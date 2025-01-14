Return-Path: <linux-arm-msm+bounces-45023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F12A10B9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 17:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E42A1889152
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 16:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25AC3194A74;
	Tue, 14 Jan 2025 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lp+A+QkS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F021ADC79
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736870407; cv=none; b=uFFS4DvgyHuLcu0iPzFI2jpFWPTqymBVXOnRrfCBNpJ//e1RyKEUwKIZTuRXmpeYyc0v4SK1UQ3Ov8PtdeXB9AzYYoB/MfKb5oAf7tD9z/lhBSWIqqbftIMocfMBkE/ylNPthjhnIk3gsbYxTHIav49oPW0KsEAe3ygJRYLo1XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736870407; c=relaxed/simple;
	bh=J4e6o0GB4Lf3g9wymfmTdluyJyMHR3IjQfm+7CyjyxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMgZkKFY7tMxlcnHrjSEc7rksEWM6A4Yv7I7X/kzlfqjqEnjxqls+oCLR92LNybQH4+2VXCtRi8UBkhjh5R+w/QsYP6b4Yke7tb7y/04sZNSmciNNVLJCycTDzOMnKXFW0O2KuyS5VNX8EcY/oHpGaCaKX0TIO4Zxn52PQPboa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lp+A+QkS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa6954ec439so81225566b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 08:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736870403; x=1737475203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=036P+TMXTDmBCcuo6XqZkVW5lvGpV28GsgySqY677wI=;
        b=Lp+A+QkSUNH5CM1ItW5N55iYTEmm0WOkJgGEQNp+0WhN3suVNL9LuyzdLsVzFr4shX
         IogN/T8zpHMrsfpj6b0iUwmDHqxkUXiZbYT8ehelfErQkYp5Xw0iYATzsDwBPJSIHamI
         Vsq3caXL/nDBQILH2fFPl4/l8lwpiKeDm6AfbwXafql2xF930T8KAueLlXpZmHJSYG8v
         gmxU76HZtgo7siZpLopNpYwQxnVwT7Mg7hcE2KEVZGq+V3MfAqwV2TLS+tseGRdpygVa
         4TckVHNQEqo+9dKrabhlUpQY29mm3Dt4lxXdz801ZgcvzE/c7ScBFIjzofI8eRGYAg8N
         Xarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736870403; x=1737475203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=036P+TMXTDmBCcuo6XqZkVW5lvGpV28GsgySqY677wI=;
        b=J7ewPEhkdRqfmfTz7oDe5f19Lq7HmQEsIpQ5D1F8clfSaUGiAIhjmyEXpkFBMeGvSn
         I8jQUwTl9SJisJXfiNWz0GhTlD8QLq0So+vHL1IUF+nGSWgF/pGjXYsApegK3MYpHGIL
         lfuMunO0Zox/2qL0FZHYLR2VrOkhL8lXpP7XdrwsFy+GM5OqZNn1cFaiQfiPnq0AESUn
         7Ju29DFzzJsNUMLfoXZtVjWsRdX0o/NO1JuhUUdomrDJDn9fbNPckVThcEinyqTnV2PC
         gTL9ILyop4dHUJMY0NHqvxSOLd95ir9iImaowy2Fnutt1SZVZE8uhWdCBO+lfWVGdDrI
         MiQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhNZO1QQxVE98fXZmnPlNW92FW8pRwBkDtD45D8CsmlO2o0TMl9WXGyXvWrp2aOZ2EPv72pQi0cWRFIlSK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzai01T1pcqGnCbHch/c6HVtm+AANl6bvQyEQKbz2IiilzBtV2J
	sL+yikSpwG1m4/ZadegfAlQ67RPmrt9R4LZQQFF3Fvil9QaSekMXnO/z/HJf8qc=
X-Gm-Gg: ASbGncvOZGGz3zpXpRNufffbHDLQcr7mEFpRx8UXeaYzJwRAiB6tzFYQ5nnqBJ/6Xfo
	dSmAOKe3oG6GzWVR+9BlSQbTflFQx9aoAvnUzzHEwZ20pbnUL84rSeI319tVNoWk8gocTuvDleo
	3TzaZcoKPeRi+JiPsO/raHATYSqFHRKKecatwPGBtAMeudHIGNM4g21FsIXHQjr8F9TmDnQCd+R
	F1CIZ9hSbvcATLDgrV0pilUdP60EZl+t3pOMsU/gHFPe6WEXK6TdXBNopLzspRrqmkQRpQ=
X-Google-Smtp-Source: AGHT+IG7PMlVz7CMMGWaY0OGnnMJa79kLHXPYfRYGus1Svu/ubNikdklVMAggGNIsgi/jcBKMo4Vmg==
X-Received: by 2002:a17:907:97c6:b0:aa6:79e6:5b03 with SMTP id a640c23a62f3a-ab2ab5759b6mr916847166b.6.1736870403102;
        Tue, 14 Jan 2025 08:00:03 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95af424sm651908666b.137.2025.01.14.08.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:00:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/msm/dpu: Simplify using local 'ctl' variable
Date: Tue, 14 Jan 2025 16:59:59 +0100
Message-ID: <20250114155959.583889-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In few places we store 'phys_enc->hw_ctl' to local 'ctl' variable so use
it everywhere.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 ++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5172ab4dea99..702e344f5aad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2183,8 +2183,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 	memset(&mixer, 0, sizeof(mixer));
 
 	/* reset all mixers for this encoder */
-	if (phys_enc->hw_ctl->ops.clear_all_blendstages)
-		phys_enc->hw_ctl->ops.clear_all_blendstages(phys_enc->hw_ctl);
+	if (ctl->ops.clear_all_blendstages)
+		ctl->ops.clear_all_blendstages(ctl);
 
 	global_state = dpu_kms_get_existing_global_state(phys_enc->dpu_kms);
 
@@ -2193,12 +2193,12 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 
 	for (i = 0; i < num_lm; i++) {
 		hw_mixer[i] = to_dpu_hw_mixer(hw_lm[i]);
-		if (phys_enc->hw_ctl->ops.update_pending_flush_mixer)
-			phys_enc->hw_ctl->ops.update_pending_flush_mixer(ctl, hw_mixer[i]->idx);
+		if (ctl->ops.update_pending_flush_mixer)
+			ctl->ops.update_pending_flush_mixer(ctl, hw_mixer[i]->idx);
 
 		/* clear all blendstages */
-		if (phys_enc->hw_ctl->ops.setup_blendstage)
-			phys_enc->hw_ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
+		if (ctl->ops.setup_blendstage)
+			ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
 	}
 }
 
@@ -2250,7 +2250,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 
 	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
 
-	phys_enc->hw_ctl->ops.reset(ctl);
+	ctl->ops.reset(ctl);
 
 	dpu_encoder_helper_reset_mixers(phys_enc);
 
@@ -2265,8 +2265,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, PINGPONG_NONE);
 
 		/* mark WB flush as pending */
-		if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
-			phys_enc->hw_ctl->ops.update_pending_flush_wb(ctl, phys_enc->hw_wb->idx);
+		if (ctl->ops.update_pending_flush_wb)
+			ctl->ops.update_pending_flush_wb(ctl, phys_enc->hw_wb->idx);
 	} else {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
@@ -2275,8 +2275,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 						PINGPONG_NONE);
 
 			/* mark INTF flush as pending */
-			if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
-				phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
+			if (ctl->ops.update_pending_flush_intf)
+				ctl->ops.update_pending_flush_intf(ctl,
 						dpu_enc->phys_encs[i]->hw_intf->idx);
 		}
 	}
@@ -2285,8 +2285,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	if (phys_enc->hw_pp && phys_enc->hw_pp->merge_3d) {
 		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
 				BLEND_3D_NONE);
-		if (phys_enc->hw_ctl->ops.update_pending_flush_merge_3d)
-			phys_enc->hw_ctl->ops.update_pending_flush_merge_3d(ctl,
+		if (ctl->ops.update_pending_flush_merge_3d)
+			ctl->ops.update_pending_flush_merge_3d(ctl,
 					phys_enc->hw_pp->merge_3d->idx);
 	}
 
@@ -2294,9 +2294,9 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 		if (phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp)
 			phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
 								PINGPONG_NONE);
-		if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
-			phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl,
-								       phys_enc->hw_cdm->idx);
+		if (ctl->ops.update_pending_flush_cdm)
+			ctl->ops.update_pending_flush_cdm(ctl,
+							  phys_enc->hw_cdm->idx);
 	}
 
 	if (dpu_enc->dsc) {
-- 
2.43.0


