Return-Path: <linux-arm-msm+bounces-40747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D1D9E6ADE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F2F316C3D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575091FCCE6;
	Fri,  6 Dec 2024 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMTifyCZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD9F1FBC95
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478207; cv=none; b=Tc8Lx4IfjFjMyO987/NfDAB7hkrcGpecMDRgjnyy9XuiLARAQBooPQ+SgyI2cXoaQuJeoDzNj3SGLoDHh8M9C9LwDppLIXiMPWOo/KV47QggPBAcPu8q5BklY/tWkO6IBZOaUOmexbOab+9TbIngF44mhrOOVBrDyaUn/lrvIts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478207; c=relaxed/simple;
	bh=I1wH9N5enlUiSVwdDRB0wmAdGhFse9ySIo7WNjanmNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y99N04jWO1Mx5HgiP0ceDqTvO95XT3p0O6+9vojhkRAvFhlQz4wuDpu3Ycn8UJiGtIM2bXVzsp4djn6MA3ucthdqI/jYFwIFWfDHqsM354CeKWTZ49Ru33S1U7jECz6k0fV88wEucWAarf4pVA0aokY29wMe8kIvwDwrzeJRzl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMTifyCZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso22751271fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478203; x=1734083003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DR5UNfjajRu4P0t/KAHkaq8u/GtT1QuQGweWq5XMJM8=;
        b=zMTifyCZgNtKN3aR21By3nPi/D2irO8K4vuxD0UBeYLWeFFFana11lOWMgnoUeaySf
         j3RK6V3qR4EvdazHgY2402LnuPeHaoM2pxExEi9GkZiHuSCgSFnC8CxXcWzBJXxxBK2F
         2Dlkc6fRxzTXGrwUf3+31o7DucopTradayayEvjfjQ3uH8i/r+LAkJOUzhAddJrPGqdq
         c0Mk28/cGzZWkW8pnewbaSSGQoVrx1DceypxgBBb0ptE3OMVocprmSjQ+BJQCiPmP62H
         ifJmcvCwf9zVRJ2P9PGrgo126Xzs8qwtk+PWsqHjiYJEzMbuVWQwSNp4xCx5qO3seBTY
         vGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478203; x=1734083003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DR5UNfjajRu4P0t/KAHkaq8u/GtT1QuQGweWq5XMJM8=;
        b=hc+ltUo9mQEBFMBnjvdbg/8s/FHXuHyYRWSXkfeQ99QrQ3gGu1ntWGqANrMYBBxRZB
         zfxlj7Epto/QS4RBekfT87MRzStRD5vneQ8NUNSWVndF/QakO/jDBuwtfdwFcM+zaLJc
         sgkqvXta5xTm3LDYeBEfsts5ZwRVLLd+X42AkoqecZ4QxgsmJ0I2RDev4Bv8AS0LIvc5
         3a6xbxWNrPVLQBgLyxaWzQAU+dv4C1fIMBaTg78no81Enoo4XjnuqRSgY3VD3LxoT19M
         dd72DHy24tXdv7XRtV5w2i8QR4T8CG//AbF8A1ZPnBiWwHCpyzxmm1MlwvLjdlyTTKVI
         rnBA==
X-Forwarded-Encrypted: i=1; AJvYcCVz2rEkwomw/S3mutXY726fDXjDBFd33xbhgL8bGAQ1eaJYS1YIBfpt7JAt9NInT/M2VDJLQWtc63b3YRkg@vger.kernel.org
X-Gm-Message-State: AOJu0YwbMzcDLk9MwDkSgAQMX1Os/L7eC9Bz4ONeEQjxwjizgOpcRD+V
	KRCfSysmMVHUVh1T0juCuehYMMB6TrQ28rlh3OaQk8KdPH21/H0P25Bgq8NOrc8=
X-Gm-Gg: ASbGnctkExZFf3ismczcjBnk6K5HJ2/aMN/WEkZd7ZcYYqq6/eN68ZYB/0+GtQhNezW
	P6fzGzSzjHB9vV4KsuRUmi50J8oH1d7j16PskiDA8PpTHj6u01EI0pajJdgAGsHQH1MRXJuvI+n
	xdvqAPL7/JV/cQjmg+jvU8EaSRTaYVvq43Nkj/WzUmF23lmaadVCfCqJBZz1F8Yj9LVkYQxb2V1
	8vhxiYgBKBExz14EGqY9QraOVhUIpG2cG09RTgI+uiKMI2UB+DCb3hyhw==
X-Google-Smtp-Source: AGHT+IGCjsHeF9S3xd5zx/P4eEcmZ95qD374mHfeNE0TcJsafXsKauKXde2wl439IjRQlzjjyxvauA==
X-Received: by 2002:a05:651c:19a5:b0:300:eb1:a4f3 with SMTP id 38308e7fff4ca-3002f8df262mr10870581fa.14.1733478203466;
        Fri, 06 Dec 2024 01:43:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:08 +0200
Subject: [PATCH v2 05/10] drm/exynos: hdmi: use eld_mutex to protect access
 to connector->eld
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-5-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=I1wH9N5enlUiSVwdDRB0wmAdGhFse9ySIo7WNjanmNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscuTpR0+HiR38S1fTr4ertYoyhKL7gh5Neki
 QVFnX1dWgWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1cP5B/4t0Yy2pHo0bHZjNzf9FSu/qDR8IpkFFhM98PVBn8EV3bNlLhb3/FOwaAYFawC0R7RFsei
 6gC0/YzWxhmMGYPjsOa/37GrWtmPrdHhBZ+KBT63EfOBOW+V3p8zsoWg67YBwUdMuuGRt0u0auc
 DgeeGk8WkE3xEW+/kPD2P0j0s/FWIYP6HpthpzIzXnTLkTKofLtovXgVO4JA7XKTloel9mAL6hd
 YV3thOkL+KoTiLV5O4nnCwLlrkMriaWauaCc/+rcxPaFF/ZnLJwVFuHb04GMj7WXisEfuKJ47PX
 zmzNh+qUndFSRAODqbBfgIEe9P0WLax3l98lRYUC73tWfPVy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index c9d4b9146df95bb46cb6bea4849c331616c2b463..6fc537c9048f5c8e57e30f083121c9aea6b99a5f 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1648,7 +1648,9 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	struct hdmi_context *hdata = dev_get_drvdata(dev);
 	struct drm_connector *connector = &hdata->connector;
 
+	mutex_lock(&connector->eld_mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	mutex_unlock(&connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


