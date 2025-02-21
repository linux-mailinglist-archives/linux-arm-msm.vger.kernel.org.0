Return-Path: <linux-arm-msm+bounces-48922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24DA3F8D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEE99861235
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4B32135B2;
	Fri, 21 Feb 2025 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eBt7mOU8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FEB221D88
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151533; cv=none; b=sgo+8cvVt0uCHtWbom/OfdLi6TwsL4+An89F++N/Zj+9iWLtU3te8r/n53KoE0/0nrdMg8KiMMj4mglqPoaoeYeNs/iz//tweZIAaDbMp2beq/YQi1levUf5e4SloWUbx1kzS33H+sfezu5tHGOZKqdMxhv3eXsF5jJCXqb2PwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151533; c=relaxed/simple;
	bh=B/jRp+dqZi7gerNizVV7Yg6wm0rCKfZ6jWcmKa1/3M8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U/4cEZzq9yfrNZqIS0zq14AAlV88YfLm8Sj1aqWcaF3/WIEzPGHf+hgRCpNGH1a2QYSPY3Z9cNpD+IaAXojnmFDkORg/zWkngmo849v/KWAyrk9PZdlh57HCwrAYg0CcdUWXuB8Z/Wab7H4PEaSQLD7Wwrt75XbLSCfVaa6LuC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eBt7mOU8; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb88d2b67eso28386466b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740151530; x=1740756330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aW+qSd6DJ95OkCJwzAK0BE2R+/YE6FtOoPf4WesQxb8=;
        b=eBt7mOU89Lz/vcaGyGuxKwd6svN72ShK1iSEsi3HnRh8tqvdg8dUxcLfqzl1cwDaJU
         snvVn2bVbyW0EZH/tnL64kCDb5FeL9ukDb2kswKFsPjMKM7ZtSyXHUO6UiGxqILHjSpI
         EMT2AT9uBAQuoQU5Yo5A5Y4kDt89A79gEXqgLNGc4Cw5DiykbidPplLVKpwvWv5Iscq5
         vd53NUkkPo+4zJ7jJLyxYTyFlpphszb5tuiHI60kh3Nx3Fw5gaRfUz/5jgVF32e0OdvS
         djGyCI9ZGQcxVh3QEJzOhSTRvdtbBu9GoTFHc3Tmyt7eAWbReeOtz5fPhzhVzFo8DjWp
         ZZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151530; x=1740756330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aW+qSd6DJ95OkCJwzAK0BE2R+/YE6FtOoPf4WesQxb8=;
        b=Tm0BYojeIRbJbD//MgMfve2lRxGhH07nuAqN5lMYXFgKtDR4sZiY1/lrBHUaicta0v
         0Y9pEjxmBcPvQe8UxckfaOG14NRZzO+N1aJNp1CBPjKsnXV++9EqEDw2LYyf/PX+Isj/
         zEqzj7E40Ksey45cqOvWwvWSQDOtw2bJ+qjv3LBSDCE9p3BoC1ZN6aPbqoifHU9c3QoP
         /nua/kKgLFQKgX3zGewM3UiCua4HxoSA7T/BFUQnQDGvNttjyRzQvu61VggSi2mgSTJp
         iAYAQhc5NqHYG6tDBojfgf0YSH9DWGKkKQbQqJAtUNkbTRTNCV71s93A28kaF6ywZ17T
         rQiw==
X-Gm-Message-State: AOJu0YyK6eKRlFEJYk5lggVgL17/CSbuEDmx6DKJyLg3Vsl61AJr3HJP
	ri27WqjHG1I0WOvGu13IvBkzws23/EQIA+lUAb/3dnID4AgeRA8Q1XYrpbs+QzI=
X-Gm-Gg: ASbGncstURm8j/03RFiZ09jXqj6SbBE2TIMN6osO5oxuZyFPMDimhJeJB1Ut+Gqpd8G
	8fow5IewdE/zc3ayPytpXP5AkH6M4cunBrSTd2YDI20Ox84CCCU+Feb4hgyuoEfzpmpsHKGg+Ef
	DaF1ihQgfmSmW7iLJhDowuS2Kj9Z4MC2U3sXrarat4cnq5qXbuX+5LJ5MUf3DB7ddN5j9sMqHoi
	o3EMJmRI/FHzMj47Sqbeyor9w98nqvFklRJqnv9lzopArot4pw044C8bDfOdOUxDcrqllGez6nK
	k+UR9u5woLOz9mQ2qG+2IEuEj66gY1aAngGsKN5/jIP39fHh2QHI6EyrHodEZl4T3iIxcUQ285q
	s
X-Google-Smtp-Source: AGHT+IGsPpyBg8qOyhg/bDlZOKxp/ndv3BmblV2iQA+6lToEVWtMzzA/1D2pzTN0hV1SWM3Rm5a5aw==
X-Received: by 2002:a17:907:2d20:b0:ab7:bb4b:aa49 with SMTP id a640c23a62f3a-abc09a0bf7fmr159585766b.5.1740151529507;
        Fri, 21 Feb 2025 07:25:29 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:25:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:30 +0100
Subject: [PATCH v3 20/21] drm/msm/dpu: Implement LM crossbar for v12.0 DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-20-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12732;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=B/jRp+dqZi7gerNizVV7Yg6wm0rCKfZ6jWcmKa1/3M8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq+LvzAV/lyIFitzT89Im6WGzTMbAehHu9Pv
 sCMzTuQyDyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iavgAKCRDBN2bmhouD
 1xBFD/9B1z56etjJgkZ4lvUAcC99W/JKa2WVXFlJZd0B+4RxajH6VhzKNSQSm7E50/I7kfv6H/N
 nqE4RwdBTTECcBgwge3kAnk7w5dMLl9WX1MF1Hks9kUbJmjZ47oFUCHINcFGQw/6sB/MY7rL/ki
 jt7nJn+4knVCizMg43Ly4KYwmOsH4Kqbumb3dphnmBrAOWp+MZQIHWfTLunorU5qfjUQTGRCm4M
 H7KwUAEcA73yFEeWmPu0fYUuUr62Kby6ooMLAg8W8/hqVGzol7P85BBfMqE2HiQ3mrtsd9KCDtm
 CwBGeInHpDZbZDjTc/65VkHKPEpPGrLe0Y2QOkT0Dk2exNNTMNhO9a/Omyy3LGwPtxZ+DbYjnxo
 1DogVeppIgN46nxorfS+6+O+MSM/P9XlOkct09gc38ESTCEvLaZA7qgOsnEAeYybUtJDzZ1tnSn
 NVxj+rY9q+7fQKKH1gq3MJXwQfrRVsA8VmqRU/pVNG2iTS3/+bVABal8sPcgdnoub13H/Oa22Yd
 U4A9LZX92UPM6KkooMGA7Yp9an6FYvCHYxZ+ufePAUeh0Tw7JxkElJHHZchPh5T4OADaiz2Hocj
 w/bIWeDEuHyuQeIYqttZZ1N3tE5JIEifPgKjKPimMPCDLMV0XMGEkvuKsxUMt0qO15knssTaYWl
 ErrT4awAgITLefg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

v12.0 DPU on SM8750 comes with new LM crossbar that requires each pipe
rectangle to be programmed separately in blend stage.  Implement support
for this along with a new CTL_LAYER_ACTIVE register and setting the
blend stage in layer mixer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  18 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |   6 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  27 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |   9 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 126 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  18 ++++
 6 files changed, 201 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a362a622bc678e11c4e7ed8a05901ad18ccf38a9..84f10a88acbdec6471ae46d8a91fcc85e01d9a4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -523,6 +523,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
 	struct dpu_hw_stage_cfg stage_cfg;
+	DECLARE_BITMAP(active_lms, LM_MAX);
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -536,10 +537,14 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].lm_ctl->ops.set_active_fetch_pipes(mixer[i].lm_ctl, NULL);
 		if (mixer[i].lm_ctl->ops.set_active_pipes)
 			mixer[i].lm_ctl->ops.set_active_pipes(mixer[i].lm_ctl, NULL);
+
+		if (mixer[i].hw_lm->ops.clear_all_blendstages)
+			mixer[i].hw_lm->ops.clear_all_blendstages(mixer[i].hw_lm);
 	}
 
 	/* initialize stage cfg */
 	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(active_lms, 0, sizeof(active_lms));
 
 	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
 
@@ -553,13 +558,22 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 		ctl->ops.update_pending_flush_mixer(ctl,
 			mixer[i].hw_lm->idx);
 
+		set_bit(lm->idx, active_lms);
+		if (ctl->ops.set_active_lms)
+			ctl->ops.set_active_lms(ctl, active_lms);
+
 		DRM_DEBUG_ATOMIC("lm %d, op_mode 0x%X, ctl %d\n",
 			mixer[i].hw_lm->idx - LM_0,
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
-		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+		if (ctl->ops.setup_blendstage)
+			ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
+						  &stage_cfg);
+
+		if (lm->ops.setup_blendstage)
+			lm->ops.setup_blendstage(lm, mixer[i].hw_lm->idx,
+						 &stage_cfg);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2b2b49fd769bd91634201e8921c1830473fc25c7..b2d4a13222fcab6ffe31cb407f794ef212c23878 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2200,6 +2200,12 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 		if (phys_enc->hw_ctl->ops.setup_blendstage)
 			phys_enc->hw_ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
 
+		if (hw_mixer[i]->ops.clear_all_blendstages)
+			hw_mixer[i]->ops.clear_all_blendstages(hw_mixer[i]);
+
+		if (ctl->ops.set_active_lms)
+			ctl->ops.set_active_lms(ctl, NULL);
+
 		if (ctl->ops.set_active_fetch_pipes)
 			ctl->ops.set_active_fetch_pipes(ctl, NULL);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 3e0bdd1100ebb0d302a852ceeaf8af86835e69a1..8b6b60f5e6206078f1df98b20f77ed91049e6ef0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -41,6 +41,7 @@
 #define   CTL_CDM_FLUSH                0x114
 #define   CTL_PERIPH_FLUSH              0x128
 #define   CTL_PIPE_ACTIVE               0x12C
+#define   CTL_LAYER_ACTIVE              0x130
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
@@ -62,6 +63,8 @@ static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
 	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
 	1, 2, 3, 4, 5};
 
+static const u32 lm_tbl[LM_MAX] = {CTL_INVALID_BIT, 0, 1, 2, 3, 4, 5, 6, 7};
+
 static int _mixer_stages(const struct dpu_lm_cfg *mixer, int count,
 		enum dpu_lm lm)
 {
@@ -649,7 +652,11 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 				merge3d_active);
 	}
 
-	dpu_hw_ctl_clear_all_blendstages(ctx);
+	if (ctx->ops.clear_all_blendstages)
+		ctx->ops.clear_all_blendstages(ctx);
+
+	if (ctx->ops.set_active_lms)
+		ctx->ops.set_active_lms(ctx, NULL);
 
 	if (ctx->ops.set_active_fetch_pipes)
 		ctx->ops.set_active_fetch_pipes(ctx, NULL);
@@ -716,6 +723,23 @@ static void dpu_hw_ctl_set_active_pipes(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(&ctx->hw, CTL_PIPE_ACTIVE, val);
 }
 
+static void dpu_hw_ctl_set_active_lms(struct dpu_hw_ctl *ctx,
+				      unsigned long *active_lms)
+{
+	int i;
+	u32 val = 0;
+
+	if (active_lms) {
+		for (i = LM_0; i < LM_MAX; i++) {
+			if (test_bit(i, active_lms) &&
+			    lm_tbl[i] != CTL_INVALID_BIT)
+				val |= BIT(lm_tbl[i]);
+		}
+	}
+
+	DPU_REG_WRITE(&ctx->hw, CTL_LAYER_ACTIVE, val);
+}
+
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
@@ -783,6 +807,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 		c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	} else {
 		c->ops.set_active_pipes = dpu_hw_ctl_set_active_pipes;
+		c->ops.set_active_lms = dpu_hw_ctl_set_active_lms;
 	}
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 40c8190a329f331401b9503f047c1e74f970eefe..7175dfecea1057db3fa16fbfd4139182a53d1760 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -253,6 +253,15 @@ struct dpu_hw_ctl_ops {
 	 */
 	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
 				 unsigned long *active_pipes);
+
+	/**
+	 * Set active layer mixers attached to this CTL
+	 * @ctx: ctl path ctx pointer
+	 * @active_lms: bitmap of enum dpu_lm
+	 */
+	void (*set_active_lms)(struct dpu_hw_ctl *ctx,
+			       unsigned long *active_lms);
+
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 75bf3521b03c8e243ccfe1fc226aa71f23b296df..c631b4ae8dc13b7b18fab4721a7b2f2d97da717a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -28,11 +28,19 @@
 #define LM_FG_COLOR_FILL_XY              0x14
 
 /* >= v12 DPU */
+#define LM_BG_SRC_SEL_V12		0x14
+#define LM_BG_SRC_SEL_V12_RESET_VALUE	0x0000C0C0
 #define LM_BORDER_COLOR_0_V12		0x1C
 #define LM_BORDER_COLOR_1_V12		0x20
 
 /* >= v12 DPU with offset to mixer base + stage base */
+#define LM_BLEND0_FG_SRC_SEL_V12	0x04
 #define LM_BLEND0_CONST_ALPHA_V12	0x08
+#define LM_FG_COLOR_FILL_COLOR_0_V12	0x0C
+#define LM_FG_COLOR_FILL_COLOR_1_V12	0x10
+#define LM_FG_COLOR_FILL_SIZE_V12	0x14
+#define LM_FG_COLOR_FILL_XY_V12		0x18
+
 #define LM_BLEND0_FG_ALPHA               0x04
 #define LM_BLEND0_BG_ALPHA               0x08
 
@@ -215,6 +223,122 @@ static void dpu_hw_lm_setup_color3_v12(struct dpu_hw_mixer *ctx,
 	}
 }
 
+static int _set_staged_sspp(u32 stage, struct dpu_hw_stage_cfg *stage_cfg,
+			    int pipes_per_stage, u32 *value)
+{
+	int i;
+	u32 pipe_type = 0, pipe_id = 0, rec_id = 0;
+	u32 src_sel[PIPES_PER_STAGE];
+
+	*value = LM_BG_SRC_SEL_V12_RESET_VALUE;
+	if (!stage_cfg || !pipes_per_stage)
+		return 0;
+
+	for (i = 0; i < pipes_per_stage; i++) {
+		enum dpu_sspp pipe = stage_cfg->stage[stage][i];
+		enum dpu_sspp_multirect_index rect_index = stage_cfg->multirect_index[stage][i];
+
+		src_sel[i] = LM_BG_SRC_SEL_V12_RESET_VALUE;
+
+		if (!pipe)
+			continue;
+
+		/* translate pipe data to SWI pipe_type, pipe_id */
+		if (pipe >= SSPP_DMA0 && pipe <= SSPP_DMA5) {
+			pipe_type = 0;
+			pipe_id = pipe - SSPP_DMA0;
+		} else if (pipe >= SSPP_VIG0 && pipe <= SSPP_VIG3) {
+			pipe_type = 1;
+			pipe_id = pipe - SSPP_VIG0;
+		} else {
+			DPU_ERROR("invalid rec-%d pipe:%d\n", i, pipe);
+			return -EINVAL;
+		}
+
+		/* translate rec data to SWI rec_id */
+		if (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0) {
+			rec_id = 0;
+		} else if (rect_index == DPU_SSPP_RECT_1) {
+			rec_id = 1;
+		} else {
+			DPU_ERROR("invalid rec-%d rect_index:%d\n", i, rect_index);
+			rec_id = 0;
+		}
+
+		/* calculate SWI value for rec-0 and rec-1 and store it temporary buffer */
+		src_sel[i] = (((pipe_type & 0x3) << 6) | ((rec_id & 0x3) << 4) | (pipe_id & 0xf));
+	}
+
+	/* calculate final SWI register value for rec-0 and rec-1 */
+	*value = 0;
+	for (i = 0; i < pipes_per_stage; i++)
+		*value |= src_sel[i] << (i * 8);
+
+	return 0;
+}
+
+static int dpu_hw_lm_setup_blendstage(struct dpu_hw_mixer *ctx, enum dpu_lm lm,
+				      struct dpu_hw_stage_cfg *stage_cfg)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int i, ret, stages, stage_off, pipes_per_stage;
+	u32 value;
+
+	stages = ctx->cap->sblk->maxblendstages;
+	if (stages <= 0)
+		return -EINVAL;
+
+	if (ctx->cap->sourcesplit)
+		pipes_per_stage = PIPES_PER_STAGE;
+	else
+		pipes_per_stage = 1;
+
+	/*
+	 * When stage configuration is empty, we can enable the
+	 * border color by setting the corresponding LAYER_ACTIVE bit
+	 * and un-staging all the pipes from the layer mixer.
+	 */
+	if (!stage_cfg)
+		DPU_REG_WRITE(c, LM_BG_SRC_SEL_V12, LM_BG_SRC_SEL_V12_RESET_VALUE);
+
+	for (i = DPU_STAGE_0; i <= stages; i++) {
+		stage_off = _stage_offset(ctx, i);
+		if (stage_off < 0)
+			return stage_off;
+
+		ret = _set_staged_sspp(i, stage_cfg, pipes_per_stage, &value);
+		if (ret)
+			return ret;
+
+		DPU_REG_WRITE(c, LM_BLEND0_FG_SRC_SEL_V12 + stage_off, value);
+	}
+
+	return 0;
+}
+
+static int dpu_hw_lm_clear_all_blendstages(struct dpu_hw_mixer *ctx)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int i, stages, stage_off;
+
+	stages = ctx->cap->sblk->maxblendstages;
+	if (stages <= 0)
+		return -EINVAL;
+
+	DPU_REG_WRITE(c, LM_BG_SRC_SEL_V12, LM_BG_SRC_SEL_V12_RESET_VALUE);
+
+	for (i = DPU_STAGE_0; i <= stages; i++) {
+		stage_off = _stage_offset(ctx, i);
+		if (stage_off < 0)
+			return stage_off;
+
+		DPU_REG_WRITE(c, LM_BLEND0_FG_SRC_SEL_V12 + stage_off,
+			      LM_BG_SRC_SEL_V12_RESET_VALUE);
+	}
+
+	return 0;
+}
+
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -257,6 +381,8 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 		c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
 	} else {
 		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
+		c->ops.setup_blendstage = dpu_hw_lm_setup_blendstage;
+		c->ops.clear_all_blendstages = dpu_hw_lm_clear_all_blendstages;
 		c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
 	}
 	c->ops.setup_misr = dpu_hw_lm_setup_misr;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index fff1156add683fec8ce6785e7fe1d769d0de3fe0..1b9ecd082d7fd72b07008787e1caea968ed23376 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -11,6 +11,7 @@
 #include "dpu_hw_util.h"
 
 struct dpu_hw_mixer;
+struct dpu_hw_stage_cfg;
 
 struct dpu_hw_mixer_cfg {
 	u32 out_width;
@@ -48,6 +49,23 @@ struct dpu_hw_lm_ops {
 	 */
 	void (*setup_alpha_out)(struct dpu_hw_mixer *ctx, uint32_t mixer_op);
 
+	/**
+	 * Clear layer mixer to pipe configuration
+	 * @ctx		: mixer ctx pointer
+	 * Returns: 0 on success or -error
+	 */
+	int (*clear_all_blendstages)(struct dpu_hw_mixer *ctx);
+
+	/**
+	 * Configure layer mixer to pipe configuration
+	 * @ctx		: mixer ctx pointer
+	 * @lm		: layer mixer enumeration
+	 * @stage_cfg	: blend stage configuration
+	 * Returns: 0 on success or -error
+	 */
+	int (*setup_blendstage)(struct dpu_hw_mixer *ctx, enum dpu_lm lm,
+				struct dpu_hw_stage_cfg *stage_cfg);
+
 	/**
 	 * setup_border_color : enable/disable border color
 	 */

-- 
2.43.0


