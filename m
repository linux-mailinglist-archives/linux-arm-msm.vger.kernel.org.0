Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31532452F4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 11:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbhKPKnq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 05:43:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:51658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234330AbhKPKm6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 05:42:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E52960F44;
        Tue, 16 Nov 2021 10:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637059201;
        bh=XQNhhOwY7CNCcEEDeCs8Qr9sMVB4unBMSmPawoOiXGs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KMNXEVQIj5ecNinUXIskocjhA5ebXZHxafEfWSSoyZKscqC676ixPWFVXGxkBLT4l
         E5V4djFgVl6Eru079C3HSPX4bHN84nfILjwqwcaIotCM58/65oICT9MHs2d2qI/E+1
         +7AbIRZ2XiN3GYlbSaWGTjbViUCCWf2KbhD2gBxa+msiIc7+TSzccIUOwHUTNLYMGJ
         QglozS3sdAhomB74li73hx6STbgi1j6rK2OMouTx2492tPhhGK/5VWoNDcLgR6P8GR
         uuoDjp9wZXC9GNxs2KW4XIgMzNs7I5AX3RdHOErYN97xLn2K+LXqh/AgglAO1XX7Qs
         w5YdXj2KBE4mw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] phy: qualcomm: ipq806x-usb: Fix kernel-doc style
Date:   Tue, 16 Nov 2021 16:09:47 +0530
Message-Id: <20211116103951.34482-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116103951.34482-1-vkoul@kernel.org>
References: <20211116103951.34482-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The functions are documented but there were style issues, so fix
the style and add missing description for phy_dwc3

drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:130:
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:174:
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:212: warning:
This comment starts with '/**', but isn't a kernel-doc comment.
Refer Documentation/doc-guide/kernel-doc.rst

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 26 +++++++++++----------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index bfff0c8c9130..e1b8fa911416 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -127,12 +127,13 @@ struct phy_drvdata {
 };
 
 /**
- * Write register and read back masked value to confirm it is written
+ * usb_phy_write_readback - Write register and read back masked value to
+ * confirm it is written
  *
- * @base - QCOM DWC3 PHY base virtual address.
- * @offset - register offset.
- * @mask - register bitmask specifying what should be updated
- * @val - value to write.
+ * @phy_dwc3: QCOM DWC3 PHY base virtual address.
+ * @offset: register offset.
+ * @mask: register bitmask specifying what should be updated
+ * @val: value to write.
  */
 static inline void usb_phy_write_readback(struct usb_phy *phy_dwc3,
 					  u32 offset,
@@ -171,11 +172,11 @@ static int wait_for_latch(void __iomem *addr)
 }
 
 /**
- * Write SSPHY register
+ * usb_ss_write_phycreg - Write SSPHY register
  *
- * @base - QCOM DWC3 PHY base virtual address.
- * @addr - SSPHY address to write.
- * @val - value to write.
+ * @phy_dwc3: QCOM DWC3 PHY base virtual address.
+ * @addr: SSPHY address to write.
+ * @val: value to write.
  */
 static int usb_ss_write_phycreg(struct usb_phy *phy_dwc3,
 				u32 addr, u32 val)
@@ -209,10 +210,11 @@ static int usb_ss_write_phycreg(struct usb_phy *phy_dwc3,
 }
 
 /**
- * Read SSPHY register.
+ * usb_ss_read_phycreg - Read SSPHY register.
  *
- * @base - QCOM DWC3 PHY base virtual address.
- * @addr - SSPHY address to read.
+ * @phy_dwc3: QCOM DWC3 PHY base virtual address.
+ * @addr: SSPHY address to read.
+ * @val: pointer in which read is store.
  */
 static int usb_ss_read_phycreg(struct usb_phy *phy_dwc3,
 			       u32 addr, u32 *val)
-- 
2.31.1

