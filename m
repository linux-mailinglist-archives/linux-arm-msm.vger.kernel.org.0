Return-Path: <linux-arm-msm+bounces-40749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D27189E6AE5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF39F16C4BE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6916A1FCFF9;
	Fri,  6 Dec 2024 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aIQtlsmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6455D1FCF7E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478212; cv=none; b=OngK1DtE6W8WK7xGjEcBg1w0QF1jcf1dBID1xLkNHQIWvYB99/Yi8kQGebJuLnZRPCCutFWDcZYjIoGZ5NpNUtdu94m3PVqlqE5DOLdn2MDfCeccSgen8K+D9sweJx9jNqqg76Nu9CVobuRxjrFDn8+09DrqJNU/u0MS1/srVWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478212; c=relaxed/simple;
	bh=g8XDt4tMHXpR+O+C6P49zaXUZ1QAJx0+8PEn0RE7Eo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I4lazFwuHEZD7F2Vkpx5uD0xEwKZ7Fx5IVccCt/VVh9HXzjAbMLgZ+YpXoSjeSZFVixZEt7iW+V1nuFctEG4GquJZ+ITAQJR5Ktbq33qTuS/eKbE2jEKRu1/uCvwW9NojKTGgdmQA6IUOZ8VCU16t5x3ed40xs/VqVGW9JZ9zd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aIQtlsmF; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so17821381fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478208; x=1734083008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGq6aED53P5HelbsA7MK6wW8IBVofd/BuTMfX8bnHpY=;
        b=aIQtlsmF0EIv8fgE/9/WRbNLkzOcLHQGrH6Cv3kgecoQs5vqQfb0Cmp23Z1SufwMGL
         LdaHNVhYVD+edfnJU2hfnsAzt+6DVYUJzf5Uzlqyao5EUxrB9BrOaCSLzp79TEZIVyjV
         XMkZ3MGHI0THIS+xru43J1m++ZSRh/pmtPoia8rzKEEbJFzV1EDMGChxtBD5+rBeBcnb
         ITsNj8b61tUwxuIk1t3MZNjhWPuB6Lwm7elPhiEvX57ZFFVhnXCQ1E3up1c8Mm/fiZ9i
         pUai6jCd4HPx/jv0gE7jIVM+pCWFu6PmZ1GZzrVLJbqzxndBjzQbvDpwJbIUEZNUf4UU
         FJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478208; x=1734083008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGq6aED53P5HelbsA7MK6wW8IBVofd/BuTMfX8bnHpY=;
        b=bN9IjjAYimKkyb2igcaIaB/z369CgOSP1eNQ9pCGXfGhvxLDqlYOdTJ9wtIH/CK7Zs
         Jgq5W2UnWEviz3qSrgXJmh2G7b1Vk7DQIqravtobFhiNlsM+mcA4/EyGwkX31H2bpOeS
         5sv5sGeiIqXmY5trH34nEeMH1uM71lJRjfgcvvpuSgtHDOslHIGi8NY1GvkSDZ++54Tp
         KgNFC7g/r/hVf7YOuh11RzxO3HS3ebxF/QWtcZcWuS/MzbPsrouWFjH0cKjkok9NhySv
         4OW3uNp+mQmwUAeAKdnkDKOhtL4cxX4ggNwvKBvnfsOngLqki4LZVATl/Uh1z5K6n2sx
         R0jA==
X-Forwarded-Encrypted: i=1; AJvYcCUHk/LNgXftFpd1NGsmE96f2ttWr9Z4tzVINtDjni4AmYSOjW7AutzOjUIgN9XoQ8FX6XZlc9QumisxqBVj@vger.kernel.org
X-Gm-Message-State: AOJu0YxoSU73oJU6MzRdibv8r3IMlCx/dBlwNPadF/uktoFvxmUfUuOT
	+htoBuEj7JZjeKCR2sU6TpQCedd8Ifpyv0u8F1yNSkj/WznpIY4TzXda8qbXRH0=
X-Gm-Gg: ASbGncsdr+FXZfO/Yr6+fheapGABK/xJIgSh3uqFpHQB/mOCZFPNK2/utRPKfIsVs8A
	gz0v8DTvUjBqO7fsakGkizAauRsKUFyzcb52Ee9HFlCi9jeiP3E4cCF4opiXhBXUMSU/Hg9r/je
	EKt7dpUpDmN5OboYeNVkiSUKMn5W4xNnY1Ztrn2EHAebj16rfRI2PncR9V+vAhn49rElakORMhW
	/ktynb6z2qOuh938iYPXd5N8Y8hAR0A6Ye25YBtfV6kKOOym/CL0tTzUg==
X-Google-Smtp-Source: AGHT+IE/NYxmjluRmONb1EoU7KbKKPH87buJ0IjBEcYtxmwcZQlKK0G0iiNZoTWvmIko49pJuOa6eQ==
X-Received: by 2002:a05:651c:b29:b0:2fb:5f9d:c284 with SMTP id 38308e7fff4ca-3002f8e7df4mr10594341fa.16.1733478208528;
        Fri, 06 Dec 2024 01:43:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:10 +0200
Subject: [PATCH v2 07/10] drm/msm/dp: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-7-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=g8XDt4tMHXpR+O+C6P49zaXUZ1QAJx0+8PEn0RE7Eo4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscuHK4m+of5M0K58J1Ue7FnC+JgeJ7oM6NSu
 bFPedJdqXmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1bfrCACW5hMSxLBb5or6qGH5D5AVPGJIvY9BGjNY1WTyi2PUHO7TE/oo3Ggc7rv7l860G7eGzQ8
 uVT1bon1fazOdXW+lYbtHJWim9TYibboTYhb22pQ3YrpWEiuV1UbYdHBB8vzbzO9jXkq/bJmQ1m
 +E4FMSQ4cvduHdnEWi/8FNjp7zOIShlJYI1KIxungwjDjpEKEtea0kLBR1PRGwCG8/yZZUFfQxI
 QckeAW77aJDzAZbPOuHWb2f1rJKPg5flOLCaaqtxskOhiUml7r060zILPXNfrxMo4DMSMj+jYwz
 1HVsVa0f3CLU5a7ZBeGqVsa/7rnSuUMsfCkuJrb6r9MQM91w
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 74e01a5dd4195d5e0e04250663886f1116f25711..0fd5e0abaf07828157085bd680bfd3c7d32deb61 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -414,8 +414,10 @@ static int msm_dp_audio_get_eld(struct device *dev,
 		return -ENODEV;
 	}
 
+	mutex_lock(&msm_dp_display->connector->eld_mutex);
 	memcpy(buf, msm_dp_display->connector->eld,
 		min(sizeof(msm_dp_display->connector->eld), len));
+	mutex_unlock(&msm_dp_display->connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


