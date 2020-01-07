Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE58131F78
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 06:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgAGFsD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 00:48:03 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40331 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727485AbgAGFsC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 00:48:02 -0500
Received: by mail-pf1-f195.google.com with SMTP id q8so28038025pfh.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 21:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=38/4Y0ttJU3gjmWod1STa0fq8ebh+tOt6oi3RiKS+1w=;
        b=u9xMo+eLqQvQ/IJ7caEM6KhgyMLLfsJJ+eAdj9CADXeF5AXp9MFkVpBRJ2geqXQFYn
         C724xCooKW7BrsuIEV47tXlYikrpRY/HeIDTcKeY5xa/fGFSK4Y5/us3wFx0aSR3tswS
         X3/M5JNNT6oClwdCpMKVBJJpqUqffShvPrTdAB+AdBcYIKocuf2TBGy//aDGDXzaZssW
         nOOQp7FnsA5navJ/thkkoslj1QkbD2qQzNCeKKz1WkMFchYvWAtJKG6a87+f/KDgwo6T
         lmX437JvEcahq9Ra2HJtzJeKNQ/HzgaU7Ma2oN2jTCpiLguQiz2MmF/Q5mI62TiGDdOF
         Y3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=38/4Y0ttJU3gjmWod1STa0fq8ebh+tOt6oi3RiKS+1w=;
        b=a1JSjUid2cfhkPkHRj9H3n7aHSTLbsHQXcUkjMiq+4twrjyc29bfniQPtNb0Z9xqQf
         kqcnebzfoeZhMPDYcUKqj+m5DnfEiOQf2rqgfkfvC/l/859Vh8CjBHKlzuJsuuGv2AbP
         k3B+IetuS2SaqzUPXwxhmZ+GdAVv01GsAd4GYOp8kjyQG4UAx306GIioVeCebDwRwfcm
         e+zG2YHxC0+VgfvGOGs1MeyBhkM3JPnLCQys8ItffTdWNKtuL+IHQgXXrKQLJXkc5aab
         nAKvQeYyRuh5wyCDEVQ05CiWw4F7DcpJJIX/FmQyF96A4TRT+Ms8INvw6BeAL75ICLaL
         ureQ==
X-Gm-Message-State: APjAAAX+PHMCYp5LwdbtBvQ02UDdVO3zaLTNaOD/lq6jgXXN3QQHPn1s
        VIKHy6rEbltFagbJIO9XxT+b3Q==
X-Google-Smtp-Source: APXvYqxLPgfY0nt6d/aCSf9XEz2l1bafazaXRoHPfqGwSpjMNK72AM37LWljxj2SrkdcvhV4PE4ViQ==
X-Received: by 2002:aa7:928b:: with SMTP id j11mr12265082pfa.176.1578376081489;
        Mon, 06 Jan 2020 21:48:01 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k21sm67129177pfa.63.2020.01.06.21.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 21:48:00 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 4/5] net: qrtr: Make qrtr_port_lookup() use RCU
Date:   Mon,  6 Jan 2020 21:47:12 -0800
Message-Id: <20200107054713.3909260-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200107054713.3909260-1-bjorn.andersson@linaro.org>
References: <20200107054713.3909260-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes since v2:
- None

 net/qrtr/qrtr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
index c2bbfa7ec6e2..aae24c1d8531 100644
--- a/net/qrtr/qrtr.c
+++ b/net/qrtr/qrtr.c
@@ -641,11 +641,11 @@ static struct qrtr_sock *qrtr_port_lookup(int port)
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
@@ -687,6 +687,10 @@ static void qrtr_port_remove(struct qrtr_sock *ipc)
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
2.24.0

