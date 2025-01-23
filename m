Return-Path: <linux-arm-msm+bounces-45986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AFCA1A484
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3486188AE12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B4720F07B;
	Thu, 23 Jan 2025 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+i/gNLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5043520F99D
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737636306; cv=none; b=mHW6QCzuj8d9BgqbMzs4ZM0qnVsHY9eqiRp8nesT9NQWhExbkgR8eWGVLOhb2tWNTcxxJ8bXvdgcuPwsAwEjVQqj1E8Lm9N+T8uwrDhVv5c+b+uD/bG81ffBoppG9fT60X/+j6nIjTaoTsEKSi2wH3m1ylEPjiGZgmaxRsnCByc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737636306; c=relaxed/simple;
	bh=pI8jt/Gg0nWGsVNN0M+A+HMbfSuoINnuOGtnWy2LNDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDRGN/vU9Kcld/s1a1DqHNY1yiimZWVooim2GBWpjmSJMwGCSKp8MhGX7t4QDKKGkdt96mf0QElq2gKFY1X/cMUnTqEQzcI1435mQR6Sc6PtNuR8pfkd/+RQSqvF7w1wKmqTJ1ok4UCaO9TNZxSok69G3pvFuosC0wiet8kJhl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U+i/gNLi; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-304e4562516so8713311fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 04:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737636302; x=1738241102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vF0qbcrlUHMns+leDnByN9gAa2CtmYb+mw9y9wF8iU=;
        b=U+i/gNLi2prK3vWcirDSfvdTlbzx5d49ri3NXc/I45csnOUy30MP0beoYb8UOitEWj
         OS0mawaMkqy4Oy2I/1MzAFxB8lhMu41txL8LHYL+HrgmRSn0X5l8+6eIQp7A160vebyL
         OSVnRG3EA55SRJACpfKbYSLZNcPJsDXGhpjsQDrulB2PoE5iP3Kwy6oMKbe8s7w98Of8
         jv9HMsQFRIYPw1BMQC+qn8tsMby+PW2r4G/ktg2qS2mCOzsFVNssir8kfZyLY8099y3G
         qCW6SeZg1FnuHVQ1ICQ3Yd3IYLwzqGCGJiHPZ4h9amhWk0Q1aJdZDMiwHUU2GUAuSrs/
         QFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737636302; x=1738241102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vF0qbcrlUHMns+leDnByN9gAa2CtmYb+mw9y9wF8iU=;
        b=JeMS1aSwY4BTd9Xau3FaisSQa3cPODuLbTLaJte1BHj7WSkVe+AsOZ33Aw5ctmKrXZ
         c1Dp6X2fnhWrzOANEN9D7whz7cVUR+m0fyMLLTaiW/cWPs48+z/PqrHnk2C3MuwhIBUs
         3Ld+GgQ2SOZtGxAYuSCb0MOwBXsqI9GwvzrHzvnvUfomOUkpBGrE390IRK0+vNsjQlNA
         CSp+xY+xWo0h/Gfi3NwvSClEr/HrJJXYRdJTJYlxV83RmNlPAGjQaJ+VoLqCwWb/oK7d
         HNbpY3pDaii4fwg37F4TMKsJK1EP9IRkhHxQDOCnof/wPuxEZRnGmjkPCEVWnriBLn4/
         ysAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhLSw4ySK7U1U5VShuJVpi1dtmMOG8oEblR7vPQpLh43ddeMWFuaxEizRKGtaxeVhjwfCfgGUAYvcr2+bK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrx70Zx1q+26RwZOjBuLxN9yMVkPIslDfnr9R6X1+4Ql9cyA1m
	jyi8FOjLJ3TzFiczVs/3nwMHTs3W0YfncMKzPL8c4Kr5n0nsqAJl8xk/mHD8/pU=
X-Gm-Gg: ASbGncvC/GwAssXz4CVUAJK9WgaxTUstlvJzEU7vB3j9De7oiMwQJ3K+gUhFQ1iYi7+
	qlGQuxsFWE7Zpn5yqe6CggMGx7IWF3N1BKKyrbSzbyKJaZo7SxYk8J+V5hW2n/TZdqakqLHKjGC
	KB4a/iFE4vNFOirXaEO9UVLYU6XXwaGJq1WfjMgK5gKw0cs/O9l8Wd4n2Aj8BeAe1Ls3E3iPIb5
	hMwhLSj9QUk71gfKG2tDmW5C62suJVnDWyqJUltAtH3iVn6MLu3qFLNnngn/zRPc3TTVNMJMZdA
	k86WmtwEOqlz
X-Google-Smtp-Source: AGHT+IHfHG9O5X1llYskqSd6JQCpl9Yb2Ept1YS83FF6LDGIK5pJeawqROTCwXIQP6rC+URwkRuOjA==
X-Received: by 2002:a2e:b5cf:0:b0:302:2cb3:bb1d with SMTP id 38308e7fff4ca-30761bdd3d7mr7826681fa.12.1737636302270;
        Thu, 23 Jan 2025 04:45:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed6f3sm30351661fa.86.2025.01.23.04.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:45:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Jan 2025 14:43:35 +0200
Subject: [PATCH v2 3/4] drm/msm/dpu: simplify dpu_encoder_get_topology()
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-drm-dirty-modeset-v2-3-bbfd3a6cd1a4@linaro.org>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
In-Reply-To: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2264;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pI8jt/Gg0nWGsVNN0M+A+HMbfSuoINnuOGtnWy2LNDQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/oky2MKZhXySS3cvArifmwRFeu084Kz/31hv6VsytTww
 jkjfXEnozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACaitZX9f7HD3ws+xzjNY22N
 L/2XVW3Qnc5ftXqB6Y61F6cfenfkp+6fdv9fzgsjdZ/Gpa5L6X7gyDllw+PNRy9e4i25tP1rcau
 oeu7VAN0fFXuK1RL4c6+rB0Ut2av29odicvKh8q7Jk9X+a3X2CvqFlBV2rJ5ld9hdf+apqhbpgJ
 /b3tv2C909rRE84WR1gtlXmwVJt/13F3W2fXg27/bXA5t7+qVEfydxhNmLFgaFSB7s8bsvLP43Z
 Zdon1GkdFT5C7lNzBnCj/zOzc843OjA5xzamXI/PjxvDn/S2pdL/PwncB/q+hYqVPBhacjkd5pc
 q05ERP5d+XfPlZmBujxzvne8WNb2V3pRaRrLNW+l7Q1VAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As a preparation for calling dpu_encoder_get_topology() from different
code paths, simplify its calling interface, obtaining some data pointers
internally instead passing them via arguments.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5dc2e0585de1337601a0426795d2c8f2806ccd10..fe139c49823674adf980db5faa3f2acd4c9c20dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -649,14 +649,14 @@ struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
-			struct dpu_kms *dpu_kms,
 			struct drm_display_mode *mode,
 			struct drm_crtc_state *crtc_state,
-			struct drm_connector_state *conn_state,
-			struct drm_dsc_config *dsc)
+			struct drm_connector_state *conn_state)
 {
 	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
 	struct msm_display_info *disp_info = &dpu_enc->disp_info;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
+	struct drm_dsc_config *dsc = dpu_encoder_get_dsc_config(&dpu_enc->base);
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
 
@@ -764,7 +764,6 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
-	struct drm_dsc_config *dsc;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -785,10 +784,7 @@ static int dpu_encoder_virt_atomic_check(
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
-	dsc = dpu_encoder_get_dsc_config(drm_enc);
-
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, conn_state,
-					    dsc);
+	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
 
 	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
 		crtc_state->mode_changed = true;

-- 
2.39.5


