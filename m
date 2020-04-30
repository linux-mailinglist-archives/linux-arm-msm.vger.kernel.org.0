Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E9C1C06DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 21:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgD3TrC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 15:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgD3Tq3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 15:46:29 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42C8C08E934
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:46:29 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mq3so1290464pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=69Vg9U3gBVUlkizCg48EDMT0ufV71AxAgwY37Mxv9RI=;
        b=Z+bKIp4ValF2xpimna9+2Wvkg/u4DEsTSNrLlwT6aivVRbhKKdgzGabovsdyTlg/69
         NmTZI1zkc/MfM85OdYnHp+oJxY9qD1946qXdgtwPHVuo9zs/v6RSG3B9Lux6QsKAsRh3
         8nQIkhHi7qaoCP6AUaiPJNszq2B3CrY2EfYVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=69Vg9U3gBVUlkizCg48EDMT0ufV71AxAgwY37Mxv9RI=;
        b=lbIplsMrqwayYB2b0y04vFIIPsJIBfoeIW5tD1M/Ad82jID8m4Wc9kBv2Cz4wEgsF6
         lSyXnRE6DP8/xL6TD1NMHijw4sOJ6K8QIZOrPf5w/IFAqFFDjSWcUih1scewC3es+HwM
         pQGxFcBqH4yMpYuotjRg2bRUf4jyNeZMVl9uqqyCI7LGMbZKvHC8nSNxy45l9wwzIRSk
         UiOEDEPrBQw8EwI1eWm7nUGRCNaekMnKythhQuN7ula0lARMPQ0q+UTh5rjtLEzOWMHD
         RDelgbkJOLYNTuORZ3COpK1/Du7o2Y7uCWrG5Dcoj5c1tQ/nL2MBeSPtBnuBsLpILnWk
         VSag==
X-Gm-Message-State: AGi0PuYYxzyWSlBy42nikQcN5s2AhvqcMgGG99tcn7yf6/hPHbCoNAXl
        aMH1VWOS4wWmoNKvRGJsgoosVw==
X-Google-Smtp-Source: APiQypLMm8BMm2i3v9zIi6LLFN1yz2hNg4Ay0PXQeF0bd8feavJN2Yy5iy7PQdAFV+JeZvO0jSoW7g==
X-Received: by 2002:a17:90a:cb0b:: with SMTP id z11mr500642pjt.62.1588275989203;
        Thu, 30 Apr 2020 12:46:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id u3sm495993pfb.105.2020.04.30.12.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:46:28 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     linux-gpio@vger.kernel.org, jonas@kwiboo.se,
        robdclark@chromium.org, bjorn.andersson@linaro.org,
        jeffrey.l.hugo@gmail.com, jernej.skrabec@siol.net,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] dt-bindings: display: Add hpd-gpios to panel-common bindings
Date:   Thu, 30 Apr 2020 12:46:13 -0700
Message-Id: <20200430124442.v4.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200430194617.197510-1-dianders@chromium.org>
References: <20200430194617.197510-1-dianders@chromium.org>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

Changes in v4: None
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
2.26.2.526.g744177e7f7-goog

