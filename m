Return-Path: <linux-arm-msm+bounces-15801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A135389291B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 04:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 573D228357B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 03:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECEFAD48;
	Sat, 30 Mar 2024 03:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e2nSsP9O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BB0AD32
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 03:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711770758; cv=none; b=CeAPscL4Xym78HMeKU7giSX55GpWdxB6Vj1rb3oCTHpKpHt6+0Kr9No1nmfnCEtneIjWrxLnZ5/zVRwXsz2w8wX5IDR9yQJK1OHFfJwI3/5Qyb+K1IuYuYKyC7dY06Umvi/h8iY/lvk18mnDWd8t7Tz73xejlOw/O5FcGtYi42c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711770758; c=relaxed/simple;
	bh=Cd4wDXm0dJqTu9lVUdgD8jllEmwa9/NyuEoxlOOn5KM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T0iKzAZv2LEBBX4t3cbZs48dac6G31lqEBkh8tED867kpUjGAvQMhRdTZH6UVTWGKER2bzoR0fHIk36xthE4XNmJmiN9EKcIlqaq9EA5ZciAF1caRifMf0i62LZPfgYhWjzPxe/twwxDK8ecM47jQkNkvnBsaoLcpkbZaRSjiY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e2nSsP9O; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-515a86daf09so3090894e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711770755; x=1712375555; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSA/SKNWRohhoJyQK/SlAoPXXZhhwMJf30uvxPPaljA=;
        b=e2nSsP9OiVR8nE8JbUampLCODT0NnBcJDMdN5fb02uP/uzTAJvF5sATBEFotwr7HhZ
         EBA0oVFCFMlNiKTjIRllqAgz/UU9qc3ATGUpnb5DlrlGMpR/xpErX5TEaZirW9RueSzP
         BU1OYD2TPIUbDA/kNBa1eIRd4fgE3tmkmAYagl/5cIFusOQEF51B0lNtxmQ2CUgXyycZ
         fA+Edjv9xBU0vIBn6x0G0DIIw/UlI3ic6VebRDOCjiJ6/LHT3TKiO3ssBogvxtokbBpz
         ezR3gGpXRBTWY5LUysWBBCi6BoNG4CgwCfQ7f3N+e0R1eHbDe1YN986b+PUyyBpdt+5x
         4bAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711770755; x=1712375555;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSA/SKNWRohhoJyQK/SlAoPXXZhhwMJf30uvxPPaljA=;
        b=RczpQqoEbSy7HdOnkO1oEvKa8PoVGaVnyL1VW5y4dvFtlhyub6nxHpZKUSgO/CtXbj
         0uxexeSh2p4iVBWv2SRB/Z9zQ3Ewxb07+jH0RHYd0fjoITvm81HYmv8YpH0Zypjjuur5
         v3rPgqW5gk4RKpVG4OyRmdJmgVNxHXXAs+74WQ5/HLzxcZkBngObITfXGCTqAaQPnT5K
         7CZn6DLWgYklJpFFfd5cgwsH+Tl6T0W7ZeU/cdO8cCP3inxJaLZIZfGDSVsb/UnDKmSe
         6dNOvUH8/K+GavfEAXCasnW9Ok+sDCj/YCLbkwcUZ9ixc5CgWcaI637teRjyOZV2MoFk
         o+WA==
X-Gm-Message-State: AOJu0YxssAt4KTgZjmFToVLNzruoUD4BbBNOF53LG8XnKUNswSUFLsjd
	GeHU4E2Y3nSsK0UXlX9V9g0LaFEP8LfVxaHe3ipDkCj8trIkdhT1ztiuN3/cgQ8=
X-Google-Smtp-Source: AGHT+IFlJRR69+oen4pVxMw0Gqvq43dCgRxZPVzIGqw5ZCI7uMoYOpiHrFnqV6MrDDhhvWcn76CwZA==
X-Received: by 2002:ac2:44c1:0:b0:515:b082:817f with SMTP id d1-20020ac244c1000000b00515b082817fmr2931392lfm.18.1711770754464;
        Fri, 29 Mar 2024 20:52:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512318f00b005162b5915b4sm86658lfe.132.2024.03.29.20.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 20:52:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 05:52:29 +0200
Subject: [PATCH] drm/msm/dpu: fix vblank IRQ handling for command panels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-dpu-fix-irqs-v1-1-39b8d4e4e918@linaro.org>
X-B4-Tracking: v=1; b=H4sIAH2MB2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDY2MD3ZSCUt20zArdzKLCYl1Ts9QkA4u05CTLFBMloJaColSgHNi46Nj
 aWgCpieQ0XgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3329;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Cd4wDXm0dJqTu9lVUdgD8jllEmwa9/NyuEoxlOOn5KM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxp7T2O55IWA6hiBHWdaV1ewH7jlXLYji7NN8n1tiM26+
 3dWLrvSyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJpHJxMCyvaTRqveOXeHmT
 nON647ApagwG+zQNPZQfpGZu1LZh2qXA4rJS8HiBE3/ohfbJItlR3oFGH3MmfEqdbSD/8vji7/t
 Tt5YIPKxXmK/5sG//khL7ZpMGP/WFnrNVdpcq6usq7PcvlLu12/iOwuHam//UfOuiWR2y0l2c67
 +tYkrkP92258GZSwE8otP14oVkjilomO6W3Fkbv6jpu9rbZNkLemKKU7POLGXpq2zSv7jq/7dTB
 nNefBFp67i9+VusTNcW9V73CSc/fNruZttaeWOrvvRrVzf5l0rXT9otO6n+ol/0082qJQcerZms
 3i2btOJV48kF7Js/yKgnzuCY6SAT5tvf7nT1Vcqa7fMqAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In case of CMD DSI panels, the vblank IRQ can be used outside of
irq_enable/irq_disable pair. This results in the following kind of
messages. Move assignment of IRQ indices to atomic_enable /
atomic_disable callbacks.

[dpu error]invalid IRQ=[134217727, 31]
[drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
[drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/0

Fixes: d13f638c9b88 ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index fc1d5736d7fc..2a2b607bd1ab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -280,14 +280,6 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 					  phys_enc->hw_pp->idx - PINGPONG_0,
 					  phys_enc->vblank_refcount);
 
-	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
-	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
-
-	if (phys_enc->has_intf_te)
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
-	else
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
-
 	dpu_core_irq_register_callback(phys_enc->dpu_kms,
 				       phys_enc->irq[INTR_IDX_PINGPONG],
 				       dpu_encoder_phys_cmd_pp_tx_done_irq,
@@ -318,10 +310,6 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
 	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
-
-	phys_enc->irq[INTR_IDX_CTL_START] = 0;
-	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
-	phys_enc->irq[INTR_IDX_RDPTR] = 0;
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -472,6 +460,14 @@ static void dpu_encoder_phys_cmd_enable(struct dpu_encoder_phys *phys_enc)
 		return;
 	}
 
+	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
+	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
+
+	if (phys_enc->has_intf_te)
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
+	else
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
+
 	dpu_encoder_phys_cmd_enable_helper(phys_enc);
 	phys_enc->enable_state = DPU_ENC_ENABLED;
 }
@@ -563,6 +559,10 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 		ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
 	}
 
+	phys_enc->irq[INTR_IDX_CTL_START] = 0;
+	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
+	phys_enc->irq[INTR_IDX_RDPTR] = 0;
+
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 }
 

---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240330-dpu-fix-irqs-56eb08fcb9d4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


