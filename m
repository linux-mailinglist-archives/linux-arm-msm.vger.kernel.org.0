Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1190D3FE3CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 22:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343744AbhIAUVx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 16:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343729AbhIAUVj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 16:21:39 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73551C0617AD
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Sep 2021 13:20:41 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 18so724201pfh.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Sep 2021 13:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mWpQuuJjmOltxcGlhp80Go7kcj2rBByEKq5WUEPaCUU=;
        b=XK94ViAcm0nxkHX43OqtJrmDk10oapIw+sE89kl6IesikSt+5Jv6hCy+/YIjBhe8NU
         ldI/mEX6luWPDd3MUKfPNt2tHvoCnvN4ej7yZuvIxr6MxL+AloelI0Fl+k8Td78wfGiz
         AWlJWNJobDgFv+/YDryZq12xHWLaxOG1XqeCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mWpQuuJjmOltxcGlhp80Go7kcj2rBByEKq5WUEPaCUU=;
        b=GmnwDdEQNR1IyHEdO7tpqQcB0HQSeCaPT2MtvA93/E6Q1SPM4izom5ipNwuhWiVkIr
         wKovcmGi6YZjtsRbVD1C2V/H1lDElQkE7sdlmARb9/FpxE/nEv1pKc2vuKgm71r8+hq4
         y5eV4gIxLEHLyjHqimGMmFTnwsACXiHc9SQ9AA/1qragR2y8E1AXosmrxJHpnK5/Yr09
         nYt/ZVDRVqP9dOtGYNy8LgcziEfWAvjy0J7yngKvRdS8B34N619jZTotyaiAfLoy7eki
         zFP335y7qJIOBxNkVDwsdxfpkqMaYhG3QZmtHKifnGyxpfN9IC8QzMkBfVGAZYklAoLq
         4zCw==
X-Gm-Message-State: AOAM531rpBCemVH+4Yf3Htnip2havSIeUe9sugiv/h/kSHwFZ82l5XqX
        wpXMgUKIFPmUeknG4gfR114xRg==
X-Google-Smtp-Source: ABdhPJzp2cmXbEsSbVWCOkZZKfiv31TzBP31B0LfIbPldpdBtF6YxlUM1F7d6HlVMOhOFD452XmjKw==
X-Received: by 2002:a63:ed03:: with SMTP id d3mr802704pgi.24.1630527641056;
        Wed, 01 Sep 2021 13:20:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:958b:b561:a735:e774])
        by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 13:20:40 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/16] arm64: defconfig: Everyone who had PANEL_SIMPLE now gets PANEL_SIMPLE_EDP
Date:   Wed,  1 Sep 2021 13:19:25 -0700
Message-Id: <20210901131531.v3.7.Ied5c4da3ea36f8c49343176eda342027b6f19586@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the patch ("drm/panel-simple-edp: Split eDP panels out of
panel-simple") we split the PANEL_SIMPLE driver in 2. Let's enable the
new config.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f423d08b9a71..914057efa160 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -697,6 +697,7 @@ CONFIG_DRM_MSM=m
 CONFIG_DRM_TEGRA=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PANEL_SIMPLE_EDP=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
-- 
2.33.0.259.gc128427fd7-goog

