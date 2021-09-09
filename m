Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F2940470D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 10:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbhIIIdD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 04:33:03 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32638 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhIIIdA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 04:33:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631176311; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=WeDU2UfoS/QAembprc7Uuqn09jNOdrtvr6LpshpTedA=; b=Czh3qSC90SjcNOV2UDqaOe5c44BWcZuZJ7t19XA0U3iy8cJesOGaqSS894X6Bji3hl1lcJNb
 Ajvy3nw41n0Xctxo/dMG9w8zGYycQmlsGx98qIP3petMLap3znA6kEajSsH1izfpj0TObkJL
 oLatNsw7lTFNE5UhfJxGa0JjSas=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6139c664ab61cfa9f4d768ba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 08:31:32
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90074C43616; Thu,  9 Sep 2021 08:31:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7131EC4338F;
        Thu,  9 Sep 2021 08:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7131EC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already resized
Date:   Thu,  9 Sep 2021 01:31:20 -0700
Message-Id: <20210909083120.15350-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some functions may dynamically enable and disable their endpoints
regularly throughout their operation, particularly when Set Interface
is employed to switch between Alternate Settings.  For instance the
UAC2 function has its respective endpoints for playback & capture
associated with AltSetting 1, in which case those endpoints would not
get enabled until the host activates the AltSetting.  And they
conversely become disabled when the interfaces' AltSetting 0 is
chosen.

With the DWC3 FIFO resizing algorithm recently added, every
usb_ep_enable() call results in a call to resize that EP's TXFIFO,
but if the same endpoint is enabled again and again, this incorrectly
leads to FIFO RAM allocation exhaustion as the mechanism did not
account for the possibility that endpoints can be re-enabled many
times.

Example log splat:

	dwc3 a600000.dwc3: Fifosize(3717) > RAM size(3462) ep3in depth:217973127
	configfs-gadget gadget: u_audio_start_capture:521 Error!
	dwc3 a600000.dwc3: request 000000000be13e18 was not queued to ep3in

This is easily fixed by bailing out of dwc3_gadget_resize_tx_fifos()
if an endpoint is already resized, avoiding the calculation error
resulting from accumulating the EP's FIFO depth repeatedly.

Fixes: 9f607a309fbe9 ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirements")
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/dwc3/gadget.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 804b50548163..c647c76d7361 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -747,6 +747,10 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
 	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
 		return 0;
 
+	/* bail if already resized */
+	if (dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1)))
+		return 0;
+
 	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
 
 	if ((dep->endpoint.maxburst > 1 &&
-- 
2.24.0

