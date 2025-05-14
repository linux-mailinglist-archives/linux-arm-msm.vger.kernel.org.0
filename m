Return-Path: <linux-arm-msm+bounces-58019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D69AB7A47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 02:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D16117765F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 00:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C91722D796;
	Wed, 14 May 2025 23:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T85dhslr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35AC227E8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266772; cv=none; b=T6I3nPKPzp0PrSG/WMv7MRB3MnB65UeVrzpJtkAmqeZSwHrQMfqookPQxVTRUO1TKdPyhSsy28lqUKlhb52HBGswHzuIhlobOva+Qod0Gevwy0Ld7X/z2wUPqGGGL7V4e6EWh6G+pJOWZhTtDY0x4CV4KyoAzL0PIGBsdXyi2Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266772; c=relaxed/simple;
	bh=FR/UnX260/Vn2NQFCzJ2cky51dUA4u7bl7zZ9YB/KsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ks/7jKfFG97HL4Mnhmr5eiYJnNrtf/6QC28qo1Hfrer7CuWThT+dSaaryiIqtt3T31zgQ+JUGii3rT/D4TKfE31QmMuibLp3F4MM1aNy/8OczA3ULPe5cjRyy1qT4PsidNAKR9eWpE/dUBQNPfijfd9F7pQKMuVyu+T8s0l+T+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T85dhslr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKf7aa012924
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NU0eLq+JzyEQQoGfJXcSGpVAEOoe7jYyygPmZ0UrOOs=; b=T85dhslrb91QAC+d
	+Nw/UoMK3gsfV834hsqVnf7tJGN8dUEzaQJoOlXZ5O66VQgKKL09i2XRYK09Vd4V
	v6NcGXLaqxROzcfrAPaVXTUydLMxrmkYhP/XxwUJwt3jFWpc+j/9MGIuZxQFb61J
	BDJ+LY2ZGjhyS/jpxxac+EG/MsbzBG6cVaz5/qrANSA0VFjtgsBFnAJ1MP2Y7Hh6
	G56+G8SNrPKEkc2VlBhYJgFI3PTPhVEaHf+62vM7PeyuOCRDmPnQQ5kdkfA8rBpf
	5Dkp5ywjObjEe7APnIqm32mhyTfwR2I653cJjhFyeLf8Re4Kl0Sjm8u9RJvR1uXB
	3wRT7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmme0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e815dd332so5619795ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 16:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266768; x=1747871568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU0eLq+JzyEQQoGfJXcSGpVAEOoe7jYyygPmZ0UrOOs=;
        b=V41qIib/Mfxt4vmFfuZfjd4sn0w4WVschrdXq57gJkeA1MVmRys2IZSOVq2ei5qDBg
         JKACvkz2p9upKdOyam5luLeQGRXqRz8UEgPBcokC1O+j5QVScrfcNrmxFd72x1wVIT0t
         a+79jwrkmyhNw3GesMiB9sYwMkWtEGFUlsmhaQGtQLix+6SVtW1X1HT8bRFJPcjvjp7H
         Ts514p1IqzmgsYRc8IWK8SOdahKeekNHCvXIcN6IlhQus4TwVFmQJO6TNt/pr9lpquIa
         P8Yy9kVLYsE91amslm/b3LLvg/Y6/ISBKKZn0NaS+Ry2mWBjGrWmbjm3O4+QV2Ow8yT3
         y5gA==
X-Forwarded-Encrypted: i=1; AJvYcCUvNtHSqvreezvLufx0csffZd/zS0SYhmW43/wss2lnDUum8ACCrMKWFYPLfFSGep2sTCYmISRaPvD+W3OM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb3W+QSMnPRPHU1pdGjoYE//TVtYOZjtzyBGwuZj00znB6TjQW
	JOCgG5bc4i0HMeikVL2RaLZxWOXyWJ/Ef64Vl0ll/bnYs/HTQY3d0bd0veSqlkn4t4lgfilqUD+
	rjJaXHlg15gYqVO+lS3gfdk5CrrPPdzquH127fiSDfz7NUb1sCSHfoEdpvrhEqplO
X-Gm-Gg: ASbGncuVrpyhPA+vF+YXM3wzsJLQjd00MP9PN2Fyd66VIS8FYhLMJOYBPllyS4STzMk
	51+YfPuP1sjw9iea2UuheGPQq3kltI//zHP0ePjHFm8RZDeXRHVJtvais9FYjOH9Ue9rpCIZ/Ec
	FP9KP6x2gGtXoTfSuOYdhAXyc65bCOP84vfhqsf9LJXA1mTOtdKZPhHqoFxPdTJBkzQzaarnU3f
	P6U5B6McIm7RQR0td9pgt18rYhO8vJyRHVRp1XOoUQDbH4m0R/VxIq44nzQncRLM1i7lucHF5PC
	Sh7aLNBF4uOV4thacmnu7JzWU95eDzYc4neBLPSBwqOf71si3A6s4KEQvUwiBbGPyCjF33Jo
X-Received: by 2002:a17:903:908:b0:227:e6fe:2908 with SMTP id d9443c01a7336-231b610822cmr6374485ad.48.1747266767914;
        Wed, 14 May 2025 16:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/2IKrjfEqDc/IU1UeJMftAdcjKjbXxfSOP2u87Uhit8UxM1MpBsVG2SZ09mhf07lKpw4iBA==
X-Received: by 2002:a17:903:908:b0:227:e6fe:2908 with SMTP id d9443c01a7336-231b610822cmr6373995ad.48.1747266767479;
        Wed, 14 May 2025 16:52:47 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:52:47 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:33 -0700
Subject: [PATCH 5/5] drm/msm/dpu: Remove max_mixer_width from catalog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-5-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=17506;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=FR/UnX260/Vn2NQFCzJ2cky51dUA4u7bl7zZ9YB/KsI=;
 b=5wBSmSpRMWf2bCUYh0At2gpXO5rSk2pn8aZ9HFmsRshcMHbb9pV86YFbWjc7TsjwjYfCOBUlF
 B1LK4QtlSTKCY1zxvqmWKGnchvGIzdxzxqTTJ85YcZrS/7RxledDoxV
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfX2JUVbyd0SwBp
 L5epeEoFlvihH0srQdxZQMeLICA9WtEqOUf3eE6poKI2UJJMPBmZkVg13sZuzK/NctGbq1o7obu
 TOwtRvtG2A670AaCY0TsupDwqbAsEsfJ0TQCJheyp7EkS5CvFUiQLxxhD4ed1B4fVSLhoGidy0i
 03nl8trpD+H7V9cso0H4njNhMqjjObSwEcbSLfxQaWt9tn4RTqj34GKELUa9KgSg124Rr2XQ/SK
 8fwsuGPuwXlmcS2R3LDZtK6vnykPZXbdlWi9p904I31i+skdqKQIpR53P+/Ctbp78RAvJdeSCaF
 9aLlU10S3Ov4O68z6vCO8ACjX9sij9DE+FbtpFJu++Z92rrba8rKkI1cu2NBzEGlWCIQyo6BQr3
 icvKn+WBFg4P9qXPqiU9vD3QR3rBYNYm7hMNCKQHyGCVJxlJVz4JiXzd71ouSnxuHmuwZ4Lg
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=68252cd1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=nedybW00AaWt5EjSzA4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: YguBrtt5vGMh7CM3dX2btPOUURYjmX1d
X-Proofpoint-ORIG-GUID: YguBrtt5vGMh7CM3dX2btPOUURYjmX1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140222

Remove the now-unused max_mixer_width field from the HW catalog

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 --
 28 files changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 9db31591e27e..2f0f4cf07338 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -8,7 +8,6 @@
 #define _DPU_10_0_SM8650_H
 
 static const struct dpu_caps sm8650_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 4ac89cadf328..6c1bfd6b6ac9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -7,7 +7,6 @@
 #define _DPU_1_14_MSM8937_H
 
 static const struct dpu_caps msm8937_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 40 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index dbd4129439a8..c00d45b8fb6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -7,7 +7,6 @@
 #define _DPU_1_14_MSM8917_H
 
 static const struct dpu_caps msm8917_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 16 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index a93976f6167c..5c1383b31691 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -7,7 +7,6 @@
 #define _DPU_1_16_MSM8953_H
 
 static const struct dpu_caps msm8953_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 40 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index e2e99504c715..5dcd1f81a4c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -9,7 +9,6 @@
 #define _DPU_1_7_MSM8996_H
 
 static const struct dpu_caps msm8996_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 1bdffe168fb1..a283b4107f8a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -8,7 +8,6 @@
 #define _DPU_3_0_MSM8998_H
 
 static const struct dpu_caps msm8998_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 03f46a652449..0c8362befe62 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -7,7 +7,6 @@
 #define _DPU_3_2_SDM660_H
 
 static const struct dpu_caps sdm660_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 011e98e6e7db..49b9bd52bf41 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -7,7 +7,6 @@
 #define _DPU_3_3_SDM630_H
 
 static const struct dpu_caps sdm630_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 152fa5ea12dd..e35fbe0eb1db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -8,7 +8,6 @@
 #define _DPU_4_0_SDM845_H
 
 static const struct dpu_caps sdm845_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 7f0754e47c2e..b55cc140aa88 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -8,7 +8,6 @@
 #define _DPU_5_0_SM8150_H
 
 static const struct dpu_caps sm8150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 1a904b68950a..22bfd755d214 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -8,7 +8,6 @@
 #define _DPU_5_1_SC8180X_H
 
 static const struct dpu_caps sc8180x_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 7c65f77a2c43..6ca54f2401d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -8,7 +8,6 @@
 #define _DPU_5_2_SM7150_H
 
 static const struct dpu_caps sm7150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index f0539dd11dc8..2f21b01393b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -7,7 +7,6 @@
 #define _DPU_5_3_SM6150_H
 
 static const struct dpu_caps sm6150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index a357567ad597..e5c5945a0385 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -9,7 +9,6 @@
 #define _DPU_5_4_SM6125_H
 
 static const struct dpu_caps sm6125_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x6,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index c0bf1eba1eab..ba2b5dda1054 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -8,7 +8,6 @@
 #define _DPU_6_0_SM8250_H
 
 static const struct dpu_caps sm8250_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index d004e7ee71fb..43c7f6794cb5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -8,7 +8,6 @@
 #define _DPU_6_2_SC7180_H
 
 static const struct dpu_caps sc7180_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index b0659b55542f..7c2be386fc73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -8,7 +8,6 @@
 #define _DPU_6_3_SM6115_H
 
 static const struct dpu_caps sm6115_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index ae0196372f35..6c4531be116f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -9,7 +9,6 @@
 #define _DPU_6_4_SM6350_H
 
 static const struct dpu_caps sm6350_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index d9bb18f11a49..b5f78064f761 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -8,7 +8,6 @@
 #define _DPU_6_5_QCM2290_H
 
 static const struct dpu_caps qcm2290_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 8893b39e2ca3..0564f108db22 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -9,7 +9,6 @@
 #define _DPU_6_9_SM6375_H
 
 static const struct dpu_caps sm6375_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 6ded8b0309d9..31517c894a13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -8,7 +8,6 @@
 #define _DPU_7_0_SM8350_H
 
 static const struct dpu_caps sm8350_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index e1512ff5945c..9c5bc570b754 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -8,7 +8,6 @@
 #define _DPU_7_2_SC7280_H
 
 static const struct dpu_caps sc7280_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 2a084ee071b9..f2fbff348d16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,6 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 11,
 	.has_src_split = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 2cb3966ee51f..5e9cb02602ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -8,7 +8,6 @@
 #define _DPU_8_1_SM8450_H
 
 static const struct dpu_caps sm8450_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 1135918e0a86..e3b332c313b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -7,7 +7,6 @@
 #define _DPU_8_4_SA8775P_H
 
 static const struct dpu_caps sa8775p_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 0516e75a3a16..a27a50da28d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -8,7 +8,6 @@
 #define _DPU_9_0_SM8550_H
 
 static const struct dpu_caps sm8550_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 23d044e10c75..7d5b94408e69 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -7,7 +7,6 @@
 #define _DPU_9_2_X1E80100_H
 
 static const struct dpu_caps x1e80100_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 194780905d29..f0534c0cd905 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -341,7 +341,6 @@ struct dpu_rotation_cfg {
 
 /**
  * struct dpu_caps - define DPU capabilities
- * @max_mixer_width    max layer mixer line width support.
  * @max_dsc_encoder_width    max dsc encoder line width support
  * @max_mixer_blendstages max layer mixer blend stages or
  *                       supported z order
@@ -355,7 +354,6 @@ struct dpu_rotation_cfg {
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
  */
 struct dpu_caps {
-	u32 max_mixer_width;
 	u32 max_dsc_encoder_width;
 	u32 max_mixer_blendstages;
 	bool has_src_split;

-- 
2.49.0


