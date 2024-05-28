Return-Path: <linux-arm-msm+bounces-20820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A178D24D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 21:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECCD11C273B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 19:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E442C178CC4;
	Tue, 28 May 2024 19:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YMFqTRkR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B569F176FA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925166; cv=none; b=QP5ulvgwkqXoVxMcFsHK//zVh9Do3whDTacHLUwliEDNypXOibvIJ4wSCU8s1r/VK8XWSLT4d5aOvX36zlGNMtnjNaQ7JggXV26syRtIlUM8dy1AgwXXafg6XcGNC+i28IljLDO08Q4n+DM4IUmc7q8r0L7PbGo4aYYcK/uNfxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925166; c=relaxed/simple;
	bh=0ZNKdxQ3JQtZLj0Gm+s5zrogyXn00ZSW+UEFR2j6wX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJH91kjjx5JBYRemuLxRHZKPiJcN5iR4muNj4nKiF70o3uFUXdX+eL+T1H0ijuxuXdZUoaqwFBJjtE1ItNjh6mZz3D5jg+3p3kztxHSlBM8yYWPUGuBYU2/Gb2zuHjUv9faBPE7Gb4fIgF+lzwDDA4bAYrumnPm9mbZ1t8Gl6zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YMFqTRkR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5295c65d3fdso183778e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716925162; x=1717529962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAWjwCLmat0Pt42wss/KcevTPw7T7NPDEdWBIi4Ib0k=;
        b=YMFqTRkRMZ5xDwhYxyMdbxJ/MPz1HkfXEB2tarwH6kxuLeIGudwIZPP5vqYgxmnFkW
         az1MXD1puKJdCQbMuOoYwNoAp4+iqT+/LT264u8P95ZAwjBdnqnVBekB5gzg9abHlZGO
         75QIPzctPG5DvrqdQbNwMxs5In7jH1oVeoaGEgwGOjRtymZwEpAbJWjCEePLr3Ebd+qT
         JYkVX9IaEmpbOM7yZaBcym/tpDGSLWbQ0nOHO2T/TxugsTu1SPesYtVDY7rkx5otWiZN
         e04uNMtrDBp66mI6hjuEfOy6aex9wHwpvvRlv7VL+bGijM3gMQwc1MUee62L/yos79Vt
         WJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716925162; x=1717529962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAWjwCLmat0Pt42wss/KcevTPw7T7NPDEdWBIi4Ib0k=;
        b=nEvcLpf95B2ZxAkEsIJNdcld/TT91PBcyf+MyK4sWHZotiEsCdPfCAp/YZQnXDehKy
         lAaCOp7fqZaLQfK51zB37iXpBFSUYKvEagp+0O5cZ/vM1oKNEReULQjALxFwbw4ZL+Ly
         3Cr13ig0cH6D2rwatIlUCgzYNeOkQ9czuKtMJG786bAKDIxtc+DEJnBLy/M3DOqgNfyT
         b4SQGAvIqROziAMXIolfz6/1RUhb4nw4snS7FbVmkVq6GrZc74plQRxnZlndGU1awVvB
         0ppLE1eZiZqi6Dhb0wyyf3Y8gMEZ9k/zLvSk/pBCWFZ0FUGc/E+E7Qnp5JKoCNghxmIu
         8dcw==
X-Forwarded-Encrypted: i=1; AJvYcCVU+5YoD32tz+n/a4652jxXvjsKjR5b6EoiHrogVpyfJ5uSTsYguQJ2KsfNIJ4sOFTBngvE8bdlZMbiQBe09MozGni7+Jq7WM4aDvsD5Q==
X-Gm-Message-State: AOJu0YxkPCRH4DNRmbGrXWBV6UWkrSOY3VrtbPN1SgyNiaDqfH+7QaBx
	S0/JcJQGWJzy5QlO3YpSOfLJzFW7g8XsKbrQ1+ksVwPrnhW1q1x+gWNEEBVoRss=
X-Google-Smtp-Source: AGHT+IFEcfUebNH9/3F7+tMGSmm6idGFX/etBkGLAL2JYR2M63YeQM1oJ70p2YpisBnpaZawk1xktw==
X-Received: by 2002:ac2:5181:0:b0:51f:9a88:be2a with SMTP id 2adb3069b0e04-52a829140ccmr9443e87.23.1716925161963;
        Tue, 28 May 2024 12:39:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529711f96c9sm1045234e87.245.2024.05.28.12.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:39:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 22:39:19 +0300
Subject: [PATCH v4 2/3] drm/panel/lg-sw43408: mark sw43408_backlight_ops as
 static
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-panel-sw43408-fix-v4-2-330b42445bcc@linaro.org>
References: <20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org>
In-Reply-To: <20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0ZNKdxQ3JQtZLj0Gm+s5zrogyXn00ZSW+UEFR2j6wX0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVjLng5Aeh5SVikvcmyAnRHw7p/ThlBTJFm122
 2UcNeNowKyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlYy5wAKCRCLPIo+Aiko
 1fYqCACDlxEKTIMf+LG30I/ejey3MLX/dYsOzRn50AnSqjNYVvRap590vVb8JCAO/9+j/KSr+8d
 T4DAgUGFxwq6LDitmxf+/oQ4ADKYaCLCsnn3jAxJI5DYvDiKXYnXY6Rc3IcjzoQ6bz6mL7/t1wC
 mwRLcPAI/PJdLSms2esDsB98guDvQBNqsRnbpkwPHHwHdukZGq1onHOffn+Duuo69584l9r/zoQ
 JwEJltht3UiIiCeKyZ+MiVA1pViV3CcXIq/yBwiGuqewvjMtDg1sMBCatIlpaTAAX4CtHutzAEu
 SGFXB8p+FvwgGpODO05RIYqS5nLSPhZxdGWjx1coXC+42tjK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix sparse warning regarding symbol 'sw43408_backlight_ops' not being
declared.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404200739.hbWZvOhR-lkp@intel.com/
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 115f4702d59f..2b3a73696dce 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -182,7 +182,7 @@ static int sw43408_backlight_update_status(struct backlight_device *bl)
 	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
 }
 
-const struct backlight_ops sw43408_backlight_ops = {
+static const struct backlight_ops sw43408_backlight_ops = {
 	.update_status = sw43408_backlight_update_status,
 };
 

-- 
2.39.2


