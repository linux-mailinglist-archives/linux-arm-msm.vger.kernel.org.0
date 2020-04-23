Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6D81B60C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 18:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbgDWQ0P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 12:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729665AbgDWQ0O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 12:26:14 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47553C09B045
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 09:26:14 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 145so3177148pfw.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t+az60ThGdIE96zHd3j4C+YFzxV2ee2icRXc48MtdSg=;
        b=e12bR+ZpXLVjEEpan9cAEWHV4kDr8Z7MZkqcd7f2suEPYFg8jvkfNyq70AOvFiT7wa
         4R/XyzA6cL0T1vpLIg314Ii0SKalB98Q4CK9r4ofREWXmfxZDtzOTMdjCYn1ytmbKmiX
         ZkpDOzjkjb2l8hrkAs+QCG1FNUaXWUvOjEhEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t+az60ThGdIE96zHd3j4C+YFzxV2ee2icRXc48MtdSg=;
        b=BBbkxrFKpPFih/4TObeb5ubCK9x2pcjgVThA2i+OZKZBCLQM1hOeD288ozowI1gT3p
         zkRUbamTqGWhXv2zYhIR9G5bv4beQcc4zbxTtZh9iylF1UAPjrogspX7KBojPJWsD1ct
         iDG22c4+hMXd+S5MYs5bAUOLUsC2Cw25Ww/4tbuhGQpfGxctMOYO8O80kxnFrvYIqkK1
         bHszg7T3b9EvCbkcjyL0HW6ijPaElsCn3nO1UfgQ4MV3jFiIbeTV0ZetfBpY0KNYyisH
         iZ6fI2Cq246j9G4hoMtIhJEU6hThx+airxnUUdBTeCt+BNc8jfdCrWUfmg62DCWpbFxy
         0A+g==
X-Gm-Message-State: AGi0Pua+vc2CHzWGN97mIZThBYTNOU0bH0y7rUN4jPeULEcWQxp5Ctm2
        uM59qeGQsBYYDZQQWib2eu+RcA==
X-Google-Smtp-Source: APiQypKjcxU1Aq1NSUI9ytZOpl3JXA96PEo792irFM8Rg9bStYDnDS9zclolWyNi4CYW+A0kSTRQDw==
X-Received: by 2002:aa7:9709:: with SMTP id a9mr4779536pfg.166.1587659173796;
        Thu, 23 Apr 2020 09:26:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id d12sm2841927pfq.36.2020.04.23.09.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 09:26:13 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     swboyd@chromium.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, jeffrey.l.hugo@gmail.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        robdclark@chromium.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
        bjorn.andersson@linaro.org,
        Douglas Anderson <dianders@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] dt-bindings: display: Add hpd-gpios to panel-common bindings
Date:   Thu, 23 Apr 2020 09:25:44 -0700
Message-Id: <20200423092431.v3.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200423162548.129661-1-dianders@chromium.org>
References: <20200423162548.129661-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the cases where there is no connector in a system there's no great
place to put "hpd-gpios".  As per discussion [1] the best place to put
it is in the panel.  Add this to the device tree bindings.

[1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v3: None
Changes in v2:
- ("dt-bindings: display: Add hpd-gpios to panel-common...") new for v2

 .../devicetree/bindings/display/panel/panel-common.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index ed051ba12084..e9a04a3a4f5f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -96,6 +96,12 @@ properties:
       (hot plug detect) signal, but the signal isn't hooked up so we should
       hardcode the max delay from the panel spec when powering up the panel.
 
+  hpd-gpios:
+    maxItems: 1
+    description:
+      If Hot Plug Detect (HPD) is connected to a GPIO in the system rather
+      than a dedicated HPD pin the pin can be specified here.
+
   # Control I/Os
 
   # Many display panels can be controlled through pins driven by GPIOs. The nature
-- 
2.26.1.301.g55bc3eb7cb9-goog

