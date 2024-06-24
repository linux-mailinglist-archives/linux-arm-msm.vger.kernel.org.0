Return-Path: <linux-arm-msm+bounces-23989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA73D9150E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91A782860CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D71D1A0706;
	Mon, 24 Jun 2024 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hq08s0pJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F96B1A01DB
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240446; cv=none; b=YpAsTECfXzutHu5AH2cj4SMbpH9yOI7lMlwK9vNEMbR2cRqYoC38zTs6bn2jfjn1bIqBUn4GIVL+xNF/qRywzGvwLvj8Um9y85pwASh++iOV1NvphvCcNd0ussCEl9no5zM4hYpD6+V0cXfzQ5dMO32T10rKvS+y+dt22MkDKYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240446; c=relaxed/simple;
	bh=KA3D+m/a7g73ZaHa7e8wf9n+neLVMHpRovLAs28rnZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkN11hAVi8n2NexhMCj9kzFuPp3tl44nrkAxdULdle2Z8ffB27BcOy50S436b9B4wd86ycVvi4SehGLw+e2p13AmzBXJlV64ActMmo3A0a9XpkwHItbAyynW5USBFRBMq1nQcqtFU2pnrVLIRSnoh/R0EzyKpjMIPDCjvNda7co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hq08s0pJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cdd03d6aaso2274875e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240443; x=1719845243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQ+DHa1toN2+n7TWo7+TJQaBjFWVOUMw0Gcw8PZtG9Y=;
        b=hq08s0pJTsfKR1tVFzUDEdqvVXHP3kF9hTNibGoch1MklNwcbxnE7ls8fBc11V6+Zv
         FSeQv8X01CuRaX0+uGxgpjGVSvLA6aAQ8o++NcZx39K/6AB8E4fgv/i1mAHvIXT5UiHE
         bbZcQCN6fy85x01tsm0MEdwAzpWyGo91kuDSIBxS+yAb9WOugR+PtxP8MQe118pafYj5
         lA5mrst1p6UECMbugsKrjY4CIaYflANvydXqMOjOGnm5+lKUXDnzfmGopCOgwZ5dC0cg
         iOaScr84ZtCBkVIGILKz2ygO3NtteA2B8ZhOZwoQlacBB6CH5A3Il8wVnxhPxkLlqfCh
         TZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240443; x=1719845243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQ+DHa1toN2+n7TWo7+TJQaBjFWVOUMw0Gcw8PZtG9Y=;
        b=t+DmyKNDqSq32ZbB3cD/YI783qLfT8lX52W5Dm508xHomnp1ixCM4ZJgo7SOJ19CCT
         MhPou5/9AxaRi2Aw1n3uw2SIEky4U4EqeCNUOPPZPWVuWJhB15yiHT40N6FIAB9P5uXH
         a0N8pKRT+U9gWBlt/TCOVC5agEIUIjDpmSWZ+XZhrvDTkwnMIEh5VnaLMyDztArk8oVZ
         W2nH7vF+JFsawFaJHLEaxFvNrJiLtGHxRLROqg/tuszySi+R4zSYHI1NmCG5Cq8LgoFC
         XBGRPxo55C07Hk+o3ZHGUmHrwVH8E7+6XSxVkwO0FpbYvi9m0ExCobuPh23UGKWDUw80
         /GTg==
X-Forwarded-Encrypted: i=1; AJvYcCV8UP5oCavsPJTET5QIa15YyPEyU8ocrXs2I9xCjvqLrxa0ntuxdXWsYHsfhqMILPGGqRzr0Ipm3auZgETYc7JfcTpnzPD09Q6S40NAtg==
X-Gm-Message-State: AOJu0YyVTaxzQrWsz9adIvC2gdZeZKXQCg2RIOysJjzPn/pGHn9kbyNJ
	TdI1wcm8KazgBDxReo/BX4bVKPME+zrIQDPbPwOdvhYJ1p50JyPwY8g1XoFt3Tw=
X-Google-Smtp-Source: AGHT+IFYs+QdZxu7xVQC/R0vHG0CMkV/ehojX1Swu7BBcnrWQIzEquRrVkOeQ2GviNaYZZN8p7mwKg==
X-Received: by 2002:ac2:5617:0:b0:52c:b606:2b2 with SMTP id 2adb3069b0e04-52ce0673b84mr3108321e87.46.1719240442967;
        Mon, 24 Jun 2024 07:47:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:19 +0300
Subject: [PATCH v4 13/16] drm/msm/dpu: move layout setup population out of
 dpu_plane_prepare_fb()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-13-1038c13da3a5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KA3D+m/a7g73ZaHa7e8wf9n+neLVMHpRovLAs28rnZU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbwdB+x33XFTd68Bqk8Qd+8V4zPpzKguQLAR
 TFcquTWZnaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8AAKCRCLPIo+Aiko
 1eSSCACG2Aiq6eqYvlJ1pnYozr1SXoRLqOGO1q+bShx1C6vjZbh5Z6y/wdiF3rAyoipMEGmQ/vD
 sUh5RW+GxShGjICYW8qelvlGt/5a3fGm9mhT0WDtagmkRIdqG5jLlx4LrYbfVAM0IyHmy8Voszr
 rgIAFFs6yXy+V3Z1tI28DUiqJ3UqSWDrM3kq3hjgJ9LG0sotymjdR3Zxid6fa9kG96sQP+1h9Dx
 qxM7Ctl05l0P8DMGILbqqs0MRkc0kOq2MsK/+3P3ZOcniLw2MhTHI9YYlhWWTvvSl5+rfw9b0Pl
 8wDXuRZwpH1GqKEO0CIBriNoesdaxCOm+vtBXBp0ITPo+jc/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move the call to dpu_format_populate_plane_sizes() to the atomic_check
step, so that any issues with the FB layout can be reported as early as
possible.

At the same time move the call to dpu_format_populate_addrs() to
dpu_plane_sspp_atomic_update(). This way the all layout management is
performed only for the visible planes: the .prepare_fb callback is
called for not visible planes too, so keeping dpu_format_populate_addrs
in dpu_plane_prepare_fb() will require dpu_format_populate_plane_sizes()
to be called for !visible planes too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1431ea753a4f..a309b06b0992 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -674,19 +674,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
-	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
-	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
-		if (pstate->aspace)
-			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
-						pstate->needs_dirtyfb);
-		return ret;
-	}
-
-	dpu_format_populate_addrs(pstate->aspace,
-				  new_state->fb,
-				  &pstate->layout);
-
 	return 0;
 }
 
@@ -863,6 +850,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		return ret;
+	}
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
@@ -1090,7 +1083,8 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		_dpu_plane_set_qos_remap(plane, pipe);
 }
 
-static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
+					 struct drm_plane_state *new_state)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
@@ -1111,6 +1105,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
 	pdpu->is_rt_pipe = is_rt_pipe;
 
+	dpu_format_populate_addrs(pstate->aspace, new_state->fb, &pstate->layout);
+
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %p4cc ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
@@ -1175,7 +1171,7 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	if (!new_state->visible) {
 		_dpu_plane_atomic_disable(plane);
 	} else {
-		dpu_plane_sspp_atomic_update(plane);
+		dpu_plane_sspp_atomic_update(plane, new_state);
 	}
 }
 

-- 
2.39.2


