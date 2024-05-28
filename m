Return-Path: <linux-arm-msm+bounces-20819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE888D24C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 21:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EADEA1F28826
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 19:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB6C17798C;
	Tue, 28 May 2024 19:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n7vk3fRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F63176FA5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 19:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925164; cv=none; b=i9irIBVb0mxg97Xdoao403qxs/5b3vh7foZPYcC41EN/7oqdcEqUIuC9/E0TS9TTTPunHTuyZIBM5OYE8ECCpd10AI3lOjCIP97Ba/wGQqEh5Y3IcnE6eVNYTHDREKAPbnw4NDqBUje9AGnZFias0pXDm1+/CP74mC4bOZLWpLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925164; c=relaxed/simple;
	bh=JpBownv2A/v5s9u+r2T7bmswrFK7bcF3CJY4XHaV/rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=As4cBl0ToDZTrNt7GA0JAmqUn2JVyJUoReFEN6/GZGZABB5IUElNrQmdvhBAsUIDPFTCDXbmHY7DGZm7Uhap0wkq/8TzGs4Dr6lF3sTQoC98Aklfb0yONeZvORlL046U+5cL8bsvFdfCq5C8jqqpPaeKcIXL53w9a5PWOmBF7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n7vk3fRU; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e95a7622cfso13933601fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716925161; x=1717529961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMzDrUPXBetRBxhwNhxvFwAUk90y+ybpda/UwhIo+Wg=;
        b=n7vk3fRUxPu7g9bW9fCzevvKqsReTNA35k9QvFKUV5eu3KCw7uGGLvVPbuWACT3Gn+
         z+fDGep77RNN0f6tK7CgOfX59YEPTvpnCzshidvQtOh5o+eXXdJTvtPxNaxZ9iduGXNT
         uaz9JnRZLm+Uwij+I0PWdlVtZPJ7j/Co7bcp6tnkB7ySUBD3Dyf9I1pr7yn7XDA1aSeb
         GUfyHnLruXqSEIhE1pau/VRqK9XuZLhSwlgGaNEF/Jn8RRe+S54FVJhMTvtUw1+H6cR/
         HyWkU62KyUlGS/84gxAjP4KGZjPBusrd8hXix4iyNPWBYyw/PTclqvj59fd0PxhpfaRe
         Tm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716925161; x=1717529961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMzDrUPXBetRBxhwNhxvFwAUk90y+ybpda/UwhIo+Wg=;
        b=GvNRJun/+1ZPAZdp8KQX6eu3tr6h5bUcQlpo4Zw3ogiU62V5Egd7+XZcNyrnpEjqAK
         QSTdnjGSL5Y3PC3jEIzdFZmDqAkCHKEjCIUEkVw5+SE/3A27VHbBQfg8jJsFUWBu0SLb
         AQjG9IOkAVxuQvKxIU9JOZBUa+xeqV4qzczhE5tYzAZlcoL5TSB/UimOC8Q5MwJaido6
         IxagvhypxZm3yvlxiQeZumtQdB8jrw1cAWuEmxwYj/3FEKfDs3NCi7J42ZrdvAtSUkBw
         z4KTvfObTROs6lUCzNszvygonuuGOhDgPyGGZcA1KooEppxbpTrQuh30uqNtR6WgD9H8
         LTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVROwOa6Ijd0rsGCpc+JQUGIqtNrS6/HGivjN1xtxq4jQJAJmAbGQPUIc+8dcveTCmY1LhnVqwJsK2quhBu6nBR4ODzG0n1/Eisu7fvlA==
X-Gm-Message-State: AOJu0YyY9LsVsgNExcQYW0eaWtAWShWy4fiF5r4WtMvQz2wkBO+7uJ5R
	b69cnJnA0TUir9Ax0TMcNF49tdp7+4WeJo2qIgvUBS1un843q1tB3Ath2v24jNE=
X-Google-Smtp-Source: AGHT+IErWuce9aRTgzYsOItaSivJAYEUeHJGEILEAjjDTx4aWbFd8+75S49CKu4CNqVt+Ys3JPc30Q==
X-Received: by 2002:ac2:561c:0:b0:523:88aa:237 with SMTP id 2adb3069b0e04-52964caab7cmr7869500e87.33.1716925161160;
        Tue, 28 May 2024 12:39:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529711f96c9sm1045234e87.245.2024.05.28.12.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:39:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 22:39:18 +0300
Subject: [PATCH v4 1/3] drm/panel/lg-sw43408: select
 CONFIG_DRM_DISPLAY_DP_HELPER
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-panel-sw43408-fix-v4-1-330b42445bcc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JpBownv2A/v5s9u+r2T7bmswrFK7bcF3CJY4XHaV/rs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVjLm9PT4rgSufs1N1DQ9nR+ydH1+hIK4hVb0O
 UFdMizG9E6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlYy5gAKCRCLPIo+Aiko
 1WTGB/9oJhsxnoP8SaNvbslvwO4vwB8P5YM1pgHeTK4f5awBy1BrzWHcn24PItaIkNG3cJQ9C6G
 Aq5N0gZ+eFpDMlgog7O6er+IxajzglH+FexACjtnCGhtaLUCCEXIYcxfO759My0X2E7HlKY3Ytb
 S7Ba3tcWJMb1w0kWduqhEKFVogO0HzdB8tpoLvGVdtS2tkTnGFy5sHGgFZbGfdABLI8ifeddA9D
 SuArUCPBtWwPNypPH9qgK2zNjOase6dyf2pswXwVuUbrIUPZ5frqzOQSGmqcizEZS7GbM32Z8DN
 it0a1IQmiGb7yAC3rakxmf03wLnnLWjvrp3WUKIoeZs+0Tra
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

This panel driver uses DSC PPS functions and as such depends on the
DRM_DISPLAY_DP_HELPER. Select this symbol to make required functions
available to the driver.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404200800.kYsRYyli-lkp@intel.com/
Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 982324ef5a41..2ae0eb0638f3 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -340,6 +340,8 @@ config DRM_PANEL_LG_SW43408
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for LG sw43408 panel.
 	  The panel has a 1080x2160@60Hz resolution and uses 24 bit RGB per

-- 
2.39.2


