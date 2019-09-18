Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1607DB68E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 19:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732151AbfIRRTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 13:19:31 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38887 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732140AbfIRRT2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 13:19:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id h195so418202pfe.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=o8jBbFMTRVOLRjVfPalAAvaLLhvjkkI5HoxGIVyvU8o=;
        b=S31B2pEsbk+z279WHVu2T3GrmYwNDVVVEi/rj5HIvyV6nVgECY/7RfHJ/xSGEt3k8s
         xShPMHY9cudQDZP2dH2wQvi5BLCnKKfojyVvVTmE40etR2gvyyljlHoYoi6uumzoghtX
         w9Z9vYHDU4Nr8o77x/MECD8F0zYjEGM0wGFN0W6SV4mPq4kePFnte+jMuBjO+V9Mk2y0
         PAcA8IRjRYXTcc9rvtEv5ImAlwMDeEupI6jzInysqLqlG72aANz/bomMqQVVysMA8gZM
         P5q4KvZmbHFyFK1W4gXjZrIhbNXctmumsmzN1F3DphKi2qR0jlIHMwLf4SO12NlkfTlY
         7LCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=o8jBbFMTRVOLRjVfPalAAvaLLhvjkkI5HoxGIVyvU8o=;
        b=DVLGqXJZJa4Ba26cXvcje4OeCqaZBtcz4GmGUOt4ktl4o4W3Ph725CDftmMyqpYSsW
         N3l+/RfHRxkYsgdclThBS2zf/wt/j/UBNCqnYLtZsbegu45GOwNoiO++NQ/gpr08qGiP
         RIljNYMAAKZynO2oy9Zs9WpH5aPnhE+3lW7CpqWuV6Lr5rv+zZauTKaA+R0HMbKWzT8G
         7zxwCXy0D6YmXoRfdmdelZUGj7l1XWNcCoxtF8KAEqIlz9xurnbQf4lDqVyOXfDMnbih
         QRKzWkLMoXljOz4yIcKZxynRndkZK/a3uqIaJLmY6GQhhwdb0DzPrfTscH1UF8V0OPEB
         KrUw==
X-Gm-Message-State: APjAAAVE9YuUBRFBIc8WJXek1fCvCRYBOthfNremLcBsZ0lPvEonMihJ
        bfYotOz9biCStzs4EfQCzrmC5A==
X-Google-Smtp-Source: APXvYqz2NwfyeZRXxm7dgiBTjnJCh8SRsdzqxi1i88kaJsXr+YupiSXjV/8iuycHgXoZ1FvOMMG8Fw==
X-Received: by 2002:a63:34cb:: with SMTP id b194mr4926065pga.446.1568827167913;
        Wed, 18 Sep 2019 10:19:27 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y4sm2614981pjn.19.2019.09.18.10.19.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 10:19:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 6/6] rpmsg: glink: Free pending deferred work on remove
Date:   Wed, 18 Sep 2019 10:19:16 -0700
Message-Id: <20190918171916.4039-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190918171916.4039-1-bjorn.andersson@linaro.org>
References: <20190918171916.4039-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

By just cancelling the deferred rx worker during GLINK instance teardown
any pending deferred commands are leaked, so free them.

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 0d7518a6ebf0..5920432e697a 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1562,6 +1562,18 @@ static void qcom_glink_work(struct work_struct *work)
 	}
 }
 
+static void qcom_glink_cancel_rx_work(struct qcom_glink *glink)
+{
+	struct glink_defer_cmd *dcmd;
+	struct glink_defer_cmd *tmp;
+
+	/* cancel any pending deferred rx_work */
+	cancel_work_sync(&glink->rx_work);
+
+	list_for_each_entry_safe(dcmd, tmp, &glink->rx_queue, node)
+		kfree(dcmd);
+}
+
 struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 					   unsigned long features,
 					   struct qcom_glink_pipe *rx,
@@ -1640,7 +1652,7 @@ void qcom_glink_native_remove(struct qcom_glink *glink)
 	unsigned long flags;
 
 	disable_irq(glink->irq);
-	cancel_work_sync(&glink->rx_work);
+	qcom_glink_cancel_rx_work(glink);
 
 	ret = device_for_each_child(glink->dev, NULL, qcom_glink_remove_device);
 	if (ret)
-- 
2.18.0

