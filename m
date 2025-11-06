Return-Path: <linux-arm-msm+bounces-80506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D361C38F94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 04:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 042B818967B9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 03:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9724C2C15BB;
	Thu,  6 Nov 2025 03:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZsgkFQzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVDzCZBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E282C11C7
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 03:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399851; cv=none; b=DBI3EBSocDgT9rLZJXi8DGYqlgWlIOJqqBvCXizFjLLD/1aIuhdPVvn+5CfP9a5jTJlgHrYKdrJYkOgtH76VNJu6OsECnaiWGqfxW8UXbLnQKmB9B9Tpl0vaXco0xQ+9cZGWm2dBauGTKGI8/lNAW701J9tlLYhnE+ycrXA+9HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399851; c=relaxed/simple;
	bh=qJb7NKtP7BXOcePFVLUH4KlNlOEuEnolQugxAYnTO7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJFHNkQAnhwGH5IonR7yAPPlSQ1eM93LnGZHRqVkG2YwysBSC3Sq6NRE0B/dgsvHNd692PWzM1tjsi5eagxbSU+YUCBSoXV74MoWSlwp6wVPwrR0eDJg/GkKz1Nvjweq9+Uc+CT9+dEvIgAC6tHM/i02YhV2mvfr+Qfa5/gqxYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZsgkFQzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVDzCZBC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KF4Pj1688911
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 03:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvPKp/XZNM2PzOQ7/u/SpcYLmO4fMzfvUCxKd6PJgI8=; b=ZsgkFQzVmth4pPMJ
	e3c4LOduI3mQbqUFCP9tQJ7VyplHKRGU4JaYzN40auyfTI4fvnj3dLschWW1rS6i
	DrCexryDJTJn2cZQRsGAmMYoo4GiGqXaorNIigMCqZqdW4LGkOZXIc/6S+KaaHMl
	snoP5+9Z5Se1wOI8BzZ/NS8hkeErR8Kfh1ORXBM5IogLaKQqFbWp2HuXBY0g5nAF
	Nk1pWxPtU/f7lbemtiGHVcUb+zN2IQ9IkmtV6K0qtyaLdk0XhjbYME7iHl6bt8EW
	RlvA0DmBumSC2hxDcj40Lg8q2ZoCTksUvoTMDQ9Mk6WaDfCOUwsv8QsGPXzOjtfZ
	I3R/5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88pja3f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 03:30:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29557f43d56so6701055ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 19:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762399848; x=1763004648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvPKp/XZNM2PzOQ7/u/SpcYLmO4fMzfvUCxKd6PJgI8=;
        b=LVDzCZBC0gZPjcMAfxDDp+c3cKIGIW0u+hBESGAPlkawDXwPMopnylq8wqBsXZuluM
         vjJAbWGS3Je7iuYY6EGRoQDk7YE3RdT+o39H2CNYRRTOPBSgJyOfoD7iJxDZfiABud18
         tYZVPQCNnh8vAzqNSGmCQQSeMSv7kjA/uG7xdEDslr8LSy4RCzzO7DKpa694mKmCiC3K
         +VUDJPKrwqTMxrXaqn8y9TndxNJaWJSOm/PLkyXGelhYpMZ4HVH6Ozwe60Txqpz+SBe4
         6iNVqT8mpxWjUcZiERFzAfX0qg8va7nrcSYaVUe7MtUOkLglmVMWX9+/CncraVvwhzdf
         Pqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762399848; x=1763004648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvPKp/XZNM2PzOQ7/u/SpcYLmO4fMzfvUCxKd6PJgI8=;
        b=Ah376hLwoUh/VIbNtLli/IYX14gqsA2akpFhwdGeHyvWwjksH+kydstAyBthMU2NKw
         KsGfYYjWRIWq5zwUAycoPUgIZD8Fzo5S5QqxbUo+xT35ubkBf4GpB3CjHhU9g6lwwamp
         fCp76e78blumBgWvqLi4y8+HabZnftcTrWalzdoOtpkquV/8yctSC/NbwbvT/KMDZdDH
         VOkHsZ/GQuf3erD68c1F/INgeC7qFZ514rUgLtuBHXfrGi6P+6SSZVXinbL7vML0UVk2
         buQ3SCqTFJu3+EKx9hDfWc2y7+1eW2lEWgIPTrVB7QwIQYH/IJJFZjIvxPyrOSZQ5I+G
         NkSw==
X-Forwarded-Encrypted: i=1; AJvYcCVFtWYF9FbMGijFVpni9oO3eAi0yfFWya5+DyxPHfvha039vv9mkiPMhk/bpIGrZfYkT02dukvRwbGeSQUw@vger.kernel.org
X-Gm-Message-State: AOJu0YxTmFtb1DAzAAQkhpvlE00C1kDlfjrRCpIXjK0bT5Nlw1/cS7ll
	8/lO5/WYsZYPnYG60R8UnDy04vuYvVWP0OY2lJyoyOs/4/pHWoUS4s/2Fu4bxsbwOkOFF+TylCc
	X9IjVF7Dx1bXGSHTZ4sMfNi0dq7F6k6hrFW1SpJyB1GqEjXDBr2bU9ESjHuMD/ubyqWCV
X-Gm-Gg: ASbGncvgZ0kp0xTjN7hxJfD5CC80SpxTrFIaSEdzfprp78EVe7NnDZ9LXh9VLU1cZ5D
	oC0RkeQvHRIywi0S8BiRK7ziuyX79rOWMBTBS9cVj+DD84Q+EAeQ4bDos+tQkzi9BThQU8pxIvj
	cfnC4AQuPTptH90staRvrJIlL7nHYvmPlyL7pXq1nwvXVxMur+9G3jiWX7iJoWSQHpy2201SReY
	CYnuTlWAl1CWWkVK217PIB+S01sWsYHMUoFrYaiqL5VSGweeQPBIwGtcuiFf++Hr3jQxLOryXbw
	pTPCdpUQnlmqWHiMpGyT98uCVzAyOs4oSGrlZLPseEiK3QJVNT/Z8yRwA4cPkx7G7h8PHxtdNEL
	gxGkarIQCP9wkUS/xbd4/GT2ob89arq+WAYnugBK7nt2LKye/q9WJnOz1l9TPyUKQJ2ulkvL7hQ
	==
X-Received: by 2002:a17:903:1b6f:b0:295:5132:1aa5 with SMTP id d9443c01a7336-2962ae9ae81mr75418905ad.55.1762399848183;
        Wed, 05 Nov 2025 19:30:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEv2NP3ANxlqrvF/FIb5iVXRiT3DT25+JxcO10XbpL3VFfkhhp2sKCiW4RWCuurF5kPljO4oA==
X-Received: by 2002:a17:903:1b6f:b0:295:5132:1aa5 with SMTP id d9443c01a7336-2962ae9ae81mr75418435ad.55.1762399847641;
        Wed, 05 Nov 2025 19:30:47 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cd0060sm10361925ad.108.2025.11.05.19.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 19:30:47 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 06 Nov 2025 11:30:34 +0800
Subject: [PATCH v4 2/6] media: qcom: iris: Improve crop_offset handling for
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-iris_encoder_enhancements-v4-2-5d6cff963f1b@oss.qualcomm.com>
References: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
In-Reply-To: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399836; l=2880;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qJb7NKtP7BXOcePFVLUH4KlNlOEuEnolQugxAYnTO7c=;
 b=2F6gp3sW6wOu+3Uds/IHQam6HdnLR0lRJdvIzRoHsFpQui/qgQ4rWcpsu89ySa/C81Irt0yKc
 GjmXJC+lqF8Dc7asip64hLvk+T4KewN78GMDVeXHsIlIk402wLffpIT
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: YgtVvtmqI3q-EXKkxeQy_mK9y5G17g5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAyNiBTYWx0ZWRfX/fuC8pWtA0Q6
 OZv50SbkZPHZACOP93DKOyqwZfggpMo+dJAVzqfaKW+ftNEkWsvp+m6GsCnOS+K4fRRl7q+afEk
 KW2kRnxaR6vpl+ls72G4SMr7vDQgzYYy/ekuwFFaecTKUE7LTSP8jyxFyQ/emkfBM8vBYHVEFI1
 GLIJmr+9cI2x615urmuenLCZPBhq9tf6gugnUO1U0wYpBtQbD7ZDecQdqceMwfnGYxnSwxNy5CZ
 4q75H1J0oXEXgWBXYC96UUb+ZA4spBukFlY3mcDtYHtz0w62mHGYbSMbBMssctuchp4kp0YgG8S
 Cd2OzrvkyjBVPQ1kiQdW2hZV+2sc82N9ZsDCKUjYBCXQaS6Ude7TGixpqvhh3BMygT/KDv43jby
 shw/IALdMfwZJfa88DqXTqgF/gFnQw==
X-Proofpoint-ORIG-GUID: YgtVvtmqI3q-EXKkxeQy_mK9y5G17g5O
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=690c1669 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZGEL9ByRZDbVprvkw1YA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060026

The setting of HFI_PROP_CROP_OFFSETS for the OUTPUT port is correct,
but on the CAPTURE port it is used to inform the firmware about the
ROI, so crop_offset needs to be handled accordingly.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../media/platform/qcom/iris/iris_hfi_gen2_command.c   | 18 ++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c           |  4 ++--
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index aaa79dfe2db281bb77be7274233f093b0086b5d4..69034e1ea8eb64440646776a40dcc657453916db 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -215,8 +215,11 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	u32 bottom_offset, right_offset;
 	u32 left_offset, top_offset;
+	u32 codec_align;
 	u32 payload[2];
 
+	codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
@@ -230,10 +233,17 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 			top_offset = inst->compose.top;
 		}
 	} else {
-		bottom_offset = (inst->fmt_dst->fmt.pix_mp.height - inst->enc_raw_height);
-		right_offset = (inst->fmt_dst->fmt.pix_mp.width - inst->enc_raw_width);
-		left_offset = inst->crop.left;
-		top_offset = inst->crop.top;
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			bottom_offset = (inst->enc_raw_height - inst->crop.height);
+			right_offset = (inst->enc_raw_width - inst->crop.width);
+			left_offset = inst->crop.left;
+			top_offset = inst->crop.top;
+		} else {
+			bottom_offset = (inst->fmt_dst->fmt.pix_mp.height - inst->enc_raw_height);
+			right_offset = (inst->fmt_dst->fmt.pix_mp.width - inst->enc_raw_width);
+			left_offset = 0;
+			top_offset = 0;
+		}
 	}
 
 	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 50a3eb975a2523abf1c2df128a66a762a1ed35c6..7ad747d2272f029e69a56572a188a032f898a3fb 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -62,8 +62,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
 
 	inst->crop.left = 0;
 	inst->crop.top = 0;
-	inst->crop.width = f->fmt.pix_mp.width;
-	inst->crop.height = f->fmt.pix_mp.height;
+	inst->crop.width = DEFAULT_WIDTH;
+	inst->crop.height = DEFAULT_HEIGHT;
 
 	inst->operating_rate = DEFAULT_FPS;
 	inst->frame_rate = DEFAULT_FPS;

-- 
2.43.0


