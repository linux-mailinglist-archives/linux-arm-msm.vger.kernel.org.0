Return-Path: <linux-arm-msm+bounces-113594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sxb0Hel/Mmq+0wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:07:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9525698CFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:07:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MJzQgBPB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113594-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113594-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E683D32FE64C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EFF47884B;
	Wed, 17 Jun 2026 10:41:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD72643E48C
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:40:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692861; cv=none; b=Xjous7WU/wyYok3KK9HakQ+ju3a0r4M2QOanSRFFiDAL7XyRxIsfW3lg638PpDg/WNPhXZhdM4IxAx+Q6hXE5r8F+RufneuOVyPm85SGv4ilSIkvNFpNNWhfit9cyvsJkuqFX/vW6bvA6WxTVnXBJV4WZ2Vu7GgrUFd+R68IObw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692861; c=relaxed/simple;
	bh=QkG7uMhxFhIgdfzJMdnxdGkaLUEDO6tHpYig6hGOA/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1pMM5HEhprNlavY40SI4+ZX+0dVEvMsp9VMFV+nDCfkXOpnmM8wms1+2Txxa9HuLag29sWa/Iog8zfQYKe0mFNPLLnrrhHfkGqSUmfxEcTAm3wifbeGobNyTbyVVODopHY/oWzAplW0F/puFfCW3bR9p/qI3MHNhka+MEqZoLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJzQgBPB; arc=none smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so2732209eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692857; x=1782297657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxB3SnelSJeC61Cb2O2sZ2DxgfCvfhJf77FHm8odZMc=;
        b=MJzQgBPBt2rwZXJjiBNEWBVl/FO9EPxRhpM9n5Ar2hXf1nnB4logthggFDDUpIoqQI
         1/dpahilPP7Ut8oSHrLqP/ZmwwxnYHqd+vxJmtfmMvu2ftuA/LkyP/hflyzz19H76aAJ
         ayexVvU3f9y7ZAsfWbrCAFRT6s5IfkOhUZI2DGlcKhz1lPMUMgkgy5ipGNs1zE8yrPug
         y/gKD82K4WNNMQ4ghV91VGyjCilqKCoi3xVUJb6RGly9WnkG6qW3jTf4s1TCQns86gOm
         JnlGcsqJQBEItFdzi5OQfx2dn3dl67geUfY3eB+ZwNkxMYRJ9w2uLBZF4WmFGC+Nk4uO
         TW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692857; x=1782297657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxB3SnelSJeC61Cb2O2sZ2DxgfCvfhJf77FHm8odZMc=;
        b=gn75RkPob7J+EDz6Z9o6UiBEH7K8q529G8gvxQfN5elwljy5KFJK0pMtYmw1Qr0m0z
         glEva42LcFyT4sgiRKksJ+Fx1orGCDcK93lgsIjCtnWt6r5g7a82bGAlTeFxwmCOPOOw
         eCgn/99yJe+N+9X71SCAFUA20TDONdjfnvWIIK1f2mwprpeIW6hVjlgXysE5DkbzvmJe
         cYDjG9XUEYLmQMiv3N6iHfP96prAbBL2yveugwxc0lagd3H5MeWeuftLjxIl2U+wvwOq
         KKhhe6EcCIxr3Lyk5+MFpapmww5oUsWG8hqUiZLq5CqI9XXbWhjaCxP59C5JEMDaCcNd
         UW/g==
X-Forwarded-Encrypted: i=1; AFNElJ8Z4evCyMInYUvWSJEhO41cxfrSHnZdpQ2GCfeU35+HZRtV68jrsTZq6OZAhoPGc8yg4I0sprXqK++os69s@vger.kernel.org
X-Gm-Message-State: AOJu0YwNy479IIAzIN3XanYJJ+leb10+RFhTF2SHZmLALtrhfmqfjw50
	u5S7IfnofFEscdhzAPBNGZG66w65/xlZtYx29IP5pS1y4Ku8Qc0NPiAc
X-Gm-Gg: AfdE7clsIRwCWI4oZeGwNUG+Y8AW+SXfbukp3N7f1GYj8ms32DKoKLWHpDYq8tnmv0j
	9mnNDwpY2tLb1cm+eGMj28LfHC0Iw/yunEX9AqF6UCA9ZQOwIrsC25Aqk/eGRjOSDS5CbPGW3Sp
	fSoaFhWhlM4+3iyMUHZsSMmpudSHWqvojpMMBralMXF86jMNxxt8qYmf2th6ypv/d4VKvgZfd/0
	CXG8YQc60tIdPmjt6N+VTEDt8Sk0xVjbFq0ttX6Oe2KHPBIVLYrWRTD+9+QykHdUD5JXWTAkUzg
	GIdNSYFPUJJCD8ZlRVluuWDW9ubDp90QoTMbBQph4ecyyff2AeoVpRexWXx5mbe/7BjLP5hFeUR
	bBtVMCeowkvNIjAcIM6apopnHcuQ/bq9A9M+Fw/ziv68L+sE7Ebeb9QaVpHE0UNepVKsjzuEPZ/
	zwtXOZyDURGYtbG6UZoJ8aePCDjlnTdNyektO72vuwPUSE8Sw=
X-Received: by 2002:a05:7301:10c5:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30bc9cad496mr1423566eec.3.1781692856764;
        Wed, 17 Jun 2026 03:40:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:56 -0700 (PDT)
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
Subject: [PATCH 51/78] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:08 +0700
Message-ID: <20260617103235.449609-52-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113594-lists,linux-arm-msm=lfdr.de];
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
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9525698CFA

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 33 +++++++++++++++----------------
 sound/soc/codecs/rt722-sdca.c     |  3 +--
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 0f76492ff915..ca5a4ee6ce9e 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -368,7 +368,7 @@ static int rt722_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt722->disable_irq_lock);
+	guard(mutex)(&rt722->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt722->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -432,12 +432,9 @@ static int rt722_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt722->jack_detect_work, msecs_to_jiffies(280));
 
-	mutex_unlock(&rt722->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt722->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -514,13 +511,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt722_sdca->disable_irq_lock);
-	rt722_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt722_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt722_sdca->disable_irq_lock) {
+		rt722_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -542,13 +539,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt722->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt722->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1b6729f363fc..5fb5dc2ee3b4 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -294,7 +294,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +317,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


