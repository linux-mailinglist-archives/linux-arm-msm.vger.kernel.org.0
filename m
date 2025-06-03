Return-Path: <linux-arm-msm+bounces-60095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A7ACC0D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 09:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C54857A41A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 07:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AC0268688;
	Tue,  3 Jun 2025 07:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ABimAatr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED49267F79
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934635; cv=none; b=g32qp/A7gVGVkIrNrJ+xwvszkhIJnmN/EUC29c0ROPZ+z0JBtqX2FkTIARgQdXLSeNOYkXrnWeKbqwDZTH1ILwrsFE/uqujfl918fmg4XBWBWMivyIOxNxa5TU9Kr04T4JqOTCgSfpKcBMDe5Jw0LTI77TrtTntch1vYSj98jaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934635; c=relaxed/simple;
	bh=2tgdYLNBOLqvrFN89J2Z5WKCnyYFo8/7L7F+T0zCRyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAOyiFuvFUN26MH5ynG0MziTBwi8e+XIH+F35oMpVcQHOhsCwtGWaT6WHY1nFhAAZEJ1ULOm0u+7EGkEtA0qa/v7p8IpC7uZVcovhUpHBKBv/VDK+DysDJMoxeeWuSQWRSmSFxYDoRa6cp18Z3aGIaACZEDDwEODOnEUP7iR6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ABimAatr; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742c9907967so5312602b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748934633; x=1749539433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
        b=ABimAatrE0Nn6hDeUZLoDtTzIDheO4U3gFZ6GAvoeaMvUe9VV9SPMJKSuXuaDFoFZA
         4VrPhgGpH4p36XNDqEkuFCNfQpuonWDTxgMP7g/eMb6YNlIB26NO0LqJZGn6xFEubV2/
         FHrn0oFFw3ssRt4H/bKIBRWI4Fcc+MJpDS2Mf3rwiIC19kn8Xfc74CoQdgb5fHXZXJ4b
         IyZCTiGd4Q7NTiQtwQUdZAL4+ANGHiw1bl+kMyoCelwYRJ7Y2BBydv9wDobuXFCIoReE
         91hsqwY1sigVdHk5TMfPpcb0LRIHokqv04tlOc8nmv/Col/SXUdrLIzcWRrdVZNNZXqG
         osnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934633; x=1749539433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
        b=CDppV6H+lEV6r6w+aTZFhSf5bghabzefRliTwzuBRTxw+gSlHrL9E5iPdsCIxtGIYJ
         xZfYeWrj9SIbspwEns+Rz1TXAchqFMBCAcbyM8ynMRpJWapRwjqBsJKdKXLO3nVllSHd
         B6UU5TTH4MlYXyiUK5TIKg2eDYgNMPTizQvh4gMHMy8nYxghMD9+IvHYRz8sbwY4fW+J
         KE8lk++0hVk39U/Tf7Oc5TMFQxDtoPP7HsToYKjhXxJyJAtWUDGJxQjwxxB6/Atg+rMz
         2P5pS1zD6YcEOGKtao/9bdwPXDVD3oegShJHyL5irBInuBPDmA5eKegceyWMXwrASXl3
         93bQ==
X-Gm-Message-State: AOJu0YwWp3tncT5aB4HCz1VD6O8e99wPiSDAYEtPvaLD7zf8exT/OA4w
	3+Wf4eVJpaypynsPf10DyUxHFJPASvO1RIUEiVUzieusrAh9KKeuaU74whpoK+FMX7s=
X-Gm-Gg: ASbGncukuwqsH/IK0msczsKg/jrZwpRPrPL0DNgK0Y752tMSRi9uRb+AuzLtkXhHCGZ
	IO+LdNqq7QmDMi6geJ8b+/isEHWVihWEpKQ/lIq2Z4eWD6NWgBTM8wHddtmXdpHfT06CrF+3QA1
	uaG5nosXeZvJgbvyVyi56iWFdMXwZrZBYzXRfWPIhhDUIs2WkeNKpgYwQhxSzGbpvqM+0bPEreB
	p1gb4kUoYHn284l7gG8uG08ci9z5/mVjM83n4V5Qu0J5qa2T+ElWfiRgaehYhuzu7Xwr1YVyWrV
	1nuQa+kGm8D6I1bzz1EY3qnb1cDu9AB7Zg3sUcb5xkbdmpKJQg==
X-Google-Smtp-Source: AGHT+IGhn186Cm+vnsoRHYjc9kosc4UetejN+c6qUOaBl7dOWEiJ887EOTjGiRAG+l5vo7CHPAcTlw==
X-Received: by 2002:a05:6a00:cd1:b0:740:6fa3:e429 with SMTP id d2e1a72fcca58-747d18b7edbmr14666552b3a.11.1748934633144;
        Tue, 03 Jun 2025 00:10:33 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:10:32 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:00 +0800
Subject: [PATCH v11 01/12] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-1-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2tgdYLNBOLqvrFN89J2Z5WKCnyYFo8/7L7F+T0zCRyk=;
 b=au9Cd5Hg3dt74qPm3iY/6P6rtbXTzZrVAS6Bm9TdMAbVIWHpvB/yR93ZFE46uoxfineTAi2CN
 tm/s4x2z6UZDsE/ka42UYtvzrR7t7epECJHkjsZGaDX/ZIZfNiGtmjn
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2e296f79cba1437470eeb30900a650f6f4e334b6..2d8ff4b524715c658188fe56bc337e3ffa831c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -865,6 +865,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -946,13 +961,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		}
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to crtc %d\n",
-				  blks_size, crtc_id);
+			DPU_ERROR("More than %d %s assigned to crtc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
-				  type, crtc_id);
+			DPU_ERROR("%s unavailable to assign to crtc %d\n",
+				  dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1


