Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA71C3F8E5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 20:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243471AbhHZS7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 14:59:41 -0400
Received: from mailfilter02-out40.webhostingserver.nl ([195.211.72.22]:22967
        "EHLO mailfilter02-out40.webhostingserver.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243438AbhHZS7i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 14:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exalondelft.nl; s=whs1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=yP4ZiiabAHmwBdK9Dfhd4Xhdf3X2enycZSmYcpTu9lk=;
        b=Goe6uZ+fCbPanNhpbBvWUApG85bx/XxasUKp5x/W+0YD9203pNqlA3Q3fVZNtKxemVf2cZ6FNEZr5
         34QPMD6lRw1FFqACTm2fsx9fUvAGOQ/PLVaQSl5z/n3BLVsgv9H3oGcwobSiYnVgg+VHhaqdGpuw8L
         164LnWNLT+kQbQddRSyVF31KKZbLDZO3i7InDknuGIQ4UONQhry+vwlFZ3UCdJULNhRZAgw69G141C
         8+hpLo10mwD7wtRK8weq1RnfQvrRhHqQEtsFGVw2jWKPcOxPK6vRZ6c+C6a422dV11YnaHRDzIZ06h
         8XlsmsmbB5aG6l1XOfj8E4oAkOssUHA==
X-Halon-ID: a3dae139-069f-11ec-a0ff-001a4a4cb922
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
        by mailfilter02.webhostingserver.nl (Halon) with ESMTPSA
        id a3dae139-069f-11ec-a0ff-001a4a4cb922;
        Thu, 26 Aug 2021 20:58:46 +0200 (CEST)
Received: from [2001:981:6fec:1:f9ad:97f3:2f9b:d8ba] (helo=localhost.localdomain)
        by s198.webhostingserver.nl with esmtpa (Exim 4.94.2)
        (envelope-from <ftoth@exalondelft.nl>)
        id 1mJKaN-009E4p-Ry; Thu, 26 Aug 2021 20:58:45 +0200
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
Subject: [PATCH v2 2/3] Revert "usb: gadget: f_uac2: add adaptive sync support for capture"
Date:   Thu, 26 Aug 2021 20:57:38 +0200
Message-Id: <20210826185739.3868-3-ftoth@exalondelft.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210826185739.3868-1-ftoth@exalondelft.nl>
References: <20210826185739.3868-1-ftoth@exalondelft.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 40c73b30546e759bedcec607fedc2d4be954508f.

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
 .../ABI/testing/configfs-usb-gadget-uac2      |   1 -
 Documentation/usb/gadget-testing.rst          |   1 -
 drivers/usb/gadget/function/f_uac2.c          | 100 ++----------------
 drivers/usb/gadget/function/u_uac2.h          |   2 -
 4 files changed, 9 insertions(+), 95 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index e7e59d7fb12f..d4356c8b8cd6 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -8,7 +8,6 @@ Description:
 		c_chmask   capture channel mask
 		c_srate    capture sampling rate
 		c_ssize    capture sample size (bytes)
-		c_sync     capture synchronization type (async/adaptive)
 		p_chmask   playback channel mask
 		p_srate    playback sampling rate
 		p_ssize    playback sample size (bytes)
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index f5a12667bd41..2085e7b24eeb 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -728,7 +728,6 @@ The uac2 function provides these attributes in its function directory:
 	c_chmask	capture channel mask
 	c_srate		capture sampling rate
 	c_ssize		capture sample size (bytes)
-	c_sync		capture synchronization type (async/adaptive)
 	p_chmask	playback channel mask
 	p_srate		playback sampling rate
 	p_ssize		playback sample size (bytes)
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 321e6c05ba93..5d63244ba319 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -44,7 +44,6 @@
 
 #define EPIN_EN(_opts) ((_opts)->p_chmask != 0)
 #define EPOUT_EN(_opts) ((_opts)->c_chmask != 0)
-#define EPOUT_FBACK_IN_EN(_opts) ((_opts)->c_sync == USB_ENDPOINT_SYNC_ASYNC)
 
 struct f_uac2 {
 	struct g_audio g_audio;
@@ -241,7 +240,7 @@ static struct usb_interface_descriptor std_as_out_if1_desc = {
 	.bDescriptorType = USB_DT_INTERFACE,
 
 	.bAlternateSetting = 1,
-	.bNumEndpoints = 1,
+	.bNumEndpoints = 2,
 	.bInterfaceClass = USB_CLASS_AUDIO,
 	.bInterfaceSubClass = USB_SUBCLASS_AUDIOSTREAMING,
 	.bInterfaceProtocol = UAC_VERSION_2,
@@ -274,7 +273,7 @@ static struct usb_endpoint_descriptor fs_epout_desc = {
 	.bDescriptorType = USB_DT_ENDPOINT,
 
 	.bEndpointAddress = USB_DIR_OUT,
-	/* .bmAttributes = DYNAMIC */
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
 	/* .wMaxPacketSize = DYNAMIC */
 	.bInterval = 1,
 };
@@ -283,7 +282,7 @@ static struct usb_endpoint_descriptor hs_epout_desc = {
 	.bLength = USB_DT_ENDPOINT_SIZE,
 	.bDescriptorType = USB_DT_ENDPOINT,
 
-	/* .bmAttributes = DYNAMIC */
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
 	/* .wMaxPacketSize = DYNAMIC */
 	.bInterval = 4,
 };
@@ -293,7 +292,7 @@ static struct usb_endpoint_descriptor ss_epout_desc = {
 	.bDescriptorType = USB_DT_ENDPOINT,
 
 	.bEndpointAddress = USB_DIR_OUT,
-	/* .bmAttributes = DYNAMIC */
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
 	/* .wMaxPacketSize = DYNAMIC */
 	.bInterval = 4,
 };
@@ -650,9 +649,7 @@ static void setup_headers(struct f_uac2_opts *opts,
 			headers[i++] = USBDHDR(epout_desc_comp);
 
 		headers[i++] = USBDHDR(&as_iso_out_desc);
-
-		if (EPOUT_FBACK_IN_EN(opts))
-			headers[i++] = USBDHDR(epin_fback_desc);
+		headers[i++] = USBDHDR(epin_fback_desc);
 	}
 	if (EPIN_EN(opts)) {
 		headers[i++] = USBDHDR(&std_as_in_if0_desc);
@@ -823,23 +820,6 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		std_as_out_if1_desc.bInterfaceNumber = ret;
 		uac2->as_out_intf = ret;
 		uac2->as_out_alt = 0;
-
-		if (EPOUT_FBACK_IN_EN(uac2_opts)) {
-			fs_epout_desc.bmAttributes =
-			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
-			hs_epout_desc.bmAttributes =
-			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
-			ss_epout_desc.bmAttributes =
-			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
-			std_as_out_if1_desc.bNumEndpoints++;
-		} else {
-			fs_epout_desc.bmAttributes =
-			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
-			hs_epout_desc.bmAttributes =
-			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
-			ss_epout_desc.bmAttributes =
-			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
-		}
 	}
 
 	if (EPIN_EN(uac2_opts)) {
@@ -903,14 +883,11 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 			return -ENODEV;
 		}
-		if (EPOUT_FBACK_IN_EN(uac2_opts)) {
-			agdev->in_ep_fback = usb_ep_autoconfig(gadget,
+		agdev->in_ep_fback = usb_ep_autoconfig(gadget,
 						       &fs_epin_fback_desc);
-			if (!agdev->in_ep_fback) {
-				dev_err(dev, "%s:%d Error!\n",
-					__func__, __LINE__);
-				return -ENODEV;
-			}
+		if (!agdev->in_ep_fback) {
+			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
+			return -ENODEV;
 		}
 	}
 
@@ -1265,68 +1242,11 @@ end:									\
 									\
 CONFIGFS_ATTR(f_uac2_opts_, name)
 
-#define UAC2_ATTRIBUTE_SYNC(name)					\
-static ssize_t f_uac2_opts_##name##_show(struct config_item *item,	\
-					 char *page)			\
-{									\
-	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
-	int result;							\
-	char *str;							\
-									\
-	mutex_lock(&opts->lock);					\
-	switch (opts->name) {						\
-	case USB_ENDPOINT_SYNC_ASYNC:					\
-		str = "async";						\
-		break;							\
-	case USB_ENDPOINT_SYNC_ADAPTIVE:				\
-		str = "adaptive";					\
-		break;							\
-	default:							\
-		str = "unknown";					\
-		break;							\
-	}								\
-	result = sprintf(page, "%s\n", str);				\
-	mutex_unlock(&opts->lock);					\
-									\
-	return result;							\
-}									\
-									\
-static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
-					  const char *page, size_t len)	\
-{									\
-	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
-	int ret = 0;							\
-									\
-	mutex_lock(&opts->lock);					\
-	if (opts->refcnt) {						\
-		ret = -EBUSY;						\
-		goto end;						\
-	}								\
-									\
-	if (!strncmp(page, "async", 5))					\
-		opts->name = USB_ENDPOINT_SYNC_ASYNC;			\
-	else if (!strncmp(page, "adaptive", 8))				\
-		opts->name = USB_ENDPOINT_SYNC_ADAPTIVE;		\
-	else {								\
-		ret = -EINVAL;						\
-		goto end;						\
-	}								\
-									\
-	ret = len;							\
-									\
-end:									\
-	mutex_unlock(&opts->lock);					\
-	return ret;							\
-}									\
-									\
-CONFIGFS_ATTR(f_uac2_opts_, name)
-
 UAC2_ATTRIBUTE(p_chmask);
 UAC2_ATTRIBUTE(p_srate);
 UAC2_ATTRIBUTE(p_ssize);
 UAC2_ATTRIBUTE(c_chmask);
 UAC2_ATTRIBUTE(c_srate);
-UAC2_ATTRIBUTE_SYNC(c_sync);
 UAC2_ATTRIBUTE(c_ssize);
 UAC2_ATTRIBUTE(req_number);
 
@@ -1337,7 +1257,6 @@ static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_c_chmask,
 	&f_uac2_opts_attr_c_srate,
 	&f_uac2_opts_attr_c_ssize,
-	&f_uac2_opts_attr_c_sync,
 	&f_uac2_opts_attr_req_number,
 	NULL,
 };
@@ -1376,7 +1295,6 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 	opts->c_chmask = UAC2_DEF_CCHMASK;
 	opts->c_srate = UAC2_DEF_CSRATE;
 	opts->c_ssize = UAC2_DEF_CSSIZE;
-	opts->c_sync = UAC2_DEF_CSYNC;
 	opts->req_number = UAC2_DEF_REQ_NUM;
 	return &opts->func_inst;
 }
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index 13589c3c805c..b5035711172d 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -21,7 +21,6 @@
 #define UAC2_DEF_CCHMASK 0x3
 #define UAC2_DEF_CSRATE 64000
 #define UAC2_DEF_CSSIZE 2
-#define UAC2_DEF_CSYNC		USB_ENDPOINT_SYNC_ASYNC
 #define UAC2_DEF_REQ_NUM 2
 
 struct f_uac2_opts {
@@ -32,7 +31,6 @@ struct f_uac2_opts {
 	int				c_chmask;
 	int				c_srate;
 	int				c_ssize;
-	int				c_sync;
 	int				req_number;
 	bool				bound;
 
-- 
2.30.2

