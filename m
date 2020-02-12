Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD7415A61F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 11:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbgBLKS6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 05:18:58 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:47754 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727592AbgBLKS6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 05:18:58 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id 1mJu220035USYZQ01mJu7N; Wed, 12 Feb 2020 11:18:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1p6c-0001Nr-1e; Wed, 12 Feb 2020 11:18:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1p6c-0002RW-0b; Wed, 12 Feb 2020 11:18:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: dwc3: qcom: Replace <linux/clk-provider.h> by <linux/of_clk.h>
Date:   Wed, 12 Feb 2020 11:18:53 +0100
Message-Id: <20200212101853.9349-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DWC3 USB driver is not a clock provider, and just needs to call
of_clk_get_parent_count().

Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 261af9e38dddf5cb..1dfd024cd06b11ff 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -9,7 +9,7 @@
 #include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/irq.h>
-#include <linux/clk-provider.h>
+#include <linux/of_clk.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/extcon.h>
-- 
2.17.1

