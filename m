Return-Path: <linux-arm-msm+bounces-39758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FA49DF420
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 00:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 503FBB22363
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 23:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40AC1BF80C;
	Sat, 30 Nov 2024 23:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ESOB7o0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E91BD9F4
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 23:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733010953; cv=none; b=GkSVCCfKNGB91JdK1pqKm78Yz78levv214QjyUV9g38oVxN/xkPbnepZ8apjmgRVkN5F+ZD1b+KWc9wNbDmkVyd3zDU7NxTydNN5HOIFg2vRIwAHuH6VE1jCtXLVpPZmPk/RwoDMrPBQHdJoii+rHL+Cdn9tDkqQFte+UkNCtbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733010953; c=relaxed/simple;
	bh=nLL+m/6tlRaIYoSYEq8RR3ocF0ESeJZGxjq7LmbbmlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MuqzLqnIplqLIJ4AFO6qZR0/dFInhMEsIhE7evNdbjtTmYumESX6DvU0jFMGtCdmbziOwo2D6JWVZOVc2bTzlL8TD99//tbQJFZFxlS7ukjH3bfy4jt/vTijC0uhYKbmhm9S9LixKp4vhJJfudOZtIxuocvxHcu3zITKGDX4r7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ESOB7o0v; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53de035ea13so2995193e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010950; x=1733615750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8B/E5apatQK8hIbe5eE+ik8zb/UqM9JhfpXKxSqUpBI=;
        b=ESOB7o0vXnx9QebKR7MoUcFgIfBCNfweBnZNkzwpoZnL0Rm25Fu8Un9KmQ1nrSVadk
         +G8EBNNuZ8Bj44Pv64FTcVxgDsWR1rQakEyiSY8Mhk0aQ/rM3jb4Kr9FO2xkaYQ5ErpN
         VFNE/L8wYuWEiNR577u/uzzmeFp0g2947p10LzKcDRh1/ZmVP42lIt6QZDV3KKvSSRyx
         5NZHcwxT+XxIWx/jgbTtKXGj65/+2ez44obkn6TYk0hHlkqPyEcIMHwreYMVXd6wb1dp
         wAuH+rZ1xwTvwA3dMu7lGq5/Fh7UODXRXe3kYegmcBcQBUbmpYbl5Cn4BEALXeDnRG1p
         y+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010950; x=1733615750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8B/E5apatQK8hIbe5eE+ik8zb/UqM9JhfpXKxSqUpBI=;
        b=SX/f5ud+3FYQKsGJ4Hq0f/fDgGUdeogcxK3hoDxtSP1oelVDgBgIw3e69K0sMjmiGd
         TnTjWibJyXXkvR073uWxUBgLUeIGWC9nlx2RB1nBKL+bHvIkmvYNhJDHIarLyI6zWfBL
         4USyDvtRv8VPw5X/ucZUZaIl8ADkNWv9hO2nUWDcPxIDMVJ0F2m44eYevD3KIU+Nd3y0
         yaI4j+HqExd6qEierepeRuB958wSBRPJshEpdUYInh/8QbPoWtnqoQU99vZJ8A1y1mg6
         MND+gYdIQRwQKAulg7huWfN0d7LWOi22oMmPVv+hxEoQzqVr4rJF6cGuNeFSws93tD9+
         RmCA==
X-Forwarded-Encrypted: i=1; AJvYcCVabz/My6j4YoUoY9e620sH07UnAqxIu+TqPgFgM8DNCctClL+7f40Hoq2g1mfYjEDvQ4Gc0LXM4T2Xc9a7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jyckzDzDZusnG9CtVJCzMb9c0exQ37oKUHHG+neZrzGbEjEB
	T62su9n7B7rb8o0VYPoCHX4285rHRyw5orsvMcy7C+QRfNF2BlZf9+52XloZnbg=
X-Gm-Gg: ASbGncuFM+ZT0ka1rCtGDKPtxUojv5R5btNdoW6ei5P49+hzLiPSWcGoS/zBBgnpLJ/
	kD3tASrSDUvdnb9PsbHzJutNZV3TgSBHADuCvzGkIdSTOMMqxEc5615dMQs0xeLYQOtn6ZVt+R2
	ftYeYhGGg6lOdllNi5oE0NKp8HG7VSqXo/pSRK2f3bKXPN/tvjZo16xTMoLNxg+0FQ8ocSyLp5s
	rd+TpRat90glTwJAkYMwZmcU7fdM8BDUsMK3JKO7M9uQ7Lh/evI0M4CZg==
X-Google-Smtp-Source: AGHT+IEIp+dlWZhe+G8N9bEIs+K1C7FxJxPBY+37wRt4+mS0XWsu4Pb8i2syhEp1VwHJei72BT+biw==
X-Received: by 2002:a05:6512:2391:b0:53d:eec6:4622 with SMTP id 2adb3069b0e04-53df0112169mr10013326e87.48.1733010949652;
        Sat, 30 Nov 2024 15:55:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:25 +0200
Subject: [PATCH 08/10] drm/radeon: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-8-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nLL+m/6tlRaIYoSYEq8RR3ocF0ESeJZGxjq7LmbbmlA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xu1LiAN0LkPKwIvEI7W7y3lCM2SxWMHTvbj
 OKqmG8qGtSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7gAKCRCLPIo+Aiko
 1U5zB/41XZZbXAdwu3uOSstE5ZQzDb/qDMfKvZlQ+OJnYtFRVRPjLns5mTLy8yXWP7axSZix0qW
 b7qL5zI7wvpO2vQvcGIlHhF/PbdVB95v/KMBMYnMbeU6gtmPf5jcjRy0jGVt10nRTw+BH1a7LiY
 s+eAItvf/SJKs3/lGEVhzQQaHbCps1ve7fnPjmWIfbHbFVndrKRvIwzNmZOCN46ii2MW1Zygzk9
 BmcKvVQ0F1Xhlx8whhYB0/xD2Yk4tKPh56VWVlvcQRz3jc0BKV4UczX+YsA3+dmiQSZfSXRoEaZ
 S/wTkEVIXnpQxr5tpjXD/AFl1W8QgGZ//FF443/owvvry4TL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/radeon/radeon_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 47aa06a9a94221555a4828f41a57cbe03d637ee1..547d8f420669cdb949ffebd0677ddb8cc3c25812 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -771,8 +771,10 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
 		if (!connector)
 			continue;
 		*enabled = true;
+		mutex_lock(&connector->eld_mutex);
 		ret = drm_eld_size(connector->eld);
 		memcpy(buf, connector->eld, min(max_bytes, ret));
+		mutex_unlock(&connector->eld_mutex);
 		break;
 	}
 

-- 
2.39.5


