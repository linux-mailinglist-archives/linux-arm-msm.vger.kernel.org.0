Return-Path: <linux-arm-msm+bounces-40752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 564289E6AF1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1736282481
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528F7200106;
	Fri,  6 Dec 2024 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gPtXq5ar"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E41FF7D1
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478220; cv=none; b=WmuzmY/PVF3bZXUW4lCJhF5FWpFS6Yv8cK6+nsPvnNG4WNGmHMwkshWLCnUCT+BezF4Gyrh2jBGJA1CUK09FbxVZFDVdxzQleK3kERb3DCJ0rhe+hgJsxYUsk+58R3nzgslBHyT2tS5h9Cy2vgTDXAK/v51GQ38LmuroyD4l9Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478220; c=relaxed/simple;
	bh=MWBHkdOEPsNn+qx18lkyYR76WN4/LOkeB2bs8gaz3L8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsQl9x6subkYX5skNnOjMwPnuWVrJn/LENk7+XSzYb1oe13td1B6ulxAY1y9e6KInXMi9UrpRoAPT0SZSHDmOdbaApKWYxS5TgDkiX29pW5ylXR0QRNZzKkxm+U+RAycRwWuaLudvOxwhVM8l5MymqaayhH9wfSZnmmv9YNzlbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gPtXq5ar; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-300392cc4caso1124901fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478215; x=1734083015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IK1o74pdns8MHUCAUXuevFOWZGOyLWsbPpjGiW0nUAA=;
        b=gPtXq5ar0qpPdnJUGscli3UI9uaPnKiu04suBW0uHlTvnxJAz3tWNYF+XLXnan6F40
         h0Xd6SE244ZzOfv2OVRJ3aNm3sSxIBfNigDvpmPNyydxVUcDBnSe6qWIuI9ln6dOCL7+
         QvDDK/k21g4mKkl3qxnKtknCllMkHvF3XziJ1J6Cd+Hi0NAKSgM/aSqVCipZXCcBlFDI
         DkHEBbzQWAdi92S0C+beFEmBD75NzyRt4yVw/BoIkdAtZCQPArf4tVPeLUbIVhBQyx7F
         39cl4M+tMgnwod97BhSBt3aq9vb7KM0AH/Qq44EZScre9O998K+Wzw6euv+5YbxDLsnK
         XhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478215; x=1734083015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IK1o74pdns8MHUCAUXuevFOWZGOyLWsbPpjGiW0nUAA=;
        b=ZgDUoNArTpyjDFy2JsaewBmwSS1o2OJmQhv3+RkhAEgNEKa6QfbCDVFQwondiqj9De
         puPheZva3sAJrgL8z7wLVvFACU0Gk7F7Th7KOqxKUfKULqrMhyT6nfnYyDr/+XSO3YKN
         t14ckU5ZifcT4LreY9JWiC935brILZvOW/jJnSgME17la1ExSo7D8VG0VrRF/RH4XpnR
         9yuLW8amdZ/GZW5LnX1Gh6A8KDIkWjTX0QsY4KvZwNJJzAsO3jpvEtF8ednIO87ywCeG
         AZnKkIV0+DqSfARdTqJCOyPPfjTC29OLPbzYbPTr/lUvJ6o914bWERQHYvu9Iva3J2Lf
         Z6xA==
X-Forwarded-Encrypted: i=1; AJvYcCUJr1vly1Uc2eBSYpkzMIgFbi4J6PpJKqALSvCrWzKjrjdNBDaQHC1cCt11bgsUozr4Fjpkenuq9qnNHLe3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9tpkWGLwlxH0iTkjcmdTFfHwTFLtfnH10F/Eer1MlnAGLqMyO
	t/GVZKAQuRGq3R5HfcVvd2zTR7Eyou6ThWxifeWaPZ8ksDu3a9+qW9ct7JPZGtI=
X-Gm-Gg: ASbGncuyt9zBtcAcZgQEyXUNJP8p2ieZvGCzYU/jjNNyHwak5L5YNW1yNqR5doCcfCP
	TpPNzDmxRX1TC9D70JjwNj0l1jShSU6wLgQG1Tce9AOzTQzQX2nNz685lXKYQN8kNNU1GsVorjm
	ym8Ro2nQIUJOyRz/416Ez2/TfJM0ZvciNferpaiO4t6JPrpNtakDcMyQHrDhu8mJkc6aThhbkvl
	OFKl+ueHzCNbkpMK45DfK+cawKqsqVXy4zPT3/KMATzRnNdy6/09qqjjg==
X-Google-Smtp-Source: AGHT+IE1jgPInMsiwRYU6/dysOt31sV51cEwkXMndrxO+i86Jp4v1LOQAej8bchTiqXotmvpJS013A==
X-Received: by 2002:a2e:9a0e:0:b0:300:1dbd:b252 with SMTP id 38308e7fff4ca-3002f688872mr6560751fa.7.1733478215436;
        Fri, 06 Dec 2024 01:43:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:13 +0200
Subject: [PATCH v2 10/10] drm/vc4: hdmi: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-10-c9bce1ee8bea@linaro.org>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MWBHkdOEPsNn+qx18lkyYR76WN4/LOkeB2bs8gaz3L8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscvPX017OK5vH3lmiCwL7kaJ0UcI+IYa3uXe
 18ffiiI2Q6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLwAKCRCLPIo+Aiko
 1TqVB/4m/VFWpZc/Kltqn587dwO8poPOaD02T82hJ5yhbMgXNJJ4xBgopTLH+t6y1qLkjWvPRa3
 +noOhRXSMbmizw9O0yVwv6gxNAM+4g7LDPk06MwmatH6VGTF1E94wSnAXNKaI8qC1bl2SrnJ/BM
 KYHiVVScK35O/os2/qE4pWE0LXnnmku3xyIW8Ls6WMe1qmZtWPFHDfeYDOFCvmSz25/s1Mwwfwd
 KFZzI9qf+sRjDaObOOZkPq6Ckv7STP7qIOBBfScm5e7oF+CtiP6mBXMg9HuQFUocZsKI9nsQmsq
 6UTE1LwnESZWvUAQ4ZC1j4eA/WqUA5QdWk1RE6h3yZLXYzYt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 297afd89036ba8fba571379f5b6d63227eadb66e..f98617b8bf6cf9d92a806e35584e8f8ab0ac9f96 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2220,9 +2220,9 @@ static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_connector *connector = &vc4_hdmi->connector;
 
-	mutex_lock(&vc4_hdmi->mutex);
+	mutex_lock(&connector->eld_mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
-	mutex_unlock(&vc4_hdmi->mutex);
+	mutex_unlock(&connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


