Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCC1B68E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 19:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732110AbfIRRT0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 13:19:26 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46605 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731734AbfIRRTZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 13:19:25 -0400
Received: by mail-pf1-f196.google.com with SMTP id q5so384002pfg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 10:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0Uy6bHHevUENAulkqSQtPk+BZ1l0ipc3uMDtQFYz2nQ=;
        b=fUltYfIHMIOjnGd1FS6BZiNa/6sr2uKEIzz7Km04e6IE93VkMueUYltt3JEHNNMed1
         GQRuxifsOhM9iy6QFfjHwj5jaUiX3QsJHwCb9hKSyT0mAeqdcDs9/ajmOcMrgjTnntfh
         MuRVkkBgPraBP+jhxCtecPZoou+N86UCV+33hwtlyvZfuoOtA0EbncL9o39XLbqVd6I9
         3Kg49BtFHgGwGEp4UMyN1ypdjImD87vMg/gWcEbN4c7Q86aX4C3vTbB5HbKi9hjaqPtq
         2h1Yj5ChS0HnM9jwMmeHYwddXhW14mb+g0jXmXjUb2lJQQov7Qcyp0X7vLD0dfDJ7xdN
         fnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0Uy6bHHevUENAulkqSQtPk+BZ1l0ipc3uMDtQFYz2nQ=;
        b=pacmYeGV6fj5FjLTnLpdHJVg9jmcRQ08HuFnIYeN7JTF02WQFVugK0k2vkXbCuKpfl
         EnLb6Wy2nys41RAgO3Z05bv5l+/dwGHm4tB/yUjMw7R/pHkkCPv6G1j6wDAdhWT4XEf9
         TfATz56xABhQtjFyx1V5p7cLaDTkr3qvOOHCKiGwcQd3s1Gr69vmllZYIuGuVRCx46E9
         5HDK+O2BdfDpgmjwD5Q2NdXBE/C8CAKOa9/wCHfZExzF0954sk9ATnH21/gqKz4w2A1h
         fkdjHGQ0PCWnE/DhqHB2DwY1ympNRPHOhbDsagxiv9mSUeWL+hhiAsaV8hYlLD8M741E
         tEaA==
X-Gm-Message-State: APjAAAVhHSjmu1VTrE9GtKuaLPzZYVhA5sJZq8pfickWOeRqLt+nUpAG
        hS154qkNcPsfKBUMo4+M/EBsmA==
X-Google-Smtp-Source: APXvYqzUBAdLgS6iTt8bHDfY8QFjRB3LWD0ZA7+0XCI2Z/UvIRKaIlHhFvg+rPfjmsmeW771XqxKXg==
X-Received: by 2002:a62:db84:: with SMTP id f126mr5532642pfg.25.1568827165043;
        Wed, 18 Sep 2019 10:19:25 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y4sm2614981pjn.19.2019.09.18.10.19.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 10:19:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 4/6] rpmsg: glink: Fix rpmsg_register_device err handling
Date:   Wed, 18 Sep 2019 10:19:14 -0700
Message-Id: <20190918171916.4039-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190918171916.4039-1-bjorn.andersson@linaro.org>
References: <20190918171916.4039-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

The device release function is set before registering with rpmsg. If
rpmsg registration fails, the framework will call device_put(), which
invokes the release function. The channel create logic does not need to
free rpdev if rpmsg_register_device() fails and release is called.

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 21fd2ae5f7f1..89e02baea2d0 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1423,15 +1423,13 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 
 		ret = rpmsg_register_device(rpdev);
 		if (ret)
-			goto free_rpdev;
+			goto rcid_remove;
 
 		channel->rpdev = rpdev;
 	}
 
 	return 0;
 
-free_rpdev:
-	kfree(rpdev);
 rcid_remove:
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	idr_remove(&glink->rcids, channel->rcid);
-- 
2.18.0

