Return-Path: <linux-arm-msm+bounces-117682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ug/tLKViTmrZLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:45:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A96617278AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:45:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kF0Q5Mk2;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117682-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117682-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76C3530B410C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797204D2EEA;
	Wed,  8 Jul 2026 14:22:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DFA4D2EE4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:22:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520566; cv=none; b=QCtNnAche7A/Ld/VpjWJypzfR5C4rwMKbluFKSDI4qJeXvTlN0NdxcnQROW+vNxi19nbdtXBff8Ipjrh0K4EvNdiJOKI9Iy9W+FDNmkvFpII9cpoUp3IRn33AtueuqzYlASYqCT7NXS4G0OOBy6B6BHM9aQ5+fztruO2nyxX21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520566; c=relaxed/simple;
	bh=fBZDeHAFDZr0SJjeir1J7nLoUKn2MLHuB+Y6RtEoAU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGgfHJ4u7E94O7x2hOpnAGE8zegFO1lU6Lr/WHLIXIWhQQEpVIm/DXBp4x+P1uAKFXGxJSKtx5u6i4j2hYcx1vkX6JrXuMLCnqqPp7x2tUdg3PYw+6ckse1cyZNbaY+vsIhsPD+g0Srp8F6COYgDhJWUCxUOfvQQ55KBg1nZ8OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kF0Q5Mk2; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso9420585ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520564; x=1784125364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=kF0Q5Mk2A03k0aOv/Kh65i/Yu0MZUe0ScPS+8ypYpirzOZVf+yjetzjW8N3KjxZZLD
         00BmMOGYqnyku8GA1b/U9FFHyj643xtTx1j7huulajKrGe/y67pRbPctnSr7TPogxFj/
         7ev2a0apQeN89CRSjvewE7UlQDoYNWMzG/NDKmVdu54iA/qKP6iWHuUkEm1/sXm4w7F9
         yRxtChWpp4Ij0Tla8J5z0gOx/7Jwi4kOK+FUK/4MtNFH1EyjOmbp7hERPC03kPcZTas+
         1PkDN9aoIJQXmzCQkjwAImDl1Jc3AMATg3H7h2KSd1J2+zWc75fZInKeY19MqImM9HF4
         RqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520564; x=1784125364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=rz535x/en1B4P2tXUQGybcIZQgp2/zCoJWV5zTsaN59DAubSDrYLDhApfwplk61R1y
         cNXiAQLeIEnKijHLXENw54A432AtpCwKgFq+3FmMFaSAuaXjCuUIlJOOEyL3Ua6CQOfQ
         EnuFvGMB3Ep/97/jKrRSzd7GjBJvfA7eWuLsZg9nmCDuYJXJd2E1paAKtA9OzuOT+5Rv
         4mIn6vKFK1zB+BF5IFrxi4gCKvglX98C0kLcr/5vyb5hr7iFF+Isph1FdmIPLUdArCWA
         D39Tzw37dhY/kEHhBuOJ6P2JjusqA9uzYJuqrWhEJnrD/cRnPBv7VLpgJPk33X8BSRUv
         c8Bw==
X-Forwarded-Encrypted: i=1; AHgh+RpY1RQpfd2NYtkhtiXQ7O//h4aSuIHAH60/H9OUEWsQotteUnxzGasuDQFJRc5bj2XduUfd5KAg3xVCeIjF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd4tXHkkWCIzx4ZuW41+cl1OhFpgUxGWu6O7YBxNtTqa6+aD1s
	pNiKU5T3hEyFsIQJZhIX9Dkujlau54EICuZSVMaVogEH6Q+QbvM1Pwt9
X-Gm-Gg: AfdE7cnNWXXLJkzISq/i4s5TaFTTRplxnSgKp8/nrHRS7VfSk3rx2AscoEgmrnmKavg
	vFvlP3XxY921EODp5eYya35sZjT4UhmTiHftbaj3lUKkOodsKEtaUpbnpTcw4oMi+Pq5UZkP4r3
	I6FygGJuQPokd5+psMLLQ4CO4BJ8jURPnve3CMY2Jn5GqRHgPuRxq8TaaN93c/aPz5+fCBy8yu0
	A2jrqmd9wPw+i2pko1G0mZ9JAUCpibr6c/4Q7lADUkMuAD6th5M3/pQd9HluZeMGeZNiy1dwovM
	bMFxwoO2VbEOaXpLOpdo0j+FJDW4ilX5IwzLbXq0FJ+81dPki+9g++q9LBp4y8eMWDOWyRKGvIQ
	iE1yI66Eq5esPk/N7ZLBGP3OtFdAWRi+ofAOe6DeZtDa4aVF4xnUrBHdAhpiZcbZVVkxIZZI9Lb
	aeQ3oXB8cv33yIqWmascYK+6sthyHwFkTpnod3m7Q/0W0/6fk=
X-Received: by 2002:a17:903:234f:b0:2c9:97a8:8c17 with SMTP id d9443c01a7336-2ccea5962bemr27443295ad.42.1783520564494;
        Wed, 08 Jul 2026 07:22:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 27/27] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:34 +0700
Message-ID: <20260708141734.578926-28-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-117682-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:phucduc.bui@gmail.com,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,suse.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
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
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A96617278AF

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt722-sdca.c     |  4 ++--
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 284900933ebf..895b8b2ed607 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -514,13 +515,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
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
@@ -542,13 +543,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq) {
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
index 1b6729f363fc..decf9407ab6d 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -294,7 +295,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +318,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


