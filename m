Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BD423BBD6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 16:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgHDOPL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 10:15:11 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:9467 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbgHDOPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 10:15:06 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 04 Aug 2020 07:15:04 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Aug 2020 07:15:03 -0700
Received: from gkohli-linux.qualcomm.com ([10.204.78.26])
  by ironmsg01-blr.qualcomm.com with ESMTP; 04 Aug 2020 19:44:50 +0530
Received: by gkohli-linux.qualcomm.com (Postfix, from userid 427023)
        id 73D3B486B; Tue,  4 Aug 2020 19:44:49 +0530 (IST)
From:   Gaurav Kohli <gkohli@codeaurora.org>
To:     will@kernel.org, linux-arm-kernel@lists.infradead.org,
        maz@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neeraju@codeaurora.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] nvmem: core: add support to NVMEM_NO_SYSFS_ENTRY
Date:   Tue,  4 Aug 2020 19:44:43 +0530
Message-Id: <1596550484-11029-2-git-send-email-gkohli@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596550484-11029-1-git-send-email-gkohli@codeaurora.org>
References: <1596550484-11029-1-git-send-email-gkohli@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Some users might not want to expose nvmem entry to sysfs and
only intend to use kernel interface so add such provision.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
  Documentation/ABI/stable/sysfs-bus-nvmem |  2 ++
  drivers/nvmem/Kconfig                    |  5 +++++
  drivers/nvmem/core.c                     | 11 ++++++-----
  3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem 
b/Documentation/ABI/stable/sysfs-bus-nvmem
index 5923ab4620c5..12aab0a85fea 100644
--- a/Documentation/ABI/stable/sysfs-bus-nvmem
+++ b/Documentation/ABI/stable/sysfs-bus-nvmem
@@ -6,6 +6,8 @@ Description:
  		This file allows user to read/write the raw NVMEM contents.
  		Permissions for write to this file depends on the nvmem
  		provider configuration.
+		Note: This file is not present if CONFIG_NVMEM_NO_SYSFS_ENTRY
+		is enabled

  		ex:
  		hexdump /sys/bus/nvmem/devices/qfprom0/nvmem
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 0a7a470ee859..6ab3276d287c 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -192,4 +192,9 @@ config SC27XX_EFUSE
  	  This driver can also be built as a module. If so, the module
  	  will be called nvmem-sc27xx-efuse.

+config NVMEM_NO_SYSFS_ENTRY
+	bool "No nvmem sysfs entry"
+
+	help
+	  Say Yes if you do not want to add nvmem entry to sysfs.
  endif
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index b9a0270883a0..c70f183fe379 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -216,7 +216,7 @@ static const struct attribute_group 
nvmem_bin_rw_group = {
	.attrs		= nvmem_attrs,
  };

-static const struct attribute_group *nvmem_rw_dev_groups[] = {
+static const __maybe_unused struct attribute_group 
*nvmem_rw_dev_groups[] = {
  	&nvmem_bin_rw_group,
  	NULL,
  };
@@ -240,7 +240,7 @@ static const struct attribute_group 
nvmem_bin_ro_group = {
  	.attrs		= nvmem_attrs,
  };

-static const struct attribute_group *nvmem_ro_dev_groups[] = {
+static const __maybe_unused struct attribute_group 
*nvmem_ro_dev_groups[] = {
  	&nvmem_bin_ro_group,
  	NULL,
  };
@@ -265,7 +265,7 @@ static const struct attribute_group 
nvmem_bin_rw_root_group = {
  	.attrs		= nvmem_attrs,
  };

-static const struct attribute_group *nvmem_rw_root_dev_groups[] = {
+static const __maybe_unused struct attribute_group 
*nvmem_rw_root_dev_groups[] = {
  	&nvmem_bin_rw_root_group,
  	NULL,
  };
@@ -289,7 +289,7 @@ static const struct attribute_group 
nvmem_bin_ro_root_group = {
  	.attrs		= nvmem_attrs,
  };

-static const struct attribute_group *nvmem_ro_root_dev_groups[] = {
+static const __maybe_unused struct attribute_group 
*nvmem_ro_root_dev_groups[] = {
  	&nvmem_bin_ro_root_group,
  	NULL,
  };
@@ -688,6 +688,7 @@ struct nvmem_device *nvmem_register(const struct 
nvmem_config *config)
  	nvmem->read_only = device_property_present(config->dev, "read-only") |
  			   config->read_only;

+#if !defined(CONFIG_NVMEM_NO_SYSFS_ENTRY)
  	if (config->root_only)
  		nvmem->dev.groups = nvmem->read_only ?
  			nvmem_ro_root_dev_groups :
@@ -696,7 +697,7 @@ struct nvmem_device *nvmem_register(const struct 
nvmem_config *config)
  		nvmem->dev.groups = nvmem->read_only ?
  			nvmem_ro_dev_groups :
  			nvmem_rw_dev_groups;
-
+#endif
  	device_initialize(&nvmem->dev);

  	dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
-- 
2.21.0
