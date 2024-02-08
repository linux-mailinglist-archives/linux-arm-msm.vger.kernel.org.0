Return-Path: <linux-arm-msm+bounces-10200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9819B84E3F6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 16:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 504E328CBFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 15:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4327476908;
	Thu,  8 Feb 2024 15:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iE7tbtcA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8B7B3E1
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707405650; cv=none; b=WkKGSWRPEzw8jwPcksbCgpnr9ejSdy036waFPtL6GKGCGiRoIHpKZQKbYgSHqdN4mq6cLrJNyM12udDWs6qu5kxwPEBp5dtAVinSyn/qToODYMU5zKzb3r3I7KosX5vtNurtjcTnoxjyL6i5N+v5P0+V+fAS9MLf3M4TmWYIoc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707405650; c=relaxed/simple;
	bh=LqxWcrfLJaFrkK4+v6orB1EiRUgTIz+Y0KjbSmEnvlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhUrUgzd6dlSgaFDrNnPgC+Dnb0F2NRyelpQKo0NqkupVF8nSE7VuQfabSLgLOUof93mWUvjknGTD9m8zbeNiiLt16ofXwaPE15jK4WsZjSA3A3Fs5/CcC08R49fnJyFRkGd2Jn52Y1YEWS22tfCQM495o88Wrnw6PpzbdJCW0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iE7tbtcA; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51168addef1so2799433e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 07:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707405646; x=1708010446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NIw6ujtsUIYYYh687QbPtfZ1kCZBQ+ag1MIZhtEUr50=;
        b=iE7tbtcAPDhb3OiAQ+kQwQ8KRvQi8BcbBT1X+263C0agjb0X2WrePd302ND3a59dme
         KbdGPaDDvYcpHLthC5owjQrgvcsRQ0+p2ajDSEJ36/rADXJusV9BkY8kzMEgpfXLqVv/
         rKITo5wKPdfZFFX5HlnKKcdweBsLNHnnhMODxeL9vVEDgyDEPbBOyffyahG/LAmZwmvX
         baGwhSjz+uQRDnmjKE1HybWWIZ2qlXQdmgnQBc5c4fwqAKzaUfOIOPtDFFv0qWVyK1/A
         bwgCE7QCPy55/YUsM80IzI+RPo26FzlyDLLsE/FQPlF+bdJuOWSJ6xQrkL2QnlHCrn4g
         kKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707405646; x=1708010446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIw6ujtsUIYYYh687QbPtfZ1kCZBQ+ag1MIZhtEUr50=;
        b=QyR9BwEU5ZpgWwBRNQJvyz68GJIUOf17htbXHM6YJznLn5sw33L7xea2zPviSxfHgU
         BLejrYupjF/hYSUefxWM61yvh46b1NP3hxVPNNoEbdq0FGjn8o8MJnVuhDg992vWQIl6
         wXvVY/kR2ZTbWBO2tavyqTRcUT8Jo78a3hDJGB9rWT2HUNv6V6vlORkeBKusnGvgPRgm
         ANTpjN7mnSKVU1LM5XW+JecsylhbXmpQXY9AJram6tib0EC8XXgWOW4DTwkK12isNpX8
         vX5wqZLn0M81581Qnrkpzy5bDKkT68e80dXw/3asrf8cIdh+AfdOokZNE7apGDp4isu+
         dpAQ==
X-Gm-Message-State: AOJu0Yzc5gv0Xy0FLziHJsQNYjuqK4wiJlXAqgUphRMCIE7b6LzOcyrB
	WVqWnAKy7QKMpEVnOodyOEuJziQNtDM4g46MCHw/NXzKiUUWOlklgQsVvhEJDVk=
X-Google-Smtp-Source: AGHT+IHUa3gcP8godZ8zMP/Vgb76O88KRC7IPF1i++7oOmKu5RlF0MOXwJ452EohWaPD1qBPeMiI1A==
X-Received: by 2002:a05:651c:1411:b0:2d0:7fea:2920 with SMTP id u17-20020a05651c141100b002d07fea2920mr5936722lje.37.1707405646359;
        Thu, 08 Feb 2024 07:20:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX074PSmb3MxJH6z7f62I84/Hj1HiP2zETfuF+cnyoANKVme9vqMomiFu+VnGso3L2bWPTWEPfxiaeytVj2K5Kd+gIpQtAU5sG6tK0ncYfCpMSYb8zvGPsmiB4Ke5hWAe3bh8PdZgigy7y5M0uV3F5RrFiNKXCYGvhd4uRbH4urSJR0JcbkoyQ4UwbuospeEMnd7LHRFETS3dxe3uCwcyJBKXzCxSYrb/9oNB2Gqm91stElrXkfqHAUMYSi4/1Ocq62eGmDAkYbQLX2p24/67VOd3Mkxd9NDEnzLDK47Rzzk/A75QMu0WF+Lyxyf6T4rCR4kk5G9K+41EEKjpA=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y4-20020a2e9d44000000b002d0d1caf26bsm22116ljj.7.2024.02.08.07.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 07:20:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:20:45 +0200
Subject: [PATCH v4 5/5] drm/msm/dpu: drop
 dpu_encoder_phys_ops::atomic_check()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-5-caf5dcd125c0@linaro.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2879;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LqxWcrfLJaFrkK4+v6orB1EiRUgTIz+Y0KjbSmEnvlo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxPFK3XtHtqLmF6T6oc6gdHxFqRPBns1rxGKau
 3bNMmEW3GiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTxSgAKCRCLPIo+Aiko
 1T4kB/4tZm+QTrUbPGyYxcrusdsPBusuPHn9Pygt/e6h0MPxQcx3lSUFbnZmynckbPgczTKgwgm
 qviZsLem7X+gnpPs8PzCtZI3AxsRmGJbLq2GnejmChi64V0brHl99YnsKBH4fBiuN5bqmG65KCK
 yNpbnma/nHoA8Ux1AbnT/T+nJaIMCgM2/++iQ0ugESIbHGKAbGk8yz46kf25F8m3+UzouLIMpWA
 olLlFLj250b/NJFv99i1RO/GZ7C8/5Cdqgu6bdywgxVdcsx59f9YHddx+8/wIus+7Me3qUTEZ0K
 /iM0oRiXaqyMZ2/PP1YPiol8lvs29wYbHz5mYdXsUcUi6kkb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Writeback was the last user of dpu_encoder_phys_ops's atomic_check()
callback. As the code was moved to the dpu_writeback.c, the callback
becomes unused. Drop it now.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  4 ----
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2da50ce0c999..56a2c8222dfc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -584,7 +584,6 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_global_state *global_state;
 	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
-	int i = 0;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -605,20 +604,6 @@ static int dpu_encoder_virt_atomic_check(
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
-	/* perform atomic check on the first physical encoder (master) */
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.atomic_check)
-			ret = phys->ops.atomic_check(phys, crtc_state,
-					conn_state);
-		if (ret) {
-			DPU_ERROR_ENC(dpu_enc,
-					"mode unsupported, phys idx %d\n", i);
-			return ret;
-		}
-	}
-
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 7eb8bdfe6bbe..dd9e3603d120 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -71,7 +71,6 @@ struct dpu_encoder_phys;
  *				on split_role and current mode (CMD/VID).
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
- * @atomic_check:		DRM Call. Atomic check new DRM state.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
  *				current pending frames to hardware
@@ -96,9 +95,6 @@ struct dpu_encoder_phys_ops {
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
-	int (*atomic_check)(struct dpu_encoder_phys *encoder,
-			    struct drm_crtc_state *crtc_state,
-			    struct drm_connector_state *conn_state);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);

-- 
2.39.2


