Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DD8262126
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 22:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbgIHUb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 16:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728936AbgIHUby (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 16:31:54 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BE3C061756
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 13:31:53 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f18so110820pfa.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 13:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GinH/+WlUUwJ7OA+sMknkcAQqYifytKaKvguzz2CVE8=;
        b=l21Kp+H0v8uAYf7toyEqNp3Cy4s11aUKhZNJtNGZTVsWzEe+4XQnEK6SNIaJHitQmE
         gu0LHt6kxnMPygob8IiXd9ep45Ga6YVhpp9KCxHz+aHqmSm9f2FmAGW0zjo7cscXts8Q
         ngeAx0qvGqsdpZhohbQBiqI0ba9dNBOtJO8tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GinH/+WlUUwJ7OA+sMknkcAQqYifytKaKvguzz2CVE8=;
        b=AwcBJUT7PqQvHNEVARhSsx6cDskQl8NhTlDcaWetWSZ53z5scZ6V3CPYukql5dJIve
         c8JTYqz5uXh+79FUWbMhcKYLjb+x2Y0Dl0qATM4s6FZGKuNBp7VgCqbfADeW2FRUvCzc
         ZU4YmB6T+gmMxOJhVpwj8VKcZrQX6qhkGCifgRLqs+if0jv+4MvO64Qp4phWX27LosAC
         41iXJW7sNDqK/s8wxqs2wPhAAIV7JuGPtfqXvnPv8iOMc799mLsLAnBmQnVK2mpWjMmi
         icpCmdgww1QequwIyIY0RhnTRJavIWVI7kXwSHTB8zClGTumpohqr0JQ0KVpXQqIg0lH
         2msQ==
X-Gm-Message-State: AOAM5303YQ7EHNY1WUIPCj8WjCclgO9LDQUBIKOKCDSQkZoeED8+sJ3R
        DnkDIm3tNSIWVhPiio6vWvsiAg==
X-Google-Smtp-Source: ABdhPJxR1cfQbHMi4YHouw7fFkCUEVsDqRPvLhAz8c9yVtVO2T5nIYTRtwU1uGRh8JQFx6b5KMCvSg==
X-Received: by 2002:a17:902:d206:b029:d0:cbe1:e711 with SMTP id t6-20020a170902d206b02900d0cbe1e711mr793068ply.31.1599597113155;
        Tue, 08 Sep 2020 13:31:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id y7sm113620pjn.54.2020.09.08.13.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 13:31:52 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, swboyd@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: Add sc7180-lazor sku2
Date:   Tue,  8 Sep 2020 13:31:17 -0700
Message-Id: <20200908133037.1.Ia98a6b938453254e360c4a9fa253d2d6807dff3f@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new SKU variant.  This is a pick from the downstream tree that
is the current source of truth for this platform.

Link: https://crrev.com/c/2386997
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/Makefile               |  1 +
 .../dts/qcom/sc7180-trogdor-lazor-r1-kb.dts     | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5899101526a7..af5ff84889cb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -21,6 +21,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
new file mode 100644
index 000000000000..c3f426c3c30a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-lazor-r1.dts"
+
+/ {
+	model = "Google Lazor (rev1+) with KB Backlight";
+	compatible = "google,lazor-sku2", "qcom,sc7180";
+};
+
+&keyboard_backlight {
+	status = "okay";
+};
-- 
2.28.0.526.ge36021eeef-goog

