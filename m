Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAFDD103BFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 14:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731133AbfKTNja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 08:39:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:47140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728541AbfKTNj3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 08:39:29 -0500
Received: from localhost.localdomain (unknown [118.189.143.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EED3B224FA;
        Wed, 20 Nov 2019 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574257169;
        bh=YhYeclBfcRAmQRKEfK1UPHgzQsEwwbB0zzIWoJvZqI0=;
        h=From:To:Cc:Subject:Date:From;
        b=wJk2StoOjc+BeWfmw2WdeZn48fkLo9n6eHL1g95WZq0jKf+UHvFMrdwopSulLlcwb
         /Rm2NvkQHogA71WaWOH2JIwhCMLTdf9LPronRGRKIK0fx6PH3x0Zl6SfY1/sYEaRVz
         o6h7jtqcjNqgBvYayTOGbO4Y1ci/zC7IlxNrNMok=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] soc: qcom: Fix Kconfig indentation
Date:   Wed, 20 Nov 2019 21:39:25 +0800
Message-Id: <20191120133925.13712-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/soc/qcom/Kconfig | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 79d826553ac8..d0a73e76d563 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -45,13 +45,13 @@ config QCOM_GLINK_SSR
 	  neighboring subsystems going up or down.
 
 config QCOM_GSBI
-        tristate "QCOM General Serial Bus Interface"
-        depends on ARCH_QCOM || COMPILE_TEST
-        select MFD_SYSCON
-        help
-          Say y here to enable GSBI support.  The GSBI provides control
-          functions for connecting the underlying serial UART, SPI, and I2C
-          devices to the output pins.
+	tristate "QCOM General Serial Bus Interface"
+	depends on ARCH_QCOM || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  Say y here to enable GSBI support.  The GSBI provides control
+	  functions for connecting the underlying serial UART, SPI, and I2C
+	  devices to the output pins.
 
 config QCOM_LLCC
 	tristate "Qualcomm Technologies, Inc. LLCC driver"
@@ -71,10 +71,10 @@ config QCOM_OCMEM
 	depends on ARCH_QCOM
 	select QCOM_SCM
 	help
-          The On Chip Memory (OCMEM) allocator allows various clients to
-          allocate memory from OCMEM based on performance, latency and power
-          requirements. This is typically used by the GPU, camera/video, and
-          audio components on some Snapdragon SoCs.
+	  The On Chip Memory (OCMEM) allocator allows various clients to
+	  allocate memory from OCMEM based on performance, latency and power
+	  requirements. This is typically used by the GPU, camera/video, and
+	  audio components on some Snapdragon SoCs.
 
 config QCOM_PM
 	bool "Qualcomm Power Management"
@@ -198,8 +198,8 @@ config QCOM_APR
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	help
-          Enable APR IPC protocol support between
-          application processor and QDSP6. APR is
-          used by audio driver to configure QDSP6
-          ASM, ADM and AFE modules.
+	  Enable APR IPC protocol support between
+	  application processor and QDSP6. APR is
+	  used by audio driver to configure QDSP6
+	  ASM, ADM and AFE modules.
 endmenu
-- 
2.17.1

