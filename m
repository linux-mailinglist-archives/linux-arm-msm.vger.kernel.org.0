Return-Path: <linux-arm-msm+bounces-96543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H/AML7Rr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:09:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C23C247001
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8E36306ABD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030463ED137;
	Tue, 10 Mar 2026 08:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFEg2qgt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpKdAydc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5DF3ED12A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130033; cv=none; b=T3QsZ9MDc0fLAB7mxEgIQGmTFvtI7wx/3rAMbKI1JMkScNYoJTNnCZHgyG7EFx6AMnK2gAfx7Hc0mTl7lMel8Z6uToAnAndHO2ATlRsazyih9V+dazStpUX1AKlxhSNvqiGb59Dw/V6pQJ1M+/RH9yiTczDKymHgf9j8bAVeecs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130033; c=relaxed/simple;
	bh=eBc/tZwYk+Z7AphVW8f7WhN/S3F9nVUOBnpnGU+WVlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tSTDzE3xIe1j3xoEKnc+zyvTQo7hfuIGoHlkDN29dYywZlRNFVDTDqzVXAoqBt1WdBg6eUtbM4+OvVlSz4NVkQcEhwRtmfw+/Ry7dhP6eNKWZSjYDxa3i+37NlYcWOxNeP3u0VVqmpRcwgJiGyjMW4E1EeLYYt44oC+/Gm27iNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFEg2qgt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpKdAydc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EeSE2460980
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zo28n/Z/OC59k3+VeK8QF7/lPzfhkKamJ3iorOSmEmg=; b=aFEg2qgtc70VhB31
	wh69BrmZCv3sg5ELq1KRjwuv+gV6R13Yp0m5BfMHN7aSkJdvFGySqRTciHwK1W+X
	S6hvtIinFIZPIQuC8uZV2nZdllu8PfFEupVlcUOdbUkOTWVm12rw09AdE8fP7ii/
	1tdVM9XlOZ+Ou1jvvTzr1U6o1ML2hXqScowyAv9fgJ2lzwpZditN3xYrJveZQG8G
	5ZeObGqEYFvekn9jiZxVhIgAwlRvIZQ35b5KUR17h9euoUYFGmT+IBEtH3RdWWrq
	SdGmT0eZ9ZcHqaDfVlxboTgjmwoElutH2UdpyvOZN3mg1W1g5CyOnZlyp7V1Lucb
	XIaylg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1b8a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c738f71723aso2987021a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773130031; x=1773734831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zo28n/Z/OC59k3+VeK8QF7/lPzfhkKamJ3iorOSmEmg=;
        b=RpKdAydcd37e1xdGdFrYTwQi2MHYoLvIMc8tTgd+gFrrVedAQYO1qbJ1fGX4YBFGHn
         Og0yyVqBZ0qhigGVArUxiFvt0UrhJSam3P6cF/I16OKUSCEu7FrCTrQb1B6h48+H64zJ
         pbuwWdklPJVXDusYU7NoeJdD9Nq+bCTG0TmlBeLFBZNOvPpDUt79j+9QWh6ITyf2lz7B
         rSaFvBQvLWNO7ocQxrBWRffHCStiNMrfWVfhTJLHhCJR1hmZcMiRzdchj+fqj4ow7i6a
         TW/gvCwsZhjzPaxFgGrE8/w//FOsrzCDbE6zPWpAY/lIWGBXJ2XJu2mNLYG4CNfzjXrY
         BSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130031; x=1773734831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zo28n/Z/OC59k3+VeK8QF7/lPzfhkKamJ3iorOSmEmg=;
        b=BiSrIA7fr8QNyQTMNJhrMySuWVCrlskVYvZ4WK8DnWdXfeCzyHVHknUqV92wMebzxU
         b41S5tBJcN4AUek63IlnHng+pvly219OXGw8QP+MIFuv8BU3XszZ4kVvboC2FrB4vYmS
         WtMRwBqKJqyNLnCzcHUs4M3Ew4FO9Ns1AIHdEqIoZ2mrCHz+D0ex3JUZSEV3yFQbysmJ
         xDRJTRrV4b8KOsOdzwHX3rxa0eaEwV2jU30h1lsayy3Mi4d1WH929r/l6iUrwYDXy3UP
         tzJ57X1Z/r7HKRSq78XFtiM/szoW7LM3U41seLPkmxajnjMNykGiu3efkvWRviIg+97i
         yGFw==
X-Forwarded-Encrypted: i=1; AJvYcCXTvv8z0TFfl8txg4sesz0hOU4oXYPTN3ll8XNQNrQchAX+Wddand3y5ty66QGmw2onQl0mibQIrdS58jgf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr9mg0UlEJj7CrwRSWb5mk1GBiU5YPUlKrWPMGXpAfA4uEfPoT
	SPW2AZaJnlGlpZLIEp4szNFNqGYAY5Sx9VdR97o9FN9uM/yVUF94mktBi48dYKjVKzDMdopj8M3
	coBOoGZzg7gl2p16cvYsQAtx3Qp0sAz3eOV3N/u7zsKM2xgSAwz0OKqEN0VtoeQuE89rJ
X-Gm-Gg: ATEYQzyQGGvAaTK/RSRYiccrLPPdc80Ibr6Cw7OqzCNMi9Mk7Q/Wn0CQVZsEO7EyHkT
	wg4AvYkTcJLevHEnMObcTqciLyA68oBr5Izl+YTr5U/EYdJX4/BG3yJyi3Y1zfu24Oc17/LgXHh
	VEMhGyCds4hQAMbYVjhYp3rnRIgd6b8xT2OkC/DF8NPUA43eXEOqqo7o/BG9dDEPRF3kpaJJcmI
	OaQyIKFiiycTmZzs8vB+/Iip7CMJeTQY1qOqDxcFRZzXtbv98k5EpP91loRmFayCLpXuSptMMNk
	7D2HEJhxkzdgV37dJXFhWtQinhVSf6G4SffYOUjTRqurLT4CP3y95yBn7HSDqVRr+uKK2yseQRq
	ba13DKqsg68br/AqumRw7xezhJwklO1oVsZi3HcrIBcgAZxo=
X-Received: by 2002:a05:6a21:1f89:b0:398:b748:b571 with SMTP id adf61e73a8af0-398b748c49amr179913637.45.1773130031458;
        Tue, 10 Mar 2026 01:07:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f89:b0:398:b748:b571 with SMTP id adf61e73a8af0-398b748c49amr179871637.45.1773130030944;
        Tue, 10 Mar 2026 01:07:10 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm11121969a12.31.2026.03.10.01.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:07:10 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:36:29 +0530
Subject: [PATCH v2 03/11] arm64: dts: qcom: lemans: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom_ice_power_and_clk_vote-v2-3-b9c2a5471d9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773129997; l=1465;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=eBc/tZwYk+Z7AphVW8f7WhN/S3F9nVUOBnpnGU+WVlc=;
 b=BABY7pgd16anVLRoM+eELOrI2+1ajg/UoVcu7W4wDva+HetlpdONBveDoz+5MiAsOGfop3x8i
 vu/Uo8AoJ3pA81LXCzO9DZxsJ8Pm5DVXlmFmXYtHY62rGQaaEsrvRSh
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: 36G9xsAgvtoXxS6vs0qqDWH9ij0Kc98Y
X-Proofpoint-ORIG-GUID: 36G9xsAgvtoXxS6vs0qqDWH9ij0Kc98Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2NyBTYWx0ZWRfX5PQw7AClnQY5
 z/5cYHoSADowC5dZx+60/4aj8e9eWZ9PdL9z8HblRO7Wg/ZTFrOI2YLUu2it6Oj4fIFU7ag2tC8
 5aKJ6WSRA85t0JiLOAww7JeDNuh2Nqv0FWn1rXr7LRBqPbffTkI8DmwVDWt5BLiXtIK7989Qzzv
 bPd2IRn36Ugw7A7MCsJUnhc7vidfkCkpotfUkv4TObRNr6z+X83Z5kIrlnU2jki91WzhChvCINQ
 a3v5uJ1fwkqECzJ3BAyoNlEnKyn+uo5ytiMYDqAy2rC8pBcx5hxSAPtUbBQ1YpGLDee44V4Xfn9
 Ks4qs2rRM3CbVTKeeaZM8wjjxjBrePJAL0CgwzV5Ru5Gib/ai39wx/I7ehuUi94m5L00bjfpHpf
 Ysxwdjcc6ZQU6hIBXxLQohcV8cl1xYml6my/uL8+IS8rC2JltIGr1OFR7yUCrmqLMACAl9S7+Rj
 wYHpYIkaR9RxDmb/Ovg==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69afd130 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100067
X-Rspamd-Queue-Id: 4C23C247001
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
	TAGGED_FROM(0.00)[bounces-96543-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1dc4000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,1d88000:email];
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

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for lemans.

Fixes: 96272ba7103d4 ("arm64: dts: qcom: sa8775p: enable the inline crypto engine")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 7c46f493300c..0312702020d5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2774,7 +2774,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sa8775p-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


