Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457C83BDC2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 19:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhGFRXq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 13:23:46 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35656 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230382AbhGFRXp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 13:23:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625592067; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=xy4ZvYhsvO9FQlRMkSv7dJTwcvw9Xjfm9z8CIXSRBZ4=; b=c++5AJ4S1qbRkEuSjK37K5X+l9D4sOo7N559/vHEsA/tqiBHu405Jk4eBZ8iBmbEDzsg/jE2
 QPqLHlDxz5LhB5OjYaPNaYOntP0duxzzaAMB28s9tirMGxXAYXpMkNd+qY1utwqHh0rELe1Z
 hO1/y8bRnjQ9NUBn6MwN7wzC9zw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60e490eff304298614327757 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Jul 2021 17:20:47
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90D31C43146; Tue,  6 Jul 2021 17:20:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B265C4338A;
        Tue,  6 Jul 2021 17:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B265C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] drm/msm/dp: replug event is converted into an unplug followed by an plug events
Date:   Tue,  6 Jul 2021 10:20:17 -0700
Message-Id: <1625592020-22658-5-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove special handling of replug interrupt and instead treat replug event
as a sequential unplug followed by a plugin event. This is needed to meet
the requirements of DP Link Layer CTS test case 4.2.1.3.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 78c5301..d089ada 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1146,9 +1146,6 @@ static int hpd_event_thread(void *data)
 		case EV_IRQ_HPD_INT:
 			dp_irq_hpd_handle(dp_priv, todo->data);
 			break;
-		case EV_HPD_REPLUG_INT:
-			/* do nothing */
-			break;
 		case EV_USER_NOTIFICATION:
 			dp_display_send_hpd_notification(dp_priv,
 						todo->data);
@@ -1192,10 +1189,8 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 
 	if (hpd_isr_status & 0x0F) {
 		/* hpd related interrupts */
-		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK ||
-			hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
+		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
 			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
-		}
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
 			/* stop sentinel connect pending checking */
@@ -1203,8 +1198,10 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 		}
 
-		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK)
-			dp_add_event(dp, EV_HPD_REPLUG_INT, 0, 0);
+		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
+			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+		}
 
 		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
 			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

