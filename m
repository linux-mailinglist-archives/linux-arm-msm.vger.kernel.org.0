Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464D1244BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 01:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfETXwB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 19:52:01 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46191 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727337AbfETXwA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 19:52:00 -0400
Received: by mail-pf1-f195.google.com with SMTP id y11so7997442pfm.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 16:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Rv32jzUGZV8rgVBuTpLJ3zSmM0FZYIuyjg2yFIdNHLI=;
        b=oSiuXpFilMvpyrsw1o2mAFYvPVX3B/Rh0EEHojcpJXOLf6UVF6y49QsRk9m2Wycwv4
         44kpdHm8apnauXUKYNBHt9HxsNDZMfa642EyJ314C2eMXP00V49RkWBtL2vB8/D3UhOM
         a1hg1A6P0KdYxdmEmdsOq0hN1kXrFzmc9tY0huvpBbO8JDmryqTIy40/+a90dc9T3YuS
         Yn8PgBTcuj0dIDHpb4qFGk+g5oiBO5111ygZk6vbp/fsaqJTSYK4eF4sZWY45a+ZUq5H
         AMYNhblRTarnJddVVuDNAM214dsDWE38WJNejnSYWCCWMbt3/fbMfb7DgNfL838wKNKf
         fanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Rv32jzUGZV8rgVBuTpLJ3zSmM0FZYIuyjg2yFIdNHLI=;
        b=I0jacj5GTWP9PildVrB5C73Zye2uGO+L8aKE9s1BY12pncVZ7w1fkQ3TZnw9ZPgEhZ
         swao4PNILqFkuyNRCDM2Ck88b1HeWnYXjWzPBeaJ8HivqKtuj5RdykSny4Ip6U647lfq
         5YbUkx8+tN2k+MPppMNkEb4jaup5giZg8cGZ59rPOvJFNiEtFWYhnHuVHGYZa+h2yef4
         l4JyJByEwFEjad+zIg3NwE85o9PDmcpz2hM1c2hUSbJKSR6fMJOLpkWhAlcxn2ji9zWa
         ayXX9NsTfGhwzApoa5b/yLWVeLxd30wZ3qNRJsmt9Cdqf2RnY6cozYPPugl+kzxB7OTN
         H1Cg==
X-Gm-Message-State: APjAAAVaptFPAvH831PExJPcgEM1jdBQVQ5SCu/zYYJFdIFwC931QJhH
        qDnGANXsVGNc8MyXBwDDDVl3g00Vip4=
X-Google-Smtp-Source: APXvYqx5ch9aWV4U6k1gQ+8/Xv5QTkWCIeMLYEaqxILZxFB5um0hi/l+30SpbTbI4nPvhtDmRFQt0g==
X-Received: by 2002:a63:2d0:: with SMTP id 199mr21113194pgc.188.1558396319858;
        Mon, 20 May 2019 16:51:59 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c16sm20286865pfd.99.2019.05.20.16.51.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 16:51:59 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Nicholas Mc Guire <hofrat@osadl.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] net: qrtr: Fix message type of outgoing packets
Date:   Mon, 20 May 2019 16:51:56 -0700
Message-Id: <20190520235156.28902-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QRTR packets has a message type in the header, which is repeated in the
control header. For control packets we therefor copy the type from
beginning of the outgoing payload and use that as message type.

For non-control messages an endianness fix introduced in v5.2-rc1 caused the
type to be 0, rather than QRTR_TYPE_DATA, causing all messages to be dropped by
the receiver. Fix this by converting and using qrtr_type, which will remain
QRTR_TYPE_DATA for non-control messages.

Fixes: 8f5e24514cbd ("net: qrtr: use protocol endiannes variable")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 net/qrtr/qrtr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
index 801872a2e7aa..05fa058bee59 100644
--- a/net/qrtr/qrtr.c
+++ b/net/qrtr/qrtr.c
@@ -733,8 +733,8 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	struct sock *sk = sock->sk;
 	struct qrtr_node *node;
 	struct sk_buff *skb;
-	u32 type = 0;
 	size_t plen;
+	u32 type;
 	int rc;
 
 	if (msg->msg_flags & ~(MSG_DONTWAIT))
@@ -809,9 +809,9 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 
 		/* control messages already require the type as 'command' */
 		skb_copy_bits(skb, 0, &qrtr_type, 4);
-		type = le32_to_cpu(qrtr_type);
 	}
 
+	type = le32_to_cpu(qrtr_type);
 	rc = enqueue_fn(node, skb, type, &ipc->us, addr);
 	if (rc >= 0)
 		rc = len;
-- 
2.18.0

