Return-Path: <linux-arm-msm+bounces-2962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FBC801525
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9DA01F21055
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFA426ACF;
	Fri,  1 Dec 2023 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJOmGZbT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C26710D0
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:19:03 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c9b8aa4fc7so35666991fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465541; x=1702070341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cO2+rr8QXkIOXuaHuUAHDNGeKygnIFgZt3IFpOuo6+Y=;
        b=pJOmGZbTXe6/3Kk+DIdBu3Ezv6BVR6CRxHIgRM1DE5qmz1CL8tuX7w/XuKJNjc3Nsg
         qN/7QP9+x1xTo2utemstsEB0zijg1WRui2lIFU76mlh2J31h3epCm1qrjAMfkBbzHssn
         gRixeegh/F/HIyaWe5uJUddmOVBvL26a0ojBOgKfbeTF1wVhK3r6k1ocAAauO8w8OCRQ
         BXnz2zt3/GIa+VpyHHjbCeVPANPljeixbCuESuRT6uVDEUFV4nlMRsFPYEv1R3lZpgAC
         3Ya4PXuPCVxE8uPAwHH2uQrxWmiLFsQue+466fDLGc5Xa5fSmWFeF6PbIZgS/lqalKbR
         HQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465541; x=1702070341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cO2+rr8QXkIOXuaHuUAHDNGeKygnIFgZt3IFpOuo6+Y=;
        b=jF4mgu1/RD98CaiUP/egADI4EELC3gVYvtH+mi5zvy6iamuPemKruMZ2jvZgLUxkVR
         6cxDn8G8UOI/6SPNCK8CahpPeWevppvNxoKeTZDuOlTPBthiflXEz1L9QCES7kBFTw8q
         lS7xr7L4Vryh9/W/CBZNo2SNElAt5/OG6AQYjDPdANZeZYiiGZN1U1XHgHjS9P+2NqPq
         uZXsgJMpH1apC/tVL/LahXMzbVkzbG/ZY91oplmQIbRDvO0HZzICkT8EViFvCBUItkap
         LPtaY614v8btxpoxnWxLWpNitePiHbyTHr1OwN3Uv29FFpNy4Y6RCWd4F3Bn6Vzj7CHN
         gQng==
X-Gm-Message-State: AOJu0YxAKsOifY/zqxqKh0k4PNDd0F3tUJSzjxE5X02G/QdTI5FSwL+m
	FtezAziR6QmlxXeXSpbmQOL+kw==
X-Google-Smtp-Source: AGHT+IFCFo+Jf6rZMsjGqmd3OMOl4tSqAkYxIs4SXF4bO/2cwb5SK6Gr7JQd+eTDRs2IjRom2lhsQg==
X-Received: by 2002:a2e:9f4e:0:b0:2c9:d872:e7aa with SMTP id v14-20020a2e9f4e000000b002c9d872e7aamr1193435ljk.97.1701465541425;
        Fri, 01 Dec 2023 13:19:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:19:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v4 12/13] drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
Date: Sat,  2 Dec 2023 00:18:44 +0300
Message-Id: <20231201211845.1026967-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the dpu_encoder_phys_ops' destroy() callback. No phys backend
implements it anymore, so it is useless.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    | 18 ------------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  2 --
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index fdbaa92ec1ad..0dc74e315a9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -452,24 +452,6 @@ static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-	mutex_lock(&dpu_enc->enc_lock);
-
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.destroy) {
-			phys->ops.destroy(phys);
-			--dpu_enc->num_phys_encs;
-			dpu_enc->phys_encs[i] = NULL;
-		}
-	}
-
-	if (dpu_enc->num_phys_encs)
-		DPU_ERROR_ENC(dpu_enc, "expected 0 num_phys_encs not %d\n",
-				dpu_enc->num_phys_encs);
-	dpu_enc->num_phys_encs = 0;
-	mutex_unlock(&dpu_enc->enc_lock);
-
 	drm_encoder_cleanup(drm_enc);
 	mutex_destroy(&dpu_enc->enc_lock);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 5dc53b65040e..b6b48e2c63ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -72,7 +72,6 @@ struct dpu_encoder_phys;
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
  * @atomic_check:		DRM Call. Atomic check new DRM state.
- * @destroy:			DRM Call. Destroy and release resources.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
  *				current pending frames to hardware
@@ -102,7 +101,6 @@ struct dpu_encoder_phys_ops {
 	int (*atomic_check)(struct dpu_encoder_phys *encoder,
 			    struct drm_crtc_state *crtc_state,
 			    struct drm_connector_state *conn_state);
-	void (*destroy)(struct dpu_encoder_phys *encoder);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
-- 
2.39.2


