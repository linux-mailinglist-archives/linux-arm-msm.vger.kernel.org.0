Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCEF921A9AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 23:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgGIVXK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 17:23:10 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:26675 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726196AbgGIVXK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 17:23:10 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Jul 2020 14:23:09 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg05-sd.qualcomm.com with ESMTP; 09 Jul 2020 14:23:09 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 9A89F181; Thu,  9 Jul 2020 14:23:09 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Veera Vegivada <vvegivad@codeaurora.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v1 2/2] thermal: qcom-spmi-temp-alarm: Don't suppress negative temp
Date:   Thu,  9 Jul 2020 14:23:08 -0700
Message-Id: <db8ac636dc4a2f8cff45f8131bf196998134cd07.1594329558.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <d8b145ca2147e366c1d0fd2fd718dc355cc73483.1594329558.git.gurus@codeaurora.org>
References: <d8b145ca2147e366c1d0fd2fd718dc355cc73483.1594329558.git.gurus@codeaurora.org>
In-Reply-To: <d8b145ca2147e366c1d0fd2fd718dc355cc73483.1594329558.git.gurus@codeaurora.org>
References: <d8b145ca2147e366c1d0fd2fd718dc355cc73483.1594329558.git.gurus@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Veera Vegivada <vvegivad@codeaurora.org>

Currently driver is suppressing the negative temperature
readings from the vadc. Consumers of the thermal zones need
to read the negative temperature too. Don't suppress the
readings.

Signed-off-by: Veera Vegivada <vvegivad@codeaurora.org>
Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index 05a9601..6d8f090 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2011-2015, 2017, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2011-2015, 2017, 2020, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/bitops.h>
@@ -212,7 +212,7 @@ static int qpnp_tm_get_temp(void *data, int *temp)
 		chip->temp = mili_celsius;
 	}
 
-	*temp = chip->temp < 0 ? 0 : chip->temp;
+	*temp = chip->temp;
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

