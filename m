Return-Path: <linux-arm-msm+bounces-46075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C77A1B488
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA717188CE15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994D921B8EC;
	Fri, 24 Jan 2025 11:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3Mb60em"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C628321B181
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717280; cv=none; b=ODTrD2ICmnUIj+Cee0iCMWbhiGZl3GEa8ijAm8ojYR8MAcoYzgtwsuEG8bbN5QgpgcFCTvww/PEM4m18nYp3S04A6RxVIlIn9taEA8TWb9vA0EHTjtlZaR8S6EgMxoXr1s4wq2wFVjr+mEFPFFGG3cujvvx5bQmpTLNlkbqQhMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717280; c=relaxed/simple;
	bh=nTNh12sSi+bFS767UAWn/EcHJvQRJYETlDdgdnAZ+xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W/PKYemuWQuC9vF4UcLNEUsJrz+lFdXn+iNbchXB0cu4NqtrDuL3sx7222Qj8o2PAobPJHMd1x+1szkXpl/DMb09peyGc/upo1C9Ohsu5/CVCFRH5mFg6AlxZ+jH1cNctH/8M42yjcZaHn2iuVP1IHxAC4RgR4YTLTzmCSpH2gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3Mb60em; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3022484d4e4so21374111fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 03:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737717277; x=1738322077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49SRE7UkGSC+0Ssj+5USiH7s/Cegkl8gvGe0j5unkHA=;
        b=A3Mb60emP5W3G3OFdfBglig6kiydW23J8eh8lcU9gqaMGBL7anXfx+qiixrkX0RIJj
         v5EN6PN33b9JaIGIpsmj5eBo4dw3rQ1cob+v33601VM/wgTH/61EZ3YavUz5QOfbSMl+
         c2OdQgStN+QO4b1EWrPIIZl7NKv2kCmgLGx1Cd9XvVgAnRYL0nRROeH45ZYvUzHKxtwU
         wRfWSX2qOodXh429bodU8iIOOiitgUL9mkzRidWsfPuHgCw6/jz1RuCqc6EWbJ8c69e6
         OHikwY/j8tfKyHVI/jKGuHUpDNRLfJh3Adf6KfAjlfvKMUGMF/Bi3nnfEyr35OjuZI3j
         uoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717277; x=1738322077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49SRE7UkGSC+0Ssj+5USiH7s/Cegkl8gvGe0j5unkHA=;
        b=b+i3RTlcnF2t6zlmDjMoyDToIxaDvrCV2Qm+3b5LSXtHJwvEvzEVNX0627Lm8qB1+X
         XOy+9qZOlI2wdTGiKeEQ54hpNfm9SrDFV41eaijvUZt3juHECW0yGcgUbbpSguhmsxMW
         N4egVUV5SywM2NXrWeYTO0Nvn3Baa0x7KiIUwj1NzvnakZguSHWLHliLhQwO2AX+kzpv
         /YADieBATYyIgNfsBkMlE13ShLWnvU/ORBpmUFHPqXX1YGzeTTfJWDbBidg8sBaFFdxa
         fOVxOnrQDCqlCyxEfIv7DTFLyxF5SeZXpo1IWquhSbtqMxt7ik0v24jn9Fgxfa8wswil
         Wzew==
X-Forwarded-Encrypted: i=1; AJvYcCVKrhPklmuTI5zkaPJGqoQFEPkFSKveVlvPhlbPsrymg+wmhRVFM3rfVIcV/GWtkvNaYqv7RPwUeiqwS29N@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3UgtG8/RpDdKPgN25i2YGMsmzL7QXfY4IEGyzubLZJLBAenTu
	N3JC354Dkapy+ipyIW1AfFE8nbqotrpcXlf0LoTAPKaziYKZxlcIvipWMceyKa4=
X-Gm-Gg: ASbGncudAVNZqQPGzsxHQ9WBouGGMq7zU9bfQx+YKxqJ+yqQ1NOSCkY4/c3NpeXVnfw
	B9+INvWEXipbbZxUdevsQOF0zpJmHkd5h9Xsz2Nq7SfL9xKXm8CChmtkXKjufq03oWsJ/wRYJFF
	t2IrY+fxNXF87F67P/urMPgfylUJPxYBFOPujWfPgcPmxy1kv2N9d08yWnLh40fDj54etzf8Kcg
	g0gVAjdjAKCxi9wbL19zC0STkNF99e/PXckGneaJaTXKve8CGgBsv0zou7gmV8DRXFcGgJfVlfN
	yAMYYLZbBbSY
X-Google-Smtp-Source: AGHT+IHvm/UlHmhJYepFpY9+XAqem3yxGy84kPFrHVQOs3BnnMkbppx70vdw9RjWnl6viFsEaAv8ig==
X-Received: by 2002:a05:651c:1309:b0:300:3a15:8f0d with SMTP id 38308e7fff4ca-3072cb284e5mr104974551fa.34.1737717276912;
        Fri, 24 Jan 2025 03:14:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:14:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:21 +0200
Subject: [PATCH 3/6] drm/msm/dpu: stop upgrading commits by enabling
 allow_modeset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-3-b0c05c9eda0f@linaro.org>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
In-Reply-To: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nTNh12sSi+bFS767UAWn/EcHJvQRJYETlDdgdnAZ+xY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YVkHVEQzO2H42gTfxsWoNpxy0mROcV3oEz4
 AyfFaZyJYWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FQAKCRCLPIo+Aiko
 1boSB/9Fjf0rWskLkp1CRYYrfV8Hxc3Cp6gZ4ThZcniTvGGLG+/0McgLdqyk+A11cU2jzsLNM4g
 +V2aI4HtslMp1QD6fmTapUdo998Shgg1k7IDk7lObsiKVwfP9CQln2bLNyPqcpo4AQEBdk4vKIT
 +KPBXsjDxBOCrTTfaI9JHj3JX8J35I+7K+U4bA5DBcCdhc5zIExDoAxr7RnL8yin2eWp0JkMiTY
 4kaQLwdPGFFr2tuzRbiV8wUm2x2kT/Oj8qSFKezc8VLG5XLzIM3AXGX1Qrg70eHCTL50IlzF6gx
 sGbZtPmwyIMNkDV2Jck3IckCAc6KtpDzcDv/6Uj0iyBx1UgW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As pointed out by the commit c5e3306a424b ("drm/atomic: clarify the
rules around drm_atomic_state->allow_modeset"), the drivers are now
allowed to set the drm_atomic_state.allow_modeset flag, as it might
break userspace API. Stop upgrading the commit to full modeset. Instead
set the drm_crtc_state.mode_changed if modeset is allowed and if CTM has
been enabled or disabled AND check that DSPPs are assigned to the CRTC
if CTM is enabled.

NOTE: This change has userspace impact, as now non-modeset commits which
enable CTM will fail.

Fixes: 82836692d5d7 ("drm/msm/dpu: manage DPU resources if CTM is requested")
Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Closes: https://lore.kernel.org/r/20231010170746.617366-1-daniel.vetter@ffwll.ch/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  9 +++++++++
 drivers/gpu/drm/msm/msm_atomic.c            | 10 ++--------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a24fedb5ba4f1c84777b71c669bac0241acdd421..84313bc1f9888452914612fab559b390cf38c705 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -828,6 +828,15 @@ static int dpu_encoder_virt_atomic_check(
 							  global_state, crtc_state);
 	}
 
+	if (crtc_state->ctm) {
+		struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+		int i;
+
+		for (i = 0; i < cstate->num_mixers; i++)
+			if (!cstate->mixers[i].hw_dspp)
+				return -EINVAL;
+	}
+
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 5c8c0661cfcd85445950e0f273b8879e7f077727..fdbe49edf2e1506ebeab500e782d456d77ba4fcf 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -189,17 +189,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	struct drm_crtc *crtc;
 	int i, ret = 0;
 
-	/*
-	 * FIXME: stop setting allow_modeset and move this check to the DPU
-	 * driver.
-	 */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
 				      new_crtc_state, i) {
-		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
-		    (!old_crtc_state->ctm && new_crtc_state->ctm)) {
+		if ((!!old_crtc_state->ctm != !!new_crtc_state->ctm) &&
+		    state->allow_modeset)
 			new_crtc_state->mode_changed = true;
-			state->allow_modeset = true;
-		}
 	}
 
 	if (kms && kms->funcs && kms->funcs->check_mode_changed)

-- 
2.39.5


