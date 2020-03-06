Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90B2517C946
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 01:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgCGAAd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 19:00:33 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43159 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgCGAAc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 19:00:32 -0500
Received: by mail-pf1-f196.google.com with SMTP id c144so1858776pfb.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 16:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mRf7ifgX7zbaVmn4NjSkySRjH8oQPa4m1mLq8CgIprc=;
        b=ZAp5Fm6dpDpVjUdraWnOpQsptURIcZwYpytZSVu+fMPEKSrjimoeHYaUHkH7jZTVKR
         vffXeuouP4jlQWxxYQRpZFjkQJfl3sPXKW4s52ci0BKa1Y+1JS19nEat043+XbAiUMer
         Hl6H8k0VMX3V1CJmew66wRlji6TFJlOML9TT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mRf7ifgX7zbaVmn4NjSkySRjH8oQPa4m1mLq8CgIprc=;
        b=pgrbb9cK2TL8CxnrMqUwsLcOmB2Z4DmbVeyOwfX7yPv5dF/ltCOGxpJzqh4yYklVu+
         TRVM9tIExZYMJMJBKm5OARZ51MX6IspooUKNAQoY0vQO1l5CvvwQ1/u7O6d7cG70aNCd
         penHubM9CiNECBHfudRfX4zY7x8REwRv0uj+EzDNPpLkQsX3pev/29W11dwX1fpcWqNm
         RFCQafDh88qbaZu/jAUts6L6rOsntBQMIkO2bML3YmJE5yGqnlte+sb/SeW2T5vcOgI3
         jZivZcQfGkBEKm4o7tjygZTaHU3A2iY2OHu3ZNz7gM25e8gVnLQ/gQIC2g8N6gjAjCZB
         csIw==
X-Gm-Message-State: ANhLgQ0NzdYIpxma0pRGLTi+Ee3Ao3OaMHz2A+FhvUZhx4QyMZpL9gH3
        WeoqfhvoGoSFW8VyqyzG91vvdg==
X-Google-Smtp-Source: ADFU+vtkomkxgMKcVnN3kivqhu2On7dz8E96mTuuCr4xI+v38xMJHA54SjCqeH6gBm3Te2cwQnq+Yg==
X-Received: by 2002:a63:f757:: with SMTP id f23mr5568459pgk.223.1583539230403;
        Fri, 06 Mar 2020 16:00:30 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 9sm32302246pge.65.2020.03.06.16.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 16:00:29 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        evgreen@chromium.org, swboyd@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH 8/9] drivers: qcom: rpmh-rsc: spin_lock_irqsave() for tcs_invalidate()
Date:   Fri,  6 Mar 2020 15:59:50 -0800
Message-Id: <20200306155707.RFT.8.I07c1f70e0e8f2dc0004bd38970b4e258acdc773e@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200306235951.214678-1-dianders@chromium.org>
References: <20200306235951.214678-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Auditing tcs_invalidate() made me worried.  Specifically I saw that it
used spin_lock(), not spin_lock_irqsave().  That always worries me.

As I understand it, using spin_lock() is only valid in these
situations:

a) You know you are running in the interrupt handler (and all other
   users of the lock use the "irqsave" variant).
b) You know that nobody using the lock is ever running in the
   interrupt handler.
c) You know that someone else has always disabled interrupts before
   your code runs and thus the "irqsave" variant is pointless.

From auditing the driver we look OK.  ...except that there is one
further corner case.  If sometimes your code is called with IRQs
disabled and sometimes it's not you will get in trouble if someone
ever boots your board with "nosmp" (AKA in uniprocessor mode).  In
such a case if someone else has the lock (without disabling
interrupts) and they get swapped out then your code (with interrupts
disabled) might loop forever waiting for the spinlock.

It's just safer to use the irqsave version, so let's do that.  In
future patches I believe tcs_invalidate() will always be called with
interrupts off anyway.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/rpmh-rsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 693873fce895..0297da5ceeaa 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -210,9 +210,10 @@ static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
 static int tcs_invalidate(struct rsc_drv *drv, int type)
 {
 	int m;
+	unsigned long flags;
 	struct tcs_group *tcs = &drv->tcs[type];
 
-	spin_lock(&tcs->lock);
+	spin_lock_irqsave(&tcs->lock, flags);
 	if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS)) {
 		spin_unlock(&tcs->lock);
 		return 0;
@@ -227,7 +228,7 @@ static int tcs_invalidate(struct rsc_drv *drv, int type)
 		write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, m, 0);
 	}
 	bitmap_zero(tcs->slots, MAX_TCS_SLOTS);
-	spin_unlock(&tcs->lock);
+	spin_unlock_irqrestore(&tcs->lock, flags);
 
 	return 0;
 }
-- 
2.25.1.481.gfbce0eb801-goog

