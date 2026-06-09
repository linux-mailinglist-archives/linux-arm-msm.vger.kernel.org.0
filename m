Return-Path: <linux-arm-msm+bounces-112215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /GBzLl8xKGqC/wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:29:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B866A661BF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:29:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P1k7XNYv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DwKTQya8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112215-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112215-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CA403166535
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BA547F2D4;
	Tue,  9 Jun 2026 15:03:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DFC47CC6A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:03:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017406; cv=none; b=r1RTiYFC4MZ9Q7QoZI/Yrqd1fRcZEeSSbqI7U3qUDUZNRaJvV68uXhxoivljpTgm3RD8URxYfkD2tWDakBUsJjX090HJYKcrwPkfUJabTUoZCHG5TVJM7GGTbd13uGavwCZ8pwsQ3G1MQ8rRcRzDPqnwFUUXdQBzxTpYM9CPGWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017406; c=relaxed/simple;
	bh=X7A8BvifHg9AJtoStT7CZzf1oH5NsdlyLLNOS9sNvUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2e6nu0ODAbEEm6E/hVlSXohEdqY3LfB1LLIAxk60Dc9x8tGJ0mzzA77iZTCANP6icSvu2j0oENdloYoPXZCUyjrcasJNw7VkZETDDN2dAAqI9DmT30ajAkgyBwwFy9qmxpPKebLNn9wrgNsOMF96m5xItuc6pm2y84zwNbs2l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1k7XNYv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwKTQya8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmRDI2625152
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=P1k7XNYvWkjAlAtm
	n4ayrXTq4wktwI9mgcGcvab+oAlzTpu82qdlvu+oqB2rbm5fKbOKUJ96ylfkKjbM
	ChUEQHmQCb5NNKixFLdOKUBiFRAyQ2zH9NT+m2J3lyfxMAmIFEAi61+XylEodkzu
	sz1pSHctu9SQcT0eJoZljjhFYh1VrQk3zWbC1JKWoA2qjE8A5Eau8oGsRP7gdEXR
	OalDIBkqZo5lfyDdjBh0wfyaRMtYiMJ6sg8oiH4OUYlWBj37H3OaBB60fGYmD7xe
	+XohJakXa6CRYlrDUMjPOdnQkZZKSlA0b1kEbAeUON/AIAv+zEyQiZuNE1UT5jcP
	C+hzCw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epddsadmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:03:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84245e2bb00so5112803b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017403; x=1781622203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=DwKTQya8ozhVOnLyuEP9bH2FI0SMVMyD90qGtL64F9BYPE8m+WULsK9HAGG0t/jruN
         IUd4bEx62xh+SvnCjd05Bs39VkAwGOeB+493qGkWI1T7dVueZif1smCHVN8EUgk1IIsq
         Iou4pElpkcY5VvcXXUMmKiHQMBF1zTd7KROrnYlZqcsSIEJTMVp6buEkkGZNCuSx1mjJ
         mDtBAaNNkyOwT0tZ7yO10JYHp0U7quWARlPv4WrR5xeUI5HMgm8kyObO9Ks2CbKq9jZe
         4txWNDbO6DJPFXMgRDQ/cAjOVQUt5hXYPxqXjcUfkcQRpJ6+4rdJvpEuae8ImuFUm/sT
         2V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017403; x=1781622203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=QhSyrOR2hMTEhiNP2ZvPvWIMibLhBI/Be0iSVpLnaBK1foTdU3xtDaBTnIQvaO7rvx
         sbZu8UHbxhEeN1VGBI/0s/UcO9DoRWTwHoqp2Euq9FQJz8OyAfjDyBCNqVlB3BfaxfnE
         p6vDV+zNaY96VWfhtxpMhhF90DJwGn89wsyBYv8WFneDQgapu8zWB15yM3N9uOwJyZMC
         w89lJnlcEGJwWJcyYDyblMm5JI32w3upX42glHdWJHRWe0RVQPou5IT95CZghFv7EcvT
         HtbNJ5ERHq8P/f533ItuLNuNncfyNUcqRXPLzS4ddzTHE2YYe3+JbHdzjbDHUP9LuaRj
         OtDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UvuILmfW7BkAl9vHejjUbZer87QmhicIPKnDDDtX3PbK6WSegaeYdP5KIMOfpUn62Wi+GBHInQ8WB0i87@vger.kernel.org
X-Gm-Message-State: AOJu0YweGI6mCl9ZeFCzMZsIOCCSRGDAAk3wKmTxIW+fmNmPaw5SfipS
	hH/RhkE5ZS1OhM4c384bgkrwdJqdA3dnHSFqUzeYHtqUALr5jHrw+06aFtgws7RohOWgX/2nTBi
	65YwF8Dj1OSgrMcVNCgu2ZZUYqHp7/59qQDTWpWjhXNuAR6V3LOAGomqGUuyQaQil03gX
X-Gm-Gg: Acq92OFY1t0o8b3mEX2aVs3Uao9hN0sdKLgc909bkG6bhTxWBO0OVVIVKgdFsbGY1bV
	Nmp6fdkMrkmdMjKUuuPDgjvzH1++Lj6aBCQatSe+JkWLjypmgJ+ZrYIOg7cLNkITQs357QbKbOv
	dufpwUGOAnG+4NPy1izi8EDYyd3suHaj+BKoAWlzkg+t5fEdpTqWFYZCObnIc0mSX08nu8SiE/B
	VYJTT3df08++gdUrXCxABHZ94qdcjZCiMHgnx2Ax9VqHIJfBv5DOig354F2tuYYuQWQKm7iprOp
	vMMAZ50USfgpnsvmJcGuk6JrMVbQ/epO4CVnxOk/DvvmaIGFCyVynfDa5xRLJnb7bGs2zk+Gcim
	vBwEE9wcXUsDO8Ghn7AO3X7bglwHz0CcOXvZyrP8WNWFfdgqx/7sz3ItB
X-Received: by 2002:a05:6a00:4216:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-842b0e5d0ecmr22209071b3a.14.1781017402842;
        Tue, 09 Jun 2026 08:03:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4216:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-842b0e5d0ecmr22208978b3a.14.1781017402222;
        Tue, 09 Jun 2026 08:03:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:53 +0530
Subject: [PATCH v6 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-2-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: Al9ozIoMgMNXFXIJlyvaDQ8Bp3zfKuEG
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a282b3c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Al9ozIoMgMNXFXIJlyvaDQ8Bp3zfKuEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfX9mwP3ITTCwU6
 dXsruPoGMw9UVYPxArrQuow4xA5FatmLoRkOFr1gY9XQzGJx3YirSVLVMgMPHA54IpU7xkAsS1F
 CSvccY2sLfP849h4MdnsVko4OyALy83KJu6p2R3hu9+XP3/oirzIkIXKenpG0BOU9vxQ2XRXxDY
 g61H+RqPZI/B01RU4+yqgapoGRg2gpvBsHLlsrBJZuL5XI9KSVJJXzFUXo76cUil/+qTcjBt+h7
 bqrFGlnrKvGy40VTME6I3CB+M7c9XjOg/QgPobK62MJpSU29WkEqkRgPWSqOilIlWDGZVWAnoYL
 IxZrRZ6omfLCw+TwBvS8HFX0lAwAE+9X2o9o1LOgIJoefcBy0wTZFcrUQ8vPwqNu/2n9qrFJvj+
 6V+GtkbhLbBjZjfkCGeCTNR+zRpGPUk9LWWN3QwCOBF0d3ImzOSRzaRolo3AffxSgtkaI8+hJcc
 kMFYsnu5Dvc6NlZQZsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112215-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:taniya.das@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B866A661BF4

Add bindings documentation for the Eliza Graphics Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1


