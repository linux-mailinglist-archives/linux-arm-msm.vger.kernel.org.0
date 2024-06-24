Return-Path: <linux-arm-msm+bounces-23991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 253DE9150E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFC841F2510A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C561A01DB;
	Mon, 24 Jun 2024 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HQZ5u+qR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23011A0702
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240447; cv=none; b=q9iawceKio2Tn0GQsix6AMby+pRIqLn2JXqXb/QEciRXpJtQJKAG2WdaaUzWX07VZgN5EdmGUIncT7P8NC5NXpCipAgUT1HrAs1g0BYvv1pdllaEMu0OeqHZryi7DXtkNRNE2oeVMRoyXHK3niC5le5z2rJxAYV1gWCsuGqu2bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240447; c=relaxed/simple;
	bh=+RF/P7K64SGg/tQu4deWbHOf+YbNZCIL5VEgg9w8tfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VVZS8fY5y93SXJq7Ar/+u651YHl2iRYUFObWs1uPlP+aW01A5HN7v5398kZEIloFEvbPBNDaym4gQHG6ODQkVIVzPkpEeGXWLqNM3pIM6PrbWzIxSqXTy/gI8RLdWOQRMVQX40qMSiS5f/6D3un36/Dw0s2PsRau785upRkW3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HQZ5u+qR; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so17429491fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240443; x=1719845243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLeNak1YIohIAUEGI7HbWPLoyZnkDUw0ZR1m0kfOocM=;
        b=HQZ5u+qRq1FLFicHpQZH42utNnWLGZj0+YC7KuZ22GAMeF+M9XkBDKgIS/hkQU17cN
         AU5CHVL2uzsduFoafmgKfxjxKqEPLVVGpnIbc3+PpoR+xZSYR0MEgr6PoZkFTCARXy38
         BN1HgI3/eVgdWf16+E05mOUvUw3qKVwLR6CYwJHSfUdm1ZwDig5oUWBMonkeDJ0x8uxW
         vUn9HrA4ceSVeTU4iNN1n54byiRDfaZ5cjo7r7QsGw7ifCB2wAQndQevPUTLtPspjkpw
         ocSD1ujrKhAgamEh0jA2aqL8pFb3Oz9aXCSG5bEWQkq0hkZHxancFZhmtHSxAGL84YLw
         METg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240443; x=1719845243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLeNak1YIohIAUEGI7HbWPLoyZnkDUw0ZR1m0kfOocM=;
        b=bhiSEHQ0yrIoZ4e1y8Ye85gHCuiE6ehmceS7Nhz/ZNvesEpIIMiZlM2h3AOgRWUDZf
         0k4y8vea6HzJJmpqYpPtdxTWMCFlZ1SRCRrSWFvleoLPtcpAm7oDAIYI2mjN/Gk+fGBf
         UELQgyPnKtI5gZfQGx37dzov10ktkNZE5GyvYf/HIZCoKuFFZkAPsLjTdnjQGuL/DdH6
         O06Hygr/dFinXyZZwRzCGzW4GnNyK66kpwqMTmEbjnh5InDZCJLNyTxAQ+phBDjgOI9K
         GuwtazamN+fpHGeKTPQRJw4LQEymUTJY2Iy9dhmaWIy6QbyLAw5V+sV+GVYS20yJu0Hg
         Jl9w==
X-Forwarded-Encrypted: i=1; AJvYcCXAmHpMHwqMAkBhdFPTDmJsTDoSvW0MPdXroyZN8HPp/FA1a5T3ZN8dgqAErhdsEl9myrojbfqkjIYB6jnUdywuJfK6ZIsueU6wX/9OFg==
X-Gm-Message-State: AOJu0Yy0x9M2Go8fY4PULTO+T5UfuIejVcrSNJ/JEdJ3MBRrq5KhpLoS
	YRAU6uHk9HTsSFebDp7oz1iyVulCtv/xtx6fhZzJCLCrVep5zd4FskBNXH+0yoM=
X-Google-Smtp-Source: AGHT+IGV2jXTmAq5MqKAg19g+k6KP+0JooI2IY873ixMRNSqDGlFusMrG+d7Dz2rksdlMT0CLSzUMA==
X-Received: by 2002:ac2:5f4c:0:b0:52c:84a2:d848 with SMTP id 2adb3069b0e04-52ce186272dmr3454109e87.65.1719240443604;
        Mon, 24 Jun 2024 07:47:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:20 +0300
Subject: [PATCH v4 14/16] drm/msm/dpu: check for the plane pitch overflow
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-14-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+RF/P7K64SGg/tQu4deWbHOf+YbNZCIL5VEgg9w8tfc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbwypWamkbFYHq9xCHZcfNfWOlbHlrnsCxGg
 bTNoVOgA+iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8AAKCRCLPIo+Aiko
 1Xz0B/9Z9dIa7gvw1tz29gjmfw9mynEEq6c75eE8Dl0jOAaIhdd8r3QXg4E4UWFWzxN/fhoglZR
 795Au+mAhB/wRq4ARHBsaMjO+WTy4/ct5d9viewJWN699MF3NAmaTCDe7UQTYu6jHdmT49CEJ50
 ebg5FcWkDU7LwibB/zomy9M2ZetfyXaCjHCBSvRDbW8uWZRMCwIK5zYnbOHpKP+dIlK4m6CN8ET
 +MoZMA6BuJBhpV9j2Xdnq3pOD9Lg+xfzjF0EJlskA8r1L063Fg/8Eoydk13Rcklc4MMxcNI1Sv8
 LaZMXZRy9IwxdldlYXdU6okAgekN04HAmLheULbvg3JIXHDL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Check that the plane pitch doesn't overflow the maximum pitch size
allowed by the hardware.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 4a910b808687..8998d1862e16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -12,6 +12,8 @@
 
 struct dpu_hw_sspp;
 
+#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
+
 /**
  * Flags
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index a309b06b0992..a629eb3a6436 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -782,7 +782,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int i, ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -856,6 +856,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return ret;
 	}
 
+	for (i = 0; i < pstate->layout.num_planes; i++)
+		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
+			return -E2BIG;
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2


