Return-Path: <linux-arm-msm+bounces-21422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA78D784F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 23:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3C2A1C20BAD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 21:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2642574D;
	Sun,  2 Jun 2024 21:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jtp0wouR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18A728DC1
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 21:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717364396; cv=none; b=FWTp/LUsgQCvf6LkX+zPXMgOZGYfokZcugF6E/HX2xklaqEHpl1ldYDS2f2LgGk2hHChaw/SiZ97X8q2qvcxQClXEo3R+bk1YW7CnnLQAA4iAeS+U/AiwJGve/qlBijYVV/WhCJ+pGG216iysJ+0HDMYYFvP3S61TVQud3oMznA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717364396; c=relaxed/simple;
	bh=hWYhkAdByN+pW4M02a+sJl2cy100VyTvE/D0nMj3Emk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nX6YolBkR53Epm2GgD/EP576dQeI7Hyw1cx6+KYnYGIljngH0FtVhQX9KvhR+I2I6pTYS2PW1iRBkpDzj2pzjRKGNr54XtsxHYtLFThZC8HNX6brEZsVsbJhTJYO7bceb4q8Snfxcbafc4PLQrN6QOSzIIl5Y35UdNNdfyCgFOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jtp0wouR; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52b88335dd7so3178103e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 14:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717364393; x=1717969193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3T0GM5JMpgLQCvQ9pF3I+zflChZzD3iJo1siLxt7j8=;
        b=jtp0wouRhrjorldZ7/VPzpUq3WsNRNvRx/BmHYQLgHUFY2NzOtMjDwO/ZLPPbGmzDg
         B2vs7ZuP3aLHWwHTYKwV7GfHa5xBPyfVXW/uOJEucgI0tFzB8LslQADAj2MXhAOaNMzI
         wTnruj/9qmxmLVA8LQpkkgPsNcgZWty3G/aMcWveIbs/GpyC2utnVWokwJdPSTudE9En
         TuucN1lWRQWQhelD3vdYH19QmdQ6NheB6kthqLB5oPdWU2fLb/yS3+3snevFp3a+SGCp
         fX7GifNvKU1ROGFs+8WIKklZNXdNbacOtLxKEz/zSvVBZo/M3e+vhIR+cdTkJ+ss4jp8
         5XmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717364393; x=1717969193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3T0GM5JMpgLQCvQ9pF3I+zflChZzD3iJo1siLxt7j8=;
        b=ld1EZzwEIuHOdpoWZjz0mN7g24vYurjXFufhgVk161hSMh1hVJLJqJtf7oY6MBXLcc
         JolasVkuff3jLoxCgJtHLZ4JDItbzSAharw632LV2lkRw+hcJxIB6zUysaeKJliuCylz
         V2yPhtNOi1Z1AnOmt6Eg5jiOdWh7t6MPgAycO4TgYpm6DiOW70rhrFV4g9vDTLg1QCrr
         yZ1/19ZnBafFoXY01mlmUH65Uvdm/HegpOEnZWrTCFi0dQ0vYainq3S0JjcyOZP3i015
         Lspi2DufFpmrts8mRsQ5hWwjm0QYqJ4/IGRySP7XZQd/IQlIog5ZcpWCKwWpy4nF3CVZ
         JMmw==
X-Forwarded-Encrypted: i=1; AJvYcCW+cFVuP8tXefLVOpksKbZGfh8OrUQGRwkH4y9+ow4HNTrGL66znBJHXiO06ThTQNgGW3SsbfqSrZ1tZddTEYzQTIdtFHIt3Vj4m0WpPw==
X-Gm-Message-State: AOJu0YxB6GGOUr/BmrwXNSF5BkeeZcjLuO8Q+0xNhPjadyRT6iyEqiS2
	oziZ1qCnqt2WYq6ffIE9AeNrD4rQSR5TJdyQokjg3WwLy08TWSKXmlwl7jtIxMiTeJXXQlBag+U
	J
X-Google-Smtp-Source: AGHT+IHK5OeYERzx3nhecYuMqLKg8fOyqhhISkQdGxBmJrro7xmuK/5pjgZHa7cdn/WMoIkjFlxUYA==
X-Received: by 2002:a19:2d4b:0:b0:518:dae6:d0ec with SMTP id 2adb3069b0e04-52b89562d1dmr4826617e87.4.1717364392959;
        Sun, 02 Jun 2024 14:39:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:39:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:48 +0300
Subject: [PATCH v2 2/9] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-2-16af520575a6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3293;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hWYhkAdByN+pW4M02a+sJl2cy100VyTvE/D0nMj3Emk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOakYZO0S50JStaLxVwdPh6TtLl+/JpC6PJ7u
 yekVJ0xeseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpAAKCRCLPIo+Aiko
 1aEdCACpbJ/bSoiXYhSiHOtxXNBm8Oy4JPYqL5u4etM+29PF6Eh7DXUUwOx1HsiGRh7kCde7r9t
 i4nF0YTNJK1WcCzZll1PYuCNv0L9R79+GEl5hMndfLN+quhKYgWXfO3KKwLpwwyv7VE29yPNn0t
 eJjNR/i7/hFQmJ77BfeOb9lPOFp7zgNlPc9Gh76jm+Z1D9mLQV1dQqYo/M0T4BviirKAJ4XvXrp
 PnAsXVZj7DOapIF3iqM4wezwWyO6jljcOrJMKgnv3Qe/UdDK+xI5TBfTkaIrLfJzJh12vJN4/k9
 24hdS2ye/zsLFmj50gWiuzv6wQn+D0dpVWA5KGGduPEggXHx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
Store the generated layour in the plane state and drop this call from
dpu_plane_sspp_update().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1c3a2657450c..9ee178a09a3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -647,7 +647,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -677,7 +676,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_layout(pstate->aspace,
-			new_state->fb, &layout);
+					 new_state->fb,
+					 &pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		return ret;
@@ -1100,17 +1100,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		msm_framebuffer_format(fb);
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	bool layout_valid = false;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else
-		layout_valid = true;
 
 	pstate->pending = true;
 
@@ -1125,12 +1114,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
 				   drm_mode_vrefresh(&crtc->mode),
-				   layout_valid ? &layout : NULL);
+				   &pstate->layout);
 
 	if (r_pipe->sspp) {
 		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
 					   drm_mode_vrefresh(&crtc->mode),
-					   layout_valid ? &layout : NULL);
+					   &pstate->layout);
 	}
 
 	if (pstate->needs_qos_remap)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..348b0075d1ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,6 +31,7 @@
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @rotation: simplified drm rotation hint
+ * @layout:     framebuffer memory layout
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -48,6 +49,8 @@ struct dpu_plane_state {
 
 	bool needs_dirtyfb;
 	unsigned int rotation;
+
+	struct dpu_hw_fmt_layout layout;
 };
 
 #define to_dpu_plane_state(x) \

-- 
2.39.2


