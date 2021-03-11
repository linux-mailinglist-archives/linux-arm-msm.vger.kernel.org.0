Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB59233690E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 01:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhCKAkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 19:40:25 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:36569 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229570AbhCKAj5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 19:39:57 -0500
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Mar 2021 16:39:57 -0800
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg03-sd.qualcomm.com with ESMTP; 10 Mar 2021 16:39:57 -0800
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id 1908618EE; Wed, 10 Mar 2021 16:39:56 -0800 (PST)
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
Subject: [RFC PATCH v3 3/3] regmap-irq: Modify type_buf handling for IRQ_TYPE_LEVEL_*
Date:   Wed, 10 Mar 2021 16:39:54 -0800
Message-Id: <46a360a9dff869606a417364a0a76c8ec4d0d4c9.1615423027.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1615423027.git.gurus@codeaurora.org>
References: <cover.1615423027.git.gurus@codeaurora.org>
In-Reply-To: <cover.1615423027.git.gurus@codeaurora.org>
References: <cover.1615423027.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to configure LEVEL_HIGH and LEVEL_LOW for QCOM's type
registers, the bit corresponding to the interrupt must be cleared.

Therefore, in QCOM's case, the type_*_val are all to be configured as
BIT() masks.

Quite clearly, this is a fundamental change, and am looking for feedback
on whether and how this may be handled in a generic manner.

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/base/regmap/regmap-irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index cb13855..c70ef90 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -327,11 +327,11 @@ static int regmap_irq_set_type(struct irq_data *data, unsigned int type)
 		break;
 
 	case IRQ_TYPE_LEVEL_HIGH:
-		d->type_buf[reg] |= t->type_level_high_val;
+		d->type_buf[reg] &= t->type_level_high_val;
 		break;
 
 	case IRQ_TYPE_LEVEL_LOW:
-		d->type_buf[reg] |= t->type_level_low_val;
+		d->type_buf[reg] &= t->type_level_low_val;
 		break;
 	default:
 		return -EINVAL;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

