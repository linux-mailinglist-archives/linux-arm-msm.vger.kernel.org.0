Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902B63B7F82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 11:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233801AbhF3JDf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 05:03:35 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:33331 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbhF3JDb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 05:03:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625043662; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=p6iIPSEmp9wvFXtay3Ujw6sPjCKrzRy7wWodzBTyDKM=; b=wO3dEecrNQ4aKqdN7+LJTOq96EU4iZjPfH/oAAEOXTUzmJo4rmbWFx5aipiCAc0L5TH85dNS
 NRw/jtliEPMbSzQKfwG4RHtUQR9Y7vXJeGqhMDRM8VqYvURNFlVHdBe4T1W7OhTQqqbcRGiE
 eAloUnbWXZI7MTB/n2ttASvu6Xc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60dc32c1ec0b18a7455e4bc1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 09:00:49
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C8989C43146; Wed, 30 Jun 2021 09:00:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 917C0C4360C;
        Wed, 30 Jun 2021 09:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 917C0C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v11 2/5] usb: gadget: configfs: Check USB configuration before adding
Date:   Wed, 30 Jun 2021 02:00:39 -0700
Message-Id: <1625043642-29822-3-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625043642-29822-1-git-send-email-wcheng@codeaurora.org>
References: <1625043642-29822-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ensure that the USB gadget is able to support the configuration being
added based on the number of endpoints required from all interfaces.  This
is for accounting for any bandwidth or space limitations.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/gadget/configfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 15a607c..f4c7c82 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1404,6 +1404,10 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 				goto err_purge_funcs;
 			}
 		}
+		ret = usb_gadget_check_config(cdev->gadget);
+		if (ret)
+			goto err_purge_funcs;
+
 		usb_ep_autoconfig_reset(cdev->gadget);
 	}
 	if (cdev->use_os_string) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

