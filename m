Return-Path: <linux-arm-msm+bounces-15828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE6892BA9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 16:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFEFD282C12
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 15:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F9D381CC;
	Sat, 30 Mar 2024 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QfeLH+E/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDF81C0DD5
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711810851; cv=none; b=iZz7bG8Fu1aLbwsDYXhvmrZgCbtrSQuyXFKvyFWTrZnXcgjEdcqOPRxJrR9DrmH4bKsRI9wVBxnEKHBpps7MXHwD7TESAtU7UCU/GfORMFXjmU3CBMPcaCNLsFk05g1wZTPfyd9uIfEzamDNYLpgC7gYAwakIfUTjpPy3SWQa4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711810851; c=relaxed/simple;
	bh=TbTHOui9nRbzInfWv54rG7ybH2YP9w+pNQe9Uik8Gy0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OsViVWVHiarDSIGRXSSGOY2yh8zIJiezq1ZUfNnT6FXY6TD25BdZ5qnjzjaM2Su5/lrMriKzKFbE5q3ApxXw5vwVFGWYl4Prgn8nNBp9KxCMIb65su8tJIjMMXLb8PnQuQwqxDf5vyUJoyCYuH8YcO5COGIvzXxOOLdmOzj7B4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QfeLH+E/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-515d49a6b92so568699e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711810848; x=1712415648; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qeFUNYhrsBvDmXfNh3GP5CFwWeV+2KjCY5GUTF19i58=;
        b=QfeLH+E/0W3Tz09xNlq+WsZ7hpSn9HaIJZ8eXtmZmIGN+QXZHOISiboi/4GVrpUF7p
         NOW+IRhqs8glaas/mEw4NapMALdBKPC3s7ikjak08WIJlzzs2YB+GypK3bgCFrcO2oPy
         ANANNN2AYVubRy8P6XmrxEz6E+ZX4Bajl/Xif8tPVizRQY68kXPfbY7Uycte8K621bTJ
         5j58wcs1xKM7tj3D7SkBKdmm3737Y+N1V+yyF+YIKP/qRqSo2CaG4H1NOEkBT5olzK2t
         VLodHMAKIrLIHeM/dj3cApcPoOV9sxWB8dnKEJLkWGRtp2oiLr7o9w3P8HJA1FBBWGhW
         QDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711810848; x=1712415648;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeFUNYhrsBvDmXfNh3GP5CFwWeV+2KjCY5GUTF19i58=;
        b=NRVDUPKcbq6+MqsCsAtMOHSxDh9zE6lt+elO9USWT/Gq98FcL0sil2ZqNDSetsLU88
         ccP9KhShdsBaxh9yDmhAiWyy9cOafDoInY589cld8cRU5+sf5s2v3TqO2Xmj9e8RR4Ey
         X06cm4sy/GE+Ijs1EWiZB9C7nmItPEV5U3dx0GSko8bYBaQ4j0itgk027AnRnfBXljT7
         1DgWWbAIYdqDgQCkkjp1mtEtEJp2HH+NjCTIpMAB+81rlmkzK8iIciMfAwdEJcQ8JnQn
         kx7BEkR9VSITpZJ52Bk0v1d6lMrdc0Z2o+2X+jEx1Ne1uSMngKL+iuOOremASvxAJbNE
         flFw==
X-Forwarded-Encrypted: i=1; AJvYcCUbzgpNqt0YqJwG5lJUBLiXd1ScSnjYzrFqQBPwOodAbwGk/vwFsnvcxTUY7CCVih7ZIleYj3Ra6TbvnPs2yqttVF/Dv8GN+1Lr5Xo2pA==
X-Gm-Message-State: AOJu0Yzb8lhoHRh5KLAH6wr9qoVZrRKzTFG/DK8x/rl0eo7J0JDMeNQD
	KMqeTrO2sencZuTBVWWxZCaE46hP0THdkftWFuuV3c997PWuePmPK9IqkTG1ZX4=
X-Google-Smtp-Source: AGHT+IHN7f4UYparBiAGyFZQsvMsLXikA/nW80TyS4l4HLUhBjxfSbN21Vqi/NPZ7qlAf4/qE6rLmQ==
X-Received: by 2002:ac2:58f2:0:b0:513:3d26:7cc6 with SMTP id v18-20020ac258f2000000b005133d267cc6mr2848569lfo.15.1711810847829;
        Sat, 30 Mar 2024 08:00:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j5-20020a056512344500b00515d205a6f0sm496199lfr.29.2024.03.30.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 08:00:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/panel: add support for LG SW43408 panel
Date: Sat, 30 Mar 2024 17:00:45 +0200
Message-Id: <20240330-lg-sw43408-panel-v2-0-293a58717b38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0pCGYC/32NTQrCMBBGr1Jm7Uh+obryHtJFbCfpQElKIlEpv
 buxB3D5Hnzv26BQZipw7TbIVLlwig3UqYNxdjEQ8tQYlFBGaC1wCVheRhvR4+oiLfiwVnkj5Wg
 1QZutmTy/j+R9aDxzeab8OR6q/Nk/sSpRoLe2F368eDW528LR5XROOcCw7/sXkSIEILEAAAA=
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TbTHOui9nRbzInfWv54rG7ybH2YP9w+pNQe9Uik8Gy0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCCkeW9RMtkNd3jg/F4YF3+7GbRlOaHo4dt3gG
 f5lWmdi9/uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZggpHgAKCRCLPIo+Aiko
 1aABCACVd6NQSpXlyfAImYk+V5+sCXVWy/Cu78jlO/LPhB1OjoR5DQ/YwVOttpOAg7b5pZ5dd3I
 faWpAQ32mUBBtU091NXtPFmAZVmbrjplgCg8HQ3CSuAq266/Y7b5NpwEPLe2u8sGL0sB+EjyDeu
 Jj9uD9DMDDmAS8ju3jFcWEkehWec1SHrJe97vzFWa9iDp3I8uDC80MXXYSAjdZbzL7fud6GPbcC
 LRMfhO7q38gMBkBys2rirGZhoH5gaxbRzel22HcaIXCGGRSnw1ZtiFFZtvfLvrpTNIsVeGLY+Q/
 q/ccLjijPHfpvLswPPiYTttJM7pdyO1DVcrICuq1NRTZFqQy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The LG SW43408 panel is used on Google Pixel3 devices. For a long time
we could not submit the driver, as the panel was not coming up from the
reset. The panel seems to be picky about some of the delays during init
and it also uses non-standard payload for MIPI_DSI_COMPRESSION_MODE.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Removed formatting char from schema (Krzysztof)
- Moved additionalProperties after required (Krzysztof)
- Added example to the schema (Krzysztof)
- Removed obsolete comment in the commit message (Marijn)
- Moved DSC params to the panel struct (Marijn)
- Changed dsc_en to be an array (Marijn)
- Added comment regiarding slice_width and slice_count (Marijn)
- Link to v1: https://lore.kernel.org/r/20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org

---
Dmitry Baryshkov (1):
      drm/mipi-dsi: add mipi_dsi_compression_mode_raw()

Sumit Semwal (2):
      dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
      drm: panel: Add LG sw43408 panel driver

 .../bindings/display/panel/lg,sw43408.yaml         |  62 ++++
 MAINTAINERS                                        |   8 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |  34 ++-
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c           | 321 +++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |   1 +
 7 files changed, 430 insertions(+), 8 deletions(-)
---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240330-lg-sw43408-panel-b552f411c53e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


