Return-Path: <linux-arm-msm+bounces-23469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F379115A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 00:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05541F224C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9849D14B978;
	Thu, 20 Jun 2024 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j7/tbrY/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6357113A26B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 22:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718922093; cv=none; b=TnKs9dJl7skoVDA7uWHQoHiCPQRAY6h0o2VXz140KvVYKF4wzdcj9483KUkbYKBI32Ye80PA2g7qD7PeVn0pM3Bref/S3KrJdl4PNfFb6Eagx8ktKfXn5i6b8i3B+IoRDnpouq1KTnLA4NeXCpt5yQ0xTZZfTPjWZa/AGepAtnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718922093; c=relaxed/simple;
	bh=KPRxQD4QLat0SQVNGI9t8mNxBIe6QFvjOk9N6qyixVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZKFWdlp5gWYYdl+f3xLDgetiyij3o/QKFAiPOF42RUdsBUyKahVUWVzSAo/W1qwHGpXubMu7k7V5NzMYcVTlSp6xJz25jFN5PQ8vWztOYUsNHQGNPdXGBDjJJzFJcoNUtMCVg/qCmEEQr0uksgUCG8avtL79+gPSe0tPD2y/6p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j7/tbrY/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cd628f21cso52548e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 15:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718922089; x=1719526889; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yLOyLRX0KOL5/ozzbKVxDFhIqbSXnJZT/bIt8R1RfLw=;
        b=j7/tbrY/bXstnmIBL5lKvGFq2FNnTRDdXuLs8MkYDX4hi9TSW/vW1GrS/1P1wC5Sla
         rD0Bcvg/UV3OqMzeurEe+qggywrAVaSHgcZyUbLB8IKieNfD7cB9MvrsokNVLH1rwaVp
         r2IYYmW1Uk7lfTkk5R3tcrn3Ic0cVi3VqjU+BacCi9TAIX6GqlleSzqmoBsOoeY2qn9O
         3965SkD9zF+ZkHAaioJrfTQcdSwXj45Cmdk0CDSzvqroFq11V6S9lo+rQeO/hxdX5ND6
         CDKI2uKMM6B9vabVY8HsS1Qf085JxbUvH4IIrgggJ6kG8uIdusFs/bYEj4AvnCY1/k6l
         Y7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718922089; x=1719526889;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLOyLRX0KOL5/ozzbKVxDFhIqbSXnJZT/bIt8R1RfLw=;
        b=ae7H/2N9JDJZjmoUv+THjhdoazWxBj1RnY4p0tHFR9HLIGZPzToSK/WEPb4qjkipBs
         UUmw4V+MdkK4md2WbvwI0OIjN9/c9yMc1ahl0PeHQVpFtsf4HwRbd92EUKo375Ir4Sg5
         kvuZHxw/iQBWX475+k+VdaAiROwNmBO/k0q2J4VK3E8ojPRV42ibJ/YCTGY5neVz7zoz
         2IXYrCcMewRXeCZmQhFEQVeasxYBx3uIa5AplLX/vVCS4Eh+kd74SpI1UnbFjkP5CRDS
         ijHhS97ot87iwLbjKY4UVa7WzeOsta/NlW1BHC3hKAZmZ2Y69rK5sB9QqM1hgTUdYEbE
         edNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT8KCOjRP9RbNwouqPsoj1UO9yc7qIdjqmCrEtRUVLkTg0HJL8/faxA7tgCMSYL9TvHYAnyqcFMAAhij0KJlvqjIkeElTsAG/PaDUzLA==
X-Gm-Message-State: AOJu0Yy+US1bzs7uaguiiPITiD8k0G4JZSrspYKzoS7+7ndKlHOGB4c5
	DiA033Cm2Ch45t9Vqx2xMZBPBdCGcerK6aDX5F/mzF5k/gF/UcE1Gtv5W/9q5z4=
X-Google-Smtp-Source: AGHT+IEUKkRtS0FKenx3Chuv0X4LU0Z5FVhArqW3LrJ9sQM2Ucde0ZN6osqngkHMuPm1mxwcCl36og==
X-Received: by 2002:a05:6512:3e3:b0:52c:d5ac:d50 with SMTP id 2adb3069b0e04-52cd5ac0f06mr113091e87.57.1718922089200;
        Thu, 20 Jun 2024 15:21:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd64202ccsm11260e87.172.2024.06.20.15.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 15:21:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 01:21:26 +0300
Subject: [PATCH v8] usb: typec: ucsi: add Lenovo Yoga C630 glue driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGWrdGYC/2XPzU6EMBQF4FeZsLak9B9XvodxcUtbaHSouUUim
 fDulknMoF2exXfuubcme4w+N8+XW4N+jTmmuQTzdGmGCebRk+hKbhhlgkqmydeQI9nSCMQPxGF
 cPRKtgtNBOgfeNEV+og/x+976+lZywHQly4Qefrs4ZVR2khnat4xxLrgiHXHXuODWWsAtT+9pf
 fmIM2BqE45H7RTzknC7b135Uf6Y9W/RygklnGnojewcOHmuOiat4uxN5UXxIoBxAcBrqyovH17
 R+r4svoOh74BawVnt1cl3rPKqeOO1slDqBe8rr89eVF4X3wdqeytoeeDv/X3ffwCFxl9u+QEAA
 A==
To: Bjorn Andersson <andersson@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11241;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KPRxQD4QLat0SQVNGI9t8mNxBIe6QFvjOk9N6qyixVw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdKto98V9ICnhk5SvkNfTRvGpmYUlI7l/cJyBe
 PiXQ2usznaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnSraAAKCRCLPIo+Aiko
 1SzjB/4ri0okXc98rCrUu0CmCyLo2M1/1eA7Mh2l1Mgueb6CJaagBLqX/HA9WguOnByNV7eVC5u
 nLKhGiL573bEWtKUBNqwOcw6tZN8g6T9mS95ZGED19b/8ecGBHqL7H7ayCcPU/dFib7FSTHjV1E
 tY7PG96omAhEzcOLu9O6+VyP2i92ItUNsRo3zvDj1y+F+45XeIY6pJU6OCBCGkRZpt+Z+0U9TFJ
 SgNTJFrUZ3Jjm+37fBc40SwUe9tPbKgzL8kDwGjv9RKR3/fn9ipEfAgZFuyxyFgSTQHjvbSHJWd
 aaTRJko3OS0kO+dys+3ofA1JZp0ck7y2aw/qxufPvmZd6/d+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The Lenovo Yoga C630 WOS laptop provides implements UCSI interface in
the onboard EC. Add glue driver to interface the platform's UCSI
implementation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Add driver for the UCSI on the Lenovo Yoga C630 laptop, as implemented
by the Embedded Controlller of the laptop.

Support for this EC was implemented by Bjorn, who later could not work
on this driver. I've picked this patchset up and updated it following
the pending review comments.

NOTE: the patch depends on the header from the platform driver. Ilpo
Järvinen has created an immutable branch based on v6.10-rc1, please pull
it before merging the patches:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-ib-lenovo-c630-v6.11

  platform: arm64: add Lenovo Yoga C630 WOS EC driver (2024-06-14 12:51:30 +0300)

----------------------------------------------------------------
Immutable branch between pdx86 lenovo c630 branch, power/supply and USB
subsystems due for the v6.11 merge window.

platform-drivers-x86-ib-lenovo-c630-v6.11:
  v6.10-rc1 + platform-drivers-x86-lenovo-c630
for merging into the power/supply and USB subsystems for v6.11.
----------------------------------------------------------------
---
Changes in v8:
- Split to a separate USB-related series
- Mention the immutable branch.
- Link to v7: https://lore.kernel.org/r/20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org

Changes in v7:
- In PSY driver use guard() instead of scoped_guard() (Ilpo)
- Use switch/case rather than ifs in yoga_c630_ucsi_read() (Ilpo)
- Link to v6: https://lore.kernel.org/r/20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org

Changes in v6:
- Use guard() instead of scoped_guard() (Ilpo)
- Add a define for UCSI version register (Ilpo)
- Added a check to prevent overflowing the address in reg16 read (Ilpo)
- Link to v5: https://lore.kernel.org/r/20240607-yoga-ec-driver-v5-0-1ac91a0b4326@linaro.org

Changes in v5:
- Added missing article in the commit message (Bryan)
- Changed yoga_c630_ec_ucsi_get_version() to explicitly set the register
  instead of just incrementing it (Bryan)
- Dropped spurious debugging pr_info (Bryan)
- Added missing includes all over the place (Ilpo)
- Switched to scoped_guard() where it's suitable (Ilpo)
- Defined register bits (Ilpo, Bryan)
- Whitespace cleanup (Ilpo, Bryan)
- Reworked yoga_c630_ucsi_notify() to use switch-case (Bryan)
- Use ternary operators instead of if()s (Ilpo)
- Switched power supply driver to use fwnode (Sebastian)
- Fixed handling of the adapter's type vs usb_type (Sebastian)
- Added SCOPE property to the battery (Sebastian)
- Link to v4: https://lore.kernel.org/r/20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org

Changes in v4:
- Moved bindings to platform/ to follow example of other Acer Aspire1 EC
  (Nikita Travkin)
- Fixed dt validation for EC interrupt pin (Rob Herring)
- Dropped separate 'scale' property (Oliver Neukum)
- Link to v3: https://lore.kernel.org/r/20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org

Changes in v3:
- Split the driver into core and power supply drivers,
- Added UCSI driver part, handling USB connections,
- Fixed Bjorn's address in DT bindings (Brian Masney)
- Changed power-role for both ports to be "dual" per UCSI
- Link to v2: https://lore.kernel.org/linux-arm-msm/20230205152809.2233436-1-dmitry.baryshkov@linaro.org/

Changes in v2:
- Dropped DP support for now, as the bindings are in process of being
  discussed separately,
- Merged dt patch into the same patchseries,
- Removed the fixed serial number battery property,
- Fixed indentation of dt bindings example,
- Added property: reg and unevaluatedProperties to the connector
  bindings.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20220810035424.2796777-1-bjorn.andersson@linaro.org/
---
 drivers/usb/typec/ucsi/Kconfig          |   9 ++
 drivers/usb/typec/ucsi/Makefile         |   1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 204 ++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index bdcb1764cfae..680e1b87b152 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -69,4 +69,13 @@ config UCSI_PMIC_GLINK
 	  To compile the driver as a module, choose M here: the module will be
 	  called ucsi_glink.
 
+config UCSI_LENOVO_YOGA_C630
+	tristate "UCSI Interface Driver for Lenovo Yoga C630"
+	depends on EC_LENOVO_YOGA_C630
+	help
+	  This driver enables UCSI support on the Lenovo Yoga C630 laptop.
+
+	  To compile the driver as a module, choose M here: the module will be
+	  called ucsi_yoga_c630.
+
 endif
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index b4679f94696b..aed41d23887b 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -21,3 +21,4 @@ obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
 obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
 obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
 obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
+obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
new file mode 100644
index 000000000000..8bee0b469041
--- /dev/null
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024, Linaro Ltd
+ * Authors:
+ *  Bjorn Andersson
+ *  Dmitry Baryshkov
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/string.h>
+#include <linux/platform_data/lenovo-yoga-c630.h>
+
+#include "ucsi.h"
+
+struct yoga_c630_ucsi {
+	struct yoga_c630_ec *ec;
+	struct ucsi *ucsi;
+	struct notifier_block nb;
+	struct completion complete;
+	unsigned long flags;
+#define UCSI_C630_COMMAND_PENDING	0
+#define UCSI_C630_ACK_PENDING		1
+	u16 version;
+};
+
+static int yoga_c630_ucsi_read(struct ucsi *ucsi, unsigned int offset,
+			       void *val, size_t val_len)
+{
+	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
+	u8 buf[YOGA_C630_UCSI_READ_SIZE];
+	int ret;
+
+	ret = yoga_c630_ec_ucsi_read(uec->ec, buf);
+	if (ret)
+		return ret;
+
+	if (offset == UCSI_VERSION) {
+		memcpy(val, &uec->version, min(val_len, sizeof(uec->version)));
+		return 0;
+	}
+
+	switch (offset) {
+	case UCSI_CCI:
+		memcpy(val, buf, min(val_len, YOGA_C630_UCSI_CCI_SIZE));
+		return 0;
+	case UCSI_MESSAGE_IN:
+		memcpy(val, buf + YOGA_C630_UCSI_CCI_SIZE,
+		       min(val_len, YOGA_C630_UCSI_DATA_SIZE));
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int yoga_c630_ucsi_async_write(struct ucsi *ucsi, unsigned int offset,
+				      const void *val, size_t val_len)
+{
+	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
+
+	if (offset != UCSI_CONTROL ||
+	    val_len != YOGA_C630_UCSI_WRITE_SIZE)
+		return -EINVAL;
+
+	return yoga_c630_ec_ucsi_write(uec->ec, val);
+}
+
+static int yoga_c630_ucsi_sync_write(struct ucsi *ucsi, unsigned int offset,
+				     const void *val, size_t val_len)
+{
+	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
+	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
+	int ret;
+
+	if (ack)
+		set_bit(UCSI_C630_ACK_PENDING, &uec->flags);
+	else
+		set_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
+
+	reinit_completion(&uec->complete);
+
+	ret = yoga_c630_ucsi_async_write(ucsi, offset, val, val_len);
+	if (ret)
+		goto out_clear_bit;
+
+	if (!wait_for_completion_timeout(&uec->complete, 5 * HZ))
+		ret = -ETIMEDOUT;
+
+out_clear_bit:
+	if (ack)
+		clear_bit(UCSI_C630_ACK_PENDING, &uec->flags);
+	else
+		clear_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
+
+	return ret;
+}
+
+const struct ucsi_operations yoga_c630_ucsi_ops = {
+	.read = yoga_c630_ucsi_read,
+	.sync_write = yoga_c630_ucsi_sync_write,
+	.async_write = yoga_c630_ucsi_async_write,
+};
+
+static void yoga_c630_ucsi_notify_ucsi(struct yoga_c630_ucsi *uec, u32 cci)
+{
+	if (UCSI_CCI_CONNECTOR(cci))
+		ucsi_connector_change(uec->ucsi, UCSI_CCI_CONNECTOR(cci));
+
+	if (cci & UCSI_CCI_ACK_COMPLETE &&
+	    test_bit(UCSI_C630_ACK_PENDING, &uec->flags))
+		complete(&uec->complete);
+
+	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
+	    test_bit(UCSI_C630_COMMAND_PENDING, &uec->flags))
+		complete(&uec->complete);
+}
+
+static int yoga_c630_ucsi_notify(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct yoga_c630_ucsi *uec = container_of(nb, struct yoga_c630_ucsi, nb);
+	u32 cci;
+	int ret;
+
+	switch (action) {
+	case LENOVO_EC_EVENT_USB:
+	case LENOVO_EC_EVENT_HPD:
+		ucsi_connector_change(uec->ucsi, 1);
+		return NOTIFY_OK;
+
+	case LENOVO_EC_EVENT_UCSI:
+		ret = uec->ucsi->ops->read(uec->ucsi, UCSI_CCI, &cci, sizeof(cci));
+		if (ret)
+			return NOTIFY_DONE;
+
+		yoga_c630_ucsi_notify_ucsi(uec, cci);
+
+		return NOTIFY_OK;
+
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
+{
+	struct yoga_c630_ec *ec = adev->dev.platform_data;
+	struct yoga_c630_ucsi *uec;
+	int ret;
+
+	uec = devm_kzalloc(&adev->dev, sizeof(*uec), GFP_KERNEL);
+	if (!uec)
+		return -ENOMEM;
+
+	uec->ec = ec;
+	init_completion(&uec->complete);
+	uec->nb.notifier_call = yoga_c630_ucsi_notify;
+
+	uec->ucsi = ucsi_create(&adev->dev, &yoga_c630_ucsi_ops);
+	if (IS_ERR(uec->ucsi))
+		return PTR_ERR(uec->ucsi);
+
+	ucsi_set_drvdata(uec->ucsi, uec);
+
+	uec->version = yoga_c630_ec_ucsi_get_version(uec->ec);
+
+	auxiliary_set_drvdata(adev, uec);
+
+	ret = yoga_c630_ec_register_notify(ec, &uec->nb);
+	if (ret)
+		return ret;
+
+	return ucsi_register(uec->ucsi);
+}
+
+static void yoga_c630_ucsi_remove(struct auxiliary_device *adev)
+{
+	struct yoga_c630_ucsi *uec = auxiliary_get_drvdata(adev);
+
+	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
+	ucsi_unregister(uec->ucsi);
+}
+
+static const struct auxiliary_device_id yoga_c630_ucsi_id_table[] = {
+	{ .name = YOGA_C630_MOD_NAME "." YOGA_C630_DEV_UCSI, },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, yoga_c630_ucsi_id_table);
+
+static struct auxiliary_driver yoga_c630_ucsi_driver = {
+	.name = YOGA_C630_DEV_UCSI,
+	.id_table = yoga_c630_ucsi_id_table,
+	.probe = yoga_c630_ucsi_probe,
+	.remove = yoga_c630_ucsi_remove,
+};
+
+module_auxiliary_driver(yoga_c630_ucsi_driver);
+
+MODULE_DESCRIPTION("Lenovo Yoga C630 UCSI");
+MODULE_LICENSE("GPL");

---
base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
change-id: 20240527-ucsi-yoga-ec-driver-76fd7f5ddae8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


