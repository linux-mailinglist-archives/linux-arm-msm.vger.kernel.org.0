Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869CC466395
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 13:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358175AbhLBM0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 07:26:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358160AbhLBMZJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 07:25:09 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950D8C0613F4
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 04:21:47 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 8so27736193pfo.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 04:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=LsxKFgbA+2a30DaeYBmMw8z7MNrrzz/s3NCf5D9i1bU=;
        b=dLAnxQnv0982QXUGwuQ6KhTvaD0igCyDS0SutKUzJDwjM1ssi5Z44pARn1z2wkp8B7
         MAnTs8ag8dj8PJx7E1WKW5z9LjEodx+/FKRvy1xqg9pHd9fHuCdAyUxb0mOpdv77xCwG
         rIPoeA4gzL7RTB5xmM3GrFA+tAOcPNYJFdMjOfgL06iTxFDXCaWVp9mzE9YO5i1EUIqp
         bF3paukWFJeb2c/yRyKdnB03R2FJgq7uafH/TtXuG+hIgi6Wj7xub8+YnzAfyi3eFNFr
         262D6XLlL7YbzvxJy2PNS7oMt+qczQ8bu+EMYo+yDAiRJ76ESVC/407uJV500JSyMoNJ
         fWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LsxKFgbA+2a30DaeYBmMw8z7MNrrzz/s3NCf5D9i1bU=;
        b=og9027o/qzgDU5zkgzS3JZZRrVDr2U+NUpgDAGvUuZId70vUO0XBgfC58XjSMAoVGs
         YpaDyJvJ+ctZiR7ZoX7jAlVHBcurwnD/VgXVkPEWfcjGrvYcZTYBt/zztTSHLvvl6zYS
         jMPTKkZaLjhph+0wgtMFBTs8xscsQ0oWVT/g3XGz44ldAvYW7b0QJsWdtLHVv9p+lLPo
         4FFr20VMWZXfoMb03vVecATOkfHcePEM37UqFmQt/D+CSrMQpe1O5xAFZOPiE2ufmLtn
         eab5JCeKIK16wbcdMs0sGXU8r5GX9ZqePDu10TdP78Qu3QiGe5wVcOcY6xsdSVeG9pmj
         wFMQ==
X-Gm-Message-State: AOAM532I5t0ou8hgcxAMQinoM2e+5k9LV2UD/FPkMq7SJPXNAFafK+Ge
        kt4QRHaxIIFeELQY1Gwjn7TxGg==
X-Google-Smtp-Source: ABdhPJzCrqzJXH96Z5MROayhEQfo213eXrRiFyMC/oAULHnau5lYrdt/lRIQ6By8zsupJT8o9z8VXg==
X-Received: by 2002:a63:d651:: with SMTP id d17mr5702769pgj.529.1638447707070;
        Thu, 02 Dec 2021 04:21:47 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id m15sm3608894pfk.186.2021.12.02.04.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 04:21:46 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/3] Add Qualcomm MPM irqchip driver support
Date:   Thu,  2 Dec 2021 20:21:19 +0800
Message-Id: <20211202122122.23548-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It updates IRQCHIP_PLATFORM_DRIVER infrastructural to pass
platform_device pointer to init_cb.  On top of that, add DT binding
and driver support for Qualcomm MPM (MSM Power Manager) interrupt
controller.

Changes for v3:
- Support module build
- Use relaxed accessors
- Add barrier call to ensure MMIO write completes
- Use d->chip_data to pass driver private data
- Use raw spinlock
- USe BIT() for bit shift
- Create a single irq domain to cover both types of MPM pins
- Call irq_resolve_mapping() to find out Linux irq number
- Save the use of ternary conditional operator and use switch/case for
  .irq_set_type call
- Drop unnecessary .irq_disable hook
- Align qcom_mpm_chip and qcom_mpm_ops members vertically
- Use helper irq_domain_translate_twocell()
- Move mailbox requesting forward in probe function
- Improve the documentation on qcm2290_gic_pins[]
- Use IRQCHIP_PLATFORM_DRIVER infrastructural
- Use cpu_pm notifier instead of .suspend_late hook to write MPM for
  sleep, so that MPM can be set up for both suspend and idle context.
  The TIMER0/1 setup is currently omitted for idle use case though,
  as I haven't been able to successfully test the idle context.


Shawn Guo (3):
  irqchip: Pass platform_device pointer to init_cb
  dt-bindings: interrupt-controller: Add Qualcomm MPM support
  irqchip: Add Qualcomm MPM controller driver

 .../interrupt-controller/qcom,mpm.yaml        |  72 +++
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-bcm7038-l1.c              |   3 +-
 drivers/irqchip/irq-bcm7120-l2.c              |  10 +-
 drivers/irqchip/irq-brcmstb-l2.c              |  10 +-
 drivers/irqchip/irq-mchp-eic.c                |   4 +-
 drivers/irqchip/irq-meson-gpio.c              |   7 +-
 drivers/irqchip/irqchip.c                     |   4 +-
 drivers/irqchip/qcom-mpm.c                    | 481 ++++++++++++++++++
 drivers/irqchip/qcom-pdc.c                    |   4 +-
 include/linux/irqchip.h                       |   8 +-
 12 files changed, 596 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
 create mode 100644 drivers/irqchip/qcom-mpm.c

-- 
2.17.1

