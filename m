Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA87872270
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 00:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbfGWWfX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 18:35:23 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39912 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfGWWfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 18:35:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so20116888pgi.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 15:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BaDjXD/RG0kyUThXx34ExLwb9nVm9t9Qz5HyHcuaCuk=;
        b=XU4E26h8825oOZUQmz4kbSqxedrUdNsyKDmDiQsMbLg6pw7auVMAtsRu03LejgQ56J
         tFpYlWDrQVv0NOtgBqFxgxvRvP39mlEoLRwpVpH189VNdu4MA2CRblZW4bAkICmxxU8d
         cTlOGMH36GlIZnkAjRuNg24F93lggpVYRdewrczApUM1I3GqDS5Dxfv4lcBjDr7QgGwi
         4NWeC+mw9uxYNS+A+nyG3Qew8V2SQkjbg9nepj4Vfehg7MAnHAC2zLPrfPwOSe9X9rlR
         FZj/k25TgdO7Wa96kn7IMSyfu+nk1xDn8osBlF/nbPOJ76Ua87y/ZsSsBmwOIhUr8G0H
         1tUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BaDjXD/RG0kyUThXx34ExLwb9nVm9t9Qz5HyHcuaCuk=;
        b=NYbeWLeB/XXoLE7Jyi2cwReAkpgNml4JtgCWCSpIkyE752svYVrn6XSjMLE6zeaBkD
         M0m4ZQt+GyyqUhv+AvxNYYmexor98dSPw2cQsaL93Cv4uM3rCohHKhe6RT0KI3D27Xul
         bzo2yMj+LGdugTJgK9vuVSx/t89HzYPffh337JyGkegPx6CkP6YdyrBq2V1l0qr5GTDm
         Zu9ZbRte/2G9VVIJvo96K/WGeVOhwwooSK0Wl0N5rSeQixqn22GBdW5FyY67+21AIpD6
         VkQvVHPDlLNJ+X2vCCQSnH13D6S9a9CqT+aKHuzM/+GVqw+ET/sVmBxotrV5cNbL42PD
         /+vw==
X-Gm-Message-State: APjAAAWDNCSrIizJTNcDv/KtlpEu2koSwEoFL6BQy0fQU1fE3Po5V2qP
        98SsD0VR7XR6IBwGpckYA/52oA==
X-Google-Smtp-Source: APXvYqxGklNuxBHWG/GtaQWMvTSDu9V41SozepAGSY3TA8rYq22Bm5hZOIEHU+MHeNVO0dpeqGfbCQ==
X-Received: by 2002:a17:90a:970a:: with SMTP id x10mr85475018pjo.12.1563921322290;
        Tue, 23 Jul 2019 15:35:22 -0700 (PDT)
Received: from localhost.localdomain ([115.99.187.56])
        by smtp.gmail.com with ESMTPSA id h16sm49036917pfo.34.2019.07.23.15.35.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 15:35:21 -0700 (PDT)
From:   Vaishali Thakkar <vaishali.thakkar@linaro.org>
To:     agross@kernel.org
Cc:     david.brown@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        Vaishali Thakkar <vaishali.thakkar@linaro.org>
Subject: [PATCH v6 0/5] soc: qcom: Add SoC info driver
Date:   Wed, 24 Jul 2019 04:05:10 +0530
Message-Id: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds SoC info driver which can provide information
such as Chip ID, Chip family and serial number about Qualcomm SoCs
to user space via sysfs. Furthermore, it allows userspace to get
information about custom attributes and various image version
information via debugfs.

The patchset cleanly applies on top of v5.2-rc7.

Changes since v1:
        - Align ifdefs to left, remove unnecessary debugfs dir
          creation check and fix function signatures in patch 3
        - Fix comment for teh case when serial number is not
          available in patch 1

Changes since v2:
        - Reorder patches [patch five -> patch two]

Changes since v3:
        - Add reviewed-bys from Greg
        - Fix build warning when debugfs is disabled
        - Remove extra checks for dir creations in patch 5

Changes since v4:
	- Added Reviewed-bys in multiple patches
	- Bunch of nitpick fixes in patch 3
	- Major refactoring for using core debugfs functions and
	  eliminating duplicate code in patch 4 and 5 [detailed info
	  can be found under --- in each patch]

Changes since v5:
	- No code changes, fix diff.context setting for formatting
	  patches. Version 4 was adding context at the bottom of
	  the file with 'git am'. 

Vaishali Thakkar (5):
  base: soc: Add serial_number attribute to soc
  base: soc: Export soc_device_register/unregister APIs
  soc: qcom: Add socinfo driver
  soc: qcom: socinfo: Expose custom attributes
  soc: qcom: socinfo: Expose image information

 Documentation/ABI/testing/sysfs-devices-soc |   7 +
 drivers/base/soc.c                          |   9 +
 drivers/soc/qcom/Kconfig                    |   8 +
 drivers/soc/qcom/Makefile                   |   1 +
 drivers/soc/qcom/smem.c                     |   9 +
 drivers/soc/qcom/socinfo.c                  | 468 ++++++++++++++++++++
 include/linux/sys_soc.h                     |   1 +
 7 files changed, 503 insertions(+)
 create mode 100644 drivers/soc/qcom/socinfo.c

-- 
2.17.1

