Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA3A2FFB7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 05:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbhAVECx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 23:02:53 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:37674 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbhAVECf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 23:02:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611288134; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=0hhdoccd5OveXcLp6Vz/dxy+em7zD5NFIwnpITENxBc=; b=Vnl4uWvyA/EgSapjiCiLoqOpN9Us5I4g5NsqyDhwUqjdDvmUgot3cTKIDsWoxw74TACLfS9l
 Ql8O7Cco5dUG/slBpXqkRLsyJCSv/lndasVjrbGBJ5zZM6FJNtpFrkykIdCWBi23Id3DTYbz
 +k81GHdWaxdvv3UNxrNpowpqcWk=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 600a4e2bbeacd1a2520801c7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Jan 2021 04:01:47
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11389C433ED; Fri, 22 Jan 2021 04:01:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D84B6C43463;
        Fri, 22 Jan 2021 04:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D84B6C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        peter.chen@nxp.com, jackp@codeaurora.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v6 2/4] usb: gadget: configfs: Check USB configuration before adding
Date:   Thu, 21 Jan 2021 20:01:38 -0800
Message-Id: <1611288100-31118-3-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611288100-31118-1-git-send-email-wcheng@codeaurora.org>
References: <1611288100-31118-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ensure that the USB gadget is able to support the configuration being
added based on the number of endpoints required from all interfaces.  This
is for accounting for any bandwidth or space limitations.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/gadget/configfs.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 0d56f33..e6de3ca5 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1368,6 +1368,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 		struct usb_function *f;
 		struct usb_function *tmp;
 		struct gadget_config_name *cn;
+		unsigned long ep_map = 0;
 
 		if (gadget_is_otg(gadget))
 			c->descriptors = otg_desc;
@@ -1397,7 +1398,28 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 				list_add(&f->list, &cfg->func_list);
 				goto err_purge_funcs;
 			}
+			if (f->fs_descriptors) {
+				struct usb_descriptor_header **d;
+
+				d = f->fs_descriptors;
+				for (; *d; ++d) {
+					struct usb_endpoint_descriptor *ep;
+					int addr;
+
+					if ((*d)->bDescriptorType != USB_DT_ENDPOINT)
+						continue;
+
+					ep = (struct usb_endpoint_descriptor *)*d;
+					addr = ((ep->bEndpointAddress & 0x80) >> 3) |
+						(ep->bEndpointAddress & 0x0f);
+					set_bit(addr, &ep_map);
+				}
+			}
 		}
+		ret = usb_gadget_check_config(cdev->gadget, ep_map);
+		if (ret)
+			goto err_purge_funcs;
+
 		usb_ep_autoconfig_reset(cdev->gadget);
 	}
 	if (cdev->use_os_string) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

