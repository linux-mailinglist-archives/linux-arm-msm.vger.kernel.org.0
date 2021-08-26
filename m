Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D29D3F8E93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 21:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238539AbhHZTQF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 15:16:05 -0400
Received: from mailfilter05-out40.webhostingserver.nl ([195.211.74.36]:28545
        "EHLO mailfilter05-out40.webhostingserver.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243390AbhHZTQF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 15:16:05 -0400
X-Greylist: delayed 962 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Aug 2021 15:16:05 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exalondelft.nl; s=whs1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=HMuEEu4uHVXJlnlSWbD6E0RyqKUtkAopwNxZWCagDfw=;
        b=jPi0yKuXsNq261eUFw4/JhpTZcz6zhKugrLx5KE196XtCkrCsukJdJG4XEfuCyTdJuOxRfoCjzj1T
         YmLFv+jYYLKLjqtOv8LqHXhQG5ovisG6eX8Fjt31MoGVZjW+nySxQ3OF+MCmh3CsNnL6DQeuw/liS6
         Zk+5v18sFuFsU28UAIfR3Ov8I65V/NLq++x24lcE/NH8JbTcwfvTwhECCxe4nrrGNfrukGxkmyiWJh
         OKYAdx0Q+QPcZPSdkt79ZspI0oK0LWtKrs8tkUPqNT5DbAgG+TEwoPbJTT7tiMf5gra51LZE6LsQre
         N5vc7HHlJ6m9+c8nCL+z77JqMIIDqKQ==
X-Halon-ID: b02d5335-069f-11ec-adfe-001a4a4cb933
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
        by mailfilter05.webhostingserver.nl (Halon) with ESMTPSA
        id b02d5335-069f-11ec-adfe-001a4a4cb933;
        Thu, 26 Aug 2021 20:59:06 +0200 (CEST)
Received: from [2001:981:6fec:1:f9ad:97f3:2f9b:d8ba] (helo=localhost.localdomain)
        by s198.webhostingserver.nl with esmtpa (Exim 4.94.2)
        (envelope-from <ftoth@exalondelft.nl>)
        id 1mJKai-009E4p-Gj; Thu, 26 Aug 2021 20:59:06 +0200
From:   Ferry Toth <ftoth@exalondelft.nl>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ferry Toth <ftoth@exalondelft.nl>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Lorenzo Colitti <lorenzo@google.com>,
        Wesley Cheng <wcheng@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH v2 3/3] Revert "usb: gadget: f_uac2/u_audio: add feedback endpoint support"
Date:   Thu, 26 Aug 2021 20:57:39 +0200
Message-Id: <20210826185739.3868-4-ftoth@exalondelft.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210826185739.3868-1-ftoth@exalondelft.nl>
References: <20210826185739.3868-1-ftoth@exalondelft.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 24f779dac8f3efb9629adc0e486914d93dc45517.

The commit is part of a series with commit
24f779dac8f3efb9629adc0e486914d93dc45517 causing a BUG on dwc3
hardware, at least on Intel Merrifield platform when configured
through configfs:
BUG: kernel NULL pointer dereference, address: 0000000000000008
...
RIP: 0010:dwc3_gadget_del_and_unmap_request+0x19/0xe0
...
Call Trace:
 dwc3_remove_requests.constprop.0+0x12f/0x170
 __dwc3_gadget_ep_disable+0x7a/0x160
 dwc3_gadget_ep_disable+0x3d/0xd0
 usb_ep_disable+0x1c/0x70
 u_audio_stop_capture+0x79/0x120 [u_audio]
 afunc_set_alt+0x73/0x80 [usb_f_uac2]
 composite_setup+0x224/0x1b90 [libcomposite]

Pavel's suggestion to add
`echo "adaptive" > functions/uac2.usb0/c_sync` to the configfs script
resolves the issue.
Thinh suggests "the crash is probably because of f_uac2 prematurely
freeing feedback request before its completion. usb_ep_dequeue() is
asynchronous. dwc2() may treat it as a synchronous call so you didn't
get a crash."

Revert as this is a regression and the kernel shouldn't crash depending
on configuration parameters.

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
---
 drivers/usb/gadget/function/f_uac2.c  |  49 +----------
 drivers/usb/gadget/function/u_audio.c | 119 +-------------------------
 drivers/usb/gadget/function/u_audio.h |   3 -
 3 files changed, 3 insertions(+), 168 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 5d63244ba319..7aa4c8bc5a1a 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -240,7 +240,7 @@ static struct usb_interface_descriptor std_as_out_if1_desc = {
 	.bDescriptorType = USB_DT_INTERFACE,
 
 	.bAlternateSetting = 1,
-	.bNumEndpoints = 2,
+	.bNumEndpoints = 1,
 	.bInterfaceClass = USB_CLASS_AUDIO,
 	.bInterfaceSubClass = USB_SUBCLASS_AUDIOSTREAMING,
 	.bInterfaceProtocol = UAC_VERSION_2,
@@ -317,37 +317,6 @@ static struct uac2_iso_endpoint_descriptor as_iso_out_desc = {
 	.wLockDelay = 0,
 };
 
-/* STD AS ISO IN Feedback Endpoint */
-static struct usb_endpoint_descriptor fs_epin_fback_desc = {
-	.bLength = USB_DT_ENDPOINT_SIZE,
-	.bDescriptorType = USB_DT_ENDPOINT,
-
-	.bEndpointAddress = USB_DIR_IN,
-	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_USAGE_FEEDBACK,
-	.wMaxPacketSize = cpu_to_le16(3),
-	.bInterval = 1,
-};
-
-static struct usb_endpoint_descriptor hs_epin_fback_desc = {
-	.bLength = USB_DT_ENDPOINT_SIZE,
-	.bDescriptorType = USB_DT_ENDPOINT,
-
-	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_USAGE_FEEDBACK,
-	.wMaxPacketSize = cpu_to_le16(4),
-	.bInterval = 4,
-};
-
-static struct usb_endpoint_descriptor ss_epin_fback_desc = {
-	.bLength = USB_DT_ENDPOINT_SIZE,
-	.bDescriptorType = USB_DT_ENDPOINT,
-
-	.bEndpointAddress = USB_DIR_IN,
-	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_USAGE_FEEDBACK,
-	.wMaxPacketSize = cpu_to_le16(4),
-	.bInterval = 4,
-};
-
-
 /* Audio Streaming IN Interface - Alt0 */
 static struct usb_interface_descriptor std_as_in_if0_desc = {
 	.bLength = sizeof std_as_in_if0_desc,
@@ -462,7 +431,6 @@ static struct usb_descriptor_header *fs_audio_desc[] = {
 	(struct usb_descriptor_header *)&as_out_fmt1_desc,
 	(struct usb_descriptor_header *)&fs_epout_desc,
 	(struct usb_descriptor_header *)&as_iso_out_desc,
-	(struct usb_descriptor_header *)&fs_epin_fback_desc,
 
 	(struct usb_descriptor_header *)&std_as_in_if0_desc,
 	(struct usb_descriptor_header *)&std_as_in_if1_desc,
@@ -493,7 +461,6 @@ static struct usb_descriptor_header *hs_audio_desc[] = {
 	(struct usb_descriptor_header *)&as_out_fmt1_desc,
 	(struct usb_descriptor_header *)&hs_epout_desc,
 	(struct usb_descriptor_header *)&as_iso_out_desc,
-	(struct usb_descriptor_header *)&hs_epin_fback_desc,
 
 	(struct usb_descriptor_header *)&std_as_in_if0_desc,
 	(struct usb_descriptor_header *)&std_as_in_if1_desc,
@@ -525,7 +492,6 @@ static struct usb_descriptor_header *ss_audio_desc[] = {
 	(struct usb_descriptor_header *)&ss_epout_desc,
 	(struct usb_descriptor_header *)&ss_epout_desc_comp,
 	(struct usb_descriptor_header *)&as_iso_out_desc,
-	(struct usb_descriptor_header *)&ss_epin_fback_desc,
 
 	(struct usb_descriptor_header *)&std_as_in_if0_desc,
 	(struct usb_descriptor_header *)&std_as_in_if1_desc,
@@ -602,26 +568,22 @@ static void setup_headers(struct f_uac2_opts *opts,
 	struct usb_ss_ep_comp_descriptor *epin_desc_comp = NULL;
 	struct usb_endpoint_descriptor *epout_desc;
 	struct usb_endpoint_descriptor *epin_desc;
-	struct usb_endpoint_descriptor *epin_fback_desc;
 	int i;
 
 	switch (speed) {
 	case USB_SPEED_FULL:
 		epout_desc = &fs_epout_desc;
 		epin_desc = &fs_epin_desc;
-		epin_fback_desc = &fs_epin_fback_desc;
 		break;
 	case USB_SPEED_HIGH:
 		epout_desc = &hs_epout_desc;
 		epin_desc = &hs_epin_desc;
-		epin_fback_desc = &hs_epin_fback_desc;
 		break;
 	default:
 		epout_desc = &ss_epout_desc;
 		epin_desc = &ss_epin_desc;
 		epout_desc_comp = &ss_epout_desc_comp;
 		epin_desc_comp = &ss_epin_desc_comp;
-		epin_fback_desc = &ss_epin_fback_desc;
 	}
 
 	i = 0;
@@ -649,7 +611,6 @@ static void setup_headers(struct f_uac2_opts *opts,
 			headers[i++] = USBDHDR(epout_desc_comp);
 
 		headers[i++] = USBDHDR(&as_iso_out_desc);
-		headers[i++] = USBDHDR(epin_fback_desc);
 	}
 	if (EPIN_EN(opts)) {
 		headers[i++] = USBDHDR(&std_as_in_if0_desc);
@@ -883,12 +844,6 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 			return -ENODEV;
 		}
-		agdev->in_ep_fback = usb_ep_autoconfig(gadget,
-						       &fs_epin_fback_desc);
-		if (!agdev->in_ep_fback) {
-			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
-			return -ENODEV;
-		}
 	}
 
 	if (EPIN_EN(uac2_opts)) {
@@ -912,10 +867,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 				le16_to_cpu(ss_epout_desc.wMaxPacketSize));
 
 	hs_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
-	hs_epin_fback_desc.bEndpointAddress = fs_epin_fback_desc.bEndpointAddress;
 	hs_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
 	ss_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
-	ss_epin_fback_desc.bEndpointAddress = fs_epin_fback_desc.bEndpointAddress;
 	ss_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
 
 	setup_descriptor(uac2_opts);
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index f637ebec80b0..5fbceee897a3 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -38,10 +38,6 @@ struct uac_rtd_params {
 	unsigned int max_psize;	/* MaxPacketSize of endpoint */
 
 	struct usb_request **reqs;
-
-	struct usb_request *req_fback; /* Feedback endpoint request */
-	unsigned int ffback; /* Real frequency reported by feedback endpoint */
-	bool fb_ep_enabled; /* if the ep is enabled */
 };
 
 struct snd_uac_chip {
@@ -74,32 +70,6 @@ static const struct snd_pcm_hardware uac_pcm_hardware = {
 	.periods_min = MIN_PERIODS,
 };
 
-static void u_audio_set_fback_frequency(enum usb_device_speed speed,
-					unsigned int freq, void *buf)
-{
-	u32 ff = 0;
-
-	if (speed == USB_SPEED_FULL) {
-		/*
-		 * Full-speed feedback endpoints report frequency
-		 * in samples/microframe
-		 * Format is encoded in Q10.10 left-justified in the 24 bits,
-		 * so that it has a Q10.14 format.
-		 */
-		ff = DIV_ROUND_UP((freq << 14), 1000);
-	} else {
-		/*
-		 * High-speed feedback endpoints report frequency
-		 * in samples/microframe.
-		 * Format is encoded in Q12.13 fitted into four bytes so that
-		 * the binary point is located between the second and the third
-		 * byte fromat (that is Q16.16)
-		 */
-		ff = DIV_ROUND_UP((freq << 13), 1000);
-	}
-	*(__le32 *)buf = cpu_to_le32(ff);
-}
-
 static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	unsigned int pending;
@@ -203,34 +173,6 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 		dev_err(uac->card->dev, "%d Error!\n", __LINE__);
 }
 
-static void u_audio_iso_fback_complete(struct usb_ep *ep,
-				       struct usb_request *req)
-{
-	struct uac_rtd_params *prm = req->context;
-	struct snd_uac_chip *uac = prm->uac;
-	struct g_audio *audio_dev = uac->audio_dev;
-	int status = req->status;
-	unsigned long flags;
-
-	/* i/f shutting down */
-	if (!prm->fb_ep_enabled || req->status == -ESHUTDOWN)
-		return;
-
-	/*
-	 * We can't really do much about bad xfers.
-	 * Afterall, the ISOCH xfers could fail legitimately.
-	 */
-	if (status)
-		pr_debug("%s: iso_complete status(%d) %d/%d\n",
-			__func__, status, req->actual, req->length);
-
-	u_audio_set_fback_frequency(audio_dev->gadget->speed,
-				    prm->ffback, req->buf);
-
-	if (usb_ep_queue(ep, req, GFP_ATOMIC))
-		dev_err(uac->card->dev, "%d Error!\n", __LINE__);
-}
-
 static int uac_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_uac_chip *uac = snd_pcm_substream_chip(substream);
@@ -393,33 +335,14 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
 		dev_err(uac->card->dev, "%s:%d Error!\n", __func__, __LINE__);
 }
 
-static inline void free_ep_fback(struct uac_rtd_params *prm, struct usb_ep *ep)
-{
-	struct snd_uac_chip *uac = prm->uac;
-
-	if (!prm->fb_ep_enabled)
-		return;
-
-	prm->fb_ep_enabled = false;
-
-	if (prm->req_fback) {
-		usb_ep_dequeue(ep, prm->req_fback);
-		kfree(prm->req_fback->buf);
-		usb_ep_free_request(ep, prm->req_fback);
-		prm->req_fback = NULL;
-	}
-
-	if (usb_ep_disable(ep))
-		dev_err(uac->card->dev, "%s:%d Error!\n", __func__, __LINE__);
-}
 
 int u_audio_start_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 	struct usb_gadget *gadget = audio_dev->gadget;
 	struct device *dev = &gadget->dev;
-	struct usb_request *req, *req_fback;
-	struct usb_ep *ep, *ep_fback;
+	struct usb_request *req;
+	struct usb_ep *ep;
 	struct uac_rtd_params *prm;
 	struct uac_params *params = &audio_dev->params;
 	int req_len, i;
@@ -451,42 +374,6 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 	}
 
-	ep_fback = audio_dev->in_ep_fback;
-	if (!ep_fback)
-		return 0;
-
-	/* Setup feedback endpoint */
-	config_ep_by_speed(gadget, &audio_dev->func, ep_fback);
-	prm->fb_ep_enabled = true;
-	usb_ep_enable(ep_fback);
-	req_len = ep_fback->maxpacket;
-
-	req_fback = usb_ep_alloc_request(ep_fback, GFP_ATOMIC);
-	if (req_fback == NULL)
-		return -ENOMEM;
-
-	prm->req_fback = req_fback;
-	req_fback->zero = 0;
-	req_fback->context = prm;
-	req_fback->length = req_len;
-	req_fback->complete = u_audio_iso_fback_complete;
-
-	req_fback->buf = kzalloc(req_len, GFP_ATOMIC);
-	if (!req_fback->buf)
-		return -ENOMEM;
-
-	/*
-	 * Configure the feedback endpoint's reported frequency.
-	 * Always start with original frequency since its deviation can't
-	 * be meauserd at start of playback
-	 */
-	prm->ffback = params->c_srate;
-	u_audio_set_fback_frequency(audio_dev->gadget->speed,
-				    prm->ffback, req_fback->buf);
-
-	if (usb_ep_queue(ep_fback, req_fback, GFP_ATOMIC))
-		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(u_audio_start_capture);
@@ -495,8 +382,6 @@ void u_audio_stop_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 
-	if (audio_dev->in_ep_fback)
-		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
 	free_ep(&uac->c_prm, audio_dev->out_ep);
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_capture);
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 53e6baf55cbf..5ea6b86f1fda 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -30,10 +30,7 @@ struct g_audio {
 	struct usb_gadget *gadget;
 
 	struct usb_ep *in_ep;
-
 	struct usb_ep *out_ep;
-	/* feedback IN endpoint corresponding to out_ep */
-	struct usb_ep *in_ep_fback;
 
 	/* Max packet size for all in_ep possible speeds */
 	unsigned int in_ep_maxpsize;
-- 
2.30.2

