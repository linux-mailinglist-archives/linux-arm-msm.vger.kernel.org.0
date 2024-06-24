Return-Path: <linux-arm-msm+bounces-23990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF299150E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D8681F25146
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842DA19D892;
	Mon, 24 Jun 2024 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lw/C0OSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88D61A01CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240447; cv=none; b=JxdQDYe2il8JSobooiEdSuf0tSqdtGyz1qLC472sJ5LUx5pODvrjc/reUeEKNu6ZDYCuh6ZTLSQjwpClsWb/H/SpDgsl6WjdwlIHX4XTkv+esIyjd5DGsYaYfn5Z4PZScICl497Ay2vb6uobTlsPbFHEt87viPin1OAC9D0j7fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240447; c=relaxed/simple;
	bh=ga/ZJbhrUVk+TaFBI1WYIbgIC50tjM64eskl8EV4ahM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJsj05PCKb8byrxZ8Bi7oqIv4vS2+OCgsbQtpA/6BR9Jf31aAsuTjBcbfYDyc7ESdIKHDTGFieHkkXETeAoGlznoTlsvL5CxUohBfJw0FHL8yfG8wvMZ44CNYJKTCpIzuaVaxRioAOXpShAwMVtlQjCkx9Ujf3SJBYp3EP58rg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lw/C0OSL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so5085996e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240444; x=1719845244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhtUg4xKtrM2KIw9xkdeNLk1MwemvpEptf/1N559jEI=;
        b=Lw/C0OSLCVAbbO4uBYv0vFrFUDg8sp1rYdRXGwYhuXof8RmX+l2jLDPj4CfP0LkkG/
         JKv946jFK+E8xQD7B1kf0D4Affq35myv5+owMjB/H++PK2cM+PRWSw/TcQ7AfsLBBR8n
         DUgVlAMYyN5f4TRZH3oy+5oU8cnm3QWKgOkpGIdJ8oYI2zyLV6Xes+jpQKXSzyNvJkiX
         CT+gJQNNWq27mduGfGQCARHGp8b+byiKTOAeQ3P2QrltPu4kinwOZ07EUcaxCc0oRAjC
         kP4YeeuJef5Zz3R+6tWGk4OVUJVTFB9QuvQxBZgywGUGIfCP6Qm76qrKphyQyocBsTsU
         mj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240444; x=1719845244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhtUg4xKtrM2KIw9xkdeNLk1MwemvpEptf/1N559jEI=;
        b=AFJHCa4iYwRJLGLmOJH8goyP/sWifz+1CoGLzmD80l1aslcCcJY8l0k3SHLQV1Q3me
         0wPhDF0neB65cAi2wk3byGlt9mNYFbkZQ1CEJo71ZX92TLWIy5vO3IT4BwPoPo6zL9h4
         42WQ2M955L31VCfYLMW1Ayf47h8DIMBzsnQlK2Sx+jmyw93+M5p4yzlEEQ0FiZghkBlf
         Q31haLZDnOJkArXqQ9zfKC09W/+mJc75fHicmSNfQFtOzeBm86AY74yxGsgH/FvlhEbp
         Z94JsrazmU2MF5T2lYeKH+krcY8rJWMvolDBdV/HxVV2lHDMuM2vblMHzprA+AK8Zopb
         teqw==
X-Forwarded-Encrypted: i=1; AJvYcCX0npqwFlkm6PBPUHxLJ3qBxyswP7XFDmv+LGeabjQaDNvazfPRIjhtlRzmk8dbbJYDlI0imy0YoxKHau9A1jAsfFxeGSW/xwqqs/E8aA==
X-Gm-Message-State: AOJu0Ywc5xhzDZhVeOrXE324nDa/LaI7pfv2Vu4AUYAVEtVPvMDSr62l
	UP3c9y0zqXBPKvpcZ5VOPSLnprpOrbQ5a56zv1Q8gwfM9KzKNweq5xcQ/0bCO3o=
X-Google-Smtp-Source: AGHT+IHkOF2Y2zANjunOdHDWnrdOGAYMf0TLfoEW8ALlmk76VDM90aqYcMM61GQSCR25Fkvk941mUg==
X-Received: by 2002:a05:6512:10d1:b0:52c:e982:8457 with SMTP id 2adb3069b0e04-52ce9828502mr1763157e87.32.1719240444218;
        Mon, 24 Jun 2024 07:47:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:21 +0300
Subject: [PATCH v4 15/16] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-15-1038c13da3a5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2318;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ga/ZJbhrUVk+TaFBI1WYIbgIC50tjM64eskl8EV4ahM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbxcu71N+9INNfPPkK2CIB3z1cLlD5fiPt7C
 6XiRIHuMeCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8QAKCRCLPIo+Aiko
 1UaEB/928OC54/bQndPdLYJkjPxLl/SCr//YwTjXVSHMNXnSgrecsYMJhPKDnEW8qNexGyVS8+a
 wF7OxggT5HQncRADsqPElHILbu9D09xgpxqijJcgPR6hsxKKO8wJKc2GBkpxfgOC3MyvJ2K+2KL
 Uf5+lVNKy5Zb+6CyTP8GzZqIlAJwL0+bTplxXneIQiAidLaqkLrj6+0oEQmCOCxDs1yXXjLXW2K
 QRJ+KcCeAz+K2waUsMXJVZzQoYy6E9XobyvKF/bagF4Vpb/rVD5qcuHeXB8hi6hFW9dD3YCSsB+
 B16QlaDN86TJ1l7K+ToJBIjmEWjrNLQTOIlS7U5NNqy8qua/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

dpu_formats.c defines DPU_MAX_IMG_WIDTH and _HEIGHT, while
dpu_hw_catalog.h defines just MAX_IMG_WIDTH and _HEIGHT. Merge these
constants to remove duplication.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 095bb947f1ff..b0909cbd91cb 100644
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
index 37e18e820a20..34e60483fbcf 100644
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
index a629eb3a6436..4712aa6f7929 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -843,8 +843,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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


