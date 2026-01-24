Return-Path: <linux-arm-msm+bounces-90418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNxJMPQCdWmy/wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 18:35:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0017E52E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 18:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC8443003618
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 17:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CCA25F995;
	Sat, 24 Jan 2026 17:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NE1RN6Jh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZL/d+II"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDEA26CE2D
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 17:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769276135; cv=none; b=BVYCGIF3eecFFU5OWh59DZ7EGmnZeAYWju1/JsIzUmWhXTdZlpbUqu70mEzhr/zCvjMFV5nStCUljagGEDIkgXoh1pTUI8UNrEovpLKTBj082nV8u9yUoZtVo5Nd4ENZ+mzyvD43vJFeDP5KTG3kNMLlNFE1sfQES43E5wrx1OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769276135; c=relaxed/simple;
	bh=8N7B3mkD7QDV9PRmF+V9QVCQmiev376HlB66yEmUGW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5lCctKW+usF+m9B3f1tc+dtUkkAxivfH8T5w6Ixu8DJq+FdR/LCYV3eWhdmXg1P2rtmF/rQT5bnJUXlYqSkY5NIxbg/vZugmWNrcWa8dYrH3dEgY5zCRW6KzQeMi8zJy+JJpv9KahbW7Cu8gSOle38tAgOzzIxtn5gnJzCtUDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NE1RN6Jh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZL/d+II; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OCwOZM1459673
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 17:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q9spu8MZGuUn7Bfj5JL2aWXLYxZyWqq4k+J/YiLFw9o=; b=NE1RN6JhCYQg+YHr
	VLa58FhuGnFT8V2x1N5NKk11fMMAyjVkxZk3Y3dzZV9g2mfxxFXCYZdgLZh/GNGI
	Ln45WyZOaWhHK7VW3pxof/W5o8Pjf3SBl22WkLiXNXEfIrg3/x3A3YEaEB2dCBf/
	WGetc+BGvnHqznCvsBn2gecKYZsYAD6h/+ijLY3Pqx5gOLdDIO6ZSDYHos2J/EY7
	dijspSiBowo/EG1LWS/tG/mY3kh7hDJ+xNWLwmVeJJNd3FiSqX+QOzX4WKfW5OM9
	ccSJ8EazNDDCg6UxuUqsuemG+1vqyZSj+PQmawr3GZyGZjdbVGXNpHj6KKxyAp7C
	WkG/GA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3h8ydj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 17:35:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e952f153so54536435ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 09:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769276132; x=1769880932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9spu8MZGuUn7Bfj5JL2aWXLYxZyWqq4k+J/YiLFw9o=;
        b=VZL/d+IInJb5oPGMI/9C/rN2PuQAmQ5WXKz1V5F7HQ6nWAnAS4B/Ov2qBbMB7sCKKV
         OfFZLOPa8ffoSwgmEPkZcrSumHjl1locM1GDvDWJDPv9BgD9uhyq82LZjK1CBEq//Nkh
         uPkn/PciaPgSQMEqJ2QGvD216WmjbvxAPuhW1VF7G2aWzKZ4a65V92ImOSd7buryklea
         25SisqRNII7sxGMPBnCakeAXxLJPOVW/rXRqzepsbdZZBPoYIQMBAb3m4Lerzr9KvSjY
         iW0SIURgVY3osFWBwk7DS/b4lbW2hFqonflo6ckwazilxt6cID634LvDCwdSV06TlY1U
         bkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769276132; x=1769880932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q9spu8MZGuUn7Bfj5JL2aWXLYxZyWqq4k+J/YiLFw9o=;
        b=WXv26UxPbNJOUMG2k/7O6Yl1tm0JNpv8342gfD3AqRwTlTYgs/2AJTsZluvih8dwvS
         Emtrswph1FrTrXSXTKav81wuqSaM962vMc4ZfsoB7JAobXGdXfu1X8aUCJng3OcTDkX1
         mENBRlurqXV1yLzF6PbfKTl5f5Yj1PtZEQT4RS5xSMZ60jyY2nHUqT25wE8e9CfpeklN
         Vs3Ec2gjUH0TuMuIDArjfmr1nqjAmLMmEwXf5kb7gyeXX5TBEIMXb60vUclxd/3k0XRn
         So9xqcxl/VZ1QtP22GfhoNv4km8UfHjoOOB6yQj77YrS+/fRG0MY9HfMvT2JHwtH+ZD7
         Y2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu8HfrzzwEoYKDJOJ/22n+fKikcbTSzgnNUeWhbgjdwawDBauzb3WV1GFYCxHGaZ2vD9GH8lIshnCVj5zE@vger.kernel.org
X-Gm-Message-State: AOJu0YzQneKXKYHQvpboPVHIwXQP+r06RtZcc21XXr/nXSjDcNs1idSD
	RYtpoLBLULV95NRwyZ4GlrJnlsCWK9edEeG2SBkz06M9Rw7UVQ0+2H3dJubAtOvT0S8SdlDIPYj
	DMgw3Sf1LISMedpEL7bLlgqnof+iSYNHEanYtbOofouKJqcTxau8jFDU3XdSpDIwbBjDM
X-Gm-Gg: AZuq6aJmVNmhRHERCkxosIcVpt32Orq4KL3PqAqaafldvdu5YtQitIN3tA836seFbu9
	ZgxT3TZHpislC5O1m4Sv7bJGLILJO9RUDn1YtTz66KJgupF08L+Zc6ZGxUV1PxhEfu2qkYn+gNy
	cCBdTj7j8t2xaNWyt59QHDN3qk3IsQw284lcoPEIzaqLx7z5RKhKnXMCbMur2dbsPBpdrPF+Mms
	Fx6DvkqqHbuOp1VOhs8MrSkaNaeoHAG4wT3Bng7XFwVzps/U1DisPEvLPdU9RiRqWPsT6LYCpB6
	+5DtIeNpgcPJwauqHm08CP7FZRKR85dnCxtowuRSDjajTWDZku8xJx8y7FGR2UjbpzX4Qf5i2iG
	Bto3GDPf6jVK9bz66hO6uNJZ6Lhy92/9ZGA==
X-Received: by 2002:a17:902:e546:b0:2a0:8be7:e3db with SMTP id d9443c01a7336-2a7fe5718c0mr70356815ad.15.1769276131679;
        Sat, 24 Jan 2026 09:35:31 -0800 (PST)
X-Received: by 2002:a17:902:e546:b0:2a0:8be7:e3db with SMTP id d9443c01a7336-2a7fe5718c0mr70356575ad.15.1769276131209;
        Sat, 24 Jan 2026 09:35:31 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa79dsm49036765ad.3.2026.01.24.09.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:35:30 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 24 Jan 2026 23:05:02 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add video clock controller
 on Glymur SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-glymur_videocc-v1-1-668f8b9c63be@oss.qualcomm.com>
References: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
In-Reply-To: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE0MSBTYWx0ZWRfX5nXnwLcER6gw
 K7DRn74oFihdQfIo5PziQzXXM5zGrIJ46J5ik1i72kj69ygPBsTZ4vXiEuhsr5/hSKnj5B+rJXh
 BKDbbSd/NK47rSs7/mmarNTkGkn0vrkLj133Qjwn8UZrbtTcyK4m3NRYDl48u9AOutXPEQzWbI4
 s1kAc51VAyCg/6lFuY2oym/pJjOv9U+MwgNfCq24ElNP74CUQL78Vtj/EO9gkcACCqqW1Rttp5T
 XHDnV1vxMc+29CD0X6c1NkQnfRruhUEwN14SR1/zd2LcLZLz8wJoU6BqjpDb02ME+gjif4M56ue
 O3gncs8iRvMz1hryd5HTAJvKEjrDWthQknSg262noZka7Wo1nPH6FiWMT9Y66R656WpH3mGvAe5
 WY/PJdD29mYPbTR44t1tgZn2ieo3Zavz0iHn5v7LwkyCYRnU14W14+AZ+pSNWgXCqNvyKgWbi+D
 DOGI4Zr3uz6+XI5vB9Q==
X-Proofpoint-ORIG-GUID: vDDZ2iDVWfF66AOEhYvrse_2DOp_prk4
X-Proofpoint-GUID: vDDZ2iDVWfF66AOEhYvrse_2DOp_prk4
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=697502e4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i4ogSa-0-Ooxq5hEEv8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240141
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90418-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E0017E52E
X-Rspamd-Action: no action

Add compatible string for Glymur video clock controller and the bindings
for Glymur Qualcomm SoC. Add the clock resets required from the GCC
clock controller for Video.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,glymur-gcc.h        |  1 +
 include/dt-bindings/clock/qcom,glymur-videocc.h    | 45 ++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..7bbf120d928cc506a4f7aaeaa1c24e5da760e450 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
@@ -23,6 +24,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-videocc
       - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
@@ -63,6 +65,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-videocc
               - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
diff --git a/include/dt-bindings/clock/qcom,glymur-gcc.h b/include/dt-bindings/clock/qcom,glymur-gcc.h
index 10c12b8c51c34c5931c34b4437be03aea098ba53..6907653c79927f0ff32c98c75d830b719ce14d51 100644
--- a/include/dt-bindings/clock/qcom,glymur-gcc.h
+++ b/include/dt-bindings/clock/qcom,glymur-gcc.h
@@ -574,5 +574,6 @@
 #define GCC_VIDEO_AXI0_CLK_ARES					89
 #define GCC_VIDEO_AXI1_CLK_ARES					90
 #define GCC_VIDEO_BCR						91
+#define GCC_VIDEO_AXI0C_CLK_ARES				92
 
 #endif
diff --git a/include/dt-bindings/clock/qcom,glymur-videocc.h b/include/dt-bindings/clock/qcom,glymur-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..98c0debef8fa9d67a2fb86a0e42d6e207ad89c09
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-videocc.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_GLYMUR_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_FREERUN_CLK				5
+#define VIDEO_CC_MVS0_SHIFT_CLK					6
+#define VIDEO_CC_MVS0C_CLK					7
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				8
+#define VIDEO_CC_MVS0C_FREERUN_CLK				9
+#define VIDEO_CC_MVS0C_SHIFT_CLK				10
+#define VIDEO_CC_MVS1_CLK					11
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				12
+#define VIDEO_CC_MVS1_FREERUN_CLK				13
+#define VIDEO_CC_MVS1_SHIFT_CLK					14
+#define VIDEO_CC_PLL0						15
+#define VIDEO_CC_SLEEP_CLK					16
+#define VIDEO_CC_SLEEP_CLK_SRC					17
+#define VIDEO_CC_XO_CLK						18
+#define VIDEO_CC_XO_CLK_SRC					19
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+#define VIDEO_CC_MVS1_GDSC					2
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_BCR					2
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				3
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				4
+#define VIDEO_CC_MVS1_FREERUN_CLK_ARES				5
+#define VIDEO_CC_XO_CLK_ARES					6
+#define VIDEO_CC_MVS1_BCR					7
+#endif

-- 
2.34.1


