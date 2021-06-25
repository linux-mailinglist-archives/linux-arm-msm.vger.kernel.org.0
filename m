Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 978093B4189
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 12:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhFYKY0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 06:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbhFYKYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 06:24:22 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7D9C061574;
        Fri, 25 Jun 2021 03:22:01 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id hq39so14307030ejc.5;
        Fri, 25 Jun 2021 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plRGUZ3UvNVKaBLKueAbkDuGyEc8z9xbnsSuhaCw/fY=;
        b=naoyXOOaAjba0P5X59WYRtUod58ccT5lth/A0slglTXbWmTpD7JRUcmRZxnjx0CJXK
         rpjizGb/+d2Dp9ga40eWQSrI64jT2xYl73al+5RaIcf7hE+0Li2+ueg7916Stut1O7rz
         0KzLXy7TyeaVv0yocF5z4uiA1o8NcaF/Gt4Y2jbhwiMzpoB/utcLWrkeygkOhjKTmEPr
         3DZkmBxgU4W+W6BgMpFVtSidjsGBF7givx1jAhnrI2LF/K7FmfUd2/tWyVYNnr29Ta3t
         oejfgPEHdiFu8d59ufjCnpXZCRcEdmmc8F+E0iQhEs8HzXmi2aEynrbthgvTz7wWzS7b
         qoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plRGUZ3UvNVKaBLKueAbkDuGyEc8z9xbnsSuhaCw/fY=;
        b=oNz4Zmkcn5KD6eEtTlPHysGFc7+2RR8KwpaF8wUELncy+Gm5LKR0AlkJO9B95eHn9w
         QhWMbBuS1WfKFfNciLGDroIjEOP8zzEd4AS7lhvzGuyDHbLMmVA6gsh6OUYvMA7lc8Zf
         81hl7gIbLdwJbQUwWahI2XaaKpc5FF9F5Fwz903cyKat0aMzBAfPjddGc2Vu3AbOKKCi
         CjF7zK4vqePF5zOMqX7HlktZme71pKe77sNXHciF7ThaUe6D1YkoLyS58oO4FivwN0V/
         oUqalrM5XPDwNobzaGk6Z3LjosEDIxuUhdZj3KFnm+GcMGfq37tpohxeqB+309/AOXMX
         N0QQ==
X-Gm-Message-State: AOAM5325wuOKY9Gy3jCzzYyC78XyPvPLammXPg+cP4l+oPcWcd1s5cKH
        o/Sbext5kOkLnF3zqcPz1vNy2bkTJlDPZQ==
X-Google-Smtp-Source: ABdhPJyDdclAfPhy8trbCRqNxzd0HmZSWc8n/H4QrfEMMTEWK7gLTgyoLrEyFsbE3DKW9ioUs7yhwg==
X-Received: by 2002:a17:906:29c7:: with SMTP id y7mr3491336eje.404.1624616520292;
        Fri, 25 Jun 2021 03:22:00 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id de6sm3642536edb.77.2021.06.25.03.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 03:21:59 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v4 2/2] drivers: qcom: pinctrl: Add pinctrl driver for sm6115
Date:   Fri, 25 Jun 2021 13:21:47 +0300
Message-Id: <20210625102147.51162-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625102147.51162-1-iskren.chernev@gmail.com>
References: <20210625102147.51162-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Based on CAF implementation with egpio/wake_reg support removed.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/pinctrl/qcom/Kconfig          |   9 +
 drivers/pinctrl/qcom/Makefile         |   1 +
 drivers/pinctrl/qcom/pinctrl-sm6115.c | 924 ++++++++++++++++++++++++++
 3 files changed, 934 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6115.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 11e967dbb44b..f45f0a221c07 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -256,6 +256,15 @@ config PINCTRL_SDX55
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
 	 Technologies Inc SDX55 platform.
 
+config PINCTRL_SM6115
+	tristate "Qualcomm Technologies Inc SM6115,SM4250 pin controller driver"
+	depends on GPIOLIB && OF
+	depends on PINCTRL_MSM
+	help
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	 Technologies Inc SM6115 and SM4250 platforms.
+
 config PINCTRL_SM8150
 	tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
 	depends on GPIOLIB && OF
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index d4301fbb7274..50236b6ffa70 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_PINCTRL_SC8180X)	+= pinctrl-sc8180x.o
 obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
 obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SDX55) += pinctrl-sdx55.o
+obj-$(CONFIG_PINCTRL_SM6115) += pinctrl-sm6115.o
 obj-$(CONFIG_PINCTRL_SM8150) += pinctrl-sm8150.o
 obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
 obj-$(CONFIG_PINCTRL_SM8350) += pinctrl-sm8350.o
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
new file mode 100644
index 000000000000..e053bda3789a
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -0,0 +1,924 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-msm.h"
+
+static const char * const sm6115_tiles[] = {
+	"south",
+	"east",
+	"west"
+};
+
+enum {
+	SOUTH,
+	EAST,
+	WEST
+};
+
+#define FUNCTION(fname)					\
+	[msm_mux_##fname] = {				\
+		.name = #fname,				\
+		.groups = fname##_groups,		\
+		.ngroups = ARRAY_SIZE(fname##_groups),	\
+	}
+
+#define PINGROUP(id, _tile, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
+	{						\
+		.name = "gpio" #id,			\
+		.pins = gpio##id##_pins,		\
+		.npins = (unsigned int)ARRAY_SIZE(gpio##id##_pins),	\
+		.funcs = (int[]){			\
+			msm_mux_gpio, /* gpio mode */	\
+			msm_mux_##f1,			\
+			msm_mux_##f2,			\
+			msm_mux_##f3,			\
+			msm_mux_##f4,			\
+			msm_mux_##f5,			\
+			msm_mux_##f6,			\
+			msm_mux_##f7,			\
+			msm_mux_##f8,			\
+			msm_mux_##f9			\
+		},					\
+		.nfuncs = 10,				\
+		.ctl_reg = 0x1000 * id,		\
+		.io_reg = 0x4 + 0x1000 * id,		\
+		.intr_cfg_reg = 0x8 + 0x1000 * id,	\
+		.intr_status_reg = 0xc + 0x1000 * id,	\
+		.intr_target_reg = 0x8 + 0x1000 * id,	\
+		.tile = _tile,			\
+		.mux_bit = 2,			\
+		.pull_bit = 0,			\
+		.drv_bit = 6,			\
+		.oe_bit = 9,			\
+		.in_bit = 0,			\
+		.out_bit = 1,			\
+		.intr_enable_bit = 0,		\
+		.intr_status_bit = 0,		\
+		.intr_target_bit = 5,		\
+		.intr_target_kpss_val = 3,	\
+		.intr_raw_status_bit = 4,	\
+		.intr_polarity_bit = 1,		\
+		.intr_detection_bit = 2,	\
+		.intr_detection_width = 2,	\
+	}
+
+#define SDC_QDSD_PINGROUP(pg_name, _tile, ctl, pull, drv)	\
+	{						\
+		.name = #pg_name,			\
+		.pins = pg_name##_pins,			\
+		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
+		.ctl_reg = ctl,				\
+		.io_reg = 0,				\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.intr_target_reg = 0,			\
+		.tile = _tile,				\
+		.mux_bit = -1,				\
+		.pull_bit = pull,			\
+		.drv_bit = drv,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = -1,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+
+#define UFS_RESET(pg_name, offset)				\
+	{						\
+		.name = #pg_name,			\
+		.pins = pg_name##_pins,			\
+		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
+		.ctl_reg = offset,			\
+		.io_reg = offset + 0x4,			\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.intr_target_reg = 0,			\
+		.tile = WEST,				\
+		.mux_bit = -1,				\
+		.pull_bit = 3,				\
+		.drv_bit = 0,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = 0,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+static const struct pinctrl_pin_desc sm6115_pins[] = {
+	PINCTRL_PIN(0, "GPIO_0"),
+	PINCTRL_PIN(1, "GPIO_1"),
+	PINCTRL_PIN(2, "GPIO_2"),
+	PINCTRL_PIN(3, "GPIO_3"),
+	PINCTRL_PIN(4, "GPIO_4"),
+	PINCTRL_PIN(5, "GPIO_5"),
+	PINCTRL_PIN(6, "GPIO_6"),
+	PINCTRL_PIN(7, "GPIO_7"),
+	PINCTRL_PIN(8, "GPIO_8"),
+	PINCTRL_PIN(9, "GPIO_9"),
+	PINCTRL_PIN(10, "GPIO_10"),
+	PINCTRL_PIN(11, "GPIO_11"),
+	PINCTRL_PIN(12, "GPIO_12"),
+	PINCTRL_PIN(13, "GPIO_13"),
+	PINCTRL_PIN(14, "GPIO_14"),
+	PINCTRL_PIN(15, "GPIO_15"),
+	PINCTRL_PIN(16, "GPIO_16"),
+	PINCTRL_PIN(17, "GPIO_17"),
+	PINCTRL_PIN(18, "GPIO_18"),
+	PINCTRL_PIN(19, "GPIO_19"),
+	PINCTRL_PIN(20, "GPIO_20"),
+	PINCTRL_PIN(21, "GPIO_21"),
+	PINCTRL_PIN(22, "GPIO_22"),
+	PINCTRL_PIN(23, "GPIO_23"),
+	PINCTRL_PIN(24, "GPIO_24"),
+	PINCTRL_PIN(25, "GPIO_25"),
+	PINCTRL_PIN(26, "GPIO_26"),
+	PINCTRL_PIN(27, "GPIO_27"),
+	PINCTRL_PIN(28, "GPIO_28"),
+	PINCTRL_PIN(29, "GPIO_29"),
+	PINCTRL_PIN(30, "GPIO_30"),
+	PINCTRL_PIN(31, "GPIO_31"),
+	PINCTRL_PIN(32, "GPIO_32"),
+	PINCTRL_PIN(33, "GPIO_33"),
+	PINCTRL_PIN(34, "GPIO_34"),
+	PINCTRL_PIN(35, "GPIO_35"),
+	PINCTRL_PIN(36, "GPIO_36"),
+	PINCTRL_PIN(37, "GPIO_37"),
+	PINCTRL_PIN(38, "GPIO_38"),
+	PINCTRL_PIN(39, "GPIO_39"),
+	PINCTRL_PIN(40, "GPIO_40"),
+	PINCTRL_PIN(41, "GPIO_41"),
+	PINCTRL_PIN(42, "GPIO_42"),
+	PINCTRL_PIN(43, "GPIO_43"),
+	PINCTRL_PIN(44, "GPIO_44"),
+	PINCTRL_PIN(45, "GPIO_45"),
+	PINCTRL_PIN(46, "GPIO_46"),
+	PINCTRL_PIN(47, "GPIO_47"),
+	PINCTRL_PIN(48, "GPIO_48"),
+	PINCTRL_PIN(49, "GPIO_49"),
+	PINCTRL_PIN(50, "GPIO_50"),
+	PINCTRL_PIN(51, "GPIO_51"),
+	PINCTRL_PIN(52, "GPIO_52"),
+	PINCTRL_PIN(53, "GPIO_53"),
+	PINCTRL_PIN(54, "GPIO_54"),
+	PINCTRL_PIN(55, "GPIO_55"),
+	PINCTRL_PIN(56, "GPIO_56"),
+	PINCTRL_PIN(57, "GPIO_57"),
+	PINCTRL_PIN(58, "GPIO_58"),
+	PINCTRL_PIN(59, "GPIO_59"),
+	PINCTRL_PIN(60, "GPIO_60"),
+	PINCTRL_PIN(61, "GPIO_61"),
+	PINCTRL_PIN(62, "GPIO_62"),
+	PINCTRL_PIN(63, "GPIO_63"),
+	PINCTRL_PIN(64, "GPIO_64"),
+	PINCTRL_PIN(65, "GPIO_65"),
+	PINCTRL_PIN(66, "GPIO_66"),
+	PINCTRL_PIN(67, "GPIO_67"),
+	PINCTRL_PIN(68, "GPIO_68"),
+	PINCTRL_PIN(69, "GPIO_69"),
+	PINCTRL_PIN(70, "GPIO_70"),
+	PINCTRL_PIN(71, "GPIO_71"),
+	PINCTRL_PIN(72, "GPIO_72"),
+	PINCTRL_PIN(73, "GPIO_73"),
+	PINCTRL_PIN(74, "GPIO_74"),
+	PINCTRL_PIN(75, "GPIO_75"),
+	PINCTRL_PIN(76, "GPIO_76"),
+	PINCTRL_PIN(77, "GPIO_77"),
+	PINCTRL_PIN(78, "GPIO_78"),
+	PINCTRL_PIN(79, "GPIO_79"),
+	PINCTRL_PIN(80, "GPIO_80"),
+	PINCTRL_PIN(81, "GPIO_81"),
+	PINCTRL_PIN(82, "GPIO_82"),
+	PINCTRL_PIN(83, "GPIO_83"),
+	PINCTRL_PIN(84, "GPIO_84"),
+	PINCTRL_PIN(85, "GPIO_85"),
+	PINCTRL_PIN(86, "GPIO_86"),
+	PINCTRL_PIN(87, "GPIO_87"),
+	PINCTRL_PIN(88, "GPIO_88"),
+	PINCTRL_PIN(89, "GPIO_89"),
+	PINCTRL_PIN(90, "GPIO_90"),
+	PINCTRL_PIN(91, "GPIO_91"),
+	PINCTRL_PIN(92, "GPIO_92"),
+	PINCTRL_PIN(93, "GPIO_93"),
+	PINCTRL_PIN(94, "GPIO_94"),
+	PINCTRL_PIN(95, "GPIO_95"),
+	PINCTRL_PIN(96, "GPIO_96"),
+	PINCTRL_PIN(97, "GPIO_97"),
+	PINCTRL_PIN(98, "GPIO_98"),
+	PINCTRL_PIN(99, "GPIO_99"),
+	PINCTRL_PIN(100, "GPIO_100"),
+	PINCTRL_PIN(101, "GPIO_101"),
+	PINCTRL_PIN(102, "GPIO_102"),
+	PINCTRL_PIN(103, "GPIO_103"),
+	PINCTRL_PIN(104, "GPIO_104"),
+	PINCTRL_PIN(105, "GPIO_105"),
+	PINCTRL_PIN(106, "GPIO_106"),
+	PINCTRL_PIN(107, "GPIO_107"),
+	PINCTRL_PIN(108, "GPIO_108"),
+	PINCTRL_PIN(109, "GPIO_109"),
+	PINCTRL_PIN(110, "GPIO_110"),
+	PINCTRL_PIN(111, "GPIO_111"),
+	PINCTRL_PIN(112, "GPIO_112"),
+	PINCTRL_PIN(113, "UFS_RESET"),
+	PINCTRL_PIN(114, "SDC1_RCLK"),
+	PINCTRL_PIN(115, "SDC1_CLK"),
+	PINCTRL_PIN(116, "SDC1_CMD"),
+	PINCTRL_PIN(117, "SDC1_DATA"),
+	PINCTRL_PIN(118, "SDC2_CLK"),
+	PINCTRL_PIN(119, "SDC2_CMD"),
+	PINCTRL_PIN(120, "SDC2_DATA"),
+};
+
+#define DECLARE_MSM_GPIO_PINS(pin) \
+	static const unsigned int gpio##pin##_pins[] = { pin }
+DECLARE_MSM_GPIO_PINS(0);
+DECLARE_MSM_GPIO_PINS(1);
+DECLARE_MSM_GPIO_PINS(2);
+DECLARE_MSM_GPIO_PINS(3);
+DECLARE_MSM_GPIO_PINS(4);
+DECLARE_MSM_GPIO_PINS(5);
+DECLARE_MSM_GPIO_PINS(6);
+DECLARE_MSM_GPIO_PINS(7);
+DECLARE_MSM_GPIO_PINS(8);
+DECLARE_MSM_GPIO_PINS(9);
+DECLARE_MSM_GPIO_PINS(10);
+DECLARE_MSM_GPIO_PINS(11);
+DECLARE_MSM_GPIO_PINS(12);
+DECLARE_MSM_GPIO_PINS(13);
+DECLARE_MSM_GPIO_PINS(14);
+DECLARE_MSM_GPIO_PINS(15);
+DECLARE_MSM_GPIO_PINS(16);
+DECLARE_MSM_GPIO_PINS(17);
+DECLARE_MSM_GPIO_PINS(18);
+DECLARE_MSM_GPIO_PINS(19);
+DECLARE_MSM_GPIO_PINS(20);
+DECLARE_MSM_GPIO_PINS(21);
+DECLARE_MSM_GPIO_PINS(22);
+DECLARE_MSM_GPIO_PINS(23);
+DECLARE_MSM_GPIO_PINS(24);
+DECLARE_MSM_GPIO_PINS(25);
+DECLARE_MSM_GPIO_PINS(26);
+DECLARE_MSM_GPIO_PINS(27);
+DECLARE_MSM_GPIO_PINS(28);
+DECLARE_MSM_GPIO_PINS(29);
+DECLARE_MSM_GPIO_PINS(30);
+DECLARE_MSM_GPIO_PINS(31);
+DECLARE_MSM_GPIO_PINS(32);
+DECLARE_MSM_GPIO_PINS(33);
+DECLARE_MSM_GPIO_PINS(34);
+DECLARE_MSM_GPIO_PINS(35);
+DECLARE_MSM_GPIO_PINS(36);
+DECLARE_MSM_GPIO_PINS(37);
+DECLARE_MSM_GPIO_PINS(38);
+DECLARE_MSM_GPIO_PINS(39);
+DECLARE_MSM_GPIO_PINS(40);
+DECLARE_MSM_GPIO_PINS(41);
+DECLARE_MSM_GPIO_PINS(42);
+DECLARE_MSM_GPIO_PINS(43);
+DECLARE_MSM_GPIO_PINS(44);
+DECLARE_MSM_GPIO_PINS(45);
+DECLARE_MSM_GPIO_PINS(46);
+DECLARE_MSM_GPIO_PINS(47);
+DECLARE_MSM_GPIO_PINS(48);
+DECLARE_MSM_GPIO_PINS(49);
+DECLARE_MSM_GPIO_PINS(50);
+DECLARE_MSM_GPIO_PINS(51);
+DECLARE_MSM_GPIO_PINS(52);
+DECLARE_MSM_GPIO_PINS(53);
+DECLARE_MSM_GPIO_PINS(54);
+DECLARE_MSM_GPIO_PINS(55);
+DECLARE_MSM_GPIO_PINS(56);
+DECLARE_MSM_GPIO_PINS(57);
+DECLARE_MSM_GPIO_PINS(58);
+DECLARE_MSM_GPIO_PINS(59);
+DECLARE_MSM_GPIO_PINS(60);
+DECLARE_MSM_GPIO_PINS(61);
+DECLARE_MSM_GPIO_PINS(62);
+DECLARE_MSM_GPIO_PINS(63);
+DECLARE_MSM_GPIO_PINS(64);
+DECLARE_MSM_GPIO_PINS(65);
+DECLARE_MSM_GPIO_PINS(66);
+DECLARE_MSM_GPIO_PINS(67);
+DECLARE_MSM_GPIO_PINS(68);
+DECLARE_MSM_GPIO_PINS(69);
+DECLARE_MSM_GPIO_PINS(70);
+DECLARE_MSM_GPIO_PINS(71);
+DECLARE_MSM_GPIO_PINS(72);
+DECLARE_MSM_GPIO_PINS(73);
+DECLARE_MSM_GPIO_PINS(74);
+DECLARE_MSM_GPIO_PINS(75);
+DECLARE_MSM_GPIO_PINS(76);
+DECLARE_MSM_GPIO_PINS(77);
+DECLARE_MSM_GPIO_PINS(78);
+DECLARE_MSM_GPIO_PINS(79);
+DECLARE_MSM_GPIO_PINS(80);
+DECLARE_MSM_GPIO_PINS(81);
+DECLARE_MSM_GPIO_PINS(82);
+DECLARE_MSM_GPIO_PINS(83);
+DECLARE_MSM_GPIO_PINS(84);
+DECLARE_MSM_GPIO_PINS(85);
+DECLARE_MSM_GPIO_PINS(86);
+DECLARE_MSM_GPIO_PINS(87);
+DECLARE_MSM_GPIO_PINS(88);
+DECLARE_MSM_GPIO_PINS(89);
+DECLARE_MSM_GPIO_PINS(90);
+DECLARE_MSM_GPIO_PINS(91);
+DECLARE_MSM_GPIO_PINS(92);
+DECLARE_MSM_GPIO_PINS(93);
+DECLARE_MSM_GPIO_PINS(94);
+DECLARE_MSM_GPIO_PINS(95);
+DECLARE_MSM_GPIO_PINS(96);
+DECLARE_MSM_GPIO_PINS(97);
+DECLARE_MSM_GPIO_PINS(98);
+DECLARE_MSM_GPIO_PINS(99);
+DECLARE_MSM_GPIO_PINS(100);
+DECLARE_MSM_GPIO_PINS(101);
+DECLARE_MSM_GPIO_PINS(102);
+DECLARE_MSM_GPIO_PINS(103);
+DECLARE_MSM_GPIO_PINS(104);
+DECLARE_MSM_GPIO_PINS(105);
+DECLARE_MSM_GPIO_PINS(106);
+DECLARE_MSM_GPIO_PINS(107);
+DECLARE_MSM_GPIO_PINS(108);
+DECLARE_MSM_GPIO_PINS(109);
+DECLARE_MSM_GPIO_PINS(110);
+DECLARE_MSM_GPIO_PINS(111);
+DECLARE_MSM_GPIO_PINS(112);
+
+static const unsigned int ufs_reset_pins[] = { 113 };
+static const unsigned int sdc1_rclk_pins[] = { 114 };
+static const unsigned int sdc1_clk_pins[] = { 115 };
+static const unsigned int sdc1_cmd_pins[] = { 116 };
+static const unsigned int sdc1_data_pins[] = { 117 };
+static const unsigned int sdc2_clk_pins[] = { 118 };
+static const unsigned int sdc2_cmd_pins[] = { 119 };
+static const unsigned int sdc2_data_pins[] = { 120 };
+
+enum sm6115_functions {
+	msm_mux_adsp_ext,
+	msm_mux_agera_pll,
+	msm_mux_atest,
+	msm_mux_cam_mclk,
+	msm_mux_cci_async,
+	msm_mux_cci_i2c,
+	msm_mux_cci_timer,
+	msm_mux_cri_trng,
+	msm_mux_dac_calib,
+	msm_mux_dbg_out,
+	msm_mux_ddr_bist,
+	msm_mux_ddr_pxi0,
+	msm_mux_ddr_pxi1,
+	msm_mux_ddr_pxi2,
+	msm_mux_ddr_pxi3,
+	msm_mux_gcc_gp1,
+	msm_mux_gcc_gp2,
+	msm_mux_gcc_gp3,
+	msm_mux_gpio,
+	msm_mux_gp_pdm0,
+	msm_mux_gp_pdm1,
+	msm_mux_gp_pdm2,
+	msm_mux_gsm0_tx,
+	msm_mux_gsm1_tx,
+	msm_mux_jitter_bist,
+	msm_mux_mdp_vsync,
+	msm_mux_mdp_vsync_out_0,
+	msm_mux_mdp_vsync_out_1,
+	msm_mux_mpm_pwr,
+	msm_mux_mss_lte,
+	msm_mux_m_voc,
+	msm_mux_nav_gpio,
+	msm_mux_pa_indicator,
+	msm_mux_pbs,
+	msm_mux_pbs_out,
+	msm_mux_phase_flag,
+	msm_mux_pll_bist,
+	msm_mux_pll_bypassnl,
+	msm_mux_pll_reset,
+	msm_mux_prng_rosc,
+	msm_mux_qdss_cti,
+	msm_mux_qdss_gpio,
+	msm_mux_qup0,
+	msm_mux_qup1,
+	msm_mux_qup2,
+	msm_mux_qup3,
+	msm_mux_qup4,
+	msm_mux_qup5,
+	msm_mux_sdc1_tb,
+	msm_mux_sdc2_tb,
+	msm_mux_sd_write,
+	msm_mux_ssbi_wtr1,
+	msm_mux_tgu,
+	msm_mux_tsense_pwm,
+	msm_mux_uim1_clk,
+	msm_mux_uim1_data,
+	msm_mux_uim1_present,
+	msm_mux_uim1_reset,
+	msm_mux_uim2_clk,
+	msm_mux_uim2_data,
+	msm_mux_uim2_present,
+	msm_mux_uim2_reset,
+	msm_mux_usb_phy,
+	msm_mux_vfr_1,
+	msm_mux_vsense_trigger,
+	msm_mux_wlan1_adc0,
+	msm_mux_wlan1_adc1,
+	msm_mux__,
+};
+
+static const char * const qup0_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio82", "gpio86",
+};
+static const char * const gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7",
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
+	"gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21",
+	"gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", "gpio28",
+	"gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
+	"gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio42",
+	"gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio48", "gpio49",
+	"gpio50", "gpio51", "gpio52", "gpio53", "gpio54", "gpio55", "gpio56",
+	"gpio57", "gpio58", "gpio59", "gpio60", "gpio61", "gpio62", "gpio63",
+	"gpio64", "gpio65", "gpio66", "gpio67", "gpio68", "gpio69", "gpio70",
+	"gpio71", "gpio72", "gpio73", "gpio74", "gpio75", "gpio76", "gpio77",
+	"gpio78", "gpio79", "gpio80", "gpio81", "gpio82", "gpio83", "gpio84",
+	"gpio85", "gpio86", "gpio87", "gpio88", "gpio89", "gpio90", "gpio91",
+	"gpio92", "gpio93", "gpio94", "gpio95", "gpio96", "gpio97", "gpio98",
+	"gpio99", "gpio100", "gpio101", "gpio102", "gpio103", "gpio104",
+	"gpio105", "gpio106", "gpio107", "gpio108", "gpio109", "gpio110",
+	"gpio111", "gpio112",
+};
+static const char * const ddr_bist_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+static const char * const phase_flag_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6",
+	"gpio14", "gpio15", "gpio16", "gpio17", "gpio22", "gpio23", "gpio24",
+	"gpio25", "gpio26", "gpio29", "gpio30", "gpio31", "gpio32", "gpio33",
+	"gpio35", "gpio36", "gpio43", "gpio44", "gpio45", "gpio63", "gpio64",
+	"gpio102", "gpio103", "gpio104", "gpio105",
+};
+static const char * const qdss_gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio8", "gpio9", "gpio10",
+	"gpio11", "gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19",
+	"gpio20", "gpio21", "gpio22", "gpio23", "gpio24", "gpio25", "gpio26",
+	"gpio47", "gpio48", "gpio69", "gpio70", "gpio87", "gpio90", "gpio91",
+	"gpio94", "gpio95", "gpio104", "gpio105", "gpio106", "gpio107",
+	"gpio109", "gpio110",
+};
+static const char * const atest_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6",
+	"gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio29", "gpio30",
+	"gpio31", "gpio32", "gpio33", "gpio86", "gpio87", "gpio88", "gpio89",
+	"gpio100", "gpio101",
+};
+static const char * const mpm_pwr_groups[] = {
+	"gpio1",
+};
+static const char * const m_voc_groups[] = {
+	"gpio0",
+};
+static const char * const dac_calib_groups[] = {
+	"gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio14", "gpio15",
+	"gpio16", "gpio17", "gpio22", "gpio23", "gpio24", "gpio25", "gpio26",
+	"gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio80", "gpio81",
+	"gpio82", "gpio102", "gpio103", "gpio104", "gpio105"
+};
+static const char * const qup1_groups[] = {
+	"gpio4", "gpio5", "gpio69", "gpio70",
+};
+static const char * const cri_trng_groups[] = {
+	"gpio4", "gpio5", "gpio18",
+};
+static const char * const qup2_groups[] = {
+	"gpio6", "gpio7", "gpio71", "gpio80",
+};
+static const char * const qup3_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11",
+};
+static const char * const pbs_out_groups[] = {
+	"gpio8", "gpio9", "gpio52",
+};
+static const char * const pll_bist_groups[] = {
+	"gpio8", "gpio9",
+};
+static const char * const tsense_pwm_groups[] = {
+	"gpio8",
+};
+static const char * const agera_pll_groups[] = {
+	"gpio10", "gpio11",
+};
+static const char * const pbs_groups[] = {
+	"gpio10", "gpio11", "gpio18", "gpio19", "gpio20", "gpio21", "gpio22",
+	"gpio23", "gpio24", "gpio25", "gpio26", "gpio47", "gpio48", "gpio87",
+	"gpio90", "gpio91",
+};
+static const char * const qup4_groups[] = {
+	"gpio12", "gpio13", "gpio96", "gpio97",
+};
+static const char * const tgu_groups[] = {
+	"gpio12", "gpio13", "gpio14", "gpio15",
+};
+static const char * const qup5_groups[] = {
+	"gpio14", "gpio15", "gpio16", "gpio17",
+};
+static const char * const sdc2_tb_groups[] = {
+	"gpio18",
+};
+static const char * const sdc1_tb_groups[] = {
+	"gpio19",
+};
+static const char * const cam_mclk_groups[] = {
+	"gpio20", "gpio21", "gpio27", "gpio28",
+};
+static const char * const adsp_ext_groups[] = {
+	"gpio21",
+};
+static const char * const cci_i2c_groups[] = {
+	"gpio22", "gpio23", "gpio29", "gpio30",
+};
+static const char * const prng_rosc_groups[] = {
+	"gpio22", "gpio23",
+};
+static const char * const cci_timer_groups[] = {
+	"gpio24", "gpio25", "gpio28", "gpio32",
+};
+static const char * const gcc_gp1_groups[] = {
+	"gpio24", "gpio86",
+};
+static const char * const cci_async_groups[] = {
+	"gpio25",
+};
+static const char * const vsense_trigger_groups[] = {
+	"gpio26",
+};
+static const char * const qdss_cti_groups[] = {
+	"gpio27", "gpio28", "gpio72", "gpio73", "gpio96", "gpio97",
+};
+static const char * const gp_pdm0_groups[] = {
+	"gpio31", "gpio95",
+};
+static const char * const gp_pdm1_groups[] = {
+	"gpio32", "gpio96",
+};
+static const char * const gp_pdm2_groups[] = {
+	"gpio33", "gpio97",
+};
+static const char * const nav_gpio_groups[] = {
+	"gpio42", "gpio47", "gpio52", "gpio95", "gpio96", "gpio97", "gpio106",
+	"gpio107", "gpio108",
+};
+static const char * const vfr_1_groups[] = {
+	"gpio48",
+};
+static const char * const pa_indicator_groups[] = {
+	"gpio49",
+};
+static const char * const gsm1_tx_groups[] = {
+	"gpio53",
+};
+static const char * const ssbi_wtr1_groups[] = {
+	"gpio59", "gpio60",
+};
+static const char * const pll_bypassnl_groups[] = {
+	"gpio62",
+};
+static const char * const pll_reset_groups[] = {
+	"gpio63",
+};
+static const char * const ddr_pxi0_groups[] = {
+	"gpio63", "gpio64",
+};
+static const char * const gsm0_tx_groups[] = {
+	"gpio64",
+};
+static const char * const gcc_gp2_groups[] = {
+	"gpio69", "gpio107",
+};
+static const char * const ddr_pxi1_groups[] = {
+	"gpio69", "gpio70",
+};
+static const char * const gcc_gp3_groups[] = {
+	"gpio70", "gpio106",
+};
+static const char * const dbg_out_groups[] = {
+	"gpio71",
+};
+static const char * const uim2_data_groups[] = {
+	"gpio72",
+};
+static const char * const uim2_clk_groups[] = {
+	"gpio73",
+};
+static const char * const uim2_reset_groups[] = {
+	"gpio74",
+};
+static const char * const uim2_present_groups[] = {
+	"gpio75",
+};
+static const char * const uim1_data_groups[] = {
+	"gpio76",
+};
+static const char * const uim1_clk_groups[] = {
+	"gpio77",
+};
+static const char * const uim1_reset_groups[] = {
+	"gpio78",
+};
+static const char * const uim1_present_groups[] = {
+	"gpio79",
+};
+static const char * const mdp_vsync_groups[] = {
+	"gpio81", "gpio96", "gpio97",
+};
+static const char * const mdp_vsync_out_0_groups[] = {
+	"gpio81",
+};
+static const char * const mdp_vsync_out_1_groups[] = {
+	"gpio81",
+};
+static const char * const usb_phy_groups[] = {
+	"gpio89",
+};
+static const char * const mss_lte_groups[] = {
+	"gpio90", "gpio91",
+};
+static const char * const wlan1_adc0_groups[] = {
+	"gpio94",
+};
+static const char * const wlan1_adc1_groups[] = {
+	"gpio95",
+};
+static const char * const sd_write_groups[] = {
+	"gpio96",
+};
+static const char * const jitter_bist_groups[] = {
+	"gpio96", "gpio97",
+};
+static const char * const ddr_pxi2_groups[] = {
+	"gpio102", "gpio103",
+};
+static const char * const ddr_pxi3_groups[] = {
+	"gpio104", "gpio105",
+};
+
+static const struct msm_function sm6115_functions[] = {
+	FUNCTION(adsp_ext),
+	FUNCTION(agera_pll),
+	FUNCTION(atest),
+	FUNCTION(cam_mclk),
+	FUNCTION(cci_async),
+	FUNCTION(cci_i2c),
+	FUNCTION(cci_timer),
+	FUNCTION(cri_trng),
+	FUNCTION(dac_calib),
+	FUNCTION(dbg_out),
+	FUNCTION(ddr_bist),
+	FUNCTION(ddr_pxi0),
+	FUNCTION(ddr_pxi1),
+	FUNCTION(ddr_pxi2),
+	FUNCTION(ddr_pxi3),
+	FUNCTION(gcc_gp1),
+	FUNCTION(gcc_gp2),
+	FUNCTION(gcc_gp3),
+	FUNCTION(gpio),
+	FUNCTION(gp_pdm0),
+	FUNCTION(gp_pdm1),
+	FUNCTION(gp_pdm2),
+	FUNCTION(gsm0_tx),
+	FUNCTION(gsm1_tx),
+	FUNCTION(jitter_bist),
+	FUNCTION(mdp_vsync),
+	FUNCTION(mdp_vsync_out_0),
+	FUNCTION(mdp_vsync_out_1),
+	FUNCTION(mpm_pwr),
+	FUNCTION(mss_lte),
+	FUNCTION(m_voc),
+	FUNCTION(nav_gpio),
+	FUNCTION(pa_indicator),
+	FUNCTION(pbs),
+	FUNCTION(pbs_out),
+	FUNCTION(phase_flag),
+	FUNCTION(pll_bist),
+	FUNCTION(pll_bypassnl),
+	FUNCTION(pll_reset),
+	FUNCTION(prng_rosc),
+	FUNCTION(qdss_cti),
+	FUNCTION(qdss_gpio),
+	FUNCTION(qup0),
+	FUNCTION(qup1),
+	FUNCTION(qup2),
+	FUNCTION(qup3),
+	FUNCTION(qup4),
+	FUNCTION(qup5),
+	FUNCTION(sdc1_tb),
+	FUNCTION(sdc2_tb),
+	FUNCTION(sd_write),
+	FUNCTION(ssbi_wtr1),
+	FUNCTION(tgu),
+	FUNCTION(tsense_pwm),
+	FUNCTION(uim1_clk),
+	FUNCTION(uim1_data),
+	FUNCTION(uim1_present),
+	FUNCTION(uim1_reset),
+	FUNCTION(uim2_clk),
+	FUNCTION(uim2_data),
+	FUNCTION(uim2_present),
+	FUNCTION(uim2_reset),
+	FUNCTION(usb_phy),
+	FUNCTION(vfr_1),
+	FUNCTION(vsense_trigger),
+	FUNCTION(wlan1_adc0),
+	FUNCTION(wlan1_adc1),
+};
+
+/* Every pin is maintained as a single group, and missing or non-existing pin
+ * would be maintained as dummy group to synchronize pin group index with
+ * pin descriptor registered with pinctrl core.
+ * Clients would not be able to request these dummy pin groups.
+ */
+static const struct msm_pingroup sm6115_groups[] = {
+	[0] = PINGROUP(0, WEST, qup0, m_voc, ddr_bist, _, phase_flag, qdss_gpio, atest, _, _),
+	[1] = PINGROUP(1, WEST, qup0, mpm_pwr, ddr_bist, _, phase_flag, qdss_gpio, atest, _, _),
+	[2] = PINGROUP(2, WEST, qup0, ddr_bist, _, phase_flag, qdss_gpio, dac_calib, atest, _, _),
+	[3] = PINGROUP(3, WEST, qup0, ddr_bist, _, phase_flag, qdss_gpio, dac_calib, atest, _, _),
+	[4] = PINGROUP(4, WEST, qup1, cri_trng, _, phase_flag, dac_calib, atest, _, _, _),
+	[5] = PINGROUP(5, WEST, qup1, cri_trng, _, phase_flag, dac_calib, atest, _, _, _),
+	[6] = PINGROUP(6, WEST, qup2, _, phase_flag, dac_calib, atest, _, _, _, _),
+	[7] = PINGROUP(7, WEST, qup2, _, _, _, _, _, _, _, _),
+	[8] = PINGROUP(8, EAST, qup3, pbs_out, pll_bist, _, qdss_gpio, _, tsense_pwm, _, _),
+	[9] = PINGROUP(9, EAST, qup3, pbs_out, pll_bist, _, qdss_gpio, _, _, _, _),
+	[10] = PINGROUP(10, EAST, qup3, agera_pll, _, pbs, qdss_gpio, _, _, _, _),
+	[11] = PINGROUP(11, EAST, qup3, agera_pll, _, pbs, qdss_gpio, _, _, _, _),
+	[12] = PINGROUP(12, WEST, qup4, tgu, _, _, _, _, _, _, _),
+	[13] = PINGROUP(13, WEST, qup4, tgu, _, _, _, _, _, _, _),
+	[14] = PINGROUP(14, WEST, qup5, tgu, _, phase_flag, qdss_gpio, dac_calib, _, _, _),
+	[15] = PINGROUP(15, WEST, qup5, tgu, _, phase_flag, qdss_gpio, dac_calib, _, _, _),
+	[16] = PINGROUP(16, WEST, qup5, _, phase_flag, qdss_gpio, dac_calib, _, _, _, _),
+	[17] = PINGROUP(17, WEST, qup5, _, phase_flag, qdss_gpio, dac_calib, _, _, _, _),
+	[18] = PINGROUP(18, EAST, sdc2_tb, cri_trng, pbs, qdss_gpio, _, _, _, _, _),
+	[19] = PINGROUP(19, EAST, sdc1_tb, pbs, qdss_gpio, _, _, _, _, _, _),
+	[20] = PINGROUP(20, EAST, cam_mclk, pbs, qdss_gpio, _, _, _, _, _, _),
+	[21] = PINGROUP(21, EAST, cam_mclk, adsp_ext, pbs, qdss_gpio, _, _, _, _, _),
+	[22] = PINGROUP(22, EAST, cci_i2c, prng_rosc, _, pbs, phase_flag, qdss_gpio, dac_calib, atest, _),
+	[23] = PINGROUP(23, EAST, cci_i2c, prng_rosc, _, pbs, phase_flag, qdss_gpio, dac_calib, atest, _),
+	[24] = PINGROUP(24, EAST, cci_timer, gcc_gp1, _, pbs, phase_flag, qdss_gpio, dac_calib, atest, _),
+	[25] = PINGROUP(25, EAST, cci_async, cci_timer, _, pbs, phase_flag, qdss_gpio, dac_calib, atest, _),
+	[26] = PINGROUP(26, EAST, _, pbs, phase_flag, qdss_gpio, dac_calib, atest, vsense_trigger, _, _),
+	[27] = PINGROUP(27, EAST, cam_mclk, qdss_cti, _, _, _, _, _, _, _),
+	[28] = PINGROUP(28, EAST, cam_mclk, cci_timer, qdss_cti, _, _, _, _, _, _),
+	[29] = PINGROUP(29, EAST, cci_i2c, _, phase_flag, dac_calib, atest, _, _, _, _),
+	[30] = PINGROUP(30, EAST, cci_i2c, _, phase_flag, dac_calib, atest, _, _, _, _),
+	[31] = PINGROUP(31, EAST, gp_pdm0, _, phase_flag, dac_calib, atest, _, _, _, _),
+	[32] = PINGROUP(32, EAST, cci_timer, gp_pdm1, _, phase_flag, dac_calib, atest, _, _, _),
+	[33] = PINGROUP(33, EAST, gp_pdm2, _, phase_flag, dac_calib, atest, _, _, _, _),
+	[34] = PINGROUP(34, EAST, _, _, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, EAST, _, phase_flag, _, _, _, _, _, _, _),
+	[36] = PINGROUP(36, EAST, _, phase_flag, _, _, _, _, _, _, _),
+	[37] = PINGROUP(37, EAST, _, _, _, _, _, _, _, _, _),
+	[38] = PINGROUP(38, EAST, _, _, _, _, _, _, _, _, _),
+	[39] = PINGROUP(39, EAST, _, _, _, _, _, _, _, _, _),
+	[40] = PINGROUP(40, EAST, _, _, _, _, _, _, _, _, _),
+	[41] = PINGROUP(41, EAST, _, _, _, _, _, _, _, _, _),
+	[42] = PINGROUP(42, EAST, _, nav_gpio, _, _, _, _, _, _, _),
+	[43] = PINGROUP(43, EAST, _, _, phase_flag, _, _, _, _, _, _),
+	[44] = PINGROUP(44, EAST, _, _, phase_flag, _, _, _, _, _, _),
+	[45] = PINGROUP(45, EAST, _, _, phase_flag, _, _, _, _, _, _),
+	[46] = PINGROUP(46, EAST, _, _, _, _, _, _, _, _, _),
+	[47] = PINGROUP(47, EAST, _, nav_gpio, pbs, qdss_gpio, _, _, _, _, _),
+	[48] = PINGROUP(48, EAST, _, vfr_1, _, pbs, qdss_gpio, _, _, _, _),
+	[49] = PINGROUP(49, EAST, _, pa_indicator, _, _, _, _, _, _, _),
+	[50] = PINGROUP(50, EAST, _, _, _, _, _, _, _, _, _),
+	[51] = PINGROUP(51, EAST, _, _, _, _, _, _, _, _, _),
+	[52] = PINGROUP(52, EAST, _, nav_gpio, pbs_out, _, _, _, _, _, _),
+	[53] = PINGROUP(53, EAST, _, gsm1_tx, _, _, _, _, _, _, _),
+	[54] = PINGROUP(54, EAST, _, _, _, _, _, _, _, _, _),
+	[55] = PINGROUP(55, EAST, _, _, _, _, _, _, _, _, _),
+	[56] = PINGROUP(56, EAST, _, _, _, _, _, _, _, _, _),
+	[57] = PINGROUP(57, EAST, _, _, _, _, _, _, _, _, _),
+	[58] = PINGROUP(58, EAST, _, _, _, _, _, _, _, _, _),
+	[59] = PINGROUP(59, EAST, _, ssbi_wtr1, _, _, _, _, _, _, _),
+	[60] = PINGROUP(60, EAST, _, ssbi_wtr1, _, _, _, _, _, _, _),
+	[61] = PINGROUP(61, EAST, _, _, _, _, _, _, _, _, _),
+	[62] = PINGROUP(62, EAST, _, pll_bypassnl, _, _, _, _, _, _, _),
+	[63] = PINGROUP(63, EAST, pll_reset, _, phase_flag, ddr_pxi0, _, _, _, _, _),
+	[64] = PINGROUP(64, EAST, gsm0_tx, _, phase_flag, ddr_pxi0, _, _, _, _, _),
+	[65] = PINGROUP(65, WEST, _, _, _, _, _, _, _, _, _),
+	[66] = PINGROUP(66, WEST, _, _, _, _, _, _, _, _, _),
+	[67] = PINGROUP(67, WEST, _, _, _, _, _, _, _, _, _),
+	[68] = PINGROUP(68, WEST, _, _, _, _, _, _, _, _, _),
+	[69] = PINGROUP(69, WEST, qup1, gcc_gp2, qdss_gpio, ddr_pxi1, _, _, _, _, _),
+	[70] = PINGROUP(70, WEST, qup1, gcc_gp3, qdss_gpio, ddr_pxi1, _, _, _, _, _),
+	[71] = PINGROUP(71, WEST, qup2, dbg_out, _, _, _, _, _, _, _),
+	[72] = PINGROUP(72, SOUTH, uim2_data, qdss_cti, _, _, _, _, _, _, _),
+	[73] = PINGROUP(73, SOUTH, uim2_clk, _, qdss_cti, _, _, _, _, _, _),
+	[74] = PINGROUP(74, SOUTH, uim2_reset, _, _, _, _, _, _, _, _),
+	[75] = PINGROUP(75, SOUTH, uim2_present, _, _, _, _, _, _, _, _),
+	[76] = PINGROUP(76, SOUTH, uim1_data, _, _, _, _, _, _, _, _),
+	[77] = PINGROUP(77, SOUTH, uim1_clk, _, _, _, _, _, _, _, _),
+	[78] = PINGROUP(78, SOUTH, uim1_reset, _, _, _, _, _, _, _, _),
+	[79] = PINGROUP(79, SOUTH, uim1_present, _, _, _, _, _, _, _, _),
+	[80] = PINGROUP(80, WEST, qup2, dac_calib, _, _, _, _, _, _, _),
+	[81] = PINGROUP(81, WEST, mdp_vsync_out_0, mdp_vsync_out_1, mdp_vsync, dac_calib, _, _, _, _, _),
+	[82] = PINGROUP(82, WEST, qup0, dac_calib, _, _, _, _, _, _, _),
+	[83] = PINGROUP(83, WEST, _, _, _, _, _, _, _, _, _),
+	[84] = PINGROUP(84, WEST, _, _, _, _, _, _, _, _, _),
+	[85] = PINGROUP(85, WEST, _, _, _, _, _, _, _, _, _),
+	[86] = PINGROUP(86, WEST, qup0, gcc_gp1, atest, _, _, _, _, _, _),
+	[87] = PINGROUP(87, EAST, pbs, qdss_gpio, _, _, _, _, _, _, _),
+	[88] = PINGROUP(88, EAST, _, _, _, _, _, _, _, _, _),
+	[89] = PINGROUP(89, WEST, usb_phy, atest, _, _, _, _, _, _, _),
+	[90] = PINGROUP(90, EAST, mss_lte, pbs, qdss_gpio, _, _, _, _, _, _),
+	[91] = PINGROUP(91, EAST, mss_lte, pbs, qdss_gpio, _, _, _, _, _, _),
+	[92] = PINGROUP(92, WEST, _, _, _, _, _, _, _, _, _),
+	[93] = PINGROUP(93, WEST, _, _, _, _, _, _, _, _, _),
+	[94] = PINGROUP(94, WEST, _, qdss_gpio, wlan1_adc0, _, _, _, _, _, _),
+	[95] = PINGROUP(95, WEST, nav_gpio, gp_pdm0, qdss_gpio, wlan1_adc1, _, _, _, _, _),
+	[96] = PINGROUP(96, WEST, qup4, nav_gpio, mdp_vsync, gp_pdm1, sd_write, jitter_bist, qdss_cti, qdss_cti, _),
+	[97] = PINGROUP(97, WEST, qup4, nav_gpio, mdp_vsync, gp_pdm2, jitter_bist, qdss_cti, qdss_cti, _, _),
+	[98] = PINGROUP(98, SOUTH, _, _, _, _, _, _, _, _, _),
+	[99] = PINGROUP(99, SOUTH, _, _, _, _, _, _, _, _, _),
+	[100] = PINGROUP(100, SOUTH, atest, _, _, _, _, _, _, _, _),
+	[101] = PINGROUP(101, SOUTH, atest, _, _, _, _, _, _, _, _),
+	[102] = PINGROUP(102, SOUTH, _, phase_flag, dac_calib, ddr_pxi2, _, _, _, _, _),
+	[103] = PINGROUP(103, SOUTH, _, phase_flag, dac_calib, ddr_pxi2, _, _, _, _, _),
+	[104] = PINGROUP(104, SOUTH, _, phase_flag, qdss_gpio, dac_calib, ddr_pxi3, _, _, _, _),
+	[105] = PINGROUP(105, SOUTH, _, phase_flag, qdss_gpio, dac_calib, ddr_pxi3, _, _, _, _),
+	[106] = PINGROUP(106, SOUTH, nav_gpio, gcc_gp3, qdss_gpio, _, _, _, _, _, _),
+	[107] = PINGROUP(107, SOUTH, nav_gpio, gcc_gp2, qdss_gpio, _, _, _, _, _, _),
+	[108] = PINGROUP(108, SOUTH, nav_gpio, _, _, _, _, _, _, _, _),
+	[109] = PINGROUP(109, SOUTH, _, qdss_gpio, _, _, _, _, _, _, _),
+	[110] = PINGROUP(110, SOUTH, _, qdss_gpio, _, _, _, _, _, _, _),
+	[111] = PINGROUP(111, SOUTH, _, _, _, _, _, _, _, _, _),
+	[112] = PINGROUP(112, SOUTH, _, _, _, _, _, _, _, _, _),
+	[113] = UFS_RESET(ufs_reset, 0x78000),
+	[114] = SDC_QDSD_PINGROUP(sdc1_rclk, WEST, 0x75000, 15, 0),
+	[115] = SDC_QDSD_PINGROUP(sdc1_clk, WEST, 0x75000, 13, 6),
+	[116] = SDC_QDSD_PINGROUP(sdc1_cmd, WEST, 0x75000, 11, 3),
+	[117] = SDC_QDSD_PINGROUP(sdc1_data, WEST, 0x75000, 9, 0),
+	[118] = SDC_QDSD_PINGROUP(sdc2_clk, SOUTH, 0x73000, 14, 6),
+	[119] = SDC_QDSD_PINGROUP(sdc2_cmd, SOUTH, 0x73000, 11, 3),
+	[120] = SDC_QDSD_PINGROUP(sdc2_data, SOUTH, 0x73000, 9, 0),
+};
+
+static const struct msm_pinctrl_soc_data sm6115_tlmm = {
+	.pins = sm6115_pins,
+	.npins = ARRAY_SIZE(sm6115_pins),
+	.functions = sm6115_functions,
+	.nfunctions = ARRAY_SIZE(sm6115_functions),
+	.groups = sm6115_groups,
+	.ngroups = ARRAY_SIZE(sm6115_groups),
+	.ngpios = 114,
+	.tiles = sm6115_tiles,
+	.ntiles = ARRAY_SIZE(sm6115_tiles),
+};
+
+static int sm6115_tlmm_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &sm6115_tlmm);
+}
+
+static const struct of_device_id sm6115_tlmm_of_match[] = {
+	{ .compatible = "qcom,sm4250-tlmm", },
+	{ .compatible = "qcom,sm6115-tlmm", },
+	{ }
+};
+
+static struct platform_driver sm6115_tlmm_driver = {
+	.driver = {
+		.name = "sm6115-tlmm",
+		.of_match_table = sm6115_tlmm_of_match,
+	},
+	.probe = sm6115_tlmm_probe,
+	.remove = msm_pinctrl_remove,
+};
+
+static int __init sm6115_tlmm_init(void)
+{
+	return platform_driver_register(&sm6115_tlmm_driver);
+}
+arch_initcall(sm6115_tlmm_init);
+
+static void __exit sm6115_tlmm_exit(void)
+{
+	platform_driver_unregister(&sm6115_tlmm_driver);
+}
+module_exit(sm6115_tlmm_exit);
+
+MODULE_DESCRIPTION("QTI sm6115 tlmm driver");
+MODULE_LICENSE("GPL v2");
+MODULE_DEVICE_TABLE(of, sm6115_tlmm_of_match);
-- 
2.32.0

