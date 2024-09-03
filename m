Return-Path: <linux-arm-msm+bounces-30450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8728C9691F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA0EB1C22A80
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07561CDFA5;
	Tue,  3 Sep 2024 03:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9j/YHUo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205241CE6F5
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333786; cv=none; b=CWI0bLcMfhAzXvX1jPD/BgMWXjgOZ79xGARgKS/6nIQC/MpR4SJGh57Wnddfx64sJUd4pJyENgET/Mwp5XX1HT1o7TQIPT/vqpU/aEMU7CAk9TrE/Y+psvchT2p0wmGfYeJjPxgLvmc2TXzuDeXoHHRQGu2o4oYc5aC68zeQM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333786; c=relaxed/simple;
	bh=u19dHALRdHSRYZ4rbk5/scc2X+1dvppKJEof9vorl5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGD/LWNM/Jj+hHxu6VRgfdPpYH30j0C4oHX3YPw/DXK7uX1ln9ETGsHaS8+HYRSd3V/1Q4OJ+oUUZ9umgBz82TBiqyaEgobG/gbKGOz3lwHXM0LBXi0ODDGdATcFS4BwA4WtXC8eH2MnQ9f67frkoXt7KPOWqVEpzT+cuvwOz3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9j/YHUo; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f406034874so57522611fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333783; x=1725938583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnTpKnP4ELVQ61jnwvZH/DvQ98T2PSNEOPQgmIwZDJg=;
        b=n9j/YHUoN3Pc7PfLLQJw3V09uS0+V8G4PFTwwbx7GIVfYXXbne1vWGpsgtxQi+4uaj
         +nEJNZ2D+K0OgOOUyApnlrkWrop9gpmX4GvPSeRbjRbC+8h7yYmjHnNREOMa8VgAbMJJ
         F7JPbAty9vk7HMkaMwiIy2Mo8AceGZ3X13dCwfq4WxwMDPmaMb0q/8gA0uW9x5uWc3yq
         CAzRz7MyTnnzx+tHvF/PSfjk+UoupxHzViLaD4x8GikFyOhqguXAP6zyneJU3y8yX2ge
         Uohy8DeP9BWfs4YWGXW6MLPQRZ9BrzaUqf9fY78nGgB5iytdF/7R7xLIHyviXnxWoViA
         2tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333783; x=1725938583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnTpKnP4ELVQ61jnwvZH/DvQ98T2PSNEOPQgmIwZDJg=;
        b=Jr1DOIn1/PN4MUOsyus+LJ4NY1jm7dkfSTCiCMDPEGpDsOJBNhChy2pT1CVKblEaJ0
         IsfBMKjLT25M8pd0zI1NPEny35Fa4ClUjJKbJ94az12actwotwVGJFQpz2KjGeHuj79a
         /ifM5nQX6G2ER8Cxc+9KrY+Ohcim6R0RpVwh+osOlBGqKr+Qz9XdBllaWLWb/x6dvLd4
         8woD/Osbb2i5Ij5JXnMccgGwyyZWFGym3JQmxiu8z6/MD9EnhZkMQlh511c6K3QUWn31
         waOIkKBFQdN1BtHh+kjpBWLd7nMdmHsLnbnoT82eLNwJW1g2c/Ri8vUXPwvfNeXxMZ3L
         epog==
X-Forwarded-Encrypted: i=1; AJvYcCXxzLRVvmI5Oc9yMc50Wq7c2mLNFGJm7PkooipfqhW7LMsXTYNS0F+ahQWEEmh1opGJrnTe23w1kKS2iyaW@vger.kernel.org
X-Gm-Message-State: AOJu0YybvCLCY2Ymnp4PME2IzqdrlNJb4c+gS55jeo7JnzSGur7TVMga
	kx6zzEi6EWvOfCexNnDyo7UOKtKmtwgzuo5bmgevNEKpnBH0oxKBiSlKNo1d7h+rFR6jfCpcnys
	+
X-Google-Smtp-Source: AGHT+IEur2S4Nc8ikOaCA/vRxjSg9edwKu2KMOglmSfJLktNRs/Rto+WlQVfrZDdXvSQVQIb7dZQsg==
X-Received: by 2002:a05:651c:548:b0:2f3:b078:84bc with SMTP id 38308e7fff4ca-2f6105b5d9amr123073801fa.4.1725333782729;
        Mon, 02 Sep 2024 20:23:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:23:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:55 +0300
Subject: [PATCH v6 12/15] drm/msm/dpu: move layout setup population out of
 dpu_plane_prepare_fb()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-12-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3133;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u19dHALRdHSRYZ4rbk5/scc2X+1dvppKJEof9vorl5k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEMacu4VLgoz8vof64f2OfQYFd9niVuVDtKX
 83StGnymjCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBDAAKCRCLPIo+Aiko
 1e39CACupr8oxAKD1t+qVPxOmjXpbbdG6wzw8SbDmbedj+zXOC0djbZyWtWzE6hgKL34zGTw1Qn
 GV3mNPqdkKCiTAN1mnu+38hzbZnUMMeTlOcaxs5XthjcpyAGPZluOdgQ774GgFMa2MBnXBkBWYb
 YEGUGiD/tkChgUEuusX9vmMmvgdfewaQJHux+5zTCLzoEYrZDyIdFKadt1SxBMSfDRhBbogUa+e
 YUUHaf8miu9Z50D6d+OtM7zeMopnVpgFQtSW4gAL3icIuITSQ+Qr1vNrjxhal6Si+qm92feHU49
 WmHo3n/Pon45PILZUyc5Hce8jZiYewnI15xbT4gAQpfV8jbm
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index df95377b98fc..3045bda8a7b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -675,19 +675,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
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
@@ -1102,7 +1095,8 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		_dpu_plane_set_qos_remap(plane, pipe);
 }
 
-static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
+					 struct drm_plane_state *new_state)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
@@ -1123,6 +1117,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
 	pdpu->is_rt_pipe = is_rt_pipe;
 
+	dpu_format_populate_addrs(pstate->aspace, new_state->fb, &pstate->layout);
+
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %p4cc ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
@@ -1187,7 +1183,7 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	if (!new_state->visible) {
 		_dpu_plane_atomic_disable(plane);
 	} else {
-		dpu_plane_sspp_atomic_update(plane);
+		dpu_plane_sspp_atomic_update(plane, new_state);
 	}
 }
 

-- 
2.39.2


