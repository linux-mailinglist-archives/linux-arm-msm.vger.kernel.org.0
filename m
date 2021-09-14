Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121C040B913
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 22:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbhINUYB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 16:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbhINUXs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 16:23:48 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B0BC0613EF
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:30 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id n4so148973plh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PBcYPyXmjQckFM/2vcPXaB6/oJE2xaU/uFm+3ktt/M4=;
        b=CckSXAwHc21xof5pws6PHHqcPQ6kRaqr7CDq3Ah80T9bXoLzSQyJLLwyDJdp/Z4NV+
         KnBsoarxEdp5JCWnwQvDcUob4dp+ZffeJ4ikwepOBFvcQOv2QzXOoQAFLijV2lgZM65j
         akcP3i1aearFox7NMwtUtwptpOl1kFR5btp7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PBcYPyXmjQckFM/2vcPXaB6/oJE2xaU/uFm+3ktt/M4=;
        b=UrW1Cxt56oG1i9b5XgOQ8Snzjm65E4kxhdlxQpeAcfNM6/MxKNJeFAihXO2VY8S5S1
         zLOCjVEtwefLymdpfwEYa32p7hvNni69bxP7SNI3OkGsJxj7jhu9B+5A+doKzs0Im119
         WndnARLpJ7YDw0FeA53U1PeHlEpUWkEYnCADojpexFCoZBc8J6sgOpzSDzVICy2VAfIW
         +TNzFPf6f+1osfa2fSuvN8kjxNDlfcCBbsGgGMOfTB49H5vQQi8EOIPvnRkqqOVyFw4i
         RHlD8uSMqJv9ooG11Xd1GmP0MGZt/b7+5ihGqHNGo2cLnIy41nYN/hBcxpnUoObSTYzi
         5rdg==
X-Gm-Message-State: AOAM533Wwe0AcOZc/s/4iUVhDfiyXnu/Ts00WMXj3G2DW2SmJNHb3KSv
        rgUqxzWtKYjSi+CHvlfguwvLwA==
X-Google-Smtp-Source: ABdhPJwT8YboamT7k/5uDkHsbWCYQKBAEu3nQN/DiSI9zWeXYNzhx+6XvNbN4xBxoN6Mk4dIUp+88Q==
X-Received: by 2002:a17:90b:4b47:: with SMTP id mi7mr4168709pjb.198.1631650949909;
        Tue, 14 Sep 2021 13:22:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
        by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 13:22:29 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Adam Ford <aford173@gmail.com>,
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
Subject: [PATCH v5 06/15] arm64: defconfig: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
Date:   Tue, 14 Sep 2021 13:21:53 -0700
Message-Id: <20210914132020.v5.6.Ied5c4da3ea36f8c49343176eda342027b6f19586@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
References: <20210914202202.1702601-1-dianders@chromium.org>
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

(no changes since v4)

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

