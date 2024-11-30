Return-Path: <linux-arm-msm+bounces-39753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDEA9DF410
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 00:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73EA1162C61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 23:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15D41B4F1C;
	Sat, 30 Nov 2024 23:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aedrvka/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36701B0105
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733010940; cv=none; b=hHzDS4NIyUbXpAMRHPhXMKH0+OfNwkVR8qArRduEFjPXR+swNQnCa+5+pKwEhEchFdqV48BFAJGETaeJHHsLvyCOrspE/3p5rBMc+1EKj2Op4+De3xgvZtwGi14taeRpALowGIQvKqerJmHWUiZtBYJyo/KoqEQNMHu45/mfP6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733010940; c=relaxed/simple;
	bh=Ze1FOtye6ODMMZl22hb9QRrfAdzUkHN5Ex5hTjwt+GA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7m3rsWm7JPnK5NTkjfdmf9eiefASYJLmiJ9hmgKCu/wLO9lFOMrDHs5Y4j7XRbZlDVATbVVxFoftHwIMmfgLMIqu6EkzH0k6U1y3R5c3P3oOyaLLd94ViwfNa3t6xjoxBDNn6Bg40sLmjCUF07jGMoqXqQpaW4Xlg8XkQviDYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aedrvka/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53ddb99e9dcso2957626e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010937; x=1733615737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsbxRwNfx7fnCx+o56uBYxIXkBxgdk/p+7MwRahv2so=;
        b=aedrvka/0jANIl7iYiu8tmsh7Vg7dcRPyDe+iBNpJycGbn5YocKiUQie7ph6D8cgkX
         W/B3ehNOn+oIUesRAdXnYEo7ukKC7kLJfIkjdz2+WdcNXREhYFJf6X7gZmtL5naSrt55
         lgC7AUmyYmtYye+RXXOZVvaNYN6Xeb+4bpcGDuYTcCfQY/UNaTzjBxCZCbeeTBRxWUck
         8CNd7UJ3IA62N1sSN/NslVq5xug8LzGN7dngews0UoZFfLCkRJ/IuAuPqjXexo2nj+jA
         sC8cvVhyyTHKH6gG9hXFFKHsA9tkFTvqnaw6R+Q2OHup9Dhc0WEmQXQa8JdKyDL04FKF
         IBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010937; x=1733615737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsbxRwNfx7fnCx+o56uBYxIXkBxgdk/p+7MwRahv2so=;
        b=L/jPd8helyoRuRe0AsWY4bnEyuk9BQLVZtZACxnbXhp/xgj8KGaHZCyujGOidsujM7
         ZSBFkQXpIlkkecVu3hejnC1nJ7mCvN5/7VxjnakloiWmS3r7P87IViFiGSAo07w+7mc5
         JAp+o9leubsiOktxeWHrC2U1clA0u2eUDIz8U4m9rzllT7hsjEcFbUsAiEb8Lc6SJs65
         Lt25dgOjTFVWRRqbrPbKN1MqjcFUahYZcWYHQWJ3q51XDKhRNJxGGPDF5RoNODKh2GzQ
         /nwhL/te8mAww4QDRXy1wq0Cv4daTi49O1hQae2buQzpL8n2r2xkDnr8Ydz6K0B8VK03
         BY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9elFBwyUJ5T3fQ5SHg0Ub/aedsV457AcYQw02/m3C/v3LnEdxAQO+lm7F1bCAWFTKDxoqnNjKy20pw7PK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq2/phiQPyIfDRBGSF+IpODiQp7N5OHGWQXyoM8Z4C38v1yt7e
	LaG08+/io35db4hw8gl1U93H98fsnJSiDRzA3avJc0Ckmd59EbK4RF6sbx9k+/A=
X-Gm-Gg: ASbGncthA6qEJJu1lVvAtSGTarFWQsxeA39Ipf0HbflwvI07JNCrDoePI5IeZfPlSL5
	dXpq8WmMeAHfM4Oo0sH7u0w6ut1I03BBvHTso1HTnixlXv2fk8ylJ0v+TzGkA6Soa7kqDZepC5M
	4qtIn3n1NWlA13k6oT7uNsxCvpCjiTX5o9xKrjTIUKAcMC0glMZ+9BRjPhuzThMrebtJbjZ1DFD
	HgsMonXAbQs6YE+YoEtbXbSQSbkvN6AgW1bgNYXV/mkU4aDDCS8S6tp4g==
X-Google-Smtp-Source: AGHT+IGcKx3qxr+rKjFg6uN+w/t1xLv8z34zeudztpmb02c9r0uba4ZBSNTSBCZfWNmdHrXgT/XSFQ==
X-Received: by 2002:a05:6512:3e2a:b0:53d:d431:7f3a with SMTP id 2adb3069b0e04-53df0108f71mr9006077e87.44.1733010936909;
        Sat, 30 Nov 2024 15:55:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:20 +0200
Subject: [PATCH 03/10] drm/bridge: ite-it66121: use eld_mutex to protect
 access to connector->eld
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-3-ba56a6545c03@linaro.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ze1FOtye6ODMMZl22hb9QRrfAdzUkHN5Ex5hTjwt+GA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xt8KExBULQDlnc0kG9cX6l7/Qf0gOZJfErh
 qwvys0sxCOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1X53B/9fdxZ832w1hRpbTcoyQFQHmA0ikcvv4VCzfB6ZaFGrG9T+SoyXM0lcIGKSaZczbYgwyYG
 VSyLd0BAxUhrC8MwHfMgp8Y4wCleisRxlVFA1vUdBWDg5Ra1tMCGv5yeTI8xG89vZvV7H1L56LH
 NJTuXCDHoAtdxiJGvpFCcxy/iyg5+gZ/1OqAZ21gCgzFdy4w/2V+gH4ahWa0JjEUHnsqPrt4sw9
 GAq6r6bDqlUd/3uTwG/u/zV5dSLxpZwsGi5tupF0T0d+UKSbAj73ZOj0Mc5cIt2otyZ3ATuZeIK
 E5n0SMo3O3r0wqRpMmCiTAGk3no1OeU6uM+duf39jYehwa8p
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 35ae3f0e8f51f768229e055a086b53a419ffcd9f..940083e5d2ddbfc56f14e2bdc6ddd0b9dd50b1f8 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1450,8 +1450,10 @@ static int it66121_audio_get_eld(struct device *dev, void *data,
 		dev_dbg(dev, "No connector present, passing empty EDID data");
 		memset(buf, 0, len);
 	} else {
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 	mutex_unlock(&ctx->lock);
 

-- 
2.39.5


