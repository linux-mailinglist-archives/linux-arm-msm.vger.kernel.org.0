Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EBF3697D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 19:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243611AbhDWRBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 13:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243523AbhDWRAp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 13:00:45 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED3FC061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 10:00:02 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so1592790pja.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qqRgrq5qTHq8+QQOXrqNOrI+XnC8s9rFcrx/PHqU9kA=;
        b=X+2LXkR+x2Y6Yo6aK1kTdJ8Rhytwsl31CFMU6k56xp/RuePZ0vzxwrb2UfkLXWGSBq
         LlAh38K6d3Rlb9ZhLKF9mKVf9rd/crkpvJJ+H9Qkz8Lur52GfMVYXi8zj2XicneHKR7c
         YdlA2lbc+fQi/b3LKgVfUmJaZh6SjEHuSYkCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qqRgrq5qTHq8+QQOXrqNOrI+XnC8s9rFcrx/PHqU9kA=;
        b=gl0vBFhtadoDeBKR84/MzBf+Btc7siQeAJ2HjReh7jpNvj3jBJw0+rGXtrdOXVhos1
         BmlcY3kKuh57HcepkNZ4SoDgnZcqykOLgSzgb34UJTSzarFRUfJz20JjSsRI+4bhuM/a
         DCsSsgFRg+OAT0AiUoTj33H71DbJt0mwILgxVRBFKLWzcRcU91xOM/iFyxSkD7RsRXul
         YthJdWJCnQI5MbJuwc6qL+2aGuaa98hlZ3cWAuPnaiDyGmIkHBABuUxnvSUFrQd5EOIv
         WabG0xFCNMLV6fQahzlSoeiLJ/6FzVtC16JrfTkuL0JwtLZr2MT6HxhNKWCNIMzN2doj
         na4g==
X-Gm-Message-State: AOAM533BT7jWV92CbYPclb6gYV3GB548K/I/5f+xEbbQnSH6t2rzZlCg
        +JMNGes/+iKu8xRyKDmvxsxlyA==
X-Google-Smtp-Source: ABdhPJwYRj/bkCBR5feDF1qTXpHaqYVIA63dyfs8jdja9V5hgW3GpI+hcKLSiO/ZUNmI8hVVg+H2gQ==
X-Received: by 2002:a17:90a:7d02:: with SMTP id g2mr6649977pjl.153.1619197202494;
        Fri, 23 Apr 2021 10:00:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.10.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 10:00:02 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 20/20] arm64: dts: qcom: Link the panel to the bridge's DDC bus
Date:   Fri, 23 Apr 2021 09:59:06 -0700
Message-Id: <20210423095743.v5.20.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding this link allows the panel code to do things like read the
EDID.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 24d293ef56d7..96e530594509 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -265,6 +265,7 @@ panel: panel {
 		power-supply = <&pp3300_dx_edp>;
 		backlight = <&backlight>;
 		hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&sn65dsi86_bridge>;
 
 		ports {
 			port {
-- 
2.31.1.498.g6c1eba8ee3d-goog

