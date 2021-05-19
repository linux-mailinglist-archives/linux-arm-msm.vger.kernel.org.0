Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800BB38884E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 09:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240834AbhESHpY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 03:45:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12585 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240731AbhESHpX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 03:45:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621410244; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ckvrAD8Fxy91c2VTgWm7u/5iO+iFGDaqMi7f2GgcXZY=; b=oZn6dDS/EMCr08oPCNnOuGG0Lh2tbVK54+PbLAt4PbrNB2ZSL4l5uAcKJwH0Bi8OX/GvldCq
 Rmgxn/doEyVgqN/FmV3P+NJ3Z91/n+gKYxsT9dgIgpqrDrPShpxIMUJYJ2/jhwS3EAC5eWuS
 LNhnYtjiAX0ORZ6FassmfhbfumE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60a4c1c32bff04e53bf279e0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 May 2021 07:44:03
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6F502C433F1; Wed, 19 May 2021 07:44:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4701AC433D3;
        Wed, 19 May 2021 07:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4701AC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v8 1/5] usb: gadget: udc: core: Introduce check_config to verify USB configuration
Date:   Wed, 19 May 2021 00:43:54 -0700
Message-Id: <1621410238-31395-2-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621410238-31395-1-git-send-email-wcheng@codeaurora.org>
References: <1621410238-31395-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some UDCs may have constraints on how many high bandwidth endpoints it can
support in a certain configuration.  This API allows for the composite
driver to pass down the total number of endpoints to the UDC so it can verify
it has the required resources to support the configuration.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/gadget/udc/core.c | 25 +++++++++++++++++++++++++
 include/linux/usb/gadget.h    |  5 +++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 493ff93..e67fd93 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1003,6 +1003,31 @@ int usb_gadget_ep_match_desc(struct usb_gadget *gadget,
 }
 EXPORT_SYMBOL_GPL(usb_gadget_ep_match_desc);
 
+/**
+ * usb_gadget_check_config - checks if the UDC can support the number of eps
+ * @gadget: controller to check the USB configuration
+ * @ep_map: bitmap of endpoints being requested by a USB configuration
+ *
+ * Ensure that a UDC is able to support the number of endpoints within a USB
+ * configuration, and that there are no resource limitations to support all
+ * requested eps.
+ *
+ * Returns zero on success, else a negative errno.
+ */
+int usb_gadget_check_config(struct usb_gadget *gadget, unsigned long ep_map)
+{
+	int ret = 0;
+
+	if (!gadget->ops->check_config)
+		goto out;
+
+	ret = gadget->ops->check_config(gadget, ep_map);
+
+out:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(usb_gadget_check_config);
+
 /* ------------------------------------------------------------------------- */
 
 static void usb_gadget_state_work(struct work_struct *work)
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index ee04ef2..9fb69eb 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -328,6 +328,7 @@ struct usb_gadget_ops {
 	struct usb_ep *(*match_ep)(struct usb_gadget *,
 			struct usb_endpoint_descriptor *,
 			struct usb_ss_ep_comp_descriptor *);
+	int	(*check_config)(struct usb_gadget *gadget, unsigned long ep_map);
 };
 
 /**
@@ -607,6 +608,7 @@ int usb_gadget_connect(struct usb_gadget *gadget);
 int usb_gadget_disconnect(struct usb_gadget *gadget);
 int usb_gadget_deactivate(struct usb_gadget *gadget);
 int usb_gadget_activate(struct usb_gadget *gadget);
+int usb_gadget_check_config(struct usb_gadget *gadget, unsigned long ep_map);
 #else
 static inline int usb_gadget_frame_number(struct usb_gadget *gadget)
 { return 0; }
@@ -630,6 +632,9 @@ static inline int usb_gadget_deactivate(struct usb_gadget *gadget)
 { return 0; }
 static inline int usb_gadget_activate(struct usb_gadget *gadget)
 { return 0; }
+static inline int usb_gadget_check_config(struct usb_gadget *gadget,
+					  unsigned long ep_map)
+{ return 0; }
 #endif /* CONFIG_USB_GADGET */
 
 /*-------------------------------------------------------------------------*/
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

