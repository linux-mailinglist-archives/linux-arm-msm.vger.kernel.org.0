Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC441C9E11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 23:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgEGV7n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 17:59:43 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:36708 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726701AbgEGV7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 17:59:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588888782; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=jeh1yXBE1sSXYGLU6lgO734SECYPdjSZPlkD/O5jYeQ=; b=v6fFifYW3/wTUZBQ6xTmHRHn++rOVbed8w5IsTjDjlgmfyke2xSzQBPfPo3sW+X1/lbCOAMe
 Y4QXYrWiOxGRklW2p+ZqjnRizLmvmAOmb6SUTUkImUNZYrKiS955xcEPfdoOiSrSHnK6ssnf
 Q9Z1VwIkJHTP611CUHNex257nmQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb484c8.7f0128d697a0-smtp-out-n01;
 Thu, 07 May 2020 21:59:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7961EC43636; Thu,  7 May 2020 21:59:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B3F09C433BA;
        Thu,  7 May 2020 21:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B3F09C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [RFC 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
Date:   Thu,  7 May 2020 14:59:26 -0700
Message-Id: <1588888768-25315-2-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588888768-25315-1-git-send-email-wcheng@codeaurora.org>
References: <1588888768-25315-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some devices have USB compositions which may require multiple endpoints
that support EP bursting.  HW defined TX FIFO sizes may not always be
sufficient for these compositions.  By utilizing flexible TX FIFO
allocation, this allows for endpoints to request the required FIFO depth to
achieve higher bandwidth.  With some higher bMaxBurst configurations, using
a larger TX FIFO size results in better TX throughput.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/dwc3/core.c   |  2 +
 drivers/usb/dwc3/core.h   |  6 +++
 drivers/usb/dwc3/ep0.c    | 40 +++++++++++++++++++-
 drivers/usb/dwc3/gadget.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 142 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index edc1715..cca5554 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1304,6 +1304,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				&tx_thr_num_pkt_prd);
 	device_property_read_u8(dev, "snps,tx-max-burst-prd",
 				&tx_max_burst_prd);
+	dwc->needs_fifo_resize = device_property_read_bool(dev,
+				"tx-fifo-resize");
 
 	dwc->disable_scramble_quirk = device_property_read_bool(dev,
 				"snps,disable_scramble_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 4c171a8..e815c13 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -675,6 +675,7 @@ struct dwc3_event_buffer {
  *		isochronous START TRANSFER command failure workaround
  * @start_cmd_status: the status of testing START TRANSFER command with
  *		combo_num = 'b00
+ * @fifo_depth: allocated TXFIFO depth
  */
 struct dwc3_ep {
 	struct usb_ep		endpoint;
@@ -718,6 +719,7 @@ struct dwc3_ep {
 	u8			resource_index;
 	u32			frame_number;
 	u32			interval;
+	int			fifo_depth;
 
 	char			name[20];
 
@@ -1004,6 +1006,7 @@ struct dwc3_scratchpad_array {
  * 	1	- utmi_l1_suspend_n
  * @is_fpga: true when we are using the FPGA board
  * @pending_events: true when we have pending IRQs to be handled
+ * @needs_fifo_resize: not all users might want fifo resizing, flag it
  * @pullups_connected: true when Run/Stop bit is set
  * @setup_packet_pending: true when there's a Setup Packet in FIFO. Workaround
  * @three_stage_setup: set if we perform a three phase setup
@@ -1044,6 +1047,7 @@ struct dwc3_scratchpad_array {
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @imod_interval: set the interrupt moderation interval in 250ns
  *                 increments or 0 to disable.
+ * @last_fifo_depth: total TXFIFO depth of all enabled USB IN/INT endpoints
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1204,6 +1208,7 @@ struct dwc3 {
 	unsigned		is_utmi_l1_suspend:1;
 	unsigned		is_fpga:1;
 	unsigned		pending_events:1;
+	unsigned		needs_fifo_resize:1;
 	unsigned		pullups_connected:1;
 	unsigned		setup_packet_pending:1;
 	unsigned		three_stage_setup:1;
@@ -1236,6 +1241,7 @@ struct dwc3 {
 	unsigned		dis_metastability_quirk:1;
 
 	u16			imod_interval;
+	int			last_fifo_depth;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 6dee4da..7ee2302 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -601,8 +601,9 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 {
 	enum usb_device_state state = dwc->gadget.state;
 	u32 cfg;
-	int ret;
+	int ret, num, size;
 	u32 reg;
+	struct dwc3_ep *dep;
 
 	cfg = le16_to_cpu(ctrl->wValue);
 
@@ -611,6 +612,43 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 		return -EINVAL;
 
 	case USB_STATE_ADDRESS:
+		/*
+		 * If tx-fifo-resize flag is not set for the controller, then
+		 * do not clear existing allocated TXFIFO since we do not
+		 * allocate it again in dwc3_gadget_resize_tx_fifos
+		 */
+		if (dwc->needs_fifo_resize) {
+			/* Read ep0IN related TXFIFO size */
+			dep = dwc->eps[1];
+			size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
+			if (dwc3_is_usb31(dwc))
+				dep->fifo_depth = DWC31_GTXFIFOSIZ_TXFDEP(size);
+			else
+				dep->fifo_depth = DWC3_GTXFIFOSIZ_TXFDEP(size);
+
+			dwc->last_fifo_depth = dep->fifo_depth;
+			/* Clear existing TXFIFO for all IN eps except ep0 */
+			for (num = 3; num < min_t(int, dwc->num_eps,
+				DWC3_ENDPOINTS_NUM); num += 2) {
+				dep = dwc->eps[num];
+				/* Don't change TXFRAMNUM on usb31 version */
+				size = dwc3_is_usb31(dwc) ?
+					dwc3_readl(dwc->regs,
+						   DWC3_GTXFIFOSIZ(num >> 1)) &
+						   DWC31_GTXFIFOSIZ_TXFRAMNUM :
+						   0;
+
+				dwc3_writel(dwc->regs,
+					    DWC3_GTXFIFOSIZ(num >> 1),
+					    size);
+				dep->fifo_depth = 0;
+
+				dev_dbg(dwc->dev, "%s(): %s fifo_depth:%x\n",
+					__func__, dep->name,
+					dep->fifo_depth);
+			}
+		}
+
 		ret = dwc3_ep0_delegate_req(dwc, ctrl);
 		/* if the cfg matches and the cfg is non zero */
 		if (cfg && (!ret || (ret == USB_GADGET_DELAYED_STATUS))) {
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 00746c2..6baca05 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -540,6 +540,97 @@ static int dwc3_gadget_start_config(struct dwc3_ep *dep)
 	return 0;
 }
 
+/*
+ * dwc3_gadget_resize_tx_fifos - reallocate fifo spaces for current use-case
+ * @dwc: pointer to our context structure
+ *
+ * This function will a best effort FIFO allocation in order
+ * to improve FIFO usage and throughput, while still allowing
+ * us to enable as many endpoints as possible.
+ *
+ * Keep in mind that this operation will be highly dependent
+ * on the configured size for RAM1 - which contains TxFifo -,
+ * the amount of endpoints enabled on coreConsultant tool, and
+ * the width of the Master Bus.
+ *
+ * In the ideal world, we would always be able to satisfy the
+ * following equation:
+ *
+ * ((512 + 2 * MDWIDTH-Bytes) + (Number of IN Endpoints - 1) * \
+ * (3 * (1024 + MDWIDTH-Bytes) + MDWIDTH-Bytes)) / MDWIDTH-Bytes
+ *
+ * Unfortunately, due to many variables that's not always the case.
+ */
+static int dwc3_gadget_resize_tx_fifos(struct dwc3 *dwc, struct dwc3_ep *dep)
+{
+	int fifo_size, mdwidth, max_packet = 1024;
+	int tmp, mult = 1, fifo_0_start, ram1_depth;
+
+	if (!dwc->needs_fifo_resize)
+		return 0;
+
+	/* resize IN endpoints excepts ep0 */
+	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
+		return 0;
+
+	/* Don't resize already resized IN endpoint */
+	if (dep->fifo_depth) {
+		dev_dbg(dwc->dev, "%s fifo_depth:%d is already set\n",
+					dep->endpoint.name, dep->fifo_depth);
+		return 0;
+	}
+
+	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
+	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
+	/* MDWIDTH is represented in bits, we need it in bytes */
+	mdwidth >>= 3;
+
+	if (((dep->endpoint.maxburst > 1) &&
+			usb_endpoint_xfer_bulk(dep->endpoint.desc))
+			|| usb_endpoint_xfer_isoc(dep->endpoint.desc))
+		mult = 3;
+
+	if ((dep->endpoint.maxburst > 6) &&
+			usb_endpoint_xfer_bulk(dep->endpoint.desc)
+			&& dwc3_is_usb31(dwc))
+		mult = 6;
+
+	tmp = ((max_packet + mdwidth) * mult) + mdwidth;
+	fifo_size = DIV_ROUND_UP(tmp, mdwidth);
+	dep->fifo_depth = fifo_size;
+
+	/* Check if TXFIFOs start at non-zero addr */
+	tmp = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
+	fifo_0_start = DWC3_GTXFIFOSIZ_TXFSTADDR(tmp);
+
+	fifo_size |= (fifo_0_start + (dwc->last_fifo_depth << 16));
+	if (dwc3_is_usb31(dwc))
+		dwc->last_fifo_depth += DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
+	else
+		dwc->last_fifo_depth += DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
+
+	dev_dbg(dwc->dev, "%s ep_num:%d last_fifo_depth:%04x fifo_depth:%d\n",
+			dep->endpoint.name, dep->number >> 1,
+			dwc->last_fifo_depth, dep->fifo_depth);
+
+	/* Check fifo size allocation doesn't exceed available RAM size. */
+	if (dwc->last_fifo_depth >= ram1_depth) {
+		dev_err(dwc->dev, "Fifosize(%d) > RAM size(%d) %s depth:%d\n",
+				(dwc->last_fifo_depth * mdwidth), ram1_depth,
+				dep->endpoint.name, fifo_size);
+		if (dwc3_is_usb31(dwc))
+			fifo_size = DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
+		else
+			fifo_size = DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
+		dwc->last_fifo_depth -= fifo_size;
+		dep->fifo_depth = 0;
+		return -ENOMEM;
+	}
+
+	dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
+	return 0;
+}
+
 static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
 {
 	const struct usb_ss_ep_comp_descriptor *comp_desc;
@@ -620,6 +711,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
 	int			ret;
 
 	if (!(dep->flags & DWC3_EP_ENABLED)) {
+		ret = dwc3_gadget_resize_tx_fifos(dwc, dep);
+		if (ret)
+			return ret;
+
 		ret = dwc3_gadget_start_config(dep);
 		if (ret)
 			return ret;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
