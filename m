Return-Path: <linux-arm-msm+bounces-22652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167C907F08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4303E1C22334
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 22:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBFE14D2B8;
	Thu, 13 Jun 2024 22:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YMAuvb3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938114D290
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 22:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318192; cv=none; b=AaElVtIVx7H2oQuxnHNiKlF/ynL5ulRZgXfPnut9hIvWRVxhHmAj4gBaezrOxo0wzpyZuVKiznvcPKfgAx5ND9BpCHSfoyBOTmahdyTzSPC9Zhia7i2XPdJrjiZHXr26UcwwWC8kpcJHZU2t2MHbwPyGXiaW04nyt+3+LIs1C9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318192; c=relaxed/simple;
	bh=4803hWNpcHudkouDSAWKTu5smpjA3R/H+DmuPg5Dn0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqIuzpgoFtAlBP7tSC5KVDVpKja2egLbtsR3/1Sf/+9KlOs3/RzsPYvpepkK6GAF+dKKylqQ9W+xbNvOh9WQbjJop/M/g+LzsU0EgQroOXz+ZvU7UC42jul8Bmk8wshVBH9z06KN+n90XbXZiP51UYCdCNsK86eECqEUoVwNuWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YMAuvb3D; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so16883531fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718318188; x=1718922988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8NGTZXoOFTfLmhsazwKT2UsGEPrRF8ia337hm+GXXs=;
        b=YMAuvb3Dh9f5ABJ02sTx00q1uK/RUdfAyRt80M7Q7YwGObOq1Ak+f9dLKOJJhMS/nL
         YWPvcWeQxrRKc9Cy7L2UxvJrLGNYou/TWl0sql19GexNY6lFrNkCWWejwcfvnuE2QoBh
         pxST4nTrJF8VAFh4kfdQ046zgX4XMi4+qkM4R7MLUnGXJU83/zheJBlDlliOAeCDxHfw
         SR/AmlHpNywVKlrbwu/zfnCyFHlQsR1p/lM3A/H8+QFXaPRcPJ0Kq5MPYz59ygHng5Pv
         VE3/+JzMLkRiJP9scd/WWpzZAo+8Jp4jSf90iz9P0QsFUSiVKnG3Bs1ISbHpPkowzOdE
         AnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718318188; x=1718922988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8NGTZXoOFTfLmhsazwKT2UsGEPrRF8ia337hm+GXXs=;
        b=KqAkHEl6ZHbtu4Ax8tXw3+sokbCJ5wpY0UkoLzDeeLS0NCnY/qGadH/Bqt8/NNC3bw
         e7Dxu+xBMfUKt1+cfQFkcWwVjDAdH334ZYhh2ReuGCyEsywPO/tM3P46Yvq8hPFffU/n
         3W0LOp3XE65VRknf1BK8QUX+22//zWpUeC0r2RL3MUM2FatOXmLBwm0SE/Y5cQcQQMAZ
         W29EPitbeg4APbC+HH2EBz2T3IFpTzxcvRsa2m0sNv0/NK/0XBavO7mQjiSBZlnuaivy
         XI05eQmQrbFTQ8gjukiupOIeTpU+nqDQsbs5yRT2W+ESsVki/DnTBvZKsBMpH0iUJOxi
         vHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjmOsMJ9VKN2yrGm3dztKz/FxnKN6MBOjUgWgGBV5anTCB1b1dI8a7/CLlDNcwSBOJCeDk0EoLqJbwRQOjLH9m03PZAr/C0kgEaDajMQ==
X-Gm-Message-State: AOJu0YxnCw3qwGdA6jo8JxedX0xuaOgeXg52nD1341drHJaVrTeQQh0J
	7Svx+wbzqLxyMAYWipHfh+pDzEDfKcLuz/N06TVGd7kHHX8Eo0ikIyB1C3pe71w=
X-Google-Smtp-Source: AGHT+IHjnAgMZOb126beQwLBaABOMPxG56SlKC98+RTdmKWdSV+pY6of3i2I3dGzuV4k1XNP+EZZWQ==
X-Received: by 2002:a2e:904c:0:b0:2eb:eb0f:a822 with SMTP id 38308e7fff4ca-2ec0e5d0c7emr5470821fa.24.1718318188647;
        Thu, 13 Jun 2024 15:36:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 15:36:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:07 +0300
Subject: [PATCH v3 6/9] drm/msm/dpu: check for the plane pitch overflow
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-6-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4803hWNpcHudkouDSAWKTu5smpjA3R/H+DmuPg5Dn0I=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1p2SdqUL53vFQ8s+nGjaJruG+mDfzqnZZ8/Xbg/ycrll
 nDa7ZeqnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYyKVuDoYF5r4B6/xFP2/Q
 dtF0MfL9WPRA+f0xnwznNWssGSfLW1dO/7CCQ1JJT/j1k5tVHzPcNrpF1Tt5zlK5nNq4yU/73NN
 8LX0J7nn7prk5a3oun+8eFd/2wi1UbpdYdYt8TeT/RS35xbHtfw6fnaAYJP2ktixjW+K/q/aLzq
 qZlLVk86w4lPzLZpb75vkOavHvU2a0TOESUS39w5CilLv+pWJGmrXhGm+X7iChg47nmxpZL5xa1
 JLof033UXSCoMXJvG/WZ+TPv9GY7tIRYvUmcxp/odAT6/6IAzGbJ8/McNoRHewVKVeVtmBhsVBa
 afIBfZXHKiVPnr6qdw5eFBfKdrrx91s2g5SNHzbxmSUDAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Check that the plane pitch doesn't overflow the maximum pitch size
allowed by the hardware.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
index 927fde2f1391..b5848fae14ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -791,7 +791,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int i, ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -865,6 +865,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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


