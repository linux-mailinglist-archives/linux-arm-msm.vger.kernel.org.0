Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABE673722D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 23:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhECWAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 18:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhECWAU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 18:00:20 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB659C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 14:59:25 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id 10so5407683pfl.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 14:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xm1pxMgf3254HnKQhOZrmriigH6ea4myanu9Y2cRDqQ=;
        b=CIAdryDpEn9rQaPhlyTVYzELYwbjMNsFogb7bPkXSCBMg+03kh4lI+6XnJudg3+4NE
         jp0IX0m1DyxzhIjnTC8cmZe5uGYfxnDTUXboX3NVs0A/i7voWWNmtEXBNOS5N0gONI4J
         vXgenGFSYCusWGmU+Un80gZgXXcGwtm0k/sT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xm1pxMgf3254HnKQhOZrmriigH6ea4myanu9Y2cRDqQ=;
        b=MluhVlCL/RQsxA/7lUDS2tKCGy8aan8oTyVRI6wBBxK9L+505hAGQqGm+nY0pIuupN
         4l/ImYDMPPhHcdhbV8Dszl061aKnJvBqpVjJ4pRo2/q4etUKPg4IsGW15CvWhvR+/JdH
         zTJBdINvBl+0+mpvugr6Ltmqaif3wJdzPWCDpE55HdzFneQK6w5HWrmToBycxk/61ixY
         qVogTa4ev1C0jgPyZinfAwkuHe+pNHNhFGHl+GwAOuhPPyS8+e5WivAYSlUxwsvXmC7k
         aP2kwn6o20y3DOACW9QcITt3SD/YgrCFTHIfv6EkMxacwG+pXw8QlvHggJ4R3AzWYRhK
         gBuA==
X-Gm-Message-State: AOAM531eJUyNv8nCw7bN0aHfWyYwEB53o90Gte4hYy61ap0sZfJGjHSi
        QSjV3+3k/t36mQcAuQLcJrV5ow==
X-Google-Smtp-Source: ABdhPJw2UkoGCFZjjZZ9DA4lzXuDBaVWBMcxVKzDXxW44/AQEfL8FfaCwy463h1uFYXcKRpcbrIF5g==
X-Received: by 2002:a63:5947:: with SMTP id j7mr1042596pgm.248.1620079165455;
        Mon, 03 May 2021 14:59:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:a592:ac50:b17b:5c43])
        by smtp.gmail.com with ESMTPSA id w1sm639186pgp.31.2021.05.03.14.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:59:25 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Lyude Paul <lyude@redhat.com>, Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Linus W <linus.walleij@linaro.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/5] arm64: dts: qcom: Link the panel to the bridge's DDC bus
Date:   Mon,  3 May 2021 14:58:44 -0700
Message-Id: <20210503145750.v6.5.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210503215844.2996320-1-dianders@chromium.org>
References: <20210503215844.2996320-1-dianders@chromium.org>
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
2.31.1.527.g47e6f16901-goog

