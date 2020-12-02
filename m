Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723772CB94D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbgLBJnF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:43:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729267AbgLBJnF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:43:05 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFDF8C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:42:24 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id r9so693766pjl.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=roXoJh4JMg0Rq6G/VrtXGfkTYMo58Mv8/81ld8N44p8=;
        b=xtQjrYDgOBB4kq11qRodiLmJDd0Qi/kKKsbcC1rTsvT1V05BD5XCzF/+7NuRaWd3z9
         3QWbf8srShDNJZ4I6mLOW3DOwo5Ugx4XsWzNdQwR6OqkdwoTm+lvm3HqTV3T0z69/ZQx
         1u5EqAWSSoPNbfa6PNQSfhPXAyHUzzTbbI9c+vwIS2zuiPZphf1gcoMHwpN+xOxs1BAc
         xENgHlzT9XAgI3+DdONeavDHqPdUNPG07iBz6H4kt4bVTyl3zUIim7AV7q3zDOW7cJi6
         p5oFBfuv7Hl7juAxmbmrwDneUJyOGkm/juhyLWhFawjdi09vB5LlkTrPhvjDdgBHZfU7
         Rokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=roXoJh4JMg0Rq6G/VrtXGfkTYMo58Mv8/81ld8N44p8=;
        b=KcJ0kdAjzgsMd16Fnq49OdZoOuzkYUPm95dOIpJY+YKNpxR0SUgNcvVMB+bViSWl2U
         k4EoX2QSqZlG8XjtCVIthdNuGjWH6GmQh/x7n9NaqBrot2IyToz91SpQLxJci/7ZOx6v
         WwyndpgeB1EcSicAKnMTmhmEExDHRyQpoY9kBJiM0nI1IiEj7S//7sSFa265lUikWnUK
         jJZlQd8XuhnIcDOoOtr80aJmnfGcxcJRKpZ98fb0drFVRIvjo6cHIcdW8AO/d0VGHIE0
         8tjqmlIKcH6Xa1nNkEbb9LLctvjd0Tk3hHFwjIg7Pnculzn4n3Ldc+LziiVzz5JyYocd
         MQxw==
X-Gm-Message-State: AOAM531nxklKQqX1ai/Khz172Ct2mLsTIX9OST5uqcU3Kooz6PgqBnSX
        22lHPEFjS2RlARuAbwQY4yC3
X-Google-Smtp-Source: ABdhPJxLukJAMewy81MmakPw2U/0HEDA1fWdGZQU9O1Ykax9RlWWa9kMhCHJmCXKomZXl6nKl/C4KQ==
X-Received: by 2002:a17:90a:9e5:: with SMTP id 92mr1638972pjo.176.1606902144334;
        Wed, 02 Dec 2020 01:42:24 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:42:23 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/29] MHI changes for v5.11
Date:   Wed,  2 Dec 2020 15:11:30 +0530
Message-Id: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the MHI patch series for v5.11. It was a busy cycle for us and so far we
have accumulated almost 29 patches. Most of the patches are cleanups and fixes
but there are some noticeable changes too:

1. Loic finally removed the auto-start option from the channel parameters of the
MHI controller. It is the duty of the client drivers like qrtr to start/stop the
channels when required, so we decided to remove this option. As a side effect,
we changed the qrtr driver to start the channels during its probe and removed
the auto-start option from ath11k controller.

**NOTE** Since these changes spawns both MHI and networking trees, the patches
are maintained in an immutable branch [1] and pulled into both mhi-next and
ath11k-next branches. The networking patches got acks from ath11k and networking
maintainers as well.

2. Loic added a generic MHI pci controller driver. This driver will be used by
the PCI based Qualcomm modems like SDX55 and exposes channels such as QMI,
IP_HW0, IPCR etc...

3. Loic fixed the MHI device hierarchy by maintaining the correct parent child
relationships. Earlier all MHI devices lived in the same level under the parent
device like PCIe. But now, the MHI devices belonging to channels will become the
children of controller MHI device.

4. Finally Loic also improved the MHI device naming by using indexed names such
as mhi0, mhi1, etc... This will break the userspace applications depending on
the old naming convention but since the only one user so far is Jeff Hugo's AI
accelerator apps, we decided to make this change now itself with his agreement.

5. Bhaumik fixed the qrtr driver by stopping the channels during remove. This
patch also got ack from networking maintainer and we decided to take it through
MHI tree (via immutable branch) since we already had a qrtr change.

Please consider applying!

Thanks,
Mani

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-ath11k-immutable

Bhaumik Bhatt (19):
  bus: mhi: core: Remove unnecessary counter from mhi_firmware_copy()
  bus: mhi: core: Add missing EXPORT_SYMBOL for mhi_get_mhi_state()
  bus: mhi: core: Expose mhi_get_exec_env() API for controllers
  bus: mhi: core: Remove unused mhi_fw_load_worker() declaration
  bus: mhi: core: Rename RDDM download function to use proper words
  bus: mhi: core: Skip RDDM download for unknown execution environment
  bus: mhi: core: Use appropriate names for firmware load functions
  bus: mhi: core: Move to using high priority workqueue
  bus: mhi: core: Skip device wake in error or shutdown states
  bus: mhi: core: Move to SYS_ERROR regardless of RDDM capability
  bus: mhi: core: Prevent sending multiple RDDM entry callbacks
  bus: mhi: core: Move to an error state on any firmware load failure
  bus: mhi: core: Use appropriate label in firmware load handler API
  bus: mhi: core: Move to an error state on mission mode failure
  bus: mhi: core: Check for IRQ availability during registration
  bus: mhi: core: Separate system error and power down handling
  bus: mhi: core: Mark and maintain device states early on after power
    down
  bus: mhi: core: Remove MHI event ring IRQ handlers when powering down
  net: qrtr: Unprepare MHI channels during remove

Carl Yin (1):
  bus: mhi: core: Fix null pointer access when parsing MHI configuration

Dan Carpenter (1):
  bus: mhi: core: Fix error handling in mhi_register_controller()

Jeffrey Hugo (1):
  bus: mhi: core: fix potential operator-precedence with BHI macros

Loic Poulain (7):
  bus: mhi: Remove auto-start option
  net: qrtr: Start MHI channels during init
  bus: mhi: Add MHI PCI support for WWAN modems
  bus: mhi: Fix channel close issue on driver remove
  bus: mhi: core: Indexed MHI controller name
  bus: mhi: core: Fix device hierarchy
  mhi: pci_generic: Fix implicit conversion warning

-- 
2.25.1

