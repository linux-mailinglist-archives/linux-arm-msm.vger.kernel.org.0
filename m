Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2360D3C8040
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 10:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238619AbhGNIg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 04:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238626AbhGNIg1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 04:36:27 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F0EC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 01:33:35 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id v7so1669444pgl.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 01:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8H/NjbSTYCmJ9koYtNuq8BZ7OvXAlUKZqFY+qWvHhMM=;
        b=yr3HTmFP8ucDPkLujaUvJXMdTiQdMdqyLhKe7FifM76X+Q00JmXCzgurrkVL1u3O6p
         m+ZcaQYKDjYF5wUobduzgIvinTq3c9NXzGGG4jXwdojjFxuli+vpxFt2ypJyNX781vli
         EG5IWpqZNgjd6Gd3M0SW/WeFpJdwVRExSKVad01BrmCMavAvZSvRLnylv1TmlTW4RpDl
         3YVvtywQZfGVJZ65mGax45WQR1K8+KpbMiF+5p+sD3sH5a2QmJ37DhuNk8r/j9MxD5yy
         UcpJegtQ+xuLukUUGOYZw0ZJLKP2pMtO3pObUsIIR5qXtYMVG28AyJ09Li5RK0IA/n3M
         Yvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8H/NjbSTYCmJ9koYtNuq8BZ7OvXAlUKZqFY+qWvHhMM=;
        b=GQ/q2DsTKBGztRq9BrHMPWENaAM7wmnFzoSl6ryD5TL8WZsxaOpx0rI/YZSQJv8XmQ
         dso+MDVYVOGqgaDlZ/ZqKd4jI04nhNHJueUGBuZydJGvWDPQZiVN/DnwYwrhwQiWmlLG
         zVIzplulKh33QuXlPD9DHnCnxBbgFluNUKaDlIniibQc7owcQK1qTlCG6pbaEP8yglUc
         Mrn5+ton1TYMUhS6eEBQwxCdY1osJQWGhTnkDKixVF9ikiRW3KRTB5weRhD03XpnZ9Fw
         vcxTN0LmaDEgExyHjHGyrsuNCvzS86buh1yqBnaWbWndMnGmUByT7TuAKAukVyFWD0Wm
         M8fg==
X-Gm-Message-State: AOAM530i/u3fWsQz5t6IelvpHGXVpD5OBSNQuiLBUeeZx7Y/uM8jMjGd
        GccvFw0Czz3k/9faj6IupMFe
X-Google-Smtp-Source: ABdhPJxmZWsKUT+rPK6U75ajqELjtKUAAdrawjsGz2vibQhnQosg5YkobFoAZTCEycUwE42/cU+4aA==
X-Received: by 2002:a65:528d:: with SMTP id y13mr8570829pgp.276.1626251614838;
        Wed, 14 Jul 2021 01:33:34 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.241])
        by smtp.gmail.com with ESMTPSA id p40sm1774446pfw.79.2021.07.14.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 01:33:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, lorenzo.pieralisi@arm.com, bhelgaas@google.com,
        robh@kernel.org
Cc:     devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, smohanad@codeaurora.org,
        bjorn.andersson@linaro.org, sallenki@codeaurora.org,
        skananth@codeaurora.org, vpernami@codeaurora.org,
        vbadigan@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 0/3] Add Qualcomm PCIe Endpoint driver support
Date:   Wed, 14 Jul 2021 14:03:13 +0530
Message-Id: <20210714083316.7835-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds support for Qualcomm PCIe Endpoint controller found
in platforms like SDX55. The Endpoint controller is based on the designware
core with additional Qualcomm wrappers around the core.

The driver is added separately unlike other Designware based drivers that
combine RC and EP in a single driver. This is done to avoid complexity and
to maintain this driver autonomously.

The driver has been validated with an out of tree MHI function driver on
SDX55 based Telit FN980 EVB connected to x86 host machine over PCIe.

Thanks,
Mani

Changes in v6:

* Removed status property in DT and added reviewed tag from Rob
* Switched to _relaxed variants as suggested by Rob

Changes in v5:

* Removed the DBI register settings that are not needed
* Used the standard definitions available in pci_regs.h
* Added defines for all the register fields
* Removed the left over code from previous iteration

Changes in v4:

* Removed the active_config settings needed for IPA integration
* Switched to writel for couple of relaxed versions that sneaked in

Changes in v3:

* Lot of minor cleanups to the driver patch based on review from Bjorn and Stan.
* Noticeable changes are:
  - Got rid of _relaxed calls and used readl/writel
  - Got rid of separate TCSR memory region and used syscon for getting the
    register offsets for Perst registers
  - Changed the wake gpio handling logic
  - Added remove() callback and removed "suppress_bind_attrs"
  - stop_link() callback now just disables PERST IRQ
* Added MMIO region and doorbell interrupt to the binding
* Added logic to write MMIO physicall address to MHI base address as it is
  for the function driver to work

Changes in v2:

* Addressed the comments from Rob on bindings patch
* Modified the driver as per binding change
* Fixed the warnings reported by Kbuild bot
* Removed the PERST# "enable_irq" call from probe()

Manivannan Sadhasivam (3):
  dt-bindings: pci: Add devicetree binding for Qualcomm PCIe EP
    controller
  PCI: dwc: Add Qualcomm PCIe Endpoint controller driver
  MAINTAINERS: Add entry for Qualcomm PCIe Endpoint driver and binding

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml | 158 ++++
 MAINTAINERS                                   |  10 +-
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 742 ++++++++++++++++++
 5 files changed, 920 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-qcom-ep.c

-- 
2.25.1

