Return-Path: <linux-arm-msm+bounces-60821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9B0AD3AB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4474D189F810
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FAA2E3367;
	Tue, 10 Jun 2025 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OPgiABXh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B132DFA46
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564407; cv=none; b=ae7QfMCKS+v/b6IkpiQqh/eLtz30ZxzHmyXRROiKxoHVtwloJAliQZr7JxYgyUwtnHck7ElbMomNt1asnxc+mCtCQ88DIOOF1v6x2QJnUDius6DTCqc6HckFa/rswO3HCtIija/zwKk3B0WE3c2RQBfU8IkYrLpuHHqrBBubB/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564407; c=relaxed/simple;
	bh=D+6Yu1/EgiQrBj2bZZNEmXKI+PQQyM35XpJ4x7Iqr54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dcjEkkoeb7nxnkw589On5dxbKqc1w1JNWpccxUlK+lfUrCllPYmkNg7CANX+8dNeFWdG2dL0j7yVZwzSZJrEyrjTZh3pMebM/Qvw9R34lR+Yr+lg0aGr+J91CweEixxSCPIVI8tFtQJujUz7WrJ5bhA7ed0MuQ6ryjIDvBKURYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OPgiABXh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4e6a0c274so689931f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564404; x=1750169204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYIOQ6ZhlTG9wMKDyOzgztxEyR0t1ek8t/vwdap4x2k=;
        b=OPgiABXhfynv9BwGTkXDqfNQT1AO8Nx3SLwaXH7E+yhQxL0+M99aeYWEt0WrMjkWJo
         Z76Z0WAB9wzmO0ql6Ah30HOxM1f8se+LWcrIEY3pLnImBc4d6w8euIgyq6i1m55ArWD/
         rAuBuGbC8hvPVA/SJtXmq2RxQ/wp0RpMy+k+1Zgu1TOX/X0JkQqeEOTaGkr4AkOLnQv1
         2sDKsXPDniuNaxbzzES2YM/rEqJlz+NRKpIwjnU563ilunVxbR/q4DXOxOOWzp+FY+eu
         Nc+XyhP7eBJhJrzCFmLawkfM9UbqWnHG0cxXxCbA/nPRlAo3UNE6/zFYxONrEV99ZRmj
         wHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564404; x=1750169204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYIOQ6ZhlTG9wMKDyOzgztxEyR0t1ek8t/vwdap4x2k=;
        b=mxgChjNggbsPcXMYCT+x2FY1sTT2bUUd+XYc28jyYerxzcxjr0Z3PJjOPx8WY4NtMY
         Qrh0mxyVqAuzicl/+DpCUxPucacothFrvdoIufEsKipb56wxzC6ktkx/imT0Qte9fzG1
         0J78rATcmNjJgPkJ4b8BENUXDwQRCR4nMThQQFem7q56ynbN2NBDCbc5hNjVBYuBpRoB
         bC+PlCddhuooU4eECD9IWakDhOOov6T+QWzIB8Tkggxy6qUYFSHSx5wJwLabQYLfNR4G
         G5Xr8K3FzLnbK1X4VNEjqhtoiBZKsZQwEEypbiNPNoFFcxt5dS79Vd7Bxw7pYJ2P6TmN
         aOmw==
X-Gm-Message-State: AOJu0YxrbDT7tprCH33f9E4xqFesDA2Vc2F+RI8BW3/hLOQgftpR6uRX
	vhzo/GAHC1qd4WHXX25u2HpLYFFt6D2DMK9X1IL5Py4KXEyQWCZRnupfYlKbGCj1YnY=
X-Gm-Gg: ASbGncv5pTbZxvbDlMZpkHdxdmPkgIzsrcYMNWyoh705XKKIY8igUyabGFXQrg78djW
	mD3L3LfJ/+s5WEvCSAzjCDNIPh8ALVfvhEXbc2gfortFMB9u2bvv9Me2dxK4u7MTvptK5SGSzRl
	/Fnc8e8tWIUU1gN1X6M8KrQ2HfbUDYLvNsZC9BgTlLwhGuhkdKFlHYTF+tGyGx4KRrDV+h1P7KG
	KQupUIKBswJZ8IMISjXqIbnHGQI3xFyZPz+B6sUJZwJfzFLVcLebuj+V8RylmTUuZ8amuZNOT/o
	R9m3NdjVjxMksfbNy7HIhuTKZkzW82s2STz8wu/5GxuBZUFBjWXPICxYWIJVfEdBxNidrpNSTAJ
	ffpV6Pw==
X-Google-Smtp-Source: AGHT+IHT1nwh85yBDchqkWMiLZ0pByvVB/iTMnjP5S3HM81ODNG7U8SEr0gUNOy+TqUfKgAPTun29w==
X-Received: by 2002:a5d:5846:0:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3a531444827mr5350119f8f.0.1749564403279;
        Tue, 10 Jun 2025 07:06:43 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:54 +0200
Subject: [PATCH v6 16/17] drm/msm/dpu: Implement LM crossbar for v12.0 DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-16-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12930;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=D+6Yu1/EgiQrBj2bZZNEmXKI+PQQyM35XpJ4x7Iqr54=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvNgmBa8hSmi/qKSgRpVrSxd166fvypUWdIZ
 sxVBNS3TlSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7zQAKCRDBN2bmhouD
 15t5D/9a1nGNxtL2npXUocH3rPH36MyC0LeWEb35oCDUB6CGSq5+FZkMKtk6GHxvax78xaY+D8M
 NlVjWpK3CARVe+bwml25r6dWkZTfZSXVWgDBnu77HOfWVNYv4FRQn1vZJRUNZPVBJnhH+PXZYBs
 EHz+OdZo24uzCOgDpZniJiAYTbq7+sIHMYz9HK8S0iMbfyesfR0lmyiHBmJhILkeSXwsGlmMvo9
 3RX7wAF9UYOEUJbSIqbbeJ3F/ih0cbjiEG/sYChcvWgGBir/gGNM2BDhlsGodfclW3OPaoEzcU6
 KQl+HnSMSjjPckaO20CY628GQ6/Hk7GrmnFLRmqiJ10BGkNaPW3XNG0LyBsDNINA7asCUSDYqis
 Y3NcadTDBMhviYKyfJ9q8W89KUE6y5aZbZQIywY2fBLqgTiOm3BOmHGmSxxMystRG+/R9wr3PYI
 ewTMtoPInYOY9prtKGbmK0ee8X2YEt0t1Vll6wK1kAeYKJd53urtceq5Lf2ib/HR3MJOtghOn/m
 CY7T8ElXCjWkxF9kG/6Kr4Z8ZW6PBdw0EUbdyOLhXJqPpgFHCWUlBdPHxQGikd7IouZeP0zJuaR
 /0IQhjT9dSKtIVrTGfiZR46GVRQzjxfEP4qE1SgENt1oIoVRi2Sp5+wu2LJuAnP3PHDtlGRU25J
 ixq2zs4QqSc4fcQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

v12.0 DPU on SM8750 comes with new LM crossbar that requires each pipe
rectangle to be programmed separately in blend stage.  Implement support
for this along with a new CTL_LAYER_ACTIVE register and setting the
blend stage in layer mixer code.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v4:
1. Lowercase hex
2. Add Dmitry's tag

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
index 50897de0ab55c2d8dc2e6547b9f3a033a3ca9b45..782aa86208d54cc28c5ad51215ef458483ff3dfb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -525,6 +525,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
 	struct dpu_hw_stage_cfg stage_cfg;
+	DECLARE_BITMAP(active_lms, LM_MAX);
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -538,10 +539,14 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
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
 
@@ -555,13 +560,22 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
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
index a52d5a74759ed9b1b12a0f00ee2417d9ee37fef9..078d3674ff411cf07614ae68889d8d0147453d10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2195,6 +2195,12 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 		if (ctl->ops.setup_blendstage)
 			ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
 
+		if (hw_mixer[i]->ops.clear_all_blendstages)
+			hw_mixer[i]->ops.clear_all_blendstages(hw_mixer[i]);
+
+		if (ctl->ops.set_active_lms)
+			ctl->ops.set_active_lms(ctl, NULL);
+
 		if (ctl->ops.set_active_fetch_pipes)
 			ctl->ops.set_active_fetch_pipes(ctl, NULL);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 4299e94351d5e5371a86608f5ec1246f0cbe4290..ac834db2e4c16cfd2053f9761c49d91a02bcffa6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -43,6 +43,7 @@
 #define   CTL_CDM_FLUSH                0x114
 #define   CTL_PERIPH_FLUSH              0x128
 #define   CTL_PIPE_ACTIVE               0x12c
+#define   CTL_LAYER_ACTIVE              0x130
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
@@ -65,6 +66,8 @@ static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
 	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
 	1, 2, 3, 4, 5};
 
+static const u32 lm_tbl[LM_MAX] = {CTL_INVALID_BIT, 0, 1, 2, 3, 4, 5, 6, 7};
+
 static int _mixer_stages(const struct dpu_lm_cfg *mixer, int count,
 		enum dpu_lm lm)
 {
@@ -677,7 +680,11 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
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
@@ -758,6 +765,23 @@ static void dpu_hw_ctl_set_active_pipes(struct dpu_hw_ctl *ctx,
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
@@ -826,6 +850,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 		c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	} else {
 		c->ops.set_active_pipes = dpu_hw_ctl_set_active_pipes;
+		c->ops.set_active_lms = dpu_hw_ctl_set_active_lms;
 	}
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index ca8f34ff3964c1adaaacdd3f0a60572da53870e1..15931b22ec941bcf53b6278332736524bc16aa12 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -266,6 +266,15 @@ struct dpu_hw_ctl_ops {
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
index f220a68e138cb9e7c88194e53e47391de7ed04f7..e8a76d5192c230fd64d748634ca8574a59aac02c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -28,11 +28,19 @@
 #define LM_FG_COLOR_FILL_XY              0x14
 
 /* >= v12 DPU */
+#define LM_BG_SRC_SEL_V12                0x14
+#define LM_BG_SRC_SEL_V12_RESET_VALUE    0x0000c0c0
 #define LM_BORDER_COLOR_0_V12            0x1c
 #define LM_BORDER_COLOR_1_V12            0x20
 
 /* >= v12 DPU with offset to mixer base + stage base */
+#define LM_BLEND0_FG_SRC_SEL_V12         0x04
 #define LM_BLEND0_CONST_ALPHA_V12        0x08
+#define LM_FG_COLOR_FILL_COLOR_0_V12     0x0c
+#define LM_FG_COLOR_FILL_COLOR_1_V12     0x10
+#define LM_FG_COLOR_FILL_SIZE_V12        0x14
+#define LM_FG_COLOR_FILL_XY_V12          0x18
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
+	if (test_bit(DPU_MIXER_SOURCESPLIT, &ctx->cap->features))
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
2.45.2


