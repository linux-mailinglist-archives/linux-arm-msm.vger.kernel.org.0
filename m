Return-Path: <linux-arm-msm+bounces-14519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C176C87FEB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 14:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49B3CB25019
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 13:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC87980036;
	Tue, 19 Mar 2024 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZdSDF/4D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F292C80636
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854533; cv=none; b=WSG7zas4O0ezCCOuspInLm2Juqe/2o5vKhY414iVOWTuoe3e/RQaFmPpnSKsUE2EinneZbtXW7hWZlpKBHsXVpQKDPHgbRHa49OLvv6XxpcJaaGbNXTGQomAs/XB9Wpek6Dq7JeWcnrGHMShpt8x4DzhyE4jES0zaJ5dx0vGPlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854533; c=relaxed/simple;
	bh=l+jS/WeU6+WV+iPnXjTwcbP9FrWycJdv5uX5JuvRCbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tPU+i+HC2/gCCfX2MYwpfuRXu9RVEHkmgnH7PPbdQVjyF5cc+laX05seAF8BuhosSU39qiqRsaPaRmzJqQPWtrd7TmmEvsw5xgjTOc19QNPXugFUNONfaavfBw3r0agoz5HkYSGDIKM3uJ+bKGmcCklwLu2BV+Eoe9uxn7jZJpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZdSDF/4D; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d220e39907so79417581fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710854530; x=1711459330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkrnYls3X1MuXQKYwYx/PX2IVbZAosNiMpQA/toIkE0=;
        b=ZdSDF/4DVEWQSWmPSnnXwBh+9SgS3KUzDnMnvnLRWGHoWa40/tfECyZyoG6aldv/nz
         wzILU/gM/CfgxSIfp1onqIgp1/6N2sQnU3szolWJs7ugFOWljtLciidaOhei5fQdUeVm
         XiORINFdT3u7chHgL7mJ6VuEpOyLx2zIjoOgp/ZgF7InGcFA+nf1NH3oPuDJsdti0vG+
         CopMKcP0vVCuR2d439cYnTDRxZo2PiG2Geyxeyi5dSZmdjxs+/jNRnSjIjPgDhHByz/D
         fwYGEFi8Z8t/b9cR4zYc0DbnhbG9CXHhmv1R9rHnjwYRC2BWl9kmaV9JmSw2gBBKZ/pR
         W7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854530; x=1711459330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkrnYls3X1MuXQKYwYx/PX2IVbZAosNiMpQA/toIkE0=;
        b=LeMRyzZ51YBDrzf1/hsECXSchdxd49AWtiHfjP+9KbNrLQ0Z3eGp3JyF4kDLlUVLqe
         SikGHOhb+3fKp0pqyLRqt9vtJHf+mbOfOwkGgu8M+HUMBEqA4WhVlbhiPmfjUliz4b79
         /yrBLkl8FaYvf2/NSGrcGIGq2ohadbl6Y6qqBIk/Zzc/Ls3FYrnaUqpPOUymD1QS4WD2
         xIWswWj9WyMBvBKfSdaPS8o4471nTSXBhZx4RLYtmJiP/+cSJJ4hvdr29HmYqa4uykER
         ccHcnxbO9rUGOagGk3ok4U6A++QC/bg2BdGuzW0OpnsVW8wT6BJKsq0fhWzChy1gRLhe
         jDxA==
X-Forwarded-Encrypted: i=1; AJvYcCX80olWF+PUPCkPM970jKbI/UPoqhaH/tirhpOrG77k741S/+8MY2H2VBcu4mGo7w4vvVzHVbDSWq5lXZ2PNwQHJDhVLqdlrO02CZzcNA==
X-Gm-Message-State: AOJu0YyYcvCEAdDfJA0wuKT50kM3cEIgMj8rf7IQD2hNaeyalWq7mw6q
	iXD6IvOR+J/Yy/qUaulS2QN3C4w48dJfT1MREt2uCe0mKoB+e9as+QaeTEp706Y=
X-Google-Smtp-Source: AGHT+IH3Rc/XI4TCoZJ2aVcx9dY4AFFvKMOie4KcwqoIxGI63sY/eHg5FBhC+JvKF70OPM+12743MA==
X-Received: by 2002:a2e:99c5:0:b0:2d4:ad34:8599 with SMTP id l5-20020a2e99c5000000b002d4ad348599mr3773601ljj.26.1710854530243;
        Tue, 19 Mar 2024 06:22:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:22:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:07 +0200
Subject: [PATCH 9/9] drm/msm/dpu: sync mode_config limits to the FB limits
 in dpu_plane.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-9-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l+jS/WeU6+WV+iPnXjTwcbP9FrWycJdv5uX5JuvRCbw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF48jjHdnqclv3m6b2iEXob/wnXebX/T4gSc
 WerEdykzqaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmReAAKCRCLPIo+Aiko
 1XsLCACqOS4AAV7mN5wqLWszjF1ylp1xJHg4rTIsuZmrqJCCMTqf/blfZ3H+Lzkch2/kf7okxrI
 m0h+HJu4Zey/tb8fdNUybFPcBikIYjJDHN2D+3XVtMmg43rELHH+c0IW2g/eBjyMWwCtEpR/LYG
 roN1TvrdcMal+szi9HBVBknWC2W1YeLyWlyxYDCPqgzFv4w/ZBvdvmV3hqGhOl0TD/9WB68nZoz
 chXWfS/U69MwxLhlBpnB/SxiAH9wS1ijl7TsyJtbFhvcASJKH9tmYodvsBjwPiZxlH9i6AHsZSK
 9957jQ+68GMk1f9C1AvSE8/G9nSfQH69b8T0g0NsAy81gFOZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Lift mode_config limits set by the DPU driver to the actual FB limits as
handled by the dpu_plane.c.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7257ac4020d8..e7dda9eca466 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1136,13 +1136,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 
-	/*
-	 * max crtc width is equal to the max mixer width * 2 and max height is
-	 * is 4K
-	 */
-	dev->mode_config.max_width =
-			dpu_kms->catalog->caps->max_mixer_width * 2;
-	dev->mode_config.max_height = 4096;
+	dev->mode_config.max_width = DPU_MAX_IMG_WIDTH;
+	dev->mode_config.max_height = DPU_MAX_IMG_HEIGHT;
 
 	dev->max_vblank_count = 0xffffffff;
 	/* Disable vblank irqs aggressively for power-saving */

-- 
2.39.2


