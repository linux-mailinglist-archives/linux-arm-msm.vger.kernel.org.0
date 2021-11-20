Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA1B457BFB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 07:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235644AbhKTGSo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 01:18:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:57194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234752AbhKTGSn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 01:18:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9924960241;
        Sat, 20 Nov 2021 06:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637388940;
        bh=MwmJXvJiEzl5Za9EAC+KE5v2GyljABkbj0U0pxgAMUI=;
        h=From:To:Cc:Subject:Date:From;
        b=rAstRgHHv4ZxyeMSf0HAMgMKoukvFmhJc2OKCPCz0uhPvkVE0yE341OoH4FW+tIbG
         jEDJPO5ZFnH0/dPIFZc5uxKUIo/L19MJKK2oaYvyIgAgF+ieVQFgyoBZEcJY4zQ37F
         T5z4PtOxsONSCmeKxhgBs6Eav07IwWH82eo2TqgXduSAuRtU7flQm1tCUMccELH73Z
         fhHJ6i0KP5oLZUoOvzJQuCxIn3uC859cOlMv6MOE/29ODIKcbdm49K8WxbSeQvbUYD
         PZP+pr/kS7Hc7CtfliUJlOQSQQJC/UZNATHqmLutLo03hYYeikeMBlRhtjVNYy8QdP
         v11TB/HM5vMYg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 1/2] phy: qualcomm: ipq806x-usb: Fix kernel-doc style
Date:   Sat, 20 Nov 2021 11:45:30 +0530
Message-Id: <20211120061531.410771-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
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

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---

Changes in v2: use () for function names
update description of @phy_dwc3

 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 26 +++++++++++----------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index bfff0c8c9130..fec1da470d26 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -127,12 +127,13 @@ struct phy_drvdata {
 };
 
 /**
- * Write register and read back masked value to confirm it is written
+ * usb_phy_write_readback() - Write register and read back masked value to
+ * confirm it is written
  *
- * @base - QCOM DWC3 PHY base virtual address.
- * @offset - register offset.
- * @mask - register bitmask specifying what should be updated
- * @val - value to write.
+ * @phy_dwc3: QCOM DWC3 phy context
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
+ * usb_ss_write_phycreg() - Write SSPHY register
  *
- * @base - QCOM DWC3 PHY base virtual address.
- * @addr - SSPHY address to write.
- * @val - value to write.
+ * @phy_dwc3: QCOM DWC3 phy context
+ * @addr: SSPHY address to write.
+ * @val: value to write.
  */
 static int usb_ss_write_phycreg(struct usb_phy *phy_dwc3,
 				u32 addr, u32 val)
@@ -209,10 +210,11 @@ static int usb_ss_write_phycreg(struct usb_phy *phy_dwc3,
 }
 
 /**
- * Read SSPHY register.
+ * usb_ss_read_phycreg() - Read SSPHY register.
  *
- * @base - QCOM DWC3 PHY base virtual address.
- * @addr - SSPHY address to read.
+ * @phy_dwc3: QCOM DWC3 phy context
+ * @addr: SSPHY address to read.
+ * @val: pointer in which read is store.
  */
 static int usb_ss_read_phycreg(struct usb_phy *phy_dwc3,
 			       u32 addr, u32 *val)
-- 
2.31.1

