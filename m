Return-Path: <linux-arm-msm+bounces-113574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id THshIQqCMmqC1AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:16:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D29698E6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:16:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="H/+iFyKN";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113574-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113574-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EF8730A97E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E8844B675;
	Wed, 17 Jun 2026 10:37:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597A480DC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:37:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692672; cv=none; b=aVNJEGviu64W67TIoi3rc4yOxWQPHBYhBz7mwXIhV8OhsdU/0d8y00gU+zdL98dS/B+SlJBXyMhn1dRCjRgITz8xRy85Pe+Vq0YEeIlddxtF/hTqkLrFOJM/A0fj7ELyG6nHD7hytbqL5icOcwreRlfBRjeJ92h8h6CqRs1U914=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692672; c=relaxed/simple;
	bh=oQeHnMFhh85OozxsBb/3vNeYhtivziKLK3HDPzCNFW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=boVnnW1Mvr3kJMy7r5AH1YjZH0zcj4ec6MvfKz36a5rKyge3LyLwdWL39iFPTGzrYm/El7AJQmtsk7lcP1TYOvHX1HICRp5Tb98lZRVjnFLuUT6ictSjZohCR9YOtLG4E5K+XYOdcE3XxhFt7cGqNJFFbru70oDi7Ff8CbcZO3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/+iFyKN; arc=none smtp.client-ip=74.125.82.51
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-13988680a69so3585132c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692666; x=1782297466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwK8VBg5mhUKIoR2ZpQuKpCqhgCKrAbRlRpszsndm90=;
        b=H/+iFyKNZ3M4fbf0MbL/0BOOSfH0C1ROMOV0gtqtqv5LJJ2bAAGsy5Mvl7YlekDIES
         9LczlYvVx01dS+HvXalcD4yxmMNZlk/lhMHFCGKZ5sen5TjOaNLngJlTbNbL2tceFamX
         6nFjjnj5gndTwqEpa/2km8L2eC/sKw8ChOoHd7AGcyFc4VuLN97GSVUywYQcriApVBP3
         gxvSNvIjBftSQiYtlokBlEjmwBPJ/5FYRij785Iw8cNC0vsW51QHJfOJ3nzvd0tf9glq
         dzmPBM9Ye2i6qCqrj0cEMklSLxIzRkFfoas19Kw1Gpjp+0LYTjDToLgc7cXlgGLqBkJn
         QAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692666; x=1782297466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qwK8VBg5mhUKIoR2ZpQuKpCqhgCKrAbRlRpszsndm90=;
        b=Ss2uPVlKY1T2v/J0SMPwrY4JC2FrWz5sd/Xmc9tcJOf91jSLiD1aU4nkY/v6jT7i6f
         crKtTbw9p582Hv/WS0goE+c2BoyBeTXZz3kfxFOQJu7IFQgwzS9pjRuOFpDAvi76ixkc
         BLDJX6z6gkrnRUK4bS9t99TtPONYOsVvq+0HPmgAXjKTxp2wFACDZdvfDNe9gDAwHtyI
         tFKGMxuXBkWuaE90vMYJOzySvaj7UBEszLrwHhKC5u5VLU4yaKlj9FDFY6YS8ITGGeWN
         iqnZg5bf9kBTEPbRp5zN8094MPoF9kSsHCwiZeHlI44fphbHopfcJzUgq3NA/XICfqpH
         Xo6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ajQOcKUyFWCkKcNGK0kvC16iLl0yrdpzG12XWECv3dSrd17SXSpnTh7SdBvLb4OZnUF0cNEjvGSonGD6s@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy4kkctVzmghdSwL/Y3huBqym9zMp4YYqzPDkhbuKlrtSg2Mb8
	hHewh5SW2boJYxkOEaGBEGQ+tp3XznNBituvPP11+L7oy1Vbg6Hi04Yx
X-Gm-Gg: AfdE7cm1nosParEyP/TXPSxZUfebQQP+ZOl9zvB+w8vKOH/wC+6oCNh5EeEILP2/h1x
	CfX124iJX89tOIXZDgpsKumCpe0CcKxA895OEcuvXRNsBv1cIB+GHTsHQ+BqN3qz5nqINqkXk6H
	DXnnHeOYIpH5bniE14CbfLZBqe71IPDu3i1Lyr26Ix3V7tnbcioOGn2GsT0z5crPeIzEqrLD9ub
	NY/eMARD/qYb9zDyy5tY5//JRccMn0YW+TZH9jr2Od4T9Xd4Cj0gpa5UyERXcxsl/8u9ZX++BTi
	Cz0v3ipJLCAV9HCnfsA7lHNqdSR208hmwWTCj5ZHXK/OWtHVkj6U8+1jSOWcy+riRO7WgPR2Z2S
	JQH4BHdOM/7HL2OU2f6YksjDJF1g15aiQGG7j385K7mbEorL7s1c3UzS7M7VuuKe+N5/0mjPo14
	DD4l0kV7pMN33z4LNkckRulxceIkmlUJEmalPhqXdF/fDhAF8=
X-Received: by 2002:a05:7300:a945:b0:307:91f9:c1c1 with SMTP id 5a478bee46e88-30bca08cc96mr1666554eec.25.1781692665702;
        Wed, 17 Jun 2026 03:37:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 31/78] ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:48 +0700
Message-ID: <20260617103235.449609-32-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113574-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:ckeepax@opensource.cirrus.com,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:phucduc.bui@gmail.com,m:povik@cutebit.org,m:matthiasbgg@gmail.com,m:steveneckhoffopensource@g
 mail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,chromium.org,kernel.org,cirrus.com,opensource.cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84D29698E6F

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/hdac_hdmi.c | 116 +++++++++++++++++------------------
 1 file changed, 56 insertions(+), 60 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 3220f9226e0b..eeca901aea74 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -537,10 +537,10 @@ static struct hdac_hdmi_port *hdac_hdmi_get_port_from_cvt(
 				continue;
 
 			list_for_each_entry(port, &pcm->port_list, head) {
-				mutex_lock(&pcm->lock);
-				ret = hdac_hdmi_query_port_connlist(hdev,
-							port->pin, port);
-				mutex_unlock(&pcm->lock);
+				scoped_guard(mutex, &pcm->lock) {
+					ret = hdac_hdmi_query_port_connlist(hdev,
+								port->pin, port);
+				}
 				if (ret < 0)
 					continue;
 
@@ -640,11 +640,11 @@ static void hdac_hdmi_pcm_close(struct snd_pcm_substream *substream,
 	pcm = hdac_hdmi_get_pcm_from_cvt(hdmi, dai_map->cvt);
 
 	if (pcm) {
-		mutex_lock(&pcm->lock);
-		pcm->chmap_set = false;
-		memset(pcm->chmap, 0, sizeof(pcm->chmap));
-		pcm->channels = 0;
-		mutex_unlock(&pcm->lock);
+		scoped_guard(mutex, &pcm->lock) {
+			pcm->chmap_set = false;
+			memset(pcm->chmap, 0, sizeof(pcm->chmap));
+			pcm->channels = 0;
+		}
 	}
 
 	if (dai_map->port)
@@ -922,7 +922,7 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 	if (port == NULL)
 		return -EINVAL;
 
-	mutex_lock(&hdmi->pin_mutex);
+	guard(mutex)(&hdmi->pin_mutex);
 	list_for_each_entry(pcm, &hdmi->pcm_list, head) {
 		if (list_empty(&pcm->port_list))
 			continue;
@@ -945,12 +945,10 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 			list_add_tail(&port->head, &pcm->port_list);
 			if (port->eld.monitor_present && port->eld.eld_valid) {
 				hdac_hdmi_jack_report_sync(pcm, port, true);
-				mutex_unlock(&hdmi->pin_mutex);
 				return ret;
 			}
 		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	return ret;
 }
@@ -1274,67 +1272,66 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
 	 * In case of non MST pin, get_eld info API expectes port
 	 * to be -1.
 	 */
-	mutex_lock(&hdmi->pin_mutex);
-	port->eld.monitor_present = false;
+	scoped_guard(mutex, &hdmi->pin_mutex) {
+		port->eld.monitor_present = false;
 
-	if (pin->mst_capable)
-		port_id = port->id;
+		if (pin->mst_capable)
+			port_id = port->id;
 
-	size = snd_hdac_acomp_get_eld(hdev, pin->nid, port_id,
-				&port->eld.monitor_present,
-				port->eld.eld_buffer,
-				ELD_MAX_SIZE);
+		size = snd_hdac_acomp_get_eld(hdev, pin->nid, port_id,
+					&port->eld.monitor_present,
+					port->eld.eld_buffer,
+					ELD_MAX_SIZE);
 
-	if (size > 0) {
-		size = min(size, ELD_MAX_SIZE);
-		if (hdac_hdmi_parse_eld(hdev, port) < 0)
-			size = -EINVAL;
-	}
+		if (size > 0) {
+			size = min(size, ELD_MAX_SIZE);
+			if (hdac_hdmi_parse_eld(hdev, port) < 0)
+				size = -EINVAL;
+		}
 
-	eld_valid = port->eld.eld_valid;
+		eld_valid = port->eld.eld_valid;
 
-	if (size > 0) {
-		port->eld.eld_valid = true;
-		port->eld.eld_size = size;
-	} else {
-		port->eld.eld_valid = false;
-		port->eld.eld_size = 0;
-	}
+		if (size > 0) {
+			port->eld.eld_valid = true;
+			port->eld.eld_size = size;
+		} else {
+			port->eld.eld_valid = false;
+			port->eld.eld_size = 0;
+		}
 
-	eld_changed = (eld_valid != port->eld.eld_valid);
+		eld_changed = (eld_valid != port->eld.eld_valid);
 
-	pcm = hdac_hdmi_get_pcm(hdev, port);
+		pcm = hdac_hdmi_get_pcm(hdev, port);
 
-	if (!port->eld.monitor_present || !port->eld.eld_valid) {
+		if (!port->eld.monitor_present || !port->eld.eld_valid) {
 
-		dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
-			__func__, pin->nid, port->id);
+			dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
+				__func__, pin->nid, port->id);
 
-		/*
-		 * PCMs are not registered during device probe, so don't
-		 * report jack here. It will be done in usermode mux
-		 * control select.
-		 */
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, false);
-			schedule_work(&port->dapm_work);
-		}
-
-		mutex_unlock(&hdmi->pin_mutex);
-		return;
-	}
+			/*
+			 * PCMs are not registered during device probe, so don't
+			 * report jack here. It will be done in usermode mux
+			 * control select.
+			 */
+			if (pcm) {
+				hdac_hdmi_jack_report(pcm, port, false);
+				schedule_work(&port->dapm_work);
+			}
 
-	if (port->eld.monitor_present && port->eld.eld_valid) {
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, true);
-			schedule_work(&port->dapm_work);
+			return;
 		}
 
-		print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
-			  port->eld.eld_buffer, port->eld.eld_size, false);
+		if (port->eld.monitor_present && port->eld.eld_valid) {
+			if (pcm) {
+				hdac_hdmi_jack_report(pcm, port, true);
+				schedule_work(&port->dapm_work);
+			}
 
+			print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
+				  port->eld.eld_buffer, port->eld.eld_size, false);
+
+		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	if (eld_changed && pcm)
 		snd_ctl_notify(hdmi->card,
@@ -1795,13 +1792,12 @@ static void hdac_hdmi_set_chmap(struct hdac_device *hdev, int pcm_idx,
 	if (list_empty(&pcm->port_list))
 		return;
 
-	mutex_lock(&pcm->lock);
+	guard(mutex)(&pcm->lock);
 	pcm->chmap_set = true;
 	memcpy(pcm->chmap, chmap, ARRAY_SIZE(pcm->chmap));
 	list_for_each_entry(port, &pcm->port_list, head)
 		if (prepared)
 			hdac_hdmi_setup_audio_infoframe(hdev, pcm, port);
-	mutex_unlock(&pcm->lock);
 }
 
 static bool is_hdac_hdmi_pcm_attached(struct hdac_device *hdev, int pcm_idx)
-- 
2.43.0


