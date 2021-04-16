Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1756C362B7F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbhDPWmS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235316AbhDPWlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:49 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744D5C06134A
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:22 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id b17so20149465pgh.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9TvqfTmBKpWQk47pVCIMnPVMBwS/uLueprhgNryYtbA=;
        b=jqBZZDcWG7s4YKPCZfESxsi5IWXAX19ybkyjsCxLgUAWTSv+PSrzGu5XAZmwQDFNzM
         ttf7BoB27sCINbqxpc8wkIXKqZG63TiCRPr41Yoek6F8sRzHt9AKgbTQjAwLd6gA9G2c
         5FSbUlFIuDNE1oe4ihKfaXppRgyi9WF7uE43M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9TvqfTmBKpWQk47pVCIMnPVMBwS/uLueprhgNryYtbA=;
        b=eS/UB9uDTfLF/4xumt6aSDZmCtDsUeT6KLATivk+uKh5WNEhafqysDuwkB2darZ9Ha
         R17ieEedwVytCmoie4UPhcqdbP9WSrxmmU0tBetEtgE8JNCmmVLWKBDoZbldg+Y0Wo5H
         ccASboCQ3+9Y8DA8Dj1Gqgic9rHdBOGOa+pwSx/HmPaLoEGfxdBnRu43cLoy3xMx7SdE
         CuZXZzNkZ5bu/q0CQwTZ05Q5lpxtGs2vakshX/EG91f2wYTKZMc/wb7ccWQ1BkQYmVa4
         4G6shmPIl1yiOUPreiGjuGGjMlJsHgkVvqFdBIkB9CaF7fB4G7mYrWRE6iya9/zmRtON
         PoWg==
X-Gm-Message-State: AOAM532ChTELgZb/RXOwsdK5bR65ZzmdM2yJcUSTA8VBUWaHS+rwKcrK
        zGtlDmt1BiGTZOM6OJzM+mJt+g==
X-Google-Smtp-Source: ABdhPJxQ9DBJQiYCekZ4xDBquq5Hfj2H7iOAKL64Gkmy7QFs0dyOoqt0xfbyRdv9R6gxEd68unyLPw==
X-Received: by 2002:a63:f95a:: with SMTP id q26mr1108999pgk.25.1618612881550;
        Fri, 16 Apr 2021 15:41:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:21 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 26/27] arm64: dts: qcom: Link the panel to the bridge's DDC bus
Date:   Fri, 16 Apr 2021 15:39:49 -0700
Message-Id: <20210416153909.v4.26.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding this link allows the panel code to do things like read the
EDID.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
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
2.31.1.368.gbe11c130af-goog

