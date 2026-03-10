Return-Path: <linux-arm-msm+bounces-96541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cALtIn3Rr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:08:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913E246F9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24D3C30532AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2C33CF69A;
	Tue, 10 Mar 2026 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ay0LGaz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9SCkwtb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0593D669B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130018; cv=none; b=pcKvEN7sThtBjIJh9WOi4BlVQfW9uVkpUu/0xka2zTQljVdWI1npPNdx+huz86heR+g3SkegjESDr7i2cmAi5SJCUmNdxYCloOu2BEpFyG4GNm8wySEvkN0kY9Z35N/GiviU6Hu7IIcJor95lVxws0fxGq6bq8jkrCvkZM2l7fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130018; c=relaxed/simple;
	bh=Lnqx9aNGInN2dRJmGZpQf0PRaaOxvX3KhhTXbK0GgTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgSmhP5/zxwps4uKpFzZFAiROPk3U8yTDitp06IRrh8SOuvw60nQ93cNPv6T1d4sfNkM3KdgMQTIJ0u+3o6Q9a3Q7w2lXXzd+tmGdPyxv5OaKAoF+Nd6MM7Qij5q2HHPH+drL0xj8N/h4pCIBQqwTaCujqMKbSRAbL3vxHRdHQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ay0LGaz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9SCkwtb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wJtx3124462
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0pGDZTp4WihSPiCeJZx7i+DZ6ZfB6hNJXG0xF6Zo5c=; b=ay0LGaz31eWUlN9z
	JU/eIjq4edPMWNsDiBoVCzs4CzK9TmkCc6detdPyAtYJwroy1E41JZw1BISxO62C
	xTeH8XT0gQ9Nad8Bxh+csNBoQGTxkpEoNr28v5fth1g6il9tahpTs50D5ODJ6SIN
	gWqNOV4vbvi3HyUSVxyA6P5JqdrVzaruU4mqcEWOogDyT293NjoFEPz9ysy+fPaA
	wakEi53xk0bScLIuGU6wJHwk5JJK3MEvntbpxG7X0nJ217i+sPjdIOaAp3sa0uRC
	9+iKih1k8rk9a1C1ABMyBlKBueTz6mV7UPXIkFjDJzxy5aGV8/6enZCjktPlnWvc
	96pDhw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj018x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:06:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7396634bb4so16993135a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773130015; x=1773734815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0pGDZTp4WihSPiCeJZx7i+DZ6ZfB6hNJXG0xF6Zo5c=;
        b=d9SCkwtb4dLTwCEWDUZVnWm2aPGl0NSI6qBeGngYbXn3MOPKk4BAZh8jn8XrKq7qy2
         G87U4EhYfMpnhr5tdgO2BZaJhjVhoZar3FeP3sJuokxysO27NJrFEboonIpWDxkmu0IB
         ogRgZ5lzDfhvrZ87AlVxfU7jR7oJWOS3QAysKz2wY235e3noURXTjDTVCKcQQeIhKkeC
         sp5D0BIzeaXPpFIUk9Y0G3DeQ0Rkk2qVjjF+4okZ65k8EPtf97cVEI4FTwpSDcMdEKIH
         QK63PPnN+31pQlfDOANLLQC19b3z8xuHeUpBqs6qrWWtwDzHI4+8U2V6KCkM4H9NoaRa
         D9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130015; x=1773734815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m0pGDZTp4WihSPiCeJZx7i+DZ6ZfB6hNJXG0xF6Zo5c=;
        b=d6I9q7PM/p0OWnMiZpf2hNaQ1xRyUr8vnMGQ/R5CTAsQXMSsx7H58vgnU3Qyah2GXj
         gI18AMxDfAIUwFpQpZ7zUQTrwkQsAzAV51ZBJEReqPcXJ+WThrxmRIvwWqg+/lbryloS
         +oCR2DLtLueOs1DmM55Ewo1e+X51Qk6/S5d2xQpFQ2iRtys1WchvOgKEFV97UxpmMp/6
         9MbFOC+s5XXgETTzFI0FSGOkktVOi/5phsN88F2NNaz09QowjfvQSiwM3AB4bCjShCwe
         GLqK7gUqb3YKrlfeu8MiLNrAUT1MXrEe8SQPdG5DxSt169P7PcCU5l3IhXny/kwk1XEr
         nIbg==
X-Forwarded-Encrypted: i=1; AJvYcCUMYcqH+z2F9P+yfgeOi2brQbyoKo+rPoBTUsSdgujvSX9CIFqaERYm3LL0w7BoNVRT1HaJ9KFM0qxJ3V36@vger.kernel.org
X-Gm-Message-State: AOJu0YxVuvMwVSq44THOZzut8VMEeyx+qroSmxUUy0qI9dALEn7DPUM9
	qJghdeL7HYKqhOs8kHn6F41yUdJtr9jJcj1VC0an6enMjmI0R0exgY1b/XbsVlbGy9YJE9185AZ
	Q6XiWCoM6j2nMe6lm2FVT9L5aOyn8nvTyVtG3DyKcvSykqUpyZIMcfSBAa/P468T6Yec2
X-Gm-Gg: ATEYQzxAkFjA1mXuruWygeWu77mbG1wNAzoF1DB4MSXj67WGHA0bp/7KxT2kW8BtsdQ
	IDvsOAy7Y1Fjh3NDYyRNs4Gy1rRDSEZvZBc9Paiy/AgCSrUbcjwXSkiwA5hcrdtjRXFIRr3msbO
	cD6X+KcwmRp6/5v/1E/kb8s+rUBsiLbpZd3FfHS3f/GStc3xLhphfOwqewm3Js7u8rqNxv2wOcx
	nI0NlnV2nEoWRdurJBSLG5AdLT7Mp4DbtooF65yl+jWSgyLNIsW2K0u5rmYrvfEzyJ5t5Aa+d34
	Q/g63C9Ndlgq8+z9Vs1mKaSOIELftVWVkAA6W1UAYCvfkgn3FoMpBVWSjnqtiRE8ZqAbqA6iaQF
	xEAFW/0hj5z12g3/rFRrASsoayxybUGvDdxRI03APNmjKJlw=
X-Received: by 2002:a05:6a20:3d8b:b0:398:95b7:c409 with SMTP id adf61e73a8af0-39895b80d85mr6429283637.25.1773130014714;
        Tue, 10 Mar 2026 01:06:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d8b:b0:398:95b7:c409 with SMTP id adf61e73a8af0-39895b80d85mr6429246637.25.1773130014138;
        Tue, 10 Mar 2026 01:06:54 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm11121969a12.31.2026.03.10.01.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:06:53 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:36:27 +0530
Subject: [PATCH v2 01/11] dt-bindings: crypto: qcom,ice: Allow power-domain
 and iface clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom_ice_power_and_clk_vote-v2-1-b9c2a5471d9e@oss.qualcomm.com>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773129997; l=2173;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Lnqx9aNGInN2dRJmGZpQf0PRaaOxvX3KhhTXbK0GgTM=;
 b=zB8v6AEKKRzJnSbCHN+ZFKKVEp3mSGm7eQ+1lFMrA5Mxnhz9gY0/fUSSZ5IF0IneoEOHAUHb1
 n5JxF6wQ984AOw5p+uFgtseY34FaWxhVVJ4giaKNk+DPxYeLJM6b/6H
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69afd11f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=k5GuLpEFyUPj9kim_VUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: qWtzbmpA01f8_FM3RYDojCro0ot7A6Ar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2NyBTYWx0ZWRfX3bq4x7egxaf+
 2LtBP+L58SC4m4DEJX5X1oR2srmxI0L/GOYC6wcEtLZKbtlsoXQ2gBQLb1llnNbhXrWF79zuevQ
 B2XlW8XbVaPtxNd2S+hnoKIpFAYP5ZGLBwt6Hv7aMf8VrnDpLNDtUlpkz+G8AocMZkddeY17q8y
 yjlLnALM2OmZ/3Qc+UZGQ7bHJQJ8NUbdw962m2Z+ffHTQQhLSDAxWdZ64Jg0mmMllbCZkvmdUQY
 Im7hM34mfCo22Ou8mw8DmDks6mokEFD9WNw8VIo3VKq0ZFp7UDxbYdnOiPqZ7LIDisjL0eS49t1
 CcalcTGkOgBZufxN0CablUD5lnc0hEnlGK5WBpu8YXR0paeJweffR8IMvR/god7JyLKmN8DDz6K
 WWPspf7Ypmf/7tJFlWdcjJiWjZvcRfMCYOxg4FmrpMf1nQW1AyYeRA42M3ORELBbIYCsX8RcN0L
 zGMD52gAZZscRMe79fg==
X-Proofpoint-ORIG-GUID: qWtzbmpA01f8_FM3RYDojCro0ot7A6Ar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100067
X-Rspamd-Queue-Id: 2913E246F9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96541-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Update the inline-crypto engine DT binding to allow specifying up to two
clocks along with their names and associated power-domain. When the
'clk_ignore_unused' flag is not passed on the kernel command line
occasional unclocked ICE hardware register access are observed during ICE
driver probe based on the relative timing between the probe and the kernel
disabling the unused clocks. On the other hand, when the 'pd_ignore_unused'
flag is not passed on the command line, clock 'stuck' issues are
observed if the power-domain required by ICE hardware is unused and thus
disabled before ICE probe. To avoid these scenarios, the 'iface' clock and
the associated power-domain should be specified in the ICE device tree node
and the 'iface' clock should be voted on by the ICE driver during probe.

Fixes: f6ff91a47ac57 ("dt-bindings: crypto: Add Qualcomm Inline Crypto Engine")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml       | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index c3408dcf5d20..d9a0a8adf645 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -28,6 +28,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: ice_core_clk
+      - const: iface_clk
+
+  power-domains:
     maxItems: 1
 
 required:
@@ -45,6 +55,10 @@ examples:
       compatible = "qcom,sm8550-inline-crypto-engine",
                    "qcom,inline-crypto-engine";
       reg = <0x01d88000 0x8000>;
-      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+               <&gcc GCC_UFS_PHY_AHB_CLK>;
+      clock-names = "ice_core_clk",
+                    "iface_clk";
+      power-domains = <&gcc UFS_PHY_GDSC>;
     };
 ...

-- 
2.34.1


