Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C693481E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 20:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237879AbhCXT3X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 15:29:23 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:55796 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237639AbhCXT24 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 15:28:56 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Mar 2021 12:28:56 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 24 Mar 2021 12:28:55 -0700
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id EB4081A0C; Wed, 24 Mar 2021 12:28:55 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Mark Brown <broonie@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v5 2/2] regmap-irq: Add driver callback to configure virtual regs
Date:   Wed, 24 Mar 2021 12:28:54 -0700
Message-Id: <07e058cdec2297d15c95c825aa0263064d962d5a.1616613838.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1616613838.git.gurus@codeaurora.org>
References: <cover.1616613838.git.gurus@codeaurora.org>
In-Reply-To: <cover.1616613838.git.gurus@codeaurora.org>
References: <cover.1616613838.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable drivers to configure and modify "virtual" registers, which are
non-standard registers that further configure irq type on some devices.
Since they are non-standard, enable drivers to configure them according
to their particular idiosyncrasies by specifying an optional callback
function while registering with the framework.

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/base/regmap/regmap-irq.c | 5 +++++
 include/linux/regmap.h           | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index d1ade76..e6343ccc 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -333,6 +333,11 @@ static int regmap_irq_set_type(struct irq_data *data, unsigned int type)
 	default:
 		return -EINVAL;
 	}
+
+	if (d->chip->set_type_virt)
+		return d->chip->set_type_virt(d->virt_buf, type, data->hwirq,
+					      reg);
+
 	return 0;
 }
 
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 97ec733..f87a11a 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1426,6 +1426,8 @@ struct regmap_irq_sub_irq_map {
  *		     before regmap_irq_handler process the interrupts.
  * @handle_post_irq: Driver specific callback to handle interrupt from device
  *		     after handling the interrupts in regmap_irq_handler().
+ * @set_type_virt:   Driver specific callback to extend regmap_irq_set_type()
+ *		     and configure virt regs.
  * @irq_drv_data:    Driver specific IRQ data which is passed as parameter when
  *		     driver specific pre/post interrupt handler is called.
  *
@@ -1473,6 +1475,8 @@ struct regmap_irq_chip {
 
 	int (*handle_pre_irq)(void *irq_drv_data);
 	int (*handle_post_irq)(void *irq_drv_data);
+	int (*set_type_virt)(unsigned int **buf, unsigned int type,
+			     unsigned long hwirq, int reg);
 	void *irq_drv_data;
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

