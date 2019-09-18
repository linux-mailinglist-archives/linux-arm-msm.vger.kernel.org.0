Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE4CFB68FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 19:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730422AbfIRRVW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 13:21:22 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34066 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbfIRRVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 13:21:22 -0400
Received: by mail-pg1-f194.google.com with SMTP id n9so241298pgc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=4LdTXDWq3Uv3L2zd/NR5TCqm7My244nHQo+ObnVgt58=;
        b=FqHH+Zoiq7lEG9/x/GOxUNp3JykuQnt4TdgW49TajHQUWWepwS/HhcutIkbTc4TJAE
         4AbCZ075/oyErat+7EzcRPMlsw1Tuq9+zLj1jiNvm389RDdDz4BbUTjHMYxbPadBeIZd
         AfR111JYfHvEOUFNCxRc/7NN+KyNPcw+NrlNkitfevmCkybcHhr2WyKWdy+/J5Y1xEmJ
         YXOY/2Fv3axFRAGi7dDcS61Kn2TdKu0obx78TJWYSkFLNgkRUdQTZALdXujWzPCdwZxh
         8gtu1fggCs8ry8ZHBOmL1OBKnHT0DeyHLfNo2xrbWmSNpmpBpNvQAWqNPcCc0rRu1qrO
         xA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4LdTXDWq3Uv3L2zd/NR5TCqm7My244nHQo+ObnVgt58=;
        b=KHt0+w3w6fQML5jPbpn+KXEO5zqHdiGKHQWZ2OACz5adMtbhrH0oIe5PGkZgSEl7P0
         WbBm8XxeS9pyQAFKmVftjELu/yxjeOGdh4KmByAWWeq9vnnqfiQubFxek3aYJisB5++2
         eP3Orv7IWjM/K3N9Owfe2217xSOrm/EAFTALJ4E66DWv0JSuQdlLOv9wTpaWOAt8qvsQ
         xXDHcayTtEjYvDPJuOgbDS8/jvxpDEfB9Ldy7OxlcFQUXlvX79u6XlKZpTXZPGNklWE2
         owuHlJYERN2bZ682nRNO9AuOCIyiJppWyGK+Ppkg5Or0ZGA7D83nXcnQ6doehZa4bVRs
         LjRw==
X-Gm-Message-State: APjAAAWTLdJBtr+OHJeg8ARkPlg97EyGrcOmnaTQzxo9HcYmp9D/C8uZ
        KWkMkfZHJFGLXhneRCfft6ofRQ==
X-Google-Smtp-Source: APXvYqwNoFVjaPm3eL6jMcaK8G2c8PabKi7HOM0JHnfEaNT+uqzgU9EB16AZzHifjaoL4rpVj6VvPw==
X-Received: by 2002:a62:ed17:: with SMTP id u23mr5387020pfh.147.1568827281215;
        Wed, 18 Sep 2019 10:21:21 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g5sm6977032pfh.133.2019.09.18.10.21.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 10:21:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] net: qrtr: Stop rx_worker before freeing node
Date:   Wed, 18 Sep 2019 10:21:17 -0700
Message-Id: <20190918172117.4116-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the endpoint is unregistered there might still be work pending to
handle incoming messages, which will result in a use after free
scenario. The plan is to remove the rx_worker, but until then (and for
stable@) ensure that the work is stopped before the node is freed.

Fixes: bdabad3e363d ("net: Add Qualcomm IPC router")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 net/qrtr/qrtr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
index 6c8b0f6d28f9..88f98f27ad88 100644
--- a/net/qrtr/qrtr.c
+++ b/net/qrtr/qrtr.c
@@ -150,6 +150,7 @@ static void __qrtr_node_release(struct kref *kref)
 	list_del(&node->item);
 	mutex_unlock(&qrtr_node_lock);
 
+	cancel_work_sync(&node->work);
 	skb_queue_purge(&node->rx_queue);
 	kfree(node);
 }
-- 
2.18.0

