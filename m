Return-Path: <linux-arm-msm+bounces-20175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EAF8CBB3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 08:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A4FEB20D2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 06:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E787D095;
	Wed, 22 May 2024 06:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qm5UBeIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C39479B96
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 06:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716359162; cv=none; b=Q0QeePlvhqdaUUFJ9St5a13dYEKVsVwb1BQRj1wr477hvft3miL8skjXTmd/GkT6unoPgCVCOjl+znuZ5IFUSu+l1dmP92viORmOPLJS/uIVY9fuN3uEcFG5PMsUS9ngXURsgqnwo4Zoe/GHmj/GGVfvmTtTmxZdX5Cx3XQ2n98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716359162; c=relaxed/simple;
	bh=0ZNKdxQ3JQtZLj0Gm+s5zrogyXn00ZSW+UEFR2j6wX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRgkcyEPp/aAJBTZHXXnMbLSoNeutCZoc/RD2aaE/73ngBiS8//PPQAWw4Ht92Vllm0Sn3pXIrDQyODjDPo2ddIGM3R5m4EcFl4jnI90rhxHOFBcvSCUX6QihIy3XUJdoHzhWoSiDp2nDRJWBokR2UGVK3Y2hYYl2oC5Qb7u/VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qm5UBeIh; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52192578b95so7228131e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 23:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716359158; x=1716963958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAWjwCLmat0Pt42wss/KcevTPw7T7NPDEdWBIi4Ib0k=;
        b=qm5UBeIh//DLKixwDirYdjn3niJ+h4eR3ExiYzVcIULaK0XsNJEMywFpDDuPJ1cuoc
         NAENbC5aqz5FbLU4M/Anw7/suVaY+Y0Rpl5EbwxIn40haXFkKx/WDxHXHtZEsmsKrCEO
         zUHM8K6KJTCk7gGM5ukQ0LPHpRju1WKPZVRD/AeclBLJxaWNjvPAKW+5lVfL8H++njYb
         YY6EOtQMrxzRX/l09i0wG6POnrn+pLu2wlT35nGgWALAIFjZiXtrv7CKN5t4lgAnhD4I
         3El095FYyQyuljYoZUdzwI2gxAeEAgoAX5lu+K8N2/JFogdibmDWNU77aKIMvryb9hB6
         au3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716359158; x=1716963958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAWjwCLmat0Pt42wss/KcevTPw7T7NPDEdWBIi4Ib0k=;
        b=hmJNurOfiYb3Zz4H84mrrG1bFLfXtFH6lllHqUZ8gjuz4OSwSHb0xAGlpBffeRRbuy
         dAncaX5yBu55qipm6JLq260ijZQmgleW9806s223EaEEhYxAgPdi2EkBylpWyqL4Zvtt
         azZGdzNOrfRqfuYAYbkhgvlg3cxTYxjxOlBpsW/U5NCXX51yCCeO32ez+ZGfgBs58A5z
         fqis28em5kqa6UOcekZsnHev0WqCR+Fs7pF+HuoWm1rPFYkZ5Fbmyp96sEyw70SvPXaQ
         0V1G2I84wJ0Cj7mTdNBhZDeoJ7ZlO6tiRkoSUvM1s8T2cphIKc7PwlHHtTXr1IBvzDjz
         miJg==
X-Forwarded-Encrypted: i=1; AJvYcCXV8DNZdOOOhSVCZaOPPU76SqqbUfA1MxIzb17TrAlpr666v8UryPZRoNhOPF90ghuRn3YY/v+IDIWqt4tYo2wzfXPQlZRTBELsOVFWAg==
X-Gm-Message-State: AOJu0YyXyviES7rNxfIkBeZKD9zyCv96HlIvpnzYSMxiP6GLTxrgJU8o
	EMW0wwnrcD9CDEjdbHyBrP8yfg0/edzDH/M29y2ZVd+aa5lWbXKua0Wdjr/kPl0=
X-Google-Smtp-Source: AGHT+IEW+S3+sVgdb7Ioh3lWeKabvLfqA+b3mZ7ScIiWLt3n37PheAoJ6ahbaI04M7Q2NlUrqW9u/g==
X-Received: by 2002:ac2:43a4:0:b0:519:5e81:276d with SMTP id 2adb3069b0e04-526bf35cademr539325e87.31.1716359158307;
        Tue, 21 May 2024 23:25:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad4d0sm4910023e87.49.2024.05.21.23.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 23:25:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 09:25:55 +0300
Subject: [PATCH v3 3/3] drm/panel/lg-sw43408: mark sw43408_backlight_ops as
 static
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-panel-sw43408-fix-v3-3-6902285adcc0@linaro.org>
References: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
In-Reply-To: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTY/yjvD9VQu7L2gIRW8vekBVTwOXaxbDR2pMu
 FPr9Zp7kVKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk2P8gAKCRCLPIo+Aiko
 1Q+kB/45cboCZ7/CfpexfH4y1ofxb4sjLn89zKrylAAgkFqw4wtjybX5pUvHhR2h0TJVS3hPsqe
 O4qvHD/4C3vZTPQcnCZUOAx1QEtRPUMCg+vF4aw925FhwDUGrg2vqpJJpbaEYNzEvoncyan8fwv
 m2INUzUrPYiwj7C/kO6GFKMfXOOP62ANl50Aeno+vO0ZlYpzqZdu+dgP8t8zvDt7r8qPgU6+EIa
 2r4WjEeCRcH9ydw6/GabNsTVdbCWo2FlwNwrByNoZEZi5c+GGCPnyEHnvwxMYCBntEuV9eCEHwy
 oQ3vg6J5dglMkju2nNaXnoHtewp2IeYb7vLJVmRWTFjzkuD4
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


