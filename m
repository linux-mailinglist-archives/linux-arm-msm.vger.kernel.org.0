Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A36D32597B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 23:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhBYWRr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 17:17:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbhBYWQ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 17:16:28 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4323FC061A28
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:53 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id e6so4759754pgk.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KLoBTL6mkiA5k1Hs0MW+I/FxZdPiLRn6ihEGRaAKG2U=;
        b=gz7d2qH2A2ffDTxM52P25z2BIgcqn2JXjeaVQEz9XhuyuNFVIGkK6Q6vdTHiIQ9ZsK
         hzlM5NWCtKGUHTMTEBbbps2/i2/e5+xImXHMJMJeqMXmyZrocjP9I9u5lt8taAvH7s+z
         nb9xAT/M7jS+TEiqN7icLcn+BgZKlATznfggY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KLoBTL6mkiA5k1Hs0MW+I/FxZdPiLRn6ihEGRaAKG2U=;
        b=XpI3CIwDgZU7j/2UQTTUsAKVbtws8Mr1PJOYHd0erqE3m60NW+hT7NEGKGJLRpr4/G
         0TfqqMD0eGCNX7VGRQQM8ArbK9MZg9+wic46MEtC0hBDsxoyPw/axATNWOoXsP2+yVuQ
         ofOnzxVl0XQZMIKZTPadntV1yM0pXdy1fyph01vGh+iHKPRAseQpYlUaeMRdrPkYJqOI
         PEvRUwJMTncjK/KUCp8N5LE9EbOJw1w3qmelCtML/O9PodBY6DWVjVPztPzFg7J5tZYT
         2MWJSX07/9DVmlzRN/czHRkCIj8TRfMvwjqIi2PZkKX87bJPHwM1xiBU853St3XV1IdT
         Co1A==
X-Gm-Message-State: AOAM530i08kPAb1k9JrHS/8GeiO1yCw5bMtZHxp4YwXd69mLl3xrXYKr
        3pQr7hwhzS+qt5vhuKKWfP2O9w==
X-Google-Smtp-Source: ABdhPJwuQdhoyNA96pKJ4SSBJ1YG9fUA/onWkGrxl1MBgx8M8aJiXg8kjMktceiHGBl/rsd00rnU/A==
X-Received: by 2002:a62:7a88:0:b029:1ee:174:7c22 with SMTP id v130-20020a627a880000b02901ee01747c22mr34672pfc.35.1614291232814;
        Thu, 25 Feb 2021 14:13:52 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:8414:45a5:94c4:d35d])
        by smtp.gmail.com with ESMTPSA id jt21sm6713301pjb.51.2021.02.25.14.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 14:13:52 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] arm64: dts: qcom: Add sc7180-lazor-limozeen skus
Date:   Thu, 25 Feb 2021 14:13:08 -0800
Message-Id: <20210225141022.11.I556326b24441e22c8c429ce383cc157c7aaef44b@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210225221310.1939599-1-dianders@chromium.org>
References: <20210225221310.1939599-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a SKU variant of lazor.  Add it.  This squashes the downstream
patches to support this hardware.

NOTES:
- The non-touch SKU actually has "innolux,n116bca" but that driver is
  still pending in simple-panel.  The bindings have been Acked though.
  Things work well enough with the "innolux,n116bge" timings for now,
  though.
- The wonky special dts just for "-rev4" arguably doesn't need to go
  upstream since they weren't widely distributed, but since a few
  people have them we might as well.  If it ever causes problems we
  can delete it.

Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
index 000000000000..91f36eeb923c
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
+	compatible = "innolux,n116bca", "innolux,n116bge";
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

