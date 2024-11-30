Return-Path: <linux-arm-msm+bounces-39760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B91939DF424
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 00:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A84C2815BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 23:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E791BF7F9;
	Sat, 30 Nov 2024 23:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WjY6g7QG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935FF1C1F11
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 23:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733010958; cv=none; b=Gac8gyvHbhOPgO/HPImHFy6UjIOz2UgDU0O4mleH4IeCCCkJDJGyKziV69RaijufinKqmuvEnpH2/bB4jM8HdY4Y6EfKDFsWSkRqguTnh7FR9E7C5310aCBLlIPO/UQQSKPQ6FBtZeVmevuoHOzlh15mTX0OUUuBT/+boVrEC84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733010958; c=relaxed/simple;
	bh=lgKbIB6YZtC8eZYzJNVRgp7pi8XWpClyliAzF0BBx7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PHOChqjuD9bxn7uB/C4szx7lxbLrkZIKzW931DRySG8Dy3uDJWJ13s1C1x7/V6cjM4zfdTJoQs8NpQ8U1DBgwuaBHfBOE6HIBMtklx/r/hMUXgcx5y48gsUI+T24s6HYk6IYRubvyjq3lcKfy9VR8ZaSiOyLdqN/fDN9uVo3QEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WjY6g7QG; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53ded167ae3so3457876e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010955; x=1733615755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxPAXAkXtGSfHE+6MDrNppIG4p1UF1/hBXNkV/LR66A=;
        b=WjY6g7QGJEL0Y1RELXFu2YHbkv7d0HUU+nqh2Z7eDTU6trvPj4BzhWtHy7MerdLP4h
         dtTuRb5JJHN8Elljpj3nq2rQkHz6gGsDkAqfDSdyPzUnlvKzRltZqSt25yHU6e0VOr8l
         1dZp8tbbGnb4eImF6DFSCzVq0hG8DWi4gjBwZt0BXKaBB6kpo3gMkjUwLq4Pkhj5MykT
         KJ9xvmYdwOBZ82jzYxpv/Zdbz+QkQvt2ZmJ03zArt20OxOoMzBZSECwvT5Aljqi6lg2f
         hiI/PxPHGXkU83OHkmOjTYJSpnHbx3C/nPmNDAfssDZP/bPn285CeiWyV0MTg3PloseU
         RuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010955; x=1733615755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxPAXAkXtGSfHE+6MDrNppIG4p1UF1/hBXNkV/LR66A=;
        b=JhalUgI3As3ZvN7R6tAYkjiURxNn4Bz5eqUBKfsNECOI6n6Jz9u1VU7KjCjv+rGFTi
         7itqLWrUk/DRJXiz1kpIw9HE4/ueJdQGZL/KmQNUndXqa+yWCTkv1HT/iJJXcqd9puRd
         VKRF7MiekMnY48Ta0xIPRZas/Ag4zDiUHbJYDM0UxXZNTCJjW+BxJY/gWyBND91a6Bgg
         8m92CCor9USDmkEbjYah5ZjHvLOvsz1GglzIEjjpTJN2+5KQJAFlzSFkXWZdLzia1Pgj
         Tz/aQxgl31OH3JoYPnk3dsk/ourvazdKzJ75jmjpmCBabHQjv1xuCEDEyxhMUX+QhtU+
         Mo/A==
X-Forwarded-Encrypted: i=1; AJvYcCWD9i5tJfNKL6EPg6wgyaggusUMWWqy+aTveVbPIWmNYKaGgMSCO++g2imPhmTJU5OHGwDmlMNBKip27V02@vger.kernel.org
X-Gm-Message-State: AOJu0YwTXDWhMA1WrDlVxFukwZRTeviTe/XwfVqOHCk86SJ5JF5T1iat
	qhLlwIKzUYSw0Hru+TMKufHVubi3eRSOX21BR/0ED9B1t1G7br2LQ6Sm+Bpm3Po=
X-Gm-Gg: ASbGncvYXiNMNH0kVT94ZaicBoQxzF4Uu4+NUsQwLB5Mg6/kzi1yfEy/sE3qI3FKLVo
	S76qciS/YjNFg9hl/4xVALJpm6/Ir05XQOPCLBeKa60emjY5gbkYEPpfQsrp/DRR8AsjO8CeenR
	y6U4r1vBHLomNC0KVS/TXgHztfo0B+9nP+PEhpK/X0UPo7xAjOtlzYwnwori8sDCNHlfLLPq2V0
	cLRBM/98xgM739krgBpXEnyiRm2BYjb32+l4UygIBOFakNO1FstJuHMtQ==
X-Google-Smtp-Source: AGHT+IEiP7LHRrhx+1WZHRcdbmuf6q9u5MgJwOgShs4CTI9tBcamTyp7ARZo+XbTG2Yuz34sCo+pVA==
X-Received: by 2002:a05:6512:2355:b0:53d:e41a:c182 with SMTP id 2adb3069b0e04-53df00dc9afmr8720884e87.31.1733010954752;
        Sat, 30 Nov 2024 15:55:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:27 +0200
Subject: [PATCH 10/10] drm/vc4: hdmi: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-10-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lgKbIB6YZtC8eZYzJNVRgp7pi8XWpClyliAzF0BBx7c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6XuosVGIxLVzwgwJF8Kv6UpGUOBhiO+tdbfv
 UsZEOLUAHeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7gAKCRCLPIo+Aiko
 1V2qB/9kxbcsSq/MwiRkIP4VkcbtJ6bvhuQ7s59Dqdt1LcK7+6hylNonFqksssAfCJeGxk6Rz41
 PgtsXMXUIVf52olUBxeNBxH2OY+HNW4u5Q21SkNlRJh2M0Jmo7qcQnvJomIEF/JLLln7LE967u4
 LJzHO8MY0j+0/Z9PGmgWmBObyPWPr4XVV5y/Wl9HZN+30NHViJDwIBGE1n0gmK2YS1053O/fbr7
 UN4+r2D3Hx6EkhG2ZPFdgyrFznaQnOHP4P43x3PUt3CBr+Op2Wwa39k2bJPTyZy7IXk/JXc3yhM
 OB9LNQpibUSlojNLFeX59UmOP5dzC3uJw9JhdOJFJ+2D7v9S
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b9fc4d981cf4d682bedd978795cf7284d2650e74..7295834e75fb1ab0cd241ed274e675567e66870b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2221,9 +2221,9 @@ static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
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


