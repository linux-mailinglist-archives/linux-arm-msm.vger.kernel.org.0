Return-Path: <linux-arm-msm+bounces-21429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 907B98D7864
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 23:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AABDB20D80
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 21:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43317CF39;
	Sun,  2 Jun 2024 21:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qcfm5nW6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BE57B3FD
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 21:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717364400; cv=none; b=rICO9V/hEBxWWm19yuM4edjhIIHhNBIRwekVDCKRr+bcX9/BCw9bzi+rHsemNrFnXaXrK0HPf7li1+tEE/19NWOseioE9vJjlM+l4s6SaGmtOYCs/g463kbmjsG/x1GXvMNzETnoDjHKDU5WCYGROvni0tzFE0N3nVIeioG/QTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717364400; c=relaxed/simple;
	bh=kt+mUO/v24R5t4QFhxIPYKNo9RIjNHA9NWWDdfrHipk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecU8Auue1j7FlFOcCYJbobp285K8Rp/MA0kJZftMJLiRc2CmYFixo2EN2sCqhRb5jc/lXh4c5M4WiwWjSx4cWC8kW2vOcghNiEUr9V5WIEH8NJ/RtWkTK3gdZM1XM9Nf1s3MxJunjm1Li4q7OxJBpr7qtMF7bXePAIFU58oFItg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qcfm5nW6; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b8b638437so2824257e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717364397; x=1717969197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcbpVWRjdcbUgJJRZuH7Bn/JQTVuo4vjsCW3dScHVqc=;
        b=Qcfm5nW6T5vRH6lq49ON3/ODuCbnkW7Xt91lcqrdhkx7U5zuJCsTWmUqGeUBxwCojW
         4LUrXMb9UyU21PMLw545FXmXZ46OUQ9gUkjDBcljdGfvwySAEM7fpcuCpG2VL6MeJo4w
         DrNj8Afsxf2mTrIxtVeU6UitgJoRIwSxABSNqoYAO8SwiU05+D4KIvtmICz+YVItmWao
         VHjY9qEmBJDQcYii2NBQl88z5pdmpinmSNy5w4aRSDS0IiWJERmcLifegqpVeg3lyu8/
         lVmejbBxQI/sVxbTpQzVacDz4vOKOcHaTKd7CxKbZgLZ6pX9IMeWEystXhTvCBA5/+pB
         vBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717364397; x=1717969197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcbpVWRjdcbUgJJRZuH7Bn/JQTVuo4vjsCW3dScHVqc=;
        b=srbVB9UoWlrsOLWJ1q5L96tEkcMSn9Euoigt/Jrz6LnM5z5Ls7cGWXdvHV8A3EGtNM
         ndthLyJctRgeLyC4AKpYXtCbvbv69ntqLAtTgIUYfS1WdqMSFv73NEIcN+EQUzFXMge+
         iJmnlSYnfTD5Kc9kmXUT74CsTnUeVj+UwiLiXScpxSgVL3M3q5oAXLpWtjyCFLunIMHN
         1yuciNKPjmYwxcXEYgXGnG9e2JcXVzeJvnB+86Gcs6gNmAZg7pAZqBWpGADd5iHSWlwc
         m8wX1Ye5HrGXUwyY2LZbgqvADxMUeF9Zdp64EX6mNmiaRWEzcXh3JT49gIgDBZku+utt
         KRNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPpMjAJTlnvsuIO2YGSEqO0NEFya6tqZu3ubs/mJ4VgkeyQmRbmM2XoYF1FcjflGKWK1TESx8WuNW9uCrqQnE8hBvxxT5IBqTq2GQCOA==
X-Gm-Message-State: AOJu0Yy8WHSRDMGc3raGNUI5rVGHdleo3V0dyLrp/JuVq2HODa/CE4zI
	FQdI/satXejQzGeVi4Tz+p2v/CRFpivH3dIUvy+AQnIBqg0A6SVqLzBSbtjJtBY0IcqXLotoNVg
	Q
X-Google-Smtp-Source: AGHT+IHz60PkWKk1NRMpJcn8TjxRZTtqgum1tGKy+1VleEMZYuUYgpb3OZofDSjCZ7qHmtMWyzKO+A==
X-Received: by 2002:a05:6512:3592:b0:523:87b6:2ac2 with SMTP id 2adb3069b0e04-52b896bfd01mr4266965e87.40.1717364397106;
        Sun, 02 Jun 2024 14:39:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:39:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:54 +0300
Subject: [PATCH v2 8/9] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-8-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kt+mUO/v24R5t4QFhxIPYKNo9RIjNHA9NWWDdfrHipk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOalyn6cTyjM6xpyhZWng8UYIofhWpakKWUPq
 +h2aXcd8dGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1fDYB/9fA+ZSwXraqbAljD5cg9JXqZZRR+1Gw+8Ov7NP/tRx8yN/hIMDapaQRnCPWZ+UO9k8bdc
 NHLyrtOpm1iHwR1mom4Ytm1dJpPUXQiQJCr4nxGJlgI5GZNZJDdSDiSHu1TwJuJyyFFzTimHvQr
 imzVFisFINLY28RRPLMdktZJpKKQzOOvxFl4lOU6tC6CzNhAfx2APRUCMKbZoyiysCUYVUzliVz
 I/10D4b86ZIG84BgJIGnPJXxYR4bAp1IHYY5FJkUXFvn8s58hNjYq5691UlhCdr7TAc7l8rTuEE
 Ufnlyam2nISIKlakzFPbc696wveo6RXXvAGr000Bw7tFrnEV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

dpu_formats.c defines DPU_MAX_IMG_WIDTH and _HEIGHT, while
dpu_hw_catalog.h defines just MAX_IMG_WIDTH and _HEIGHT. Merge these
constants to remove duplication.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index c6485cb6f1d2..6d7c4373bf84 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -13,9 +13,6 @@
 
 #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
 
-#define DPU_MAX_IMG_WIDTH		0x3FFF
-#define DPU_MAX_IMG_HEIGHT		0x3FFF
-
 /*
  * struct dpu_media_color_map - maps drm format to media format
  * @format: DRM base pixel format
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d1aef778340b..af2ead1c4886 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -21,8 +21,8 @@
 
 #define DPU_HW_BLK_NAME_LEN	16
 
-#define MAX_IMG_WIDTH 0x3fff
-#define MAX_IMG_HEIGHT 0x3fff
+#define DPU_MAX_IMG_WIDTH 0x3fff
+#define DPU_MAX_IMG_HEIGHT 0x3fff
 
 #define CRTC_DUAL_MIXERS	2
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b5848fae14ce..6000e84598c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -852,8 +852,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	fb_rect.y2 = new_plane_state->fb->height;
 
 	/* Ensure fb size is supported */
-	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
-	    drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
+	if (drm_rect_width(&fb_rect) > DPU_MAX_IMG_WIDTH ||
+	    drm_rect_height(&fb_rect) > DPU_MAX_IMG_HEIGHT) {
 		DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&fb_rect));
 		return -E2BIG;

-- 
2.39.2


