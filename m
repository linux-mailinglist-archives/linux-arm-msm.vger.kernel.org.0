Return-Path: <linux-arm-msm+bounces-85206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D6CBD047
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E5E330248BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02294329383;
	Mon, 15 Dec 2025 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipzbHdt3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqYoXEpS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AF2329C48
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788056; cv=none; b=MrMk17mHPzg3h91kNG5pjQ7+oe6tfOCYPFQ90GTvrOC8w5rV7mUQEjwMbHyONI87MfSbYTUqBWO7BnUjo28gWi8tvOztRn962Lf55e1XQXVXkWKz6KZPggi3J2jRMIrkNDxfpXkHhOQGlR+GnJjxG2zAjQPcg+trmzkMCV1BFOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788056; c=relaxed/simple;
	bh=CWfkoJLjgIy2gUgRXCOUxurYebB6LVsEC7XgknJptQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=We4oqeSdFn4uZU1V9Dyrryz0GaOgwzXjvQ7chi9MwSPm85TNOuPOVAa0gLQQbOUBhu1r8hyPHuYnPS4P69B3j6gDi9ZFWqxM4MW6tK926J0A2LlLfdyjV2VWkwkncRUba2Z3msKC+DGYwmcNO+hFVNrqzlB9vNW9khiAT57iCsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipzbHdt3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqYoXEpS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BENe8JT3407426
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZtV4X5cR6Ur
	U16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=; b=ipzbHdt3Z5lcQmn0jzbJcgXpN8W
	UfprVbrjyX2o7v4dGazqeKJk+z5+z+uEbkqeUyfRq3tdTAqZZeBbAfaylR0r3/J+
	lM+oCBP9415T45FFHQCSYOZrKMNnEf4B8iITcmo41KaIUtgvLutINk1QzFUAciXR
	QURaJOUNHdf9E2q6yV0+vxJzc8IncDdukXeePj8U5oigDWQ6Ixv4TVya4DpuiAeL
	lQg6+g9/0Aa7vdp1rUxSH/xYKMWx1rBRwlwekvDjqrcGPjBjueYOLG6i/Vtboz/e
	VJdvnfzKirxhGtf7OWixKI78Hu/Tr9CPXfB+vVa092DLKnkWJSbqRgv1SXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11dsbssj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed79dd4a47so76492041cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765788054; x=1766392854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtV4X5cR6UrU16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=;
        b=ZqYoXEpSQOeTviWeDH19SYN8HBdoKXPUib39kOcETbrUluDIj4R2kMdIM8L+zfj5m3
         L8d8PE4kJI5DQtknKxgdnWLnAjijXwKAKYDD0tsz3Jrl0A/WgxpF3PM3jvnu7rF1aAzU
         nUiH01ieAzWyW/xF4ZgTSweLVtdZnH8u6g1bMpECIWEtluJmioIybknJ2dPWNpIaYHge
         ExMGABvK7RQN8HVCuSqB1yH+dgDl8/t0FDPYRJhRSNUgZ7PP5DNEc+yXUumhyl9C4yxd
         HXjYn4knP1rgEOW2tnj33EtL/S/YWNlU93TL2YXQAbRjFE84Pt3KyKFqpGbDckRsdiol
         LDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788054; x=1766392854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtV4X5cR6UrU16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=;
        b=W5PydybpBSEbbkryFOR3/Q3hnoBiZQdy5u7nnRVH6h42Ylt+FRRErqXpkF6d/OMIvm
         VUjPPCBVuKduNvQIp3wt6dCOGVbuY29bTgxnzhTviIOhCLr1cAM9txaA5W5dbYRmkUKw
         0NXqWN6Ftl7VpSmgC+sZ9qWlKmUhGTjlnsDmvHzZAusYcv2chVSsyOMrAUW9G0rx5U0C
         +aUeMkKqUAjsTbDMevFYNu6BtSmUtUwp+7/nBVYEV/JTcBWI75/lqIQqIVG74D7qiCz3
         X9xme3n9S84hgWw7/PTLnXrKcorMXKYvtJysiKQClPK9qlm/f45kaHDniXUQxtCo2SLH
         mQGA==
X-Gm-Message-State: AOJu0YzYTsbpkN4aqrm5qP/ilXGvkXTQi3SLr26Xwauh/4hLmR3hH1w7
	bsXJdTnfLWRu7Oo+5IdqYk6np/PbsYyLhFBl5/bBW0uquTo/J4hvqP8D154CUFkNNH+0Z6esb7x
	4v1jn5fRHuf0vyQSQUa+qwpjOryXXWte364ryCdT5yUy6U+xwgh3lY4Aia5PwP+uTL8Po
X-Gm-Gg: AY/fxX4gc5+fs2Kx22haM239K1ZWvrlwyyPW6JABXNQEceaP9LxNEjHCySRPq15Aihk
	3a2TDJ4hI7A4qNPItZqQU6b3t9cTTfiRRI2rAl/zIhONRPnEckVbQvRafL+4rWpWvbC4fCTn99s
	Bhizhk/Rp5eqyyi/TJYQ1D48TaBRyIh1bYkW+2TKMWJobxNqTxREZeSwym6hOm6PwvAknc5DAGP
	YtIASNDlA/DPXe/c0wbYHk7cRSuQsZ0IM4cjB5jUpExO1h0FC0w8XZHijBc77qkG0URw/NldVs1
	+cciBu2qOsTddXUadMz3UiS0H6KWr2m7EeHQViSqKNJbnMV7oV02hSTAvXg9VCrzNfLVDbGoTqd
	k9qf0RiRRNnAKcGRPxX0GxraIZ5ng8LUP/Tz+VPJkDPCPwLow6+lrau68ZyPtKhFi4xI=
X-Received: by 2002:ac8:5794:0:b0:4f1:c6c4:dbcf with SMTP id d75a77b69052e-4f1d05e1994mr118120751cf.41.1765788053686;
        Mon, 15 Dec 2025 00:40:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/1noZeIOiPTqPNhvlgm4f0gFz0fAc6cRFHkHLSAhxls+TIUbS04EGECkvuqYtOB+uQYVx2A==
X-Received: by 2002:ac8:5794:0:b0:4f1:c6c4:dbcf with SMTP id d75a77b69052e-4f1d05e1994mr118120621cf.41.1765788053258;
        Mon, 15 Dec 2025 00:40:53 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:40:52 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 08/11] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
Date: Mon, 15 Dec 2025 16:38:51 +0800
Message-Id: <20251215083854.577-9-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nhwB6SiWq5VUomdMICelbiaUbNp0XMMN
X-Proofpoint-ORIG-GUID: nhwB6SiWq5VUomdMICelbiaUbNp0XMMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX0rJJhbYSd3wF
 +XTKYSJe/Txpx0aFZJlyFsyKNh2HaAsys9f6YQu+QRpETtWyk29mhdIlCj+Zx1Dq20PD5pUx7dk
 HXWApJz5unLrG/R/8fxW6r2uoxue8fwtxGig1YG4rlPSPMKsGlpixEKlfyheLqMvhsBkG1L6hJS
 9t0UKcMCfBj7R4uYgau/YTAxzsu51eDdmreCzkRD/WGPnWErc4AJ5mj8ay/m3eHavq4YeM5ADH0
 xY8PkeMLfABDyImuC64T78V95QKbV+jrH8RiETcdTo5ldX45y/O5G4uYvgA6ShvVSzF8f6AFD+A
 f6EELATQqHhhpCMz2dpHUZVQSQ8Qkw3aY6wgc5sLFJKoks94gOQxHbQfKKczf+PsKMtj9JuoiVs
 cK7Rj7D8JqER0AeGKgv1T1zygLGRMg==
X-Authority-Analysis: v=2.4 cv=cfLfb3DM c=1 sm=1 tr=0 ts=693fc996 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RfJNy9JZAWTFlj1jTG0A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150072

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

DPU version 13.0.0 introduces changes to the interrupt register
layout. Update the driver to support these modifications for
proper interrupt handling.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 49bd77a755aa..5b7cd5241f45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -40,6 +40,15 @@
 #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
 #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
 
+#define MDP_INTF_REV_13xx_OFF(intf)			(0x18d000 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
+#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
+#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
+#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18d800 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
+#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
+#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
+
 /**
  * struct dpu_intr_reg - array of DPU register sets
  * @clr_off:	offset to CLEAR reg
@@ -199,6 +208,82 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 	},
 };
 
+/*
+ * dpu_intr_set_13xx -  List of DPU interrupt registers for DPU >= 13.0
+ */
+static const struct dpu_intr_reg dpu_intr_set_13xx[] = {
+	[MDP_SSPP_TOP0_INTR] = {
+		INTR_CLEAR,
+		INTR_EN,
+		INTR_STATUS
+	},
+	[MDP_SSPP_TOP0_INTR2] = {
+		INTR2_CLEAR,
+		INTR2_EN,
+		INTR2_STATUS
+	},
+	[MDP_SSPP_TOP0_HIST_INTR] = {
+		HIST_INTR_CLEAR,
+		HIST_INTR_EN,
+		HIST_INTR_STATUS
+	},
+	[MDP_INTF0_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(0),
+		MDP_INTF_REV_13xx_INTR_EN(0),
+		MDP_INTF_REV_13xx_INTR_STATUS(0)
+	},
+	[MDP_INTF1_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_EN(1),
+		MDP_INTF_REV_13xx_INTR_STATUS(1)
+	},
+	[MDP_INTF1_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(1)
+	},
+	[MDP_INTF2_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_EN(2),
+		MDP_INTF_REV_13xx_INTR_STATUS(2)
+	},
+	[MDP_INTF2_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(2)
+	},
+	[MDP_INTF3_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(3),
+		MDP_INTF_REV_13xx_INTR_EN(3),
+		MDP_INTF_REV_13xx_INTR_STATUS(3)
+	},
+	[MDP_INTF4_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(4),
+		MDP_INTF_REV_13xx_INTR_EN(4),
+		MDP_INTF_REV_13xx_INTR_STATUS(4)
+	},
+	[MDP_INTF5_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(5),
+		MDP_INTF_REV_13xx_INTR_EN(5),
+		MDP_INTF_REV_13xx_INTR_STATUS(5)
+	},
+	[MDP_INTF6_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(6),
+		MDP_INTF_REV_13xx_INTR_EN(6),
+		MDP_INTF_REV_13xx_INTR_STATUS(6)
+	},
+	[MDP_INTF7_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(7),
+		MDP_INTF_REV_13xx_INTR_EN(7),
+		MDP_INTF_REV_13xx_INTR_STATUS(7)
+	},
+	[MDP_INTF8_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(8),
+		MDP_INTF_REV_13xx_INTR_EN(8),
+		MDP_INTF_REV_13xx_INTR_STATUS(8)
+	},
+};
+
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
 
 static inline bool dpu_core_irq_is_valid(unsigned int irq_idx)
@@ -507,7 +592,9 @@ struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	if (m->mdss_ver->core_major_ver >= 7)
+	if (m->mdss_ver->core_major_ver >= 13)
+		intr->intr_set = dpu_intr_set_13xx;
+	else if (m->mdss_ver->core_major_ver >= 7)
 		intr->intr_set = dpu_intr_set_7xxx;
 	else
 		intr->intr_set = dpu_intr_set_legacy;
-- 
2.34.1


