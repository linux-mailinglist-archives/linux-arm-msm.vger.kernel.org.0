Return-Path: <linux-arm-msm+bounces-39752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF08E9DF40B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 00:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 537B3B216B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 23:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1671AED3F;
	Sat, 30 Nov 2024 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXMmW3Lm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C311AC420
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733010938; cv=none; b=j5ENhXIbETy9Z5pdzOWYodKC4BjenSAMFxK1EeUOoKqmDhPMcJUvc7tnOlrJvu28Juff8NzJUwrRmXA5yFGMq2mXawyTIZ0TXfsUalJd/Upx8AYVYNtn8uz49c6HgAoJn3WPF96FJeqD2vhoROBnosik8ckBQxe6Xei7s1ZIX+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733010938; c=relaxed/simple;
	bh=jvlD3JuIycYlsUfGVML+3UeoaevWmHaaQytOdr+mxNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t8PGLINt2hTyCYtAAYYnVxe+yyz95yHbAtmllKcYxw/iQHF/12VegfMPKHGPys4s4aDOANcoF4ooxgRRqZszXcNxHe54lXCOE89nTFRghDlBuajOsn0pmvS9Fsk4Sah8ZRfIaPLiXj2NsTQeIp5hEGDQ0xBwrymjllECXvAwPME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NXMmW3Lm; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53dd57589c8so4272091e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010934; x=1733615734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgyD7a8KnGJ66sjxEdDPFFI8o7yH9d7qAC7Fc+pHT8w=;
        b=NXMmW3Lm5rI9n1uKJZj9DBRsEUGKjg4gtCUkMwFy7J737VJakYJdX2LzrYF7TwKMdQ
         QGOXYDHP7E0wGVPyHNW/+dbDSFCgXR+RQBCRuNnmolmxwRHJR91SRghn6goKiMmPzDdu
         +KxrOhilGhGpCJQMFbeNSk371aqrG9ESldhN9/2lplBsvHPBr1dloCLYuymUbcff3Ylv
         mGJJKQNlH8PqJTjTYwUD4C1pCv1HQZLoXPoewITZk6ecis0onE/NfRDWqeNfZYY7OMvx
         IGNGICwH+s68TyhpCIHF5oktWsPCx57RbALjFeM+jkV/QgmlUIQTLlZVCCR08EfciZH/
         DToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010934; x=1733615734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgyD7a8KnGJ66sjxEdDPFFI8o7yH9d7qAC7Fc+pHT8w=;
        b=YBaoZuh4BIqupbUPsgL6DFSmhII4qn2Fjo8X7vmV25ol+JxQvDly/LxFBsADrfVfNg
         nUzpVKRvJoue8ieGSoFYVjFKHNgJLxDJHNTfjyfjpeR/UMni+2IkQf4u5W+GPl8u5h9e
         9w0/cgmXCYP60xioReZgWA/uwo6uu87YX/u/Gf6yH//lE2SErylxL0GvNm99OJyjlKS5
         UaZmtHbMYEbJa+mZ7k7wV4R0+UqLjVkkAxAEztjCl5o8UCgwgRJx9X8LCaqHz27GZ3x2
         hhKiDKPjKF0K8vqQ8A8RwUXImDIDbC6YscSdvL9nFs5EkP3uyn3zdZlv7FfO6fVIG+ma
         A/QA==
X-Forwarded-Encrypted: i=1; AJvYcCX0fCp6MBRO33ayKuhJiQE0a4gZMlo0hLUWgGrCPCr+yyrjWmU3QBrcActkUuSV4gTcXm8Wbgrcof4JO5ux@vger.kernel.org
X-Gm-Message-State: AOJu0YyBEatel60RBUTlETvHDsvpxGNK7Y3LgQGXdDg2AqIUHZcMOMHc
	mQK+yxquSslsUo/lljUlFpY/gOQU5yfvWtb8PunBHiLDeyHXXvo76k0iVQg4E+E=
X-Gm-Gg: ASbGnctXWyDV1bJQYuFZUMeA7FETs21UCZbkZabvz1Khh9CZI6UTeSNnzykz5Z6N2I7
	JBSj06vRBYlNn9AOXnJn3MgyqCpHuaL9LHtoWYtrNcSpvZ87OEIarYrskbreD6WF5soqMrb9n8N
	xufR+jQTaBBZnbQbG720TEhX7JDifmLaS1IwOJJucKYH+s6x7x4PGX02wd5naVLM2lGdVOJ+Pi7
	mHc0Dy8lGfIFGVXeqTiHDoc6qVX5AWQjjFIIkbAX+Yo9dt00hrADGnRig==
X-Google-Smtp-Source: AGHT+IFfhVER9h/x9rK2y02O8ScgxqBwF/5PNitw9Xk11JpSQfAwSB2naROC3kIrCP+2Ei8nyJ5Kkg==
X-Received: by 2002:a05:6512:3f7:b0:53d:f583:81df with SMTP id 2adb3069b0e04-53df5838209mr3265430e87.28.1733010934296;
        Sat, 30 Nov 2024 15:55:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:19 +0200
Subject: [PATCH 02/10] drm/bridge: anx7625: use eld_mutex to protect access
 to connector->eld
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-2-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jvlD3JuIycYlsUfGVML+3UeoaevWmHaaQytOdr+mxNU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xt/7pykgJj245vtdzYWdYBTAMnwoeiEVz0V
 cHOwIg5ZZOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1Uh9CACs2EKgY3agKG4T+t0CkgNiBGM+05Aomb7V037y3ZsVMyGBgsnshcMdjjksyQHwWAR9UO4
 phcMcAP56G/wnh2roZkGyvmlMsXgcYwC/JcmmAmqRpZ3BOU41lxrAgavIrurye9kHFCYMSeIXMC
 ZL/VeuwljGdXtKvbiNuFpq85TOh36Cs5evtJpDjaTBBuRCU3eJzaHjovDNB31z0KSlAG44ZpfKW
 /bdsJLcjoLwHRdTtVG4mRghPrGrLzz35ix7Igay76WHZuOI3nL19Gs+e3V6XTkA8m2kprqqo7x9
 ff5KN4kX/nqX3Z+YcrmBBsD2/q8MSlB3PQI3Q2xKw0EPGz1c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe44b96945f34215fd900f35bfde43a..c036bbc92ba96ec4663c55cca091cd5da9f6d271 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2002,8 +2002,10 @@ static int anx7625_audio_get_eld(struct device *dev, void *data,
 		memset(buf, 0, len);
 	} else {
 		dev_dbg(dev, "audio copy eld\n");
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 
 	return 0;

-- 
2.39.5


