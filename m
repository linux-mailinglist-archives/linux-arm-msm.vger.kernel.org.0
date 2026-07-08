Return-Path: <linux-arm-msm+bounces-117678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UcygDcJfTmoGLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:33:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E1B727671
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:33:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hcXesz3e;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117678-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117678-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0440307F9C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02354BC01E;
	Wed,  8 Jul 2026 14:22:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2394657E0
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:22:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520531; cv=none; b=XQO3UmSNO9eYrIJws2D2Sgyy/1u2ZBmGaHzJW3BJ3K78lbyAM89VtpI2dRtS6RkFvW9X67G90bGR6k5fn6HOCIHfE2ZiKLrd8TjYdjCnw/qH94BhyniRfTqaqzhQEU9WIaUWnK4Xd3OC4PBI83qWyBRz1Zo9Gby78uPkdB4BMUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520531; c=relaxed/simple;
	bh=pw0S/aozuZfLqNq1mfx8Qgloh+QRimRV50r7uAkzncI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHXH8ucL1dy875fh/SrCDMbNrUysSMSvSqkauBLoS/8BXmvLHwdurqN0Q+sLIA+wnexwG+yjZPYw75CJhsj/z3xP2AriKvWHHmTbIwxuxS3X5tENEPFaeOp6ulr6EciyGhPsgQ6zZJZWZvS4CMjqRvZUS1ERr3rqQmusIb4UrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcXesz3e; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cca24023edso11206535ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520530; x=1784125330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=hcXesz3eH9Uc/hGejA0vLsZeaPG0jQWkkyFlKzcB1H+wLWJ/wrTzDAllF8yRQjXsJp
         nU24oYG9LuDP7XBjnPg0Zl2+VsXJpnX0/iZtDYX+N1oa9A3+70J0LwvjMI30r4w3NsgP
         gZ7/xu/xGK3DQK+22oiBpkQO9Elh+Bv/I6Bza70gHPycN4YK3kX62mClOlmaaMZ4FHbM
         P+38Z0B5/VB/tzas6GFIoS+gAGQWYchz1XFnb7W0QitoDrFIhYaBFKzmYeEbdGH+fKNA
         Wop7W5gpl5Rk3LO5Xx1Y7LQoiP2vs7/0pmvk4J2LBu3d6HeuVhQp+iqy/tWeuzjicTrw
         ewBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520530; x=1784125330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=kk8NL53j+kiB0UHl0lU8tYh675U4hc5wH58cLV0tG/SA+r9HOZwbapf9ORPnJhkUA6
         IgCA8/GUm1GWpah/tdzs8l0arwIXyc7n2ObW1Z3R2SuvfWhTD5Aba18gJdKubMEOZ7Kp
         9IxYqQ/EGyijqRhHZNL88xLcI0biTxL6U5cOJ85DzCtmLZgItXhx6WtsFOY+YEFgdO5C
         zAAjxItWKpY7WrpvJdw9zJKfQRkWUkJET7jphTfyI3KYA2gl32PZMc0YtNVfL1irRozu
         jMEBMiQtoFnev+/9jZd8EZbn91PtroppWZco8KJROalgMvOqxhmA6T+apbMpSVZwwBiz
         xmSQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJrcTre0YkkzvUPnpOZPloIKpmvJqUUcVtWYI3cqvC9L0JG+JQasjp3IASwHRGxuORtXPmSDiaYiuA1aGo@vger.kernel.org
X-Gm-Message-State: AOJu0YxNBa04HvMIoYnegjoD7FU9qbNq94nWm4wetYqnKGSPjmbUpMRg
	Nr4xgj3UFkUS6417bQj8LSGaITA0zWMSgvlKjn/l51eRFKz2r8U5B/ub
X-Gm-Gg: AfdE7ckk8NJ8KXROeg101EoyQI/IAjbN3CzqDwUEGfaBzUL/z7ZzU/b3NPUYmU5lsn2
	TeOG8sOAtIPfUVdYsSax+QPFMQxScQzZ9mAA8as9Ah1P0mIck1B+ohjI2tOyAZBTtLGnu+LRVb8
	IMqmdV3r6P2xhVDD1e2m3xGLDj3RrHQNYvJHdvZUcjk9mHtVDyjdsOHfTLTwpMuf7X3vim6TvC9
	cOm0CUj0Wz5u4QgnAYJ4DJ9+tFk4TcO9yBTiG+SAjZ0e02TeZ25+dvibcOAEo6g/UkiTd03zVnY
	+vgrROnTzems5mBrrhzVOsqPzlgl+IqrLmGR8qpu7oZ7Il+/EYs+lPvh2sF8+KUjnoY17LyGwCa
	yUCq3o53o4S7zxmtALC2N+LQ9CfRh3l0itmSUJTrZuPDUFU+Oe4zldAYEtdb6UVisL6WlOCMy2Q
	BZMR8507ceKfRhX/NXPXuvhsCVpu79z2xylznW1WJBkB/NlyQ=
X-Received: by 2002:a17:902:d58d:b0:2c9:97a7:71b1 with SMTP id d9443c01a7336-2ccea5828acmr29807815ad.44.1783520530129;
        Wed, 08 Jul 2026 07:22:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:09 -0700 (PDT)
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
Subject: [PATCH v2 23/27] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:30 +0700
Message-ID: <20260708141734.578926-24-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,suse.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117678-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:phucduc.bui@gmail.com,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5E1B727671

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt700-sdw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 6bc636c86f42..053ccb92c726 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -416,12 +417,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -502,11 +502,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0


