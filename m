Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C166C405E89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 23:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349318AbhIIVES (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 17:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346746AbhIIVCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 17:02:45 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20467C0613D8
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Sep 2021 14:01:34 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id k23so2283722pji.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Sep 2021 14:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E0YD6/w741DLBo+8epZ84w+Nzh2RSrsyIyRP4DXTlfI=;
        b=KLqQo69jsDgiLLzLxVcFmLS+QUjTP9TCMprej1GSz83J1W8zrp7qShkr6DMt5Mrmq0
         J5UKuJouUKRPtg9f+5wwnrMc8fI9N5+BXJpiubtdZN+gjYEU9rFjNw26KWZ9E0tga57Y
         mI3wNQmqjb5yUMVGAgpuUyb86FnIkRRhpoMIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E0YD6/w741DLBo+8epZ84w+Nzh2RSrsyIyRP4DXTlfI=;
        b=Ag7PpqqdKexbSx/jrAiDNHUFBrntjkC2V4AV0cyRgZTjFxQRdQiucvJ9uT5YbfvMF4
         T4/N/0MIwyRTutLRlV7t7Fg+RXU3o4pxOn7dHR2mbDWQus2nqJoyTB+dHbewCNu15+Ib
         fbvGbEJDx+AhH4+MqpYzcGTReELWfuboazqi8PhPGhalGrXCmch8MOf7Aku0Wz8bGoCq
         mrmhVjGNYKe5IDlsIhOX/mPS1TdwiE1jo5t1VoCn02wg1GA82N7rKQiBQRJq+VC5sqUZ
         I9DeI5GT2DxF13n7f0qKLCKqLtjj6Y7EIeAk3i0LvyW5EQlu2Gz2MtpWbzXYYwYq2WTG
         hcWQ==
X-Gm-Message-State: AOAM530nh3P2QR0J5LzxkGbIMDRmXFnwQ96R/G1CnTQ4f2lP5Y5Wwf2K
        3r/EA7GGyN3OXwVAl8tLR33/hrYzpCltAQ==
X-Google-Smtp-Source: ABdhPJzMGLCk8suYXbCVV/DXix14488+h1XgFszZairIgMIm+G7m5pc0V0dVvPrZYmw2hSbvBAp/Zg==
X-Received: by 2002:a17:903:31cd:b0:134:5b6f:2ff8 with SMTP id v13-20020a17090331cd00b001345b6f2ff8mr4413248ple.46.1631221293771;
        Thu, 09 Sep 2021 14:01:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:8da3:b0fb:4261:2c10])
        by smtp.gmail.com with ESMTPSA id l143sm177069pfd.60.2021.09.09.14.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:01:33 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
        Shawn Guo <shawnguo@kernel.org>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/15] arm64: defconfig: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
Date:   Thu,  9 Sep 2021 14:00:22 -0700
Message-Id: <20210909135838.v4.6.Ied5c4da3ea36f8c49343176eda342027b6f19586@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210909210032.465570-1-dianders@chromium.org>
References: <20210909210032.465570-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the patch ("drm/panel-simple-edp: Split eDP panels out of
panel-simple") we split the PANEL_SIMPLE driver in 2. Let's enable the
new config.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v4:
- PANEL_SIMPLE_EDP => PANEL_EDP
- Reordered config patches to be before code patch

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f423d08b9a71..01b30f4a7e74 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -697,6 +697,7 @@ CONFIG_DRM_MSM=m
 CONFIG_DRM_TEGRA=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PANEL_EDP=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
-- 
2.33.0.309.g3052b89438-goog

