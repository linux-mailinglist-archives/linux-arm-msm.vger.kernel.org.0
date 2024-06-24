Return-Path: <linux-arm-msm+bounces-24043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A29158A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33D69284C73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32DC1A08D7;
	Mon, 24 Jun 2024 21:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cud6chSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365619F48D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263641; cv=none; b=jxV4twD7zQFho6Aoc4HjmptGPQFlPVcNGDv5X4cMsM2Ax2q1UtZfGlLw/FPkDiP7eLI40Sc1VcqIJkeXBNHEx49b8AfznzWTUkqNb5tEGhbxY3N7WucEmjWI2ifg5/Pc+LzYqp40781ZrhfuxPqdTtakhB514tmmHRbmA3M/5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263641; c=relaxed/simple;
	bh=N3YZKN6loeIt7zXSx7uKEpsl5ti+ONaIe5A6G3FjkBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QN6y5wman2DZkZgCGdOkt+xABoz9jc0nUR/gzSBSdxCjh8IAMw7keMy9YG/tjhpwluXnmU6r1e7lmV1mi8emjGr/r/0ktpmPFhuBRcqj61uvY6DXC9OK6G9vFZ/PQ+O1u3al0DUmOWYT8AacEl35Kblwhauer9U+RcujkU8eizI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cud6chSL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdebf9f6fso3093083e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263638; x=1719868438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1x4u/WFQ3yi7lWZK3LSC04Q6VFcnkANEfAcENz04sk=;
        b=Cud6chSLiAqA3FM5DNlga2yb7xltlenfVjiQqeXd17Wt2ZY0YB871tMBuZGop5Msx1
         AoYg2Z+LoOb65Q7xv2WzP/LNM565veNfXR/ilMVNLEO84D+0UYRt5QoQsvnE9LOzIsJj
         7r62bVU2roNULoeDUCH7d9Mqo6uFOMnWswyw049zO5TA0PBkscR/Gl2Yn4iqu7SdCxNN
         ZqD8eByOqXh4ifk5NwKFfSj0ENFCldlRkeUQRvmdAEVil8HNgL5B3hbaPEJMj5hxzHkK
         ly1tsPVfzjI3G6PSzVQFRsYKv8Rsr0WpmQLSvdUIwwtS3mfB41VOdaJKzNQpcH4Lt+bZ
         Xq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263638; x=1719868438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1x4u/WFQ3yi7lWZK3LSC04Q6VFcnkANEfAcENz04sk=;
        b=bGy7ffwo9Kq6gbjxN/Jpyz7GGjSagtKyZZM95JY9J/kvhC3EdIB0LjFtsXKX+S3u6b
         hEGUjAME20a9g4/SrXktngyLvcI5RyU6b/7N02onMmCx6APeAa37KnDgvXxK70pPK1Y8
         57is4Kv2W/kPu/x0CBS77k6ZH2A0M4hYzAW6HPldW8J5SQu61kwWbbKETU0eUdtixLd+
         8Fclbu+/lF2hBqcWMR6s1bsuWKu5E+Elv8P7unSc6frexucAuvypgmWFZaRzXkO2qKnK
         6PoEwKKutAmED3RNXXECMW4iRRcpVJjxJdqOXy/NQ+I0Iv1rWtxuOvp2oVEAT2jKBynP
         SmUA==
X-Forwarded-Encrypted: i=1; AJvYcCVAeWGuflVbFCpVN/V9xiA+fVShjtmLcWcTrV/mgfhfnwWtoF+XEICT4q0EFyLX2eRg0RfU+VxbKo/i3hvwzssNW3ReF0oFOSMefs7ukw==
X-Gm-Message-State: AOJu0YyN4sa/pWy3EZmNkD1eH0C26VJeguDrDGg8WNnLbd21ADWwXKHI
	CB6egwKz7tKnslS99+pXb9x6Lkq3Vf/OPvj7dASHdHBPBtLrpNyt4+E1D+0H/EQ=
X-Google-Smtp-Source: AGHT+IEmY+P+wMqwNtmzmS+y3X/vc34LWCTNENhVeVAk/uMKzvKiYLYLXlBfXFsGoAgZ2rgw5dlvcA==
X-Received: by 2002:a05:6512:5d5:b0:52c:dd3d:85af with SMTP id 2adb3069b0e04-52ce183531bmr3549457e87.25.1719263638303;
        Mon, 24 Jun 2024 14:13:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:56 +0300
Subject: [PATCH v5 16/16] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-16-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=N3YZKN6loeIt7zXSx7uKEpsl5ti+ONaIe5A6G3FjkBU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGJ3W6nxzLLrhDKnT+F7nbXuEjMtQWwODlOG
 daPmsQiNJOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiQAKCRCLPIo+Aiko
 1eJjB/45YnYDuHZnbUk62JBC3kcTUAeC2/V2+VDRd9jPMmDam6QGNdIyNx7Qi9slvsAXF1qNxbc
 oDiNVbKIjvzqnDzDarpLogMyBvnNbZdV0VaUhdtI2/46Yml0P/bzkzS+DegzFIFfvQTaQ22OsL2
 +L28OkDfO9/n5/8LqXeeq5u7jd5brGMMd0J6NXCXVPcjM2NYMGLkvhdu3pvK9qN+svFVyC0L1aD
 v2CqpRf/+lQSqKxgx7FEtAcGOaenQpuui5QE8XdL9cGJD3AuYPDCXF1tOiZCRPbGHJfpbVV0MQ1
 Su4SjvXVLVtbtWSGOyO6+SPKFAzrsT2scKxH1t9Dh+0CHjdo
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Lift mode_config limits set by the DPU driver to the actual FB limits as
handled by the dpu_plane.c. Move 2*max_lm_width check where it belongs,
to the drm_crtc_helper_funcs::mode_valid() callback.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2a87dd7188b8..f4ec3df45536 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1235,6 +1235,20 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
+						const struct drm_display_mode *mode)
+{
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+
+	/*
+	 * max crtc width is equal to the max mixer width * 2 and max height is
+	 * is 4K
+	 */
+	return drm_mode_validate_size(mode,
+				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      4096);
+}
+
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
@@ -1450,6 +1464,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
+	.mode_valid = dpu_crtc_mode_valid,
 	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 40e4b829b9da..1c86f22859fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1191,13 +1191,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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


