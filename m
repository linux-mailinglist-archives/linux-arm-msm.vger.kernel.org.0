Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9481825A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731520AbgCKXOX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:14:23 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37889 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731513AbgCKXOX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:14:23 -0400
Received: by mail-pl1-f194.google.com with SMTP id w3so1824928plz.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3xshg7ExKoZEQ1cmRMbwPGjLTkGkDqXFoENhWmw2kvw=;
        b=B7/KZHMfx/pmxw43ZXgtosczRo5w1B5pV4DwD4I7ocTJtH/KHnLq5kPOgKQIwkyF2W
         eAYNB5zzBdc1/Ow+NeqHY/wrbNlnUfUt4OLrGRyGiCDBdwW/SzD8W6WKyk6ADh36204z
         KoRbmp5/BFJPsG3fxhNoK/HnTXDX3Cve4EjkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3xshg7ExKoZEQ1cmRMbwPGjLTkGkDqXFoENhWmw2kvw=;
        b=ueZMKQyVjSm/N1h+KOXF+t/BhOMNBYm3qx0w72p28cn2DUCvsGpCqIaKiwvgdL2Dji
         ZTnjhRbVI+hmreavLkenG7cNh5SLul+6yXJ5RMQYRwyZoEHIxLGb1UqoD1DOB5KfL5df
         jFimqwfCYn3PYAtMH0wEfXH7ViLjYSlOyY49+JjYCDqv6kN9GzeevtABLHQHdAoSDJzn
         7jZd9ufGYRsV+Fk6zHVegDQJCtSmf1dCwBFcLXxbPKWOlZv5uz9CvFF6JCzJVytcF7JA
         zPwZo7aBYEJ3CK2aP++2osNqAQv0sCCQpcTDG7XzpjuHvhyIov+wn/Py9u0dBMtcmwDr
         7aew==
X-Gm-Message-State: ANhLgQ1DzNoScsFyu4Sdg7xHy55G54qiaeysK/Y1ITyFmQaLXzkIjXw8
        y7cUcB8S25skE9uHPJnlkjBW+A==
X-Google-Smtp-Source: ADFU+vtJPb7raHtNVcBlj/4DXcl6eXZsrwxmV0Q1tUcIzYLc0r3sj7CGDQOd1wc55wtMz5uc24ug5Q==
X-Received: by 2002:a17:90a:de16:: with SMTP id m22mr1086840pjv.142.1583968461826;
        Wed, 11 Mar 2020 16:14:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id g75sm2606334pje.37.2020.03.11.16.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:14:21 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 08/10] drivers: qcom: rpmh-rsc: spin_lock_irqsave() for tcs_invalidate()
Date:   Wed, 11 Mar 2020 16:13:46 -0700
Message-Id: <20200311161104.RFT.v2.8.I07c1f70e0e8f2dc0004bd38970b4e258acdc773e@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200311231348.129254-1-dianders@chromium.org>
References: <20200311231348.129254-1-dianders@chromium.org>
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

Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index ba489d18c20e..c82c734788b1 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -218,9 +218,10 @@ static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
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
@@ -235,7 +236,7 @@ static int tcs_invalidate(struct rsc_drv *drv, int type)
 		write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, m, 0);
 	}
 	bitmap_zero(tcs->slots, MAX_TCS_SLOTS);
-	spin_unlock(&tcs->lock);
+	spin_unlock_irqrestore(&tcs->lock, flags);
 
 	return 0;
 }
-- 
2.25.1.481.gfbce0eb801-goog

