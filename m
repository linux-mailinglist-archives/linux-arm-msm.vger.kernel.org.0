Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B145BB68E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 19:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732143AbfIRRT2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 13:19:28 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34235 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732129AbfIRRT1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 13:19:27 -0400
Received: by mail-pl1-f196.google.com with SMTP id d3so277481plr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Zted6byoUjfvi72VSDIhM8pesVU1cPbkC92rYkmfs6k=;
        b=rYhSObq4evGVg356bza5zIWCf7uvuBbpf4HCEDLaZ/lBqNwdVQZDZZoJiUCg5d1A6b
         cmF677BmCdEDLLgmJKuII4SBexOEnJwmuqvItJo7DaeE8IDlhRrFU1xI9PNu54Am5Nsq
         8O0JANibva5B7rlPn5iBN4STl/6PWnmXYTPwCkim8kiqhcs1bBXjWFga1BqcQvhJ+3jx
         6H3jIg+C1VUq53LrNHDo9jwI4WZQH3nT2sDwFIIyNQGKmh9nDz2jmGUAUZmF6LsTpOp4
         0UBsPBSdsE1TcqagQJhKslYjT7t1M6t8FJAsbCKRKUeRT04AaniPiAI5g229tX0I+wvt
         tjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Zted6byoUjfvi72VSDIhM8pesVU1cPbkC92rYkmfs6k=;
        b=kTWbwXOgXwLfBV95BBPNPLmnfN9sl99ekotDMgonBlZKFohmlkdtrisGfM382G0Fk7
         HqF4tudUfzfenT6Yhqa1AIcI5IM48+ssE9P7qG/n8kF+eqfPnRK7emrGD4kE5frD7YVx
         ddlRDvScH914rMU9I01uKL0QK0UDF6Qv4r3y6Hyxhp0XR3rBclCRCtMbj9IWxzcr44Ah
         p30LOPovcuOpOv6THc0zProdDwlSgbCvRe2cwYyu6kuZnbeJK5qR9ftHIfAOYN1szhQ4
         NYmTiFZ3Oo+r7BngJ7q1YJVqusEfOpJcyocBulhCRK8XmiIiKdCDX7y6BFkZ+lMcIF5w
         EuSw==
X-Gm-Message-State: APjAAAXSxcAqbaAPEe2gDZakaqdlYYKo/QmXXXp7tAt8Xn5C9wTU4bZk
        lH+dq6uTx8q1Y5+3g6lCEZSPzQ==
X-Google-Smtp-Source: APXvYqw0iFqROo2OVRy0jIHEtn/M2cMt17ahjJ12kB01MygdAcnt0iw88YZq2uoIDfL3USxZjvrq+w==
X-Received: by 2002:a17:902:b497:: with SMTP id y23mr5286203plr.201.1568827166359;
        Wed, 18 Sep 2019 10:19:26 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y4sm2614981pjn.19.2019.09.18.10.19.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 10:19:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 5/6] rpmsg: glink: Don't send pending rx_done during remove
Date:   Wed, 18 Sep 2019 10:19:15 -0700
Message-Id: <20190918171916.4039-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190918171916.4039-1-bjorn.andersson@linaro.org>
References: <20190918171916.4039-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Attempting to transmit rx_done messages after the GLINK instance is
being torn down will cause use after free and memory leaks. So cancel
the intent_work and free up the pending intents.

Fixes: 1d2ea36eead9 ("rpmsg: glink: Add rx done command")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 89e02baea2d0..0d7518a6ebf0 100644
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
-- 
2.18.0

