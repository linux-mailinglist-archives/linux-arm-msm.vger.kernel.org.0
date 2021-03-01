Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61B64329404
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 22:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238086AbhCAVo2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 16:44:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240107AbhCAVmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 16:42:45 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D70C0610CE
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 13:35:03 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id t26so12482363pgv.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 13:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aHmWBB6HuTM9AzOvkula5c0v/SuO+ofpwQAgQj/t6ek=;
        b=EEWONlpFBt0WCFISzj+sV5vNOpNoXqTCqfapOdRG2UY782ccKtwfiBloRcC/NI+bif
         HeN/zc7NWr6SwKHEFMT7suSKtAzAOqAmOVgHYuYaCi8DRLaNFxDiKSfHuhaadRhAb24f
         O7EzgW2bNEejx8uk6tbKtGjQEVus94z3/NCAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aHmWBB6HuTM9AzOvkula5c0v/SuO+ofpwQAgQj/t6ek=;
        b=DB8xuV7AgkhuJ61qSt0+wZhRBmOFfAmvOahtSmINcFw+8XLQuGwdotvGSgEKgveE9I
         2MUpm7FgOGqK0+tahAgIVm/unruQ9Fa/Yjwh6gmnfJK14R8NImUisN7fVUDs0fyLI3/j
         +91teFwUSvB0flLdH+GYeWnzyxGlwgwMCanckMUG9NuUIAIOORL+bXO8W5XpGoSoO4YY
         q0UFF5dwwUse7MXPJI8iIKnu7ud9OUjm9CEbdm1cARGuvoCyYQ/rNHeIc00jHDkftPCb
         Ct4iwkRnmsg4fL136E4umKvE6F2Mv+1p+Jh0shfG5WoYj0VrEpgJp5DKI5wIdxuAURbV
         13zQ==
X-Gm-Message-State: AOAM533f21TGaB1qUdcV4ExIudyX6FB9OOd+4q9PfNYlSxxpJVErx0MA
        gsiSk2g3hD9e+9rjaaq036qB3Q==
X-Google-Smtp-Source: ABdhPJxFCYGeUxZo3SMWHBHMQPTXVpCsNG4vgi8kjEifPHETvq4cdUZJQZOZQJCiFBcrc7oL2f1XFA==
X-Received: by 2002:a05:6a00:1582:b029:1bc:fb40:4bd7 with SMTP id u2-20020a056a001582b02901bcfb404bd7mr17339167pfk.41.1614634502499;
        Mon, 01 Mar 2021 13:35:02 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:c086:5f6:85dd:98c8])
        by smtp.gmail.com with ESMTPSA id f13sm790366pjj.1.2021.03.01.13.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 13:35:01 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] arm64: dts: qcom: Add sc7180-lazor-limozeen skus
Date:   Mon,  1 Mar 2021 13:34:35 -0800
Message-Id: <20210301133318.v2.11.I556326b24441e22c8c429ce383cc157c7aaef44b@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210301213437.4165775-1-dianders@chromium.org>
References: <20210301213437.4165775-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a SKU variant of lazor.  Add it.  This squashes the downstream
patches to support this hardware.

NOTES:
- The non-touch SKU actually has "innolux,n116bca-ea1" but that driver
  is still pending in simple-panel.  The bindings have been Acked
  though [1].  Things work well enough with the "innolux,n116bge"
  timings for now, though.
- The wonky special dts just for "-rev4" arguably doesn't need to go
  upstream since they weren't widely distributed, but since a few
  people have them we might as well.  If it ever causes problems we
  can delete it.

[1] https://lore.kernel.org/r/20210115144345.v2.4.I6889e21811df6adaff5c5b8a8c80fda0669ab3a5@changeid

Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- Add link to Acked bindings.
- Proper compatible for the "correct" panel (added -ea1 suffix).

 arch/arm64/boot/dts/qcom/Makefile             |  3 ++
 .../sc7180-trogdor-lazor-limozeen-nots-r4.dts | 34 +++++++++++++++
 .../sc7180-trogdor-lazor-limozeen-nots.dts    | 26 ++++++++++++
 .../qcom/sc7180-trogdor-lazor-limozeen.dts    | 42 +++++++++++++++++++
 4 files changed, 105 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 549a7a2151d4..adc915a5f027 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -38,6 +38,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3-kb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r4.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
new file mode 100644
index 000000000000..6ebde0828550
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor Limozeen board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-lazor-limozeen-nots.dts"
+
+/ {
+	model = "Google Lazor Limozeen without Touchscreen (rev4)";
+	compatible = "google,lazor-rev4-sku5", "qcom,sc7180";
+};
+
+/*
+ * rev4-sku5 was built with a different trackpad.
+ */
+/delete-node/&trackpad;
+&ap_tp_i2c {
+	 trackpad: trackpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tp_int_odl>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
+
+		vcc-supply = <&pp3300_fp_tp>;
+		hid-descr-addr = <0x20>;
+
+		wakeup-source;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
new file mode 100644
index 000000000000..0456c7e05d00
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor Limozeen board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-lazor.dtsi"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Lazor Limozeen without Touchscreen";
+	compatible = "google,lazor-sku6", "google,lazor-sku5", "qcom,sc7180";
+};
+
+/delete-node/&ap_ts;
+
+&panel {
+	compatible = "innolux,n116bca-ea1", "innolux,n116bge";
+};
+
+&sdhc_2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts
new file mode 100644
index 000000000000..e6ad6dae4e60
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor Limozeen board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-lazor.dtsi"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Lazor Limozeen";
+	compatible = "google,lazor-sku4", "qcom,sc7180";
+};
+
+/delete-node/&ap_ts;
+
+&ap_ts_pen_1v8 {
+	ap_ts: touchscreen@10 {
+		compatible = "elan,ekth3500";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc33-supply = <&pp3300_ts>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&panel {
+	compatible = "auo,b116xa01";
+};
+
+&sdhc_2 {
+	status = "okay";
+};
-- 
2.30.1.766.gb4fecdf3b7-goog

