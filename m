Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A851B3F8E8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 21:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239107AbhHZTPR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 15:15:17 -0400
Received: from mailfilter01-out40.webhostingserver.nl ([195.211.73.31]:38691
        "EHLO mailfilter01-out40.webhostingserver.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243431AbhHZTPR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 15:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exalondelft.nl; s=whs1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=BjnnRcmO7v5uNltEMMrurncOVMdTuk8RUhq+mBk137Y=;
        b=qQbVOAYw5bgIu0q2CxVn2DE5Angd0aOiL9ns5LcJjMzy2Ngp2kukAjAtcK7toBss8/gigPcau8/3H
         DYAeN9hpymfnnfxIknUof35h5eI76OikLKBzTMSXKKVBcDkdGYvBgNjoeYwvr+mA1bmfkZ33iOSJiG
         ScCMtZAOHPgOkPbIcBhF5OmY98LuXRddm+3YwiG6lxCF63CYd2HoTTdnAoskZn/NaMHVUnxFByHsVz
         ooNeW9vvl4pWwqj8Um0Qa+RhdNTfbma0jWBFKyeNQZ5VwkT55sb4iTOiSkUJWUGXrLuT/xdB0BptBW
         DalYe2RkF4ITXT7eQLaTG4v3FYm6kCg==
X-Halon-ID: 96f8ef98-069f-11ec-93c9-001a4a4cb906
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
        by mailfilter01.webhostingserver.nl (Halon) with ESMTPSA
        id 96f8ef98-069f-11ec-93c9-001a4a4cb906;
        Thu, 26 Aug 2021 20:58:24 +0200 (CEST)
Received: from [2001:981:6fec:1:f9ad:97f3:2f9b:d8ba] (helo=localhost.localdomain)
        by s198.webhostingserver.nl with esmtpa (Exim 4.94.2)
        (envelope-from <ftoth@exalondelft.nl>)
        id 1mJKa2-009E4p-85; Thu, 26 Aug 2021 20:58:24 +0200
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
Subject: [PATCH v2 1/3] Revert "usb: gadget: u_audio: add real feedback implementation"
Date:   Thu, 26 Aug 2021 20:57:37 +0200
Message-Id: <20210826185739.3868-2-ftoth@exalondelft.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210826185739.3868-1-ftoth@exalondelft.nl>
References: <20210826185739.3868-1-ftoth@exalondelft.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit e89bb4288378b85c82212b60dc98ecda6b3d3a70.

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
 drivers/usb/gadget/function/f_uac2.c          |   9 +-
 drivers/usb/gadget/function/u_audio.c         | 124 ++----------------
 drivers/usb/gadget/function/u_audio.h         |   9 --
 drivers/usb/gadget/function/u_uac2.h          |   2 -
 6 files changed, 10 insertions(+), 136 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index 26fb8e9b4e61..e7e59d7fb12f 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -9,7 +9,6 @@ Description:
 		c_srate    capture sampling rate
 		c_ssize    capture sample size (bytes)
 		c_sync     capture synchronization type (async/adaptive)
-		fb_max     maximum extra bandwidth in async mode
 		p_chmask   playback channel mask
 		p_srate    playback sampling rate
 		p_ssize    playback sample size (bytes)
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 9d6276f82774..f5a12667bd41 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -729,7 +729,6 @@ The uac2 function provides these attributes in its function directory:
 	c_srate		capture sampling rate
 	c_ssize		capture sample size (bytes)
 	c_sync		capture synchronization type (async/adaptive)
-	fb_max          maximum extra bandwidth in async mode
 	p_chmask	playback channel mask
 	p_srate		playback sampling rate
 	p_ssize		playback sample size (bytes)
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index ae29ff2b2b68..321e6c05ba93 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -584,11 +584,8 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 		ssize = uac2_opts->c_ssize;
 	}
 
-	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
-		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
-
 	max_size_bw = num_channels(chmask) * ssize *
-		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
+		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
 	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
 						    max_size_ep));
 
@@ -960,7 +957,6 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	agdev->params.c_srate = uac2_opts->c_srate;
 	agdev->params.c_ssize = uac2_opts->c_ssize;
 	agdev->params.req_number = uac2_opts->req_number;
-	agdev->params.fb_max = uac2_opts->fb_max;
 	ret = g_audio_setup(agdev, "UAC2 PCM", "UAC2_Gadget");
 	if (ret)
 		goto err_free_descs;
@@ -1333,7 +1329,6 @@ UAC2_ATTRIBUTE(c_srate);
 UAC2_ATTRIBUTE_SYNC(c_sync);
 UAC2_ATTRIBUTE(c_ssize);
 UAC2_ATTRIBUTE(req_number);
-UAC2_ATTRIBUTE(fb_max);
 
 static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_p_chmask,
@@ -1344,7 +1339,6 @@ static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_c_ssize,
 	&f_uac2_opts_attr_c_sync,
 	&f_uac2_opts_attr_req_number,
-	&f_uac2_opts_attr_fb_max,
 	NULL,
 };
 
@@ -1384,7 +1378,6 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 	opts->c_ssize = UAC2_DEF_CSSIZE;
 	opts->c_sync = UAC2_DEF_CSYNC;
 	opts->req_number = UAC2_DEF_REQ_NUM;
-	opts->fb_max = UAC2_DEF_FB_MAX;
 	return &opts->func_inst;
 }
 
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 018dd0978995..f637ebec80b0 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -16,7 +16,6 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
-#include <sound/control.h>
 
 #include "u_audio.h"
 
@@ -36,12 +35,12 @@ struct uac_rtd_params {
 
 	void *rbuf;
 
-	unsigned int pitch;	/* Stream pitch ratio to 1000000 */
 	unsigned int max_psize;	/* MaxPacketSize of endpoint */
 
 	struct usb_request **reqs;
 
 	struct usb_request *req_fback; /* Feedback endpoint request */
+	unsigned int ffback; /* Real frequency reported by feedback endpoint */
 	bool fb_ep_enabled; /* if the ep is enabled */
 };
 
@@ -76,29 +75,18 @@ static const struct snd_pcm_hardware uac_pcm_hardware = {
 };
 
 static void u_audio_set_fback_frequency(enum usb_device_speed speed,
-					unsigned long long freq,
-					unsigned int pitch,
-					void *buf)
+					unsigned int freq, void *buf)
 {
 	u32 ff = 0;
 
-	/*
-	 * Because the pitch base is 1000000, the final divider here
-	 * will be 1000 * 1000000 = 1953125 << 9
-	 *
-	 * Instead of dealing with big numbers lets fold this 9 left shift
-	 */
-
 	if (speed == USB_SPEED_FULL) {
 		/*
 		 * Full-speed feedback endpoints report frequency
-		 * in samples/frame
+		 * in samples/microframe
 		 * Format is encoded in Q10.10 left-justified in the 24 bits,
 		 * so that it has a Q10.14 format.
-		 *
-		 * ff = (freq << 14) / 1000
 		 */
-		freq <<= 5;
+		ff = DIV_ROUND_UP((freq << 14), 1000);
 	} else {
 		/*
 		 * High-speed feedback endpoints report frequency
@@ -106,14 +94,9 @@ static void u_audio_set_fback_frequency(enum usb_device_speed speed,
 		 * Format is encoded in Q12.13 fitted into four bytes so that
 		 * the binary point is located between the second and the third
 		 * byte fromat (that is Q16.16)
-		 *
-		 * ff = (freq << 16) / 8000
 		 */
-		freq <<= 4;
+		ff = DIV_ROUND_UP((freq << 13), 1000);
 	}
-
-	ff = DIV_ROUND_CLOSEST_ULL((freq * pitch), 1953125);
-
 	*(__le32 *)buf = cpu_to_le32(ff);
 }
 
@@ -226,8 +209,8 @@ static void u_audio_iso_fback_complete(struct usb_ep *ep,
 	struct uac_rtd_params *prm = req->context;
 	struct snd_uac_chip *uac = prm->uac;
 	struct g_audio *audio_dev = uac->audio_dev;
-	struct uac_params *params = &audio_dev->params;
 	int status = req->status;
+	unsigned long flags;
 
 	/* i/f shutting down */
 	if (!prm->fb_ep_enabled || req->status == -ESHUTDOWN)
@@ -242,8 +225,7 @@ static void u_audio_iso_fback_complete(struct usb_ep *ep,
 			__func__, status, req->actual, req->length);
 
 	u_audio_set_fback_frequency(audio_dev->gadget->speed,
-				    params->c_srate, prm->pitch,
-				    req->buf);
+				    prm->ffback, req->buf);
 
 	if (usb_ep_queue(ep, req, GFP_ATOMIC))
 		dev_err(uac->card->dev, "%d Error!\n", __LINE__);
@@ -498,10 +480,9 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	 * Always start with original frequency since its deviation can't
 	 * be meauserd at start of playback
 	 */
-	prm->pitch = 1000000;
+	prm->ffback = params->c_srate;
 	u_audio_set_fback_frequency(audio_dev->gadget->speed,
-				    params->c_srate, prm->pitch,
-				    req_fback->buf);
+				    prm->ffback, req_fback->buf);
 
 	if (usb_ep_queue(ep_fback, req_fback, GFP_ATOMIC))
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
@@ -597,82 +578,12 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_playback);
 
-static int u_audio_pitch_info(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_info *uinfo)
-{
-	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
-	struct snd_uac_chip *uac = prm->uac;
-	struct g_audio *audio_dev = uac->audio_dev;
-	struct uac_params *params = &audio_dev->params;
-	unsigned int pitch_min, pitch_max;
-
-	pitch_min = (1000 - FBACK_SLOW_MAX) * 1000;
-	pitch_max = (1000 + params->fb_max) * 1000;
-
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-	uinfo->count = 1;
-	uinfo->value.integer.min = pitch_min;
-	uinfo->value.integer.max = pitch_max;
-	uinfo->value.integer.step = 1;
-	return 0;
-}
-
-static int u_audio_pitch_get(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
-{
-	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
-
-	ucontrol->value.integer.value[0] = prm->pitch;
-
-	return 0;
-}
-
-static int u_audio_pitch_put(struct snd_kcontrol *kcontrol,
-				  struct snd_ctl_elem_value *ucontrol)
-{
-	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
-	struct snd_uac_chip *uac = prm->uac;
-	struct g_audio *audio_dev = uac->audio_dev;
-	struct uac_params *params = &audio_dev->params;
-	unsigned int val;
-	unsigned int pitch_min, pitch_max;
-	int change = 0;
-
-	pitch_min = (1000 - FBACK_SLOW_MAX) * 1000;
-	pitch_max = (1000 + params->fb_max) * 1000;
-
-	val = ucontrol->value.integer.value[0];
-
-	if (val < pitch_min)
-		val = pitch_min;
-	if (val > pitch_max)
-		val = pitch_max;
-
-	if (prm->pitch != val) {
-		prm->pitch = val;
-		change = 1;
-	}
-
-	return change;
-}
-
-static const struct snd_kcontrol_new u_audio_controls[]  = {
-{
-	.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
-	.name =         "Capture Pitch 1000000",
-	.info =         u_audio_pitch_info,
-	.get =          u_audio_pitch_get,
-	.put =          u_audio_pitch_put,
-},
-};
-
 int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 					const char *card_name)
 {
 	struct snd_uac_chip *uac;
 	struct snd_card *card;
 	struct snd_pcm *pcm;
-	struct snd_kcontrol *kctl;
 	struct uac_params *params;
 	int p_chmask, c_chmask;
 	int err;
@@ -760,23 +671,6 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &uac_pcm_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &uac_pcm_ops);
 
-	if (c_chmask && g_audio->in_ep_fback) {
-		strscpy(card->mixername, card_name, sizeof(card->driver));
-
-		kctl = snd_ctl_new1(&u_audio_controls[0], &uac->c_prm);
-		if (!kctl) {
-			err = -ENOMEM;
-			goto snd_fail;
-		}
-
-		kctl->id.device = pcm->device;
-		kctl->id.subdevice = 0;
-
-		err = snd_ctl_add(card, kctl);
-		if (err < 0)
-			goto snd_fail;
-	}
-
 	strscpy(card->driver, card_name, sizeof(card->driver));
 	strscpy(card->shortname, card_name, sizeof(card->shortname));
 	sprintf(card->longname, "%s %i", card_name, card->dev->id);
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index a218cdf771fe..53e6baf55cbf 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -11,14 +11,6 @@
 
 #include <linux/usb/composite.h>
 
-/*
- * Same maximum frequency deviation on the slower side as in
- * sound/usb/endpoint.c. Value is expressed in per-mil deviation.
- * The maximum deviation on the faster side will be provided as
- * parameter, as it impacts the endpoint required bandwidth.
- */
-#define FBACK_SLOW_MAX	250
-
 struct uac_params {
 	/* playback */
 	int p_chmask;	/* channel mask */
@@ -31,7 +23,6 @@ struct uac_params {
 	int c_ssize;	/* sample size */
 
 	int req_number; /* number of preallocated requests */
-	int fb_max;	/* upper frequency drift feedback limit per-mil */
 };
 
 struct g_audio {
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index 179d3ef6a195..13589c3c805c 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -23,7 +23,6 @@
 #define UAC2_DEF_CSSIZE 2
 #define UAC2_DEF_CSYNC		USB_ENDPOINT_SYNC_ASYNC
 #define UAC2_DEF_REQ_NUM 2
-#define UAC2_DEF_FB_MAX 5
 
 struct f_uac2_opts {
 	struct usb_function_instance	func_inst;
@@ -35,7 +34,6 @@ struct f_uac2_opts {
 	int				c_ssize;
 	int				c_sync;
 	int				req_number;
-	int				fb_max;
 	bool				bound;
 
 	struct mutex			lock;
-- 
2.30.2

