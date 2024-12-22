Return-Path: <linux-arm-msm+bounces-43060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7889FA3F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ABDA7A1772
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 05:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB25C17ADE1;
	Sun, 22 Dec 2024 05:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EjJHGDXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA88A16C684
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 05:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734843661; cv=none; b=Sv8qFmN3u+WL7/Y3abl9gdv+2I2oVwRBM06QX/COBvoeTEbx570K6Fpd0GmHKbnIAb6FQWg+vrbvy0IL4ggYh5pv8MdNn0HjovQU6pPw0TIHvle/DRyjZ8qzZr0uVh+iKuOnFGfe2BrtEWy4xibtvFoUJc7rMQEBEAPYcJDLX4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734843661; c=relaxed/simple;
	bh=SDNJAbezzZSsnq7fpawYXa2xRvPpUEjnL/Cth4qzNd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BbKWBI7ZiLL4snmhsHlKH27mJTzXlRBiDq8lTYsHIYozxHTjBDZ4rKI6ExoPYXMVRmqFYsgJRlxnmMvzRmPDlZsVmgJHaz9O9OOIWYpxRu2aiURcQKtws162bVTCGVD5euJnx20eI8P8ndStjmnu5WgM5QYKcA9wkyqBm5Yjo7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EjJHGDXl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e399e3310so3626537e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2024 21:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734843658; x=1735448458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PPE+DKsFPu1B8MZdgtx/UyAZ7+JrfrkZtB47k/Sbl8=;
        b=EjJHGDXls7MJoxyFa9LE7FLh4wjhlktH1/1EIDLljwK4bQvRvy+TPhg8MGiP2qXoT/
         twRtSZGBGFph3gTj1ihC4bIfphLImmJDPVGW3x2oDm9SyrCNt+DYSphwsRMVxrlIS4Bm
         2TpAboZKBoFV8HgyhnynDifwrRe7NTFi22EwXkpDevfEctZ1OAoBwevBgeVgWXkIw+Ow
         RQh4ZHllWNE92aD+tBhy0cVZhRGl6cnP77O8YJ4wySsM+em26aeXH6+qYAQpFObL3YjP
         i8nGRiSUk5AwFW/ga+dG6i3CHzHRgkFOcKap3WsmWN06vC0mua/bS7ds/2u6i9Nhfsbr
         XWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734843658; x=1735448458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PPE+DKsFPu1B8MZdgtx/UyAZ7+JrfrkZtB47k/Sbl8=;
        b=DLqQNXNowptXrb/KOEl4tlE6s+UvaMPmxfSEAlIYrTJcntQq59o8Ikf0aBf8Y8EUNF
         7A2gFsp5o42OLJ8fXYijd1lEIkPugYGWMWcamDvmolkRU1RUmGvCdcsaXvAsOJsdX18B
         q298/MbEZsfYBPha/lWhNURxXGeztCV5YMAGTyuNQB6zKX8zAJbJefOnKte3/Ots7Q6Z
         ZpLzRsYDRV/j1nsKb8ngC3/LThNMT3ipc1CCFB74UDTsgr9ixZ0Q9RCi938FL8lKStxb
         3rQwj+h2kOW5qB5Fyoe3YTBlh6SAJEQX8eCd2lZpeuVo1SvH93ph0JFW6JWg6zqo//y4
         cCGA==
X-Forwarded-Encrypted: i=1; AJvYcCWNKoPGP5Cc4ceVZfSRzpeDYV1Wox5hMf4nv+w4emOU+EfSPf18TsGCilqnQrKpFjlA3IPQipDhog7AHvQn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1HVRwt7V+heY//fmx2qAWVk+niFsVkZIMYCy2p8rpGr2sQP3S
	Wi8YBIQmPFdpn0G9vefSKbCRSNgvFlOawVzTJ/zpIY5W+kWlplLzNc51y8WOflc=
X-Gm-Gg: ASbGncuQeBLJn5yst1OIxRi/ERi36psGC0RmdZ2v9EfNh5gqHbZCREhi47yJ31TKiAR
	YSpTz8mNsGM1r7af+LoLeAHi/yXc3/TBzMlQJYcJiUFxo061Vnzl+omKvQCZzklTuUZsvrSC/rh
	Y3WrE06ubtwFbPTf1xow/EbYmpb8jQoRt0dGKwfMJ3e5G65sYbNnsMzHIy+UatDZ5njXZWvETtQ
	0GJDN6hp3CL67oH88MJE6CK2cDkpnbvutZqN9KRVEgKQpRHMVslJUHJYg+R/v9u
X-Google-Smtp-Source: AGHT+IH+eDvaVhNnPNnX4zWTkXTtQclana7wLSRQrkIgq8aEDb+XrV3w0l4HgTPorE4qdZ+Lvklo7Q==
X-Received: by 2002:a05:6512:1594:b0:540:25a6:c390 with SMTP id 2adb3069b0e04-542295302ebmr2158713e87.23.1734843657997;
        Sat, 21 Dec 2024 21:00:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 21:00:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:45 +0200
Subject: [PATCH 5/6] drm/msm/dpu: simplify dpu_encoder_get_topology()
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-5-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SDNJAbezzZSsnq7fpawYXa2xRvPpUEjnL/Cth4qzNd8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z71T2yv4R9UPEPMcmIkEaIwmjnLl7Y7eQrO
 nscMp6Tu6SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1duyB/4rfKOpjGWq0scuzKBQewFm9Dx24jvzo3P+DhpeytyRxLzingB/T0inzmmrQOQpwKiWfio
 D0jnRNBHfATPbKdu4OiS6Ki+k+1wH8XzuaK9H1/7DYTAWvssLTPZf+ICqjiMg1/fMVvGUEPforl
 6todMfQE7PWAwSCBq+AvLLppjwzKnr4LPlvWprhU0JjkJameNpPMoYw75JklyVFZF52HgKktBdE
 4YvP3+1DV8EVV2PLOTBqbI5FiINVobD2NbQUdj2uOWPN0/K5NOgiPeFbIb24a52wyKwcbO7XIg1
 IkHrr/ZnBzUs4KQ3Rza6ZJjqFgfe+2R46XD4LIAeqHeJh8G0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As a preparation for calling dpu_encoder_get_topology() from different
code paths, simplify its calling interface, obtaining some data pointers
internally instead passing them via arguments.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 88690191a9c9485e052d37749d1b61f50328916e..209e6fb605b2d8724935b62001032e7d39540366 100644
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


