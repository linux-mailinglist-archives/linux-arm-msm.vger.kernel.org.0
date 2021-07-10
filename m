Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB283C33D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 11:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbhGJJQO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 05:16:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:61441 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbhGJJQK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 05:16:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625908405; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=yRAN0Itr5X2kNRTVzZrquh9Jp2t19T/UylZmENO8ll4=; b=jZXQaANc6NaPddDCz+z8JfhoEU5gv3zkBkLnNZT8jmmWciAvyqXSyDmI34YezQbZPQXB0n1B
 YsAnszZXdYnSta9LfnITDg12XKT3zi+qWECzyskqD8kfF4F0AnIiX5ZM1w0ToA89Po7YzUAF
 iXG2iWXID61h7epDwl1Us+nu1tY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60e964b03a8b6d0a453eb92a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 10 Jul 2021 09:13:20
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82623C433F1; Sat, 10 Jul 2021 09:13:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B3A8C433D3;
        Sat, 10 Jul 2021 09:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2B3A8C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v14 1/6] usb: gadget: udc: core: Introduce check_config to verify USB configuration
Date:   Sat, 10 Jul 2021 02:13:10 -0700
Message-Id: <1625908395-5498-2-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625908395-5498-1-git-send-email-wcheng@codeaurora.org>
References: <1625908395-5498-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some UDCs may have constraints on how many high bandwidth endpoints it can
support in a certain configuration.  This API allows for the composite
driver to pass down the total number of endpoints to the UDC so it can verify
it has the required resources to support the configuration.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/gadget/udc/core.c | 19 +++++++++++++++++++
 include/linux/usb/gadget.h    |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index b7f0b1e..14fdf91 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1003,6 +1003,25 @@ int usb_gadget_ep_match_desc(struct usb_gadget *gadget,
 }
 EXPORT_SYMBOL_GPL(usb_gadget_ep_match_desc);
 
+/**
+ * usb_gadget_check_config - checks if the UDC can support the binded
+ *	configuration
+ * @gadget: controller to check the USB configuration
+ *
+ * Ensure that a UDC is able to support the requested resources by a
+ * configuration, and that there are no resource limitations, such as
+ * internal memory allocated to all requested endpoints.
+ *
+ * Returns zero on success, else a negative errno.
+ */
+int usb_gadget_check_config(struct usb_gadget *gadget)
+{
+	if (gadget->ops->check_config)
+		return gadget->ops->check_config(gadget);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_gadget_check_config);
+
 /* ------------------------------------------------------------------------- */
 
 static void usb_gadget_state_work(struct work_struct *work)
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 75c7538..776851e 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -329,6 +329,7 @@ struct usb_gadget_ops {
 	struct usb_ep *(*match_ep)(struct usb_gadget *,
 			struct usb_endpoint_descriptor *,
 			struct usb_ss_ep_comp_descriptor *);
+	int	(*check_config)(struct usb_gadget *gadget);
 };
 
 /**
@@ -608,6 +609,7 @@ int usb_gadget_connect(struct usb_gadget *gadget);
 int usb_gadget_disconnect(struct usb_gadget *gadget);
 int usb_gadget_deactivate(struct usb_gadget *gadget);
 int usb_gadget_activate(struct usb_gadget *gadget);
+int usb_gadget_check_config(struct usb_gadget *gadget);
 #else
 static inline int usb_gadget_frame_number(struct usb_gadget *gadget)
 { return 0; }
@@ -631,6 +633,8 @@ static inline int usb_gadget_deactivate(struct usb_gadget *gadget)
 { return 0; }
 static inline int usb_gadget_activate(struct usb_gadget *gadget)
 { return 0; }
+static inline int usb_gadget_check_config(struct usb_gadget *gadget)
+{ return 0; }
 #endif /* CONFIG_USB_GADGET */
 
 /*-------------------------------------------------------------------------*/
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

