Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBEDB3062D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 03:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfEaBSW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 21:18:22 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43005 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfEaBSC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 21:18:02 -0400
Received: by mail-pl1-f193.google.com with SMTP id go2so3259288plb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2019 18:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uBw4EEYJCi6dX24BKwZjutyozmTL8aJL03Jek8XZUz0=;
        b=p5yjRe95hE2L74zPVNLK1TX9rAuxSEKw3QPLcPDoNubJMlT8hW3msrbX9RYT1IzJor
         BBOcGMnIAgGxczRAO2tPepHxmRSrnAU8U/aNcQ2r3LN7L7jrsRn31ZBqQkRtm1o6Z+EK
         eyg0d09rveIz8M9od3xJfx4TrDnlkr8Nwd4dSJzeiMxLzpO+Ox8O994euhq7inpDmEuv
         5rqiS/0xocH1ZN3jnv7Lp9hxF5gtqtZmWP6EGhOUPbR5GhoTTStf/YYDDvJstdN5jgU9
         n9Xlr1D3Po6cuX+8T8k8d9p1hyMk2Au6MbIKt84oZRkslaQtKwvaRACbzYyi13FgM7c7
         MKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uBw4EEYJCi6dX24BKwZjutyozmTL8aJL03Jek8XZUz0=;
        b=nSwd4dYSG84l6HmTcr9mVBb179ebBM2v5FUv2sUkFxU4O9STXyU1X054RqfNL/hV3r
         yJxLK4YqNhQpgMMaxvEv3azRm84ROpXbWr5lnHJN1g1HIA0/akuBkBIaZCJFKjXdQJQq
         fzl3ukkjULbJ9sK3RfO4MV9NEVWWGEJqU+OiqGn9dNeszNGq+rzj91ydU/wimpKFSOk1
         eFgvBPjFRsS7pNHqCe2hLaW0ugG9p6yx7MFkaC9b6C2jyIqzxLYXLcJGrB8+kQIik+58
         /rlOXw3bo1QuIJo8BXxQ9KgiZvi3e14k48zcdf2yQXuhgg16yUed+Cfgc25vVNl6qLeI
         pWog==
X-Gm-Message-State: APjAAAWnsyed1p7sewHo/NGTfi6cRoOi2W3/Mw6tVr9nybWe2/QLh6/Z
        z9dOXjr1OJ7jaGpQP7waiK803g==
X-Google-Smtp-Source: APXvYqzbzNYd5zzYyX2VJGLxBUZ6atoMsqyZ1H31My9jgxQR6LYgh9qzjC2joi/yKRfxRKZttRoKog==
X-Received: by 2002:a17:902:8e8a:: with SMTP id bg10mr6206452plb.247.1559265481358;
        Thu, 30 May 2019 18:18:01 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j20sm1819042pff.183.2019.05.30.18.18.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 18:18:00 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/5] net: qrtr: Make qrtr_port_lookup() use RCU
Date:   Thu, 30 May 2019 18:17:52 -0700
Message-Id: <20190531011753.11840-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190531011753.11840-1-bjorn.andersson@linaro.org>
References: <20190531011753.11840-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The important part of qrtr_port_lookup() wrt synchronization is that the
function returns a reference counted struct qrtr_sock, or fail.

As such we need only to ensure that an decrement of the object's
refcount happens inbetween the finding of the object in the idr and
qrtr_port_lookup()'s own increment of the object.

By using RCU and putting a synchronization point after we remove the
mapping from the idr, but before it can be released we achieve this -
with the benefit of not having to hold the mutex in qrtr_port_lookup().

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 net/qrtr/qrtr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
index fdee32b979fe..7f048b9e02fb 100644
--- a/net/qrtr/qrtr.c
+++ b/net/qrtr/qrtr.c
@@ -645,11 +645,11 @@ static struct qrtr_sock *qrtr_port_lookup(int port)
 	if (port == QRTR_PORT_CTRL)
 		port = 0;
 
-	mutex_lock(&qrtr_port_lock);
+	rcu_read_lock();
 	ipc = idr_find(&qrtr_ports, port);
 	if (ipc)
 		sock_hold(&ipc->sk);
-	mutex_unlock(&qrtr_port_lock);
+	rcu_read_unlock();
 
 	return ipc;
 }
@@ -691,6 +691,10 @@ static void qrtr_port_remove(struct qrtr_sock *ipc)
 	mutex_lock(&qrtr_port_lock);
 	idr_remove(&qrtr_ports, port);
 	mutex_unlock(&qrtr_port_lock);
+
+	/* Ensure that if qrtr_port_lookup() did enter the RCU read section we
+	 * wait for it to up increment the refcount */
+	synchronize_rcu();
 }
 
 /* Assign port number to socket.
-- 
2.18.0

