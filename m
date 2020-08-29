Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2665F2564F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Aug 2020 07:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgH2F71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Aug 2020 01:59:27 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55929 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726797AbgH2F70 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Aug 2020 01:59:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598680765; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zbtKWEe/ycA4XfAazELEies/9m6qkiUjWQM6OfnRcUs=; b=OGCHXUT+0Oo4uD//F6L9FIllkiqNNy4qGFZ8ZYd6UFtUfxG1UmHfQIBAx7N7czScN28X88IS
 dRiWXoC22/mb9TpUgB1u6psQiz3b1w8OYqGnuz1ApDY3TIKl2bRukms1DfV0ybGOI48w1d/2
 PpxDPXNTmaS/6c3EdMzCc1EXBq4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f49eea0d70e1f492d204326 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 29 Aug 2020 05:58:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6FA3EC433C6; Sat, 29 Aug 2020 05:58:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 20BE8C43391;
        Sat, 29 Aug 2020 05:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 20BE8C43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     robh+dt@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [RFC v5 6/6] usb: dwc3: gadget: Ensure enough TXFIFO space for USB configuration
Date:   Fri, 28 Aug 2020 22:58:46 -0700
Message-Id: <20200829055846.19034-7-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200829055846.19034-1-wcheng@codeaurora.org>
References: <20200829055846.19034-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If TXFIFO resizing is enabled, then based on if endpoint bursting is
required or not, a larger amount of FIFO space is benefical.  Sometimes
a particular interface can take all the available FIFO space, leading
to other interfaces not functioning properly.  This callback ensures that
the minimum fifo requirements, a single fifo per endpoint, can be met,
otherwise the configuration binding will fail.  This will be based on the
maximum number of eps existing in all configurations.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/dwc3/core.h   |  1 +
 drivers/usb/dwc3/gadget.c | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e85c1ec70cc3..0559b0a82c4d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1249,6 +1249,7 @@ struct dwc3 {
 	u16			imod_interval;
 	int			last_fifo_depth;
 	int			num_ep_resized;
+	int			max_cfg_eps;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 53e5220f9893..e8f7ea560920 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2411,6 +2411,7 @@ static int dwc3_gadget_stop(struct usb_gadget *g)
 
 out:
 	dwc->gadget_driver	= NULL;
+	dwc->max_cfg_eps = 0;
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	free_irq(dwc->irq_gadget, dwc->ev_buf);
@@ -2518,6 +2519,39 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
+static int dwc3_gadget_check_config(struct usb_gadget *g, unsigned long ep_map)
+{
+	struct dwc3 *dwc = gadget_to_dwc(g);
+	unsigned long in_ep_map;
+	int fifo_size = 0;
+	int ram1_depth;
+	int ep_num;
+
+	if (!dwc->needs_fifo_resize)
+		return 0;
+
+	/* Only interested in the IN endpoints */
+	in_ep_map = ep_map >> 16;
+	ep_num = hweight_long(in_ep_map);
+
+	if (ep_num <= dwc->max_cfg_eps)
+		return 0;
+
+	/* Update the max number of eps in the composition */
+	dwc->max_cfg_eps = ep_num;
+
+	fifo_size = dwc3_gadget_calc_tx_fifo_size(dwc, dwc->max_cfg_eps);
+	/* Based on the equation, increment by one for every ep */
+	fifo_size += dwc->max_cfg_eps;
+
+	/* Check if we can fit a single fifo per endpoint */
+	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
+	if (fifo_size > ram1_depth)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.get_frame		= dwc3_gadget_get_frame,
 	.wakeup			= dwc3_gadget_wakeup,
@@ -2527,6 +2561,7 @@ static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.udc_stop		= dwc3_gadget_stop,
 	.udc_set_speed		= dwc3_gadget_set_speed,
 	.get_config_params	= dwc3_gadget_config_params,
+	.check_config		= dwc3_gadget_check_config,
 };
 
 /* -------------------------------------------------------------------------- */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

