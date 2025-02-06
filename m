Return-Path: <linux-arm-msm+bounces-47014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA964A2A464
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 10:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB0A17A202B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 09:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD0E228C99;
	Thu,  6 Feb 2025 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nahpDvJW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DE226896
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834139; cv=none; b=YQ8l2lArOyW0hh6kR6BiPnGb1FVXmoh4YU3jYYj31TPhiSijwnVVno7gEMv0TN0H3ipof51bONQIQ0kOiKHTHAOt5hIrpHTswVXkuLL3ixCe/et5c7Lj/nGGs3PH+6aHmJiJSOHbi3YI7hrAkOe6QHFlFKRLVOsg89DCxaiiA5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834139; c=relaxed/simple;
	bh=jseS7Nk1Ii/UxIrGwD8OV8gqX2B/jXZ396qOdcUVBHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMqSS7A18TOItLaGK23YWs3KC2BrNpktIZJJTiIWEYneaE0bLBr+MMsvzNPXgZSdO0jswsRV+3PFPK6E3zMHFyA09Tm2nz2U5eQfT4tjtUBAFsAoDkXhtAG/vXCw6o0I8mQFTovPuZToWMQklUT3qwnTBtS1OlzfZaQgD15y79s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nahpDvJW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4363ae65100so7139205e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 01:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834135; x=1739438935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjjoDIh4JZy0lAfg9i8lSdTUZmTjTLvkgRh6FrnqCHA=;
        b=nahpDvJWgvWcA5US370e4CgWjx8DC/4AODXkM0n9xjLjK+P1+kz2uYeNAK97r7m2TM
         PS7n6e3ZZ+6ngGRf2ETy87w/EediHGasDvhZ+86LYQbfOOSp70i1GE0r7PcoZNcCnuP9
         Y0MulfRIeoN3hSApIAgqjmI6Zg20NNjW0AfBE3/ejmCZ+XFKT5IHTFUP0slwWatt/eZW
         az/g2VcIEdYYXLLtfDy8Fck0OqXEBvE5V6Q3Rh+Md8+E9yVbe70xk8L7LcmdgMedlqMV
         XoHo5pPSNLh4QtX9ly7udi4iW6K2OZrrzdLOFSD+kalxA7auucRCN8iIAkA5pS4VpObK
         GEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834135; x=1739438935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjjoDIh4JZy0lAfg9i8lSdTUZmTjTLvkgRh6FrnqCHA=;
        b=JMq5ql+MUOl7EDz4bLIpTzwvpZTuNt4w7yRKnkRIfZCDaVIeeWwPgFZFEwrri0s3FR
         hpaE6ie0IwdK/ifUqyiZQNML7gfUBvW2zsFib22u53tUFc07viwvTv0YvN8ucsOzUdIR
         TzM0Wu9FwEwNmS4PY29GJMTqdmPS7tGRbUp4Q8TP2Xr2lmPPx/4wJAU/APTtpxxGU1jo
         OmPXjVC6tqjjh1r38PO03FOqb/6SXTgwqwOWcV86eNZMCswjMlxo6k5C5j+KrcjknF1a
         1rRtiD1bMTmbE8EsRezn51S7gM9wudn3qX/fybz6NeHxTC4A+a8RzgcdMF+woiNk9qR5
         g2YA==
X-Forwarded-Encrypted: i=1; AJvYcCVWEV6esaT11KB0teu9zE+vVVPvP0PUsvie+41B6XIKfUIBJZiA/j7xBTrZB6cghz+1nnDKKpZSY5JVI5sM@vger.kernel.org
X-Gm-Message-State: AOJu0YzwDr1bP7n3Lw6nT2uV4rKStnjhTLhNrYZfb7OAkwbjAnaaYggN
	sbRM/46pZFG8JVCZttmToyjwc0rEzcvm4j99nC9mpEhZJE0zBF6OIkzLmquTVfA=
X-Gm-Gg: ASbGncuQXgdmrv6Xr8ZwUGLefVhU8pn2Re9GHutaM0Nq//rxs+vecjcT5xMyaDNt9QJ
	1CU6fhtAxUy5JJV+5+Ze6C5WdeNUy9xPFdhHUIHWcVVBEvV7vKzFJw+Ypp3I4WPnHEFRUAMObHb
	YKLjBMrR+/EhpLLOdoBKWr0GvRujcROcDZwuXZV2xLKCD+Dq9pgvxdaTZrCXMRwJm0MD6611qnh
	gew4dlnZ+jRqUmD7r2sxt3+kqf99NqVseMlvf+NhlvyojAZYWeMMyCoVl14pixZc25Tq4D0a2UH
	ZnMgrcdg/Aov7Os=
X-Google-Smtp-Source: AGHT+IG+RhQFGWyQ26MR1Wr9DDZaU1IR6vgyMJtwo0K/A3HrLnlRVvrjtMjYLw5UrjrUzF8mGk8mJg==
X-Received: by 2002:a05:600c:1c20:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-4390d42f854mr57629685e9.4.1738834134425;
        Thu, 06 Feb 2025 01:28:54 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae80dsm12827595e9.22.2025.02.06.01.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:28:53 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 06 Feb 2025 11:28:28 +0200
Subject: [PATCH v6 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-x1e80100-ps8830-v6-2-60b1e49cfa8d@linaro.org>
References: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
In-Reply-To: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14837; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=jseS7Nk1Ii/UxIrGwD8OV8gqX2B/jXZ396qOdcUVBHQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnpIDQow0U+Q8QuGnu/7eEYt58y+aL46xFiK1Hq
 MGEL4WHAgyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6SA0AAKCRAbX0TJAJUV
 Vm2FEADKsJU0zDHFvnXr9rSn32ElTsnxgHzBbuMnhJKlvu+aspJcNvbIWQUSiNJklh4dbD1BnZp
 VjGN4oCcGvRmEU1ftSeJ+H4dPVndlgihlCpkRfBdGCiHn5aHHKuYcwCCioElXOQxPKplPYpFeOP
 nSyPSc7TcO0PbXpYof4+HovR0xrBp5x8pJeFEy8DTduD+zavpNYT094N822edU4RB2HVMxmRDVR
 E0bPRCKxk4AKqz0D9gDjG0E0mpZwR1TUY6r9bz1ZVUIS/MijUR2cinZIBr7kADmd5V1BYBcmhUZ
 fE7IFXe5jVB1UY5XZl+qCGZr7tROByLnP6wCbofmVIPz0cYDgLpdum+M6svPLYtMcDa01gp+0TD
 cJc31CjPCmgdFnKKdVJR6D44yEH20Mu7pheLK7ccUNPKVvcEGysg5COFslx5zNXz7WuhfGAxm1c
 S8EQ7y7IpLP+ulZTox1IcfNHXN3sAcpz8o0m7yFEH+DPcuwZQbnnYC0Rb5VjvKQAUG8yjY4d/4F
 ZTr11JPOC4GqiVH2aYUKBPxS7SektzKc2ga8Ie63iC8NZhcZ2LAaq8jQpiYsq/CT0WaYkPYU+2v
 3vn7GYC2w/z34WwDRUK/KNjpoJR1bOlf9P3tPbehVjCohib4/p+y4xWUqDlxKzNbRVOL8Whbnoy
 v77H2QUgPtYaBeQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
controlled over I2C. It usually sits between a USB/DisplayPort PHY
and the Type-C connector, and provides orientation and altmode handling.

The boards that use this retimer are the ones featuring the Qualcomm
Snapdragon X Elite SoCs.

Add a driver with support for the following modes:
 - DisplayPort 4-lanes
 - DisplayPort 2-lanes + USB3
 - USB3

There is another variant of this retimer which is called PS8833. It seems
to be really similar to the PS8830, so future-proof this driver by
naming it ps883x.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/usb/typec/mux/Kconfig  |  10 +
 drivers/usb/typec/mux/Makefile |   1 +
 drivers/usb/typec/mux/ps883x.c | 437 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 448 insertions(+)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index 67381b4ef4f68f4a6e73f157365ee24d0ab7109a..6dd8f961b593261fde1d39b238b981966e463599 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -56,6 +56,16 @@ config TYPEC_MUX_NB7VPQ904M
 	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
 	  redriver chip found on some devices with a Type-C port.
 
+config TYPEC_MUX_PS883X
+	tristate "Parade PS883x Type-C retimer driver"
+	depends on I2C
+	depends on DRM || DRM=n
+	select DRM_AUX_BRIDGE if DRM_BRIDGE && OF
+	select REGMAP_I2C
+	help
+	  Say Y or M if your system has a Parade PS883x Type-C retimer chip
+	  found on some devices with a Type-C port.
+
 config TYPEC_MUX_PTN36502
 	tristate "NXP PTN36502 Type-C redriver driver"
 	depends on I2C
diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
index 60879446da9365183567d3374a2fb7b5171fb3d7..b4f599eb5053b8f20e9a41409b0a2d9a03d850b6 100644
--- a/drivers/usb/typec/mux/Makefile
+++ b/drivers/usb/typec/mux/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
 obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
 obj-$(CONFIG_TYPEC_MUX_IT5205)		+= it5205.o
 obj-$(CONFIG_TYPEC_MUX_NB7VPQ904M)	+= nb7vpq904m.o
+obj-$(CONFIG_TYPEC_MUX_PS883X)		+= ps883x.o
 obj-$(CONFIG_TYPEC_MUX_PTN36502)	+= ptn36502.o
 obj-$(CONFIG_TYPEC_MUX_TUSB1046)	+= tusb1046.o
 obj-$(CONFIG_TYPEC_MUX_WCD939X_USBSS)	+= wcd939x-usbss.o
diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
new file mode 100644
index 0000000000000000000000000000000000000000..10e407ab6b7f6ce3c6d4a61a2d6219eb1b9e85e8
--- /dev/null
+++ b/drivers/usb/typec/mux/ps883x.c
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Parade ps883x usb retimer driver
+ *
+ * Copyright (C) 2024 Linaro Ltd.
+ */
+
+#include <drm/bridge/aux-bridge.h>
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_retimer.h>
+
+#define REG_USB_PORT_CONN_STATUS_0		0x00
+
+#define CONN_STATUS_0_CONNECTION_PRESENT	BIT(0)
+#define CONN_STATUS_0_ORIENTATION_REVERSED	BIT(1)
+#define CONN_STATUS_0_USB_3_1_CONNECTED		BIT(5)
+
+#define REG_USB_PORT_CONN_STATUS_1		0x01
+
+#define CONN_STATUS_1_DP_CONNECTED		BIT(0)
+#define CONN_STATUS_1_DP_SINK_REQUESTED		BIT(1)
+#define CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D	BIT(2)
+#define CONN_STATUS_1_DP_HPD_LEVEL		BIT(7)
+
+#define REG_USB_PORT_CONN_STATUS_2		0x02
+
+struct ps883x_retimer {
+	struct i2c_client *client;
+	struct gpio_desc *reset_gpio;
+	struct regmap *regmap;
+	struct typec_switch_dev *sw;
+	struct typec_retimer *retimer;
+	struct clk *xo_clk;
+	struct regulator *vdd_supply;
+	struct regulator *vdd33_supply;
+	struct regulator *vdd33_cap_supply;
+	struct regulator *vddat_supply;
+	struct regulator *vddar_supply;
+	struct regulator *vddio_supply;
+
+	struct typec_switch *typec_switch;
+	struct typec_mux *typec_mux;
+
+	struct mutex lock; /* protect non-concurrent retimer & switch */
+
+	enum typec_orientation orientation;
+	unsigned long mode;
+	unsigned int svid;
+};
+
+static void ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
+			     int cfg1, int cfg2)
+{
+	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_0, cfg0);
+	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_1, cfg1);
+	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_2, cfg2);
+}
+
+static int ps883x_set(struct ps883x_retimer *retimer)
+{
+	int cfg0 = CONN_STATUS_0_CONNECTION_PRESENT;
+	int cfg1 = 0x00;
+	int cfg2 = 0x00;
+
+	if (retimer->orientation == TYPEC_ORIENTATION_NONE ||
+	    retimer->mode == TYPEC_STATE_SAFE) {
+		ps883x_configure(retimer, cfg0, cfg1, cfg2);
+		return 0;
+	}
+
+	if (retimer->mode != TYPEC_STATE_USB && retimer->svid != USB_TYPEC_DP_SID)
+		return -EINVAL;
+
+	if (retimer->orientation == TYPEC_ORIENTATION_REVERSE)
+		cfg0 |= CONN_STATUS_0_ORIENTATION_REVERSED;
+
+	switch (retimer->mode) {
+	case TYPEC_STATE_USB:
+		cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
+		break;
+
+	case TYPEC_DP_STATE_C:
+		cfg1 = CONN_STATUS_1_DP_CONNECTED |
+		       CONN_STATUS_1_DP_SINK_REQUESTED |
+		       CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D |
+		       CONN_STATUS_1_DP_HPD_LEVEL;
+		break;
+
+	case TYPEC_DP_STATE_D:
+		cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
+		cfg1 = CONN_STATUS_1_DP_CONNECTED |
+		       CONN_STATUS_1_DP_SINK_REQUESTED |
+		       CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D |
+		       CONN_STATUS_1_DP_HPD_LEVEL;
+		break;
+
+	case TYPEC_DP_STATE_E:
+		cfg1 = CONN_STATUS_1_DP_CONNECTED |
+		       CONN_STATUS_1_DP_HPD_LEVEL;
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	ps883x_configure(retimer, cfg0, cfg1, cfg2);
+
+	return 0;
+}
+
+static int ps883x_sw_set(struct typec_switch_dev *sw,
+			 enum typec_orientation orientation)
+{
+	struct ps883x_retimer *retimer = typec_switch_get_drvdata(sw);
+	int ret = 0;
+
+	ret = typec_switch_set(retimer->typec_switch, orientation);
+	if (ret)
+		return ret;
+
+	mutex_lock(&retimer->lock);
+
+	if (retimer->orientation != orientation) {
+		retimer->orientation = orientation;
+
+		ret = ps883x_set(retimer);
+	}
+
+	mutex_unlock(&retimer->lock);
+
+	return ret;
+}
+
+static int ps883x_retimer_set(struct typec_retimer *rtmr,
+			      struct typec_retimer_state *state)
+{
+	struct ps883x_retimer *retimer = typec_retimer_get_drvdata(rtmr);
+	struct typec_mux_state mux_state;
+	int ret = 0;
+
+	mutex_lock(&retimer->lock);
+
+	if (state->mode != retimer->mode) {
+		retimer->mode = state->mode;
+
+		if (state->alt)
+			retimer->svid = state->alt->svid;
+		else
+			retimer->svid = 0;
+
+		ret = ps883x_set(retimer);
+	}
+
+	mutex_unlock(&retimer->lock);
+
+	if (ret)
+		return ret;
+
+	mux_state.alt = state->alt;
+	mux_state.data = state->data;
+	mux_state.mode = state->mode;
+
+	return typec_mux_set(retimer->typec_mux, &mux_state);
+}
+
+static int ps883x_enable_vregs(struct ps883x_retimer *retimer)
+{
+	struct device *dev = &retimer->client->dev;
+	int ret;
+
+	ret = regulator_enable(retimer->vdd33_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD 3.3V regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(retimer->vdd33_cap_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD 3.3V CAP regulator: %d\n", ret);
+		goto err_vdd33_disable;
+	}
+
+	usleep_range(4000, 10000);
+
+	ret = regulator_enable(retimer->vdd_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD regulator: %d\n", ret);
+		goto err_vdd33_cap_disable;
+	}
+
+	ret = regulator_enable(retimer->vddar_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD AR regulator: %d\n", ret);
+		goto err_vdd_disable;
+	}
+
+	ret = regulator_enable(retimer->vddat_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD AT regulator: %d\n", ret);
+		goto err_vddar_disable;
+	}
+
+	ret = regulator_enable(retimer->vddio_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD IO regulator: %d\n", ret);
+		goto err_vddat_disable;
+	}
+
+	return 0;
+
+err_vddat_disable:
+	regulator_disable(retimer->vddat_supply);
+err_vddar_disable:
+	regulator_disable(retimer->vddar_supply);
+err_vdd_disable:
+	regulator_disable(retimer->vdd_supply);
+err_vdd33_cap_disable:
+	regulator_disable(retimer->vdd33_cap_supply);
+err_vdd33_disable:
+	regulator_disable(retimer->vdd33_supply);
+
+	return ret;
+}
+
+static void ps883x_disable_vregs(struct ps883x_retimer *retimer)
+{
+	regulator_disable(retimer->vddio_supply);
+	regulator_disable(retimer->vddat_supply);
+	regulator_disable(retimer->vddar_supply);
+	regulator_disable(retimer->vdd_supply);
+	regulator_disable(retimer->vdd33_cap_supply);
+	regulator_disable(retimer->vdd33_supply);
+}
+
+static int ps883x_get_vregs(struct ps883x_retimer *retimer)
+{
+	struct device *dev = &retimer->client->dev;
+
+	retimer->vdd_supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(retimer->vdd_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vdd_supply),
+				     "failed to get VDD\n");
+
+	retimer->vdd33_supply = devm_regulator_get(dev, "vdd33");
+	if (IS_ERR(retimer->vdd33_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vdd33_supply),
+				     "failed to get VDD 3.3V\n");
+
+	retimer->vdd33_cap_supply = devm_regulator_get(dev, "vdd33-cap");
+	if (IS_ERR(retimer->vdd33_cap_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vdd33_cap_supply),
+				     "failed to get VDD CAP 3.3V\n");
+
+	retimer->vddat_supply = devm_regulator_get(dev, "vddat");
+	if (IS_ERR(retimer->vddat_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vddat_supply),
+				     "failed to get VDD AT\n");
+
+	retimer->vddar_supply = devm_regulator_get(dev, "vddar");
+	if (IS_ERR(retimer->vddar_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vddar_supply),
+				     "failed to get VDD AR\n");
+
+	retimer->vddio_supply = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(retimer->vddio_supply))
+		return dev_err_probe(dev, PTR_ERR(retimer->vddio_supply),
+				     "failed to get VDD IO\n");
+
+	return 0;
+}
+
+static const struct regmap_config ps883x_retimer_regmap = {
+	.max_register = 0x1f,
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int ps883x_retimer_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct typec_switch_desc sw_desc = { };
+	struct typec_retimer_desc rtmr_desc = { };
+	struct ps883x_retimer *retimer;
+	int ret;
+
+	retimer = devm_kzalloc(dev, sizeof(*retimer), GFP_KERNEL);
+	if (!retimer)
+		return -ENOMEM;
+
+	retimer->client = client;
+
+	mutex_init(&retimer->lock);
+
+	retimer->regmap = devm_regmap_init_i2c(client, &ps883x_retimer_regmap);
+	if (IS_ERR(retimer->regmap))
+		return dev_err_probe(dev, PTR_ERR(retimer->regmap),
+				     "failed to allocate register map\n");
+
+	ret = ps883x_get_vregs(retimer);
+	if (ret)
+		return ret;
+
+	retimer->xo_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(retimer->xo_clk))
+		return dev_err_probe(dev, PTR_ERR(retimer->xo_clk),
+				     "failed to get xo clock\n");
+
+	retimer->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(retimer->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(retimer->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	retimer->typec_switch = typec_switch_get(dev);
+	if (IS_ERR(retimer->typec_switch))
+		return dev_err_probe(dev, PTR_ERR(retimer->typec_switch),
+				     "failed to acquire orientation-switch\n");
+
+	retimer->typec_mux = typec_mux_get(dev);
+	if (IS_ERR(retimer->typec_mux)) {
+		ret = dev_err_probe(dev, PTR_ERR(retimer->typec_mux),
+				    "failed to acquire mode-mux\n");
+		goto err_switch_put;
+	}
+
+	ret = drm_aux_bridge_register(dev);
+	if (ret)
+		goto err_mux_put;
+
+	ret = ps883x_enable_vregs(retimer);
+	if (ret)
+		goto err_mux_put;
+
+	ret = clk_prepare_enable(retimer->xo_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable XO: %d\n", ret);
+		goto err_vregs_disable;
+	}
+
+	sw_desc.drvdata = retimer;
+	sw_desc.fwnode = dev_fwnode(dev);
+	sw_desc.set = ps883x_sw_set;
+
+	retimer->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(retimer->sw)) {
+		ret = PTR_ERR(retimer->sw);
+		dev_err(dev, "failed to register typec switch: %d\n", ret);
+		goto err_clk_disable;
+	}
+
+	rtmr_desc.drvdata = retimer;
+	rtmr_desc.fwnode = dev_fwnode(dev);
+	rtmr_desc.set = ps883x_retimer_set;
+
+	retimer->retimer = typec_retimer_register(dev, &rtmr_desc);
+	if (IS_ERR(retimer->retimer)) {
+		ret = PTR_ERR(retimer->retimer);
+		dev_err(dev, "failed to register typec retimer: %d\n", ret);
+		goto err_switch_unregister;
+	}
+
+	/* skip resetting if already configured */
+	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
+			     CONN_STATUS_0_CONNECTION_PRESENT) == 1)
+		return gpiod_direction_output(retimer->reset_gpio, 0);
+
+	gpiod_direction_output(retimer->reset_gpio, 1);
+
+	/* VDD IO supply enable to reset release delay */
+	usleep_range(4000, 14000);
+
+	gpiod_set_value(retimer->reset_gpio, 0);
+
+	/* firmware initialization delay */
+	msleep(60);
+
+	return 0;
+
+err_switch_unregister:
+	typec_switch_unregister(retimer->sw);
+err_vregs_disable:
+	ps883x_disable_vregs(retimer);
+err_clk_disable:
+	clk_disable_unprepare(retimer->xo_clk);
+err_mux_put:
+	typec_mux_put(retimer->typec_mux);
+err_switch_put:
+	typec_switch_put(retimer->typec_switch);
+
+	return ret;
+}
+
+static void ps883x_retimer_remove(struct i2c_client *client)
+{
+	struct ps883x_retimer *retimer = i2c_get_clientdata(client);
+
+	typec_retimer_unregister(retimer->retimer);
+	typec_switch_unregister(retimer->sw);
+
+	gpiod_set_value(retimer->reset_gpio, 1);
+
+	clk_disable_unprepare(retimer->xo_clk);
+
+	ps883x_disable_vregs(retimer);
+
+	typec_mux_put(retimer->typec_mux);
+	typec_switch_put(retimer->typec_switch);
+}
+
+static const struct of_device_id ps883x_retimer_of_table[] = {
+	{ .compatible = "parade,ps8830" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ps883x_retimer_of_table);
+
+static struct i2c_driver ps883x_retimer_driver = {
+	.driver = {
+		.name = "ps883x_retimer",
+		.of_match_table = ps883x_retimer_of_table,
+	},
+	.probe		= ps883x_retimer_probe,
+	.remove		= ps883x_retimer_remove,
+};
+
+module_i2c_driver(ps883x_retimer_driver);
+
+MODULE_DESCRIPTION("Parade ps883x Type-C Retimer driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


