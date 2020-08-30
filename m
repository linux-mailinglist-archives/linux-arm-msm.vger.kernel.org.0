Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A14256E9E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Aug 2020 16:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgH3Oj2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Aug 2020 10:39:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47891 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726264AbgH3OjW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Aug 2020 10:39:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598798361; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BG5Bli+klgMbg2PSkB4G0lK79qcXpmQXHNwoceerTbI=; b=iQ2lK9V5u9Ekul1ZfLlNwstLftiQoSovAtoqfkT21SkEQMShR5JtmnLqWVoOfTqyCyX4Snsc
 OLv6xPplRQptEKdp347ngHC7bUzIHs2eE5Cg4vNAkPbtxQewuRAvJIoOF0nnmY4knbEQ7I0p
 qU/b6zzy3GX7/Eh86UnvOKfZ0Qo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f4bb9fe63431d1144a3fb01 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 30 Aug 2020 14:38:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65027C43387; Sun, 30 Aug 2020 14:38:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B36ACC433C6;
        Sun, 30 Aug 2020 14:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B36ACC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Carl Huang <cjhuang@codeaurora.org>,
        Necip Fazil Yildiran <necip@google.com>,
        netdev@vger.kernel.org (open list:NETWORKING [GENERAL])
Subject: [PATCH V1 3/4] net: qrtr: Change port allocation to use cyclic idr
Date:   Sun, 30 Aug 2020 20:08:11 +0530
Message-Id: <1598798292-5971-4-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598798292-5971-1-git-send-email-deesin@codeaurora.org>
References: <1598798292-5971-1-git-send-email-deesin@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

There is a race for clients that open sockets before the control port
is bound. If a client gets an idr that was allocated before the control
port is bound, there is a chance the previous address owner sent lookup
packets to the control port. The new address owner will get residual
responses to this the lookup packets.

Change the idr_alloc to idr_alloc_cyclic so new idr's are allocated
instead of trying to reuse the freed idrs.
---
 net/qrtr/qrtr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
index 4496b75..e2dd38e 100644
--- a/net/qrtr/qrtr.c
+++ b/net/qrtr/qrtr.c
@@ -744,7 +744,8 @@ static int qrtr_port_assign(struct qrtr_sock *ipc, int *port)
 	mutex_lock(&qrtr_port_lock);
 	if (!*port) {
 		min_port = QRTR_MIN_EPH_SOCKET;
-		rc = idr_alloc_u32(&qrtr_ports, ipc, &min_port, QRTR_MAX_EPH_SOCKET, GFP_ATOMIC);
+		rc = idr_alloc_cyclic(&qrtr_ports, ipc, &min_port,
+				      QRTR_MAX_EPH_SOCKET, GFP_ATOMIC);
 		if (!rc)
 			*port = min_port;
 	} else if (*port < QRTR_MIN_EPH_SOCKET && !capable(CAP_NET_ADMIN)) {
@@ -754,7 +755,8 @@ static int qrtr_port_assign(struct qrtr_sock *ipc, int *port)
 		rc = idr_alloc_u32(&qrtr_ports, ipc, &min_port, 0, GFP_ATOMIC);
 	} else {
 		min_port = *port;
-		rc = idr_alloc_u32(&qrtr_ports, ipc, &min_port, *port, GFP_ATOMIC);
+		rc = idr_alloc_cyclic(&qrtr_ports, ipc, &min_port,
+				      *port, GFP_ATOMIC);
 		if (!rc)
 			*port = min_port;
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

