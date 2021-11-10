Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC8244C0FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 13:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhKJMMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 07:12:43 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:34610 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbhKJMMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 07:12:30 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636546183; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=xI64hCz1HNiVpcCIETPeu0F3pBC1lsCOTonaWoQ+rrQ=; b=cpwRxkea+bdvXtfjKuQn9tK5o1Vd82hc3uh3wOUx6Dj3fV9E9qk0uUbAsIfTwMAX+tNiDeeH
 M9T8ZAn6UDvZb/KuGRdfW+h5AKpxmbUUBU3/dQxsthg8MjAZOuPX/010fDuCaGZDQxQNYpbE
 jAaDw9iw30Ox3bslUi+FWZvpK6E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 618bb6850f34c3436aca1691 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Nov 2021 12:09:41
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB611C43635; Wed, 10 Nov 2021 12:09:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A83B3C43618;
        Wed, 10 Nov 2021 12:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A83B3C43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, c-hbandi@codeaurora.org,
        hemantg@codeaurora.org, rjliao@codeaurora.org,
        zijuhu@codeaurora.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: [PATCH v1] Bluetooth: hci_h4: Fix padding calculation error within h4_recv_buf()
Date:   Wed, 10 Nov 2021 20:09:19 +0800
Message-Id: <1636546159-8339-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Zijun Hu <quic_zijuhu@quicinc.com>

it is erroneous to calculate padding by subtracting length of type
indication from skb->len, it will cause data analysis error for
alignment which is greater than 1, so fixed by adding length of type
indication with skb->len.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/bluetooth/hci_h4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_h4.c b/drivers/bluetooth/hci_h4.c
index 4b3b14a34794..1d0cdf023243 100644
--- a/drivers/bluetooth/hci_h4.c
+++ b/drivers/bluetooth/hci_h4.c
@@ -252,7 +252,7 @@ struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
 			}
 
 			if (!dlen) {
-				hu->padding = (skb->len - 1) % alignment;
+				hu->padding = (skb->len + 1) % alignment;
 				hu->padding = (alignment - hu->padding) % alignment;
 
 				/* No more data, complete frame */
@@ -260,7 +260,7 @@ struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
 				skb = NULL;
 			}
 		} else {
-			hu->padding = (skb->len - 1) % alignment;
+			hu->padding = (skb->len + 1) % alignment;
 			hu->padding = (alignment - hu->padding) % alignment;
 
 			/* Complete frame */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

