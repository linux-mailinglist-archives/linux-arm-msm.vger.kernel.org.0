Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037BE449A1A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 17:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241343AbhKHQrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 11:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241331AbhKHQrn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 11:47:43 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36571C061570;
        Mon,  8 Nov 2021 08:44:59 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id c4so4820427pfj.2;
        Mon, 08 Nov 2021 08:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=otya5ySSGPpItEAXCYq/kCkCfRqQC7Z1FWt4Y1Vj2S4=;
        b=dC2ImGfIDsH9ZYk555d8L7PNVuZLo2JFMJGQMCPr6h81dU4ZgV5R8gC1Uov8x5ggnw
         Qiwq0pSsPkyKWgxcj2Payi2VFlB7tDcWwzyw6DW018JMkNDmOvus1Oj43wd2IRg6ewaL
         v1LlXwh9IW+AT3G0o82RgyBtDy2BMvXoKPuvJobOGZ4swZFYXpWCpNRD8Gev/RK13Brr
         +cGaIxoyB7+NnBiBR3je/x6uKerpyxPu/pUzdwyvOpu2HOwJIxIX4woKHE0KjouWACMP
         ppFOMOgRw5Ux9+uGDzzVhmvQok4cMj9RlYh23siK+kFayk/ilO8tx4L/7w0JS5NFR84A
         Axtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=otya5ySSGPpItEAXCYq/kCkCfRqQC7Z1FWt4Y1Vj2S4=;
        b=pc/goeXeywDiaa1zA05bYTuWGBY57j7qQD2ctOEYe/rB58N3QjouTvlzXNuxAZBR3I
         UL7BAo/BRTGzOrFHpiFfY9Lk6vGTLEBvHXTBxOWGw5LOUrsyn74u+2WmNhXLgHlMoZac
         3DnseETgp0z9A8AO/m+eNI/kO+AuNhBOVqF6SiNkpLg663wMxNJxqRqRWmCl6WVkymi+
         rlJKutd1POWKiib/mFbWIqvOauwUNbcAXnvo2m6THagt1KKFcZCUhDIpLlWS3OsRcGMv
         dI1pZE6mJmVGVnUIi6ZdTcMdSIX26c7VEZ+S+LiojBUf+VjW3M+yJk6uUyMyQFOAvRvG
         C5BQ==
X-Gm-Message-State: AOAM533mTZDYiRdNOGqYmXNA66O0HyxwegiOEcdG1Eq7ZzDQrGhZavZj
        U7gkFoh20/0B22nougcl7mo=
X-Google-Smtp-Source: ABdhPJz4Q9HhQCXDeCSTeAHjzPnXXLUT6bYXTPkgDaaYrSYyiAnIT347d5KAn79IpUM40Ite3Wir3w==
X-Received: by 2002:a65:6554:: with SMTP id a20mr568199pgw.107.1636389898747;
        Mon, 08 Nov 2021 08:44:58 -0800 (PST)
Received: from jaschultz-Thelio-Major.corp.microsoft.com ([2001:4898:80e8:36:87e1:381d:5b89:8aef])
        by smtp.gmail.com with ESMTPSA id 145sm15980974pfx.87.2021.11.08.08.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:44:58 -0800 (PST)
From:   Jarrett Schultz <jaschultzms@gmail.com>
X-Google-Original-From: Jarrett Schultz <jaschultz@microsoft.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultzMS@gmail.com>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: [PATCH v2 2/5] platform: surface: Propagate ACPI Dependency
Date:   Mon,  8 Nov 2021 08:44:46 -0800
Message-Id: <20211108164449.3036210-3-jaschultz@microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108164449.3036210-1-jaschultz@microsoft.com>
References: <20211108164449.3036210-1-jaschultz@microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jarrett Schultz <jaschultzMS@gmail.com>

Since the Surface XBL Driver does not depend on ACPI, the
platform/surface directory as a whole no longer depends on ACPI. With
respect to this, the ACPI dependency is moved into each config that
depends on ACPI individually.

Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>

---

Changes in v2:
 - Created to propagate ACPI dependency

---

 drivers/platform/surface/Kconfig | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
index 3105f651614f..0d3970e1d144 100644
--- a/drivers/platform/surface/Kconfig
+++ b/drivers/platform/surface/Kconfig
@@ -5,7 +5,6 @@
 
 menuconfig SURFACE_PLATFORMS
 	bool "Microsoft Surface Platform-Specific Device Drivers"
-	depends on ACPI
 	default y
 	help
 	  Say Y here to get to see options for platform-specific device drivers
@@ -18,6 +17,7 @@ if SURFACE_PLATFORMS
 
 config SURFACE3_WMI
 	tristate "Surface 3 WMI Driver"
+	depends on ACPI
 	depends on ACPI_WMI
 	depends on DMI
 	depends on INPUT
@@ -30,12 +30,14 @@ config SURFACE3_WMI
 
 config SURFACE_3_BUTTON
 	tristate "Power/home/volume buttons driver for Microsoft Surface 3 tablet"
+	depends on ACPI
 	depends on KEYBOARD_GPIO && I2C
 	help
 	  This driver handles the power/home/volume buttons on the Microsoft Surface 3 tablet.
 
 config SURFACE_3_POWER_OPREGION
 	tristate "Surface 3 battery platform operation region support"
+	depends on ACPI
 	depends on I2C
 	help
 	  This driver provides support for ACPI operation
@@ -43,6 +45,7 @@ config SURFACE_3_POWER_OPREGION
 
 config SURFACE_ACPI_NOTIFY
 	tristate "Surface ACPI Notify Driver"
+	depends on ACPI
 	depends on SURFACE_AGGREGATOR
 	help
 	  Surface ACPI Notify (SAN) driver for Microsoft Surface devices.
@@ -62,6 +65,7 @@ config SURFACE_ACPI_NOTIFY
 
 config SURFACE_AGGREGATOR_CDEV
 	tristate "Surface System Aggregator Module User-Space Interface"
+	depends on ACPI
 	depends on SURFACE_AGGREGATOR
 	help
 	  Provides a misc-device interface to the Surface System Aggregator
@@ -79,6 +83,7 @@ config SURFACE_AGGREGATOR_CDEV
 
 config SURFACE_AGGREGATOR_REGISTRY
 	tristate "Surface System Aggregator Module Device Registry"
+	depends on ACPI
 	depends on SURFACE_AGGREGATOR
 	depends on SURFACE_AGGREGATOR_BUS
 	help
@@ -106,6 +111,7 @@ config SURFACE_AGGREGATOR_REGISTRY
 
 config SURFACE_DTX
 	tristate "Surface DTX (Detachment System) Driver"
+	depends on ACPI
 	depends on SURFACE_AGGREGATOR
 	depends on INPUT
 	help
@@ -126,6 +132,7 @@ config SURFACE_DTX
 
 config SURFACE_GPE
 	tristate "Surface GPE/Lid Support Driver"
+	depends on ACPI
 	depends on DMI
 	help
 	  This driver marks the GPEs related to the ACPI lid device found on
@@ -135,6 +142,7 @@ config SURFACE_GPE
 
 config SURFACE_HOTPLUG
 	tristate "Surface Hot-Plug Driver"
+	depends on ACPI
 	depends on GPIOLIB
 	help
 	  Driver for out-of-band hot-plug event signaling on Microsoft Surface
@@ -154,6 +162,7 @@ config SURFACE_HOTPLUG
 
 config SURFACE_PLATFORM_PROFILE
 	tristate "Surface Platform Profile Driver"
+	depends on ACPI
 	depends on SURFACE_AGGREGATOR_REGISTRY
 	select ACPI_PLATFORM_PROFILE
 	help
@@ -176,6 +185,7 @@ config SURFACE_PLATFORM_PROFILE
 
 config SURFACE_PRO3_BUTTON
 	tristate "Power/home/volume buttons driver for Microsoft Surface Pro 3/4 tablet"
+	depends on ACPI
 	depends on INPUT
 	help
 	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3/4 tablet.
-- 
2.25.1

