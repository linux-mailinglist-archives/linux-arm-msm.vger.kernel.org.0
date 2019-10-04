Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 672F4CC5D6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 00:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388681AbfJDW1X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 18:27:23 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46329 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388496AbfJDW1R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 18:27:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id q5so4698930pfg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2019 15:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DC2A5jSQG+hIe1l9YvJxvxOzUl1uERA8bQ7DMTBdthc=;
        b=RelufgZ+B/odeePAnM4e87bM9EabciKjaV6lHM4VYkTp/XFzlnEDyH2DNRxjXQF10u
         Y1cX00PxAOrVJXOMVI4Jz5pH6HZB8i2ZgTpxobzNvMAVib5gLlNe5A3fpFX+wEjHeLbj
         Nwnh722lDXKm7pVrndqojqo39nvS0EPkjZmnbvzWXqEcvUUc81j573I2IRNppESFcZ5F
         YSsMlhPDFhMcmTAgawV0PwlSpiD2yzwuqvqvF30LNcae/Vv3w+SsylmXVOuc0gAqGnuJ
         Ngr4Zw88cfUi/DX9COsC/+pNYS9s4O5KBXOW30BztAa/0l7uBPKY/Lp/6wr1WndjPEPK
         Uubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DC2A5jSQG+hIe1l9YvJxvxOzUl1uERA8bQ7DMTBdthc=;
        b=FXIYnerFu+b7UsHhvwcGb+tjYyDvWES6W9oZaIhzRajOguDGk7ConpSFFz6rhV8GGa
         S1a5mpA5ANx8t4W68YIZqRNw2rw00kB6CKwVGXcAZaI0nYiLotAkYHcYPyUMFbQzjjL/
         Wm6W6dWVyComQvv6FNziHSIJ8pg1VNIrTHY0cSj2kPvrIkLt0/dlWnAaRIWzyVheTTzW
         X3pdTMZWEGZmbgCoJnY2uI7WGfSbwNLEek8Knqro7NvYqpx13FwJcYjTTR76CyvZsWdk
         DrVY0QNONOgp1vxuLI7EMfR59+AJCrlbrfMqhvT0eieT9MqYo6XyQ5wYGUkBO0TrfFZB
         /xBw==
X-Gm-Message-State: APjAAAXlDhw+mZua9pekHX1vzr1iyBtK/GchfXEM6qO64IBfcEZHs8Hg
        Gr8J1muJF+oK5XVTK9Nc4tIWDw==
X-Google-Smtp-Source: APXvYqz5VK7pAGKA+8WpcMWMpMSCUhGcTozeLZuaV4L7KWEhbWBn6UuWfKMxTtVNaxJjYJpr5Vwh8g==
X-Received: by 2002:a17:90a:e38f:: with SMTP id b15mr18969878pjz.140.1570228035009;
        Fri, 04 Oct 2019 15:27:15 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x37sm6328136pgl.18.2019.10.04.15.27.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 15:27:14 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 5/6] rpmsg: glink: Don't send pending rx_done during remove
Date:   Fri,  4 Oct 2019 15:27:01 -0700
Message-Id: <20191004222702.8632-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191004222702.8632-1-bjorn.andersson@linaro.org>
References: <20191004222702.8632-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Attempting to transmit rx_done messages after the GLINK instance is
being torn down will cause use after free and memory leaks. So cancel
the intent_work and free up the pending intents.

With this there are no concurrent accessors of the channel left during
qcom_glink_native_remove() and there is therefor no need to hold the
spinlock during this operation - which would prohibit the use of
cancel_work_sync() in the release function. So remove this.

Fixes: 1d2ea36eead9 ("rpmsg: glink: Add rx done command")
Cc: stable@vger.kernel.org
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Drop the locking of idr_lock in qcom_glink_native_remove()

 drivers/rpmsg/qcom_glink_native.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 89e02baea2d0..4117818db6a1 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -241,11 +241,23 @@ static void qcom_glink_channel_release(struct kref *ref)
 {
 	struct glink_channel *channel = container_of(ref, struct glink_channel,
 						     refcount);
+	struct glink_core_rx_intent *intent;
 	struct glink_core_rx_intent *tmp;
 	unsigned long flags;
 	int iid;
 
+	/* cancel pending rx_done work */
+	cancel_work_sync(&channel->intent_work);
+
 	spin_lock_irqsave(&channel->intent_lock, flags);
+	/* Free all non-reuse intents pending rx_done work */
+	list_for_each_entry_safe(intent, tmp, &channel->done_intents, node) {
+		if (!intent->reuse) {
+			kfree(intent->data);
+			kfree(intent);
+		}
+	}
+
 	idr_for_each_entry(&channel->liids, tmp, iid) {
 		kfree(tmp->data);
 		kfree(tmp);
@@ -1634,7 +1646,6 @@ void qcom_glink_native_remove(struct qcom_glink *glink)
 	if (ret)
 		dev_warn(glink->dev, "Can't remove GLINK devices: %d\n", ret);
 
-	spin_lock_irqsave(&glink->idr_lock, flags);
 	/* Release any defunct local channels, waiting for close-ack */
 	idr_for_each_entry(&glink->lcids, channel, cid)
 		kref_put(&channel->refcount, qcom_glink_channel_release);
@@ -1645,7 +1656,6 @@ void qcom_glink_native_remove(struct qcom_glink *glink)
 
 	idr_destroy(&glink->lcids);
 	idr_destroy(&glink->rcids);
-	spin_unlock_irqrestore(&glink->idr_lock, flags);
 	mbox_free_channel(glink->mbox_chan);
 }
 EXPORT_SYMBOL_GPL(qcom_glink_native_remove);
-- 
2.18.0

