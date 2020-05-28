Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8ADD1E7001
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 01:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391537AbgE1XGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 19:06:05 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:15284 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391479AbgE1XGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 19:06:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590707162; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=OFnRFdGdwOdlT6++yGr8Uhb6YcmrXqckJ/J0OHf9bY4=; b=PdBXg5WeHzgqPr87/xXT8sKYwLnbfbIAIjnjNRB1el3OLxwgzZAgPHCt2zFZC1sro5KtDTlZ
 4f90MV9+4wEZWL8kH/7Mi7CZeeKOtr66slGxSCt/XbJuIlxzJw6yZtG2eRLQJM938bL2n3zX
 zdGqzjHh2yUaoL/TRtGGbJ5rP4U=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ed043d150867324810c4e4b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 23:05:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 261DEC433C6; Thu, 28 May 2020 23:05:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from clew-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: clew)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D20DC433C9;
        Thu, 28 May 2020 23:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D20DC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=clew@codeaurora.org
From:   Chris Lew <clew@codeaurora.org>
To:     davem@davemloft.net, bjorn.andersson@linaro.org
Cc:     manivannan.sadhasivam@linaro.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        clew@codeaurora.org
Subject: [PATCH] net: qrtr: Allocate workqueue before kernel_bind
Date:   Thu, 28 May 2020 16:05:26 -0700
Message-Id: <1590707126-16957-1-git-send-email-clew@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A null pointer dereference in qrtr_ns_data_ready() is seen if a client
opens a qrtr socket before qrtr_ns_init() can bind to the control port.
When the control port is bound, the ENETRESET error will be broadcasted
and clients will close their sockets. This results in DEL_CLIENT
packets being sent to the ns and qrtr_ns_data_ready() being called
without the workqueue being allocated.

Allocate the workqueue before setting sk_data_ready and binding to the
control port. This ensures that the work and workqueue structs are
allocated and initialized before qrtr_ns_data_ready can be called.

Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Signed-off-by: Chris Lew <clew@codeaurora.org>
---
 net/qrtr/ns.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index e7d0fe3f4330..c5b3202a14ca 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -712,6 +712,10 @@ void qrtr_ns_init(void)
 		goto err_sock;
 	}
 
+	qrtr_ns.workqueue = alloc_workqueue("qrtr_ns_handler", WQ_UNBOUND, 1);
+	if (!qrtr_ns.workqueue)
+		goto err_sock;
+
 	qrtr_ns.sock->sk->sk_data_ready = qrtr_ns_data_ready;
 
 	sq.sq_port = QRTR_PORT_CTRL;
@@ -720,17 +724,13 @@ void qrtr_ns_init(void)
 	ret = kernel_bind(qrtr_ns.sock, (struct sockaddr *)&sq, sizeof(sq));
 	if (ret < 0) {
 		pr_err("failed to bind to socket\n");
-		goto err_sock;
+		goto err_wq;
 	}
 
 	qrtr_ns.bcast_sq.sq_family = AF_QIPCRTR;
 	qrtr_ns.bcast_sq.sq_node = QRTR_NODE_BCAST;
 	qrtr_ns.bcast_sq.sq_port = QRTR_PORT_CTRL;
 
-	qrtr_ns.workqueue = alloc_workqueue("qrtr_ns_handler", WQ_UNBOUND, 1);
-	if (!qrtr_ns.workqueue)
-		goto err_sock;
-
 	ret = say_hello(&qrtr_ns.bcast_sq);
 	if (ret < 0)
 		goto err_wq;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

