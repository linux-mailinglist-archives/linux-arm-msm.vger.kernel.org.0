Return-Path: <linux-arm-msm+bounces-45420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAEEA15382
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CFED163738
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8127C19D8B7;
	Fri, 17 Jan 2025 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpXdxv9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E757D15855E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129693; cv=none; b=aWcrZCuBNs98ws2jp+J8zji/4M07OXDxWGWMvwOGSNOijUnkC2lpV93ZJ3sfyNHkncknSV5VcYpnLExOGfijl55WBJSQ6ut8KAGhc5O0707Gwl3jpveuK9epqIFyQ6Sg0u3RtfgnTAyLZatNDzSMhOqvj4lpA9VKVfISOFL1QCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129693; c=relaxed/simple;
	bh=GP+URSefhQuQ7yB4SyL/Yc7ro6P5CbwOt/8QO9JdOu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2kxKm3+eeXqtSqy9bYyQ4b/ZzT+3kjiW40oUQKzPSjZEUygaOMYkyA9R04tugfcD3sJWvcKDRJ7zUTHaksKd9SOy5ohpE/WZsIOfEVK1Spo1Dq7eL9b/5bcqXZxYjAG8ayRGAXQoRIJSaGhKFPN3Bm5aVlwOlN5EC7peO0z+F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpXdxv9J; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2161eb95317so45741675ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129691; x=1737734491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wr+B49KkVbsBteglGhqGqgQcYh/xCc0iV+7YbLbwVHE=;
        b=QpXdxv9JP7bbwfNNibhQQVUP9GDKtOtVFyDsZeNwBKtQVwHrdXaB5DXo9vwBWXnVnq
         47g/wvDVxDmFZ5PcdZqQzu3GdY59gadvqb43yK86nAVZ3c/NvaYvqp+GhM/HyjVQFijS
         sC+qeQrUy9TR4wrp0hZHasqiJP6a8pCTlArTB46LuRyAPhB0CWNvCHlGMfBZLsrjdyWs
         x3MIN1ASEjM6yE/OHp3SF3J9B5iL1qUJWkedIXgFXdRDRE9JTclzEXNwABMarKJKEyuU
         XZLGaycuKaDss6xxAla0BrXs18WhcVRd0XGEZ2hQWqJM+Qm9lw60swvxsyTSvVv+fJjG
         V2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129691; x=1737734491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wr+B49KkVbsBteglGhqGqgQcYh/xCc0iV+7YbLbwVHE=;
        b=I38L7IIKk65jqwisIIkujkwyDgwo4ZzN4WkM7XOjp1HI0Ii/YuURDieG+9VdgmxRhZ
         Tnvn/KpmWkpolAwD2c/qVoI6uxQUIPdopW/0DMuHnUL0UJ+5pRRCEl87oK0+cnWcYp5O
         2tfXsHDR2jhZJ92cFdjqTE/D4jjSOsb+QfNBuQOyVTdoGS3rJ3eXQSA/DQx8bXJqd3sn
         r8yvSTj0tnj7c5ujXM6vofWWhxQAJ6EAlCTdlCs4HW/MBqUHzVRpu6HNNzAtC8UhG6FW
         HuFQto0XgBeIuoC1fXH8EKqFugK1Dq7O1uodoeZuSU2AXmKEo/YJCWeuhVEfsHUIYkiT
         AbUw==
X-Gm-Message-State: AOJu0YzjZCGUxir8r6KiNpxfAHgwjprpwgiWaRp5NdLaKjZtCrxLK9jC
	THxiapS3JB2YJwUGN1ofzL021RrKtwKe+ffYxuTZ/6GhhV29DGT9/cDxgrz1Usw=
X-Gm-Gg: ASbGncuL2Pm5siT8epGKInsJa64dMNWvLR1Xg0moSe5icJWSSvRoIYve8GWjwK+xFj9
	KxIah7xClsXTQJwSLy1ZY19x97yYWMLyDDch2uKnvu0ZKI5Ii/o8zPiOa5edcXU229Y40pGELrc
	lZIDZsF4g3iN1wNx7VqlRbp2WN7wHgRDNw5rN1b6KPKFCQaFoi7n3gbq+p0v0e1Bwz9IFljeKiY
	ifsTdwv3fxF9Ii0G8+YY4u2iaz8eUOTuuEX64IVbSKUnFEp8Xckug==
X-Google-Smtp-Source: AGHT+IFCMBLEuNxUQlJAJyR5L/QLo/Ne+5PWgfbfHOTbZl7jUgVf3+h3V24vH5DOTyhflDZPVH8d4g==
X-Received: by 2002:a17:902:e74b:b0:218:a4ea:a786 with SMTP id d9443c01a7336-21c35607c4emr48378565ad.53.1737129691139;
        Fri, 17 Jan 2025 08:01:31 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:01:30 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:47 +0800
Subject: [PATCH v5 04/15] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-4-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=2149;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=GP+URSefhQuQ7yB4SyL/Yc7ro6P5CbwOt/8QO9JdOu8=;
 b=GdVRWPfAhthcVRZ02F6X+2Ov3TsWwSpgfj2Jf1xyfuUzYJJ2EhEUVlGB48tQYxK6K4WWoDW3/
 AjoA9FvPm/FCluHc2fLDvSFgUiZ8T+auBWHbMQkdFZ1ya0u1omdINRM
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a67ad58acd99f..24e085437039e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -802,6 +802,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
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
@@ -862,13 +877,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d %s assigned to enc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("%s unavailable to assign to enc %d\n",
+				  dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1


