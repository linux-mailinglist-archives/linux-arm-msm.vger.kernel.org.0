Return-Path: <linux-arm-msm+bounces-14515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 978AD87FEA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 14:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D948285341
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 13:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49D18061E;
	Tue, 19 Mar 2024 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DF4eQL5q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55AD8002D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854529; cv=none; b=M4zvodIE517cGTqNr/aaFAKifQApGQSFAXQtoW9WbyaQQipI8kdUMxQbQBZjrJd9LknjQrPYg2Rx7ywdVdLs3N2/GJtS3O9QShdFTU1q1MQripFR0cX9+FOYl8zn+G9lKMPbR49Fig5+m++RSPg/YPWIwBveKLS7EWp1PXkKiJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854529; c=relaxed/simple;
	bh=zIBBrMeVyHBOI7xFU2blyQniDBu8Ce/9r1dzS2RD+9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xmu0JyZ6RZuhQkwyb4fc/BvUDj/9lE8fp/nO++l7TS3VRiFtHrNeXjDayazPh9AsiGdeWDXnUOH/d4Uhy3Gk6a4lKgxMJ3tGpXKHIUgm0OwfIWr7lkQw2TDJkS5NMUov8wCSADA8nS/RR8uqvVNkjxIaYaryhjfPj3ylNgsB380=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DF4eQL5q; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-515830dc79cso497658e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710854526; x=1711459326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WD7yBNRoaRKt7gkhASL4YuNhAW8aTci/0KYixE/5y+0=;
        b=DF4eQL5qUp7OzVWGyxNbzDZuiGcCTAW7eF6XlrXtlmJAxFiZdEx1xRAodsMZebqlVb
         od7mYdPVChwJmn1vu42IqY2LRc52v3MUdSU4hSEAVB75aDSjbRiOs0jLabhxUCUiu33H
         h9l218v/+nk6GjRrZ6R+sOpzrvj7kzCCYPpBp9VnCEd+YOeWGtVflnD2F6ODfiJj96S3
         KRjT+69waeT5kXpyj5c6mg/If5koMTARDOBNnhON3QSDfedAJrG5kG+y+f4LgUqbat6v
         KHEdlHkaFwosjNNEU29njIRQzqAeocRSzTjZw+CxjD3aYkveeapbs9gY3wta5sqSMR1X
         ORiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854526; x=1711459326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WD7yBNRoaRKt7gkhASL4YuNhAW8aTci/0KYixE/5y+0=;
        b=LM3j6ZV2883vGZLjbhCVML++AwLFDtRHAEfT0RJi5ArXmItl5E9R6VD93un/f4qYrq
         Z4dsm/yOjO+Ksh3sU3W9rTLbrRHgMVhz0ZNwT3xbyPXUhzHkGR+78eu1IBuudqRkAfGw
         kF8vmxkgLIm1kuiB74QC7DQN/j6a4cd2trkyjajHabr61MdkFPAvwzFqF3eQExG5RF0r
         z44UE2M6KnfX88Y5IIqGL1Uk3cIn98B+Kk074RlBOfrsVDEJdpyiljl+W08dKbpW3ac9
         LVla0reb4Kd413ep5MU8tK75mz/bKEJwkkNG53/fGkpuQc1bExkqaenFt3oIuEJCZ588
         tC1A==
X-Forwarded-Encrypted: i=1; AJvYcCVLlLL/eOlU0k15TPo0r4k5RfkLZknIBNyP/CBN1A/56xUuxtYgvM9xGLJodr1XJZCrSO22kD9g9ZyBTgN2fSDRtGaxJ4l5cHMDmQkL5Q==
X-Gm-Message-State: AOJu0YyrCKFH91DUXgGX1dpFRbZBRnP3n++NeMVaqEenOW1k0R5penZZ
	+uQBFuzmLnKGUr67hO/8So3VwaUjD7ratOIdahEYOWQctVXSULamlhFnI++slwM=
X-Google-Smtp-Source: AGHT+IFoBlBXLATJwtn11NwC95jZvMudqneFSyVeHjOITEmsLIkS67V0F62kAvSJefpUoEZ+7NC6bg==
X-Received: by 2002:a2e:a9a7:0:b0:2d4:1700:34a2 with SMTP id x39-20020a2ea9a7000000b002d4170034a2mr12647195ljq.33.1710854526182;
        Tue, 19 Mar 2024 06:22:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:22:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:03 +0200
Subject: [PATCH 5/9] drm/msm/dpu: check for the plane pitch overflow
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-5-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zIBBrMeVyHBOI7xFU2blyQniDBu8Ce/9r1dzS2RD+9s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF4pY/VL46Xa9j61sl17x/W0yJqmKwYdQhs9
 Vw0GposSJGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmReAAKCRCLPIo+Aiko
 1VS3B/9FskmpJEoP55DmNokOoSiMJDEZE3wEQQ6GKqWCsbSnYBkPyUh2PeUgd0O1tBx8HNcRjoA
 rOXXA8utPu6bAYapEPS3PuB8cCeexYbpRz5kY2dTA8n/noQo45XxoShxg+h7fufOWkJpZuiamJk
 9ZtNVutp1StlESc+xfiyiVS4sl3qQAD/mulmH2T0rbqt8BGUcqxz4E21DKB9T8kJEAjEmddeLLM
 GgT4g0Snx2IwzgAxGxTJfzUlwjP3JW8OdBBOWHw0atcGlMIo38UUO3oiyMK9D3P4y4AgmHOy2zA
 ta1g7zqBbm9jyyDHktmmc9i8sQ4cHA2x/Ixrv2t8m9gOkjn5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Check that the plane pitch doesn't overflow the maximum pitch size
allowed by the hardware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index b7dc52312c39..86b1defa5d21 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -12,6 +12,8 @@
 
 struct dpu_hw_sspp;
 
+#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
+
 /**
  * Flags
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index a9de1fbd0df3..9e57c51f5343 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -790,7 +790,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int i, ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -864,6 +864,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return ret;
 	}
 
+	for (i = 0; i < pstate->layout.num_planes; i++)
+		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
+			return -E2BIG;
+
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2


