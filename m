Return-Path: <linux-arm-msm+bounces-24040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC53391589C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 905D81F24B1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D67C1A08D1;
	Mon, 24 Jun 2024 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jPC5A9u5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFDA19F48D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263639; cv=none; b=Kmj6OVwggMeQ9XyM1zGnA7PmvSw3GIqJ7Enj3VNUfNSzAK+uY1nc8JrVL9mHMGvu0HiSa+pmx2n4qGe8u2DoCUJApR3gkzq1Whdi6QG+PlvAwe8EsmpOe4VUP795qXPrYYF0wj/dbSGWelVJxYOnpesg7ng0nFjXgkWnETfQlu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263639; c=relaxed/simple;
	bh=KA3D+m/a7g73ZaHa7e8wf9n+neLVMHpRovLAs28rnZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FsBE7TdDWcuyGaxvfGcK8p47GkAcOBy9R9YGk2VsITflvwMlSPHe1RjWyEqFtYv98sdd/VW4uZiBesr2tU9hHHKUf2uVswdfA6tjrjeaV2lR+7rTFU+oIFSWBexyXLB5c99vRD1Yd9EsPjIztnrxDqk1knYiteM1m3ItKtZO9Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jPC5A9u5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cdb0d8107so4040717e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263636; x=1719868436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQ+DHa1toN2+n7TWo7+TJQaBjFWVOUMw0Gcw8PZtG9Y=;
        b=jPC5A9u55Cz8/99Nxv8IXnLTO0p2M81i4DcuF3PqzPhAcsW1xEgUdM3bzhYSEniXBF
         Mm0MjaMc7j5oJjRpf5UEP3X7PSrPCuWvr/LuJLzXuKkcSz3rR5MzBSfOA8CaHFhTscgR
         LtoWj63K6bhp/vCWK4OJpN3HgQ9TJPiaRYSaAoeZ2M+xQ4Dcn2lIZSYZ/GjeCZ+fpqvy
         0UNGFbVPBWloKYnZjafDz2HQMi2u0Rqx06/i7Fgjpe8tQ9Xwziml0eKSqlMDqrMSY53o
         YKarmhMU9cIYSHNrzJpmdxM6MPvOtDLIvgr26WXBLRn+giuWfPxbI25tKLBj45XRvG0b
         O2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263636; x=1719868436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQ+DHa1toN2+n7TWo7+TJQaBjFWVOUMw0Gcw8PZtG9Y=;
        b=FCPB3P+x2E2nMAt5tjyO/BYsolGsF1OqISbeSyFh/uhVrWhIOVS7CbDgb1eSBffcp6
         h53nN5sr8t4FkrktdqcxGUZbI0JHx0qpqmnJnRZ02OELdijV0r3XyAVQjG1IH/WMRg39
         xM578fGGhzPn+NgUr6W0SvtZsaYl2h8c0WyXzvMPLq2J3Ayd4zCNZs26pogyHg5GHsBI
         g5Ro6PIYLWo7tVSEuh2KdIFpbWkzf27tNNtGze5AHSv8D/zER/oYDm3o+40lIfEqqFBc
         0D+XO4hn/n+Aaokd9gFIcpaXVVhJjuml+JQmt11YgQK4hUijtZxFe1jfkcqdHuw1/FtM
         3SmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtzDLaVidqlYNmnHdlq0t6jYx8kO2tY23lgytcxkhqn6gnDhIH/Pv0xN8PIVFGhQeNr9tgpjq9pr036fDhHUVWrRi8SJLxqlJ7005znA==
X-Gm-Message-State: AOJu0YyNMNSdx9RPgKfk1y6oAJGHE+D+bKPsVUQlEt1b2gH9JJPb44Pf
	jDricT4r6flxHQUCg7iC4Bl/3oyfWyzbM/bVfFNd+aUwWCni7ejT37PpcRObCoo=
X-Google-Smtp-Source: AGHT+IGWt/LXA2KMs7RS+iu+Bu8klNrfjdBf/mEJe/fEN6UonHslShDU5B6mjmWqj3kffaWDvXxzCw==
X-Received: by 2002:a19:6b08:0:b0:52c:8944:2427 with SMTP id 2adb3069b0e04-52cdf7f65f3mr4135378e87.31.1719263636039;
        Mon, 24 Jun 2024 14:13:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:53 +0300
Subject: [PATCH v5 13/16] drm/msm/dpu: move layout setup population out of
 dpu_plane_prepare_fb()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-13-501d984d634f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KA3D+m/a7g73ZaHa7e8wf9n+neLVMHpRovLAs28rnZU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGJc+UK3nuvzNMK7zG+4jXibMyipXO8oslij
 VTDrAuOQteJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiQAKCRCLPIo+Aiko
 1bBuB/9DPqusQEDVhZuLT89pAyYTgat2sPdMAaMwHfJeW3Bk0ixx0YJaxEWbW/ikxoly3EVJJeP
 6jXMU8CGkewneOhqb+yl2G+2oIzK9rbpqBIi0jf8xuJ67/hlOa6XR5oeVZ4PtNuUtqWMgXJvgFs
 HJxuVy2VuqN2/+XNhoP05xpreYUb7mjCQN8GT0uxBQwZO3aJPt1uOc5MVjun1eQPTcu5wIWTCdJ
 aIbpzB8Lz4NUFyDPVvBdN286xMwHN/gvLNw5Z1A6/z9OWGlYHq2lDdswJXMwNYgPyI5j9r1JfjO
 xZlFo1kQNW7vDUcrZjNhnlnxLmFZo4hrThNBN1s8wzMXrdGb
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


