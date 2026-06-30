Return-Path: <linux-arm-msm+bounces-115275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aFJcDQdlQ2pYXwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:41:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A446D6E0D5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:41:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FDi6GPhN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115275-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115275-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE6AC309773A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2649930DD2F;
	Tue, 30 Jun 2026 06:35:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86A5343D66
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:35:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801348; cv=none; b=JKyB6KXjDg9o15Cw79EyzepJkciTTXFYjpLqYX1mv+jVahMeKSacM/DHOYD4Hh6r756naklovpqsRnoR/OwB7nc+Qh2R0C7fJALd6GlA7EfrZyCn3sdOfpwQnpCVcGdKuwLJauphF20yv8ACB45CfmNnjbDsTi2LJ/L3Mb7U99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801348; c=relaxed/simple;
	bh=fTei+vUEtZNmVemds32xGB8uary3SUfKARXY0HPVp94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=alP2221mSPZzBwm//14rGJelKO5LtKJ63U0IS3VSmt6uLNZAVHbc8wg1t9KKLQD/MgWRs2EgknrKrW18lPso9zdmjOAw9Cu/tThl0qS1LFdoxMrBDI2MoqGJcFVJcaQYm+P3qb9iGaLzHf2iOZpewNBR+f6cR9MRrQur8qzrnaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDi6GPhN; arc=none smtp.client-ip=209.85.210.171
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-845e363246aso1934637b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801345; x=1783406145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=FDi6GPhN+2bto5YvAJvdy8oubusuCrk3xnMmCyh4uxEpjsixGpccJC8MeDbC1MEnNx
         HqnvLeLxjL1xOBTh9vhgacGlkpYSilamQE/KYapFca7dHByVh/r8s+PiKtFlbdE8VEXd
         7sRW1WONAZ0iXN/eu4cmO2CZ6fSPDqqRj9c9FRgxEh5pub/EkTg+CN6qPrava7xxd7fK
         FptGZ7PIVLMDUhbrO/rKx5KlPRUUzvX36cCs1zIMFl7RgeUkDc6KVIauRFqdCgU+6jPz
         AmNAxjMHsao42G0FF6B1fYH3Tl5LZ6OQSGVV9Pu2G2wN/T8qqOHZQay9H5CyjYGU0jrr
         gWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801345; x=1783406145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=o7ifuofwVsrE/8tEga/dckJHBA3JQD2ynXtRy6iAIKbzJduKVT/Ubf9L5knf9V29LD
         FT2dC1g7xTYp/qX63R6EPr93Si51XSePp/brMGBJWnyiCd7G4VQfdB63JiosyN03fEEo
         fUDdN23UoJhLsxW0Afv+aH6VfDe/i4e1igPgLzvsygrEifpDNBZX8F2lRLhQ8q14qCiw
         oFUgFElY0kFO2p3UCKArp29iLzQoQkTDZlaKZXfVfxF+MPNZaeAiBKxbfMJVtO1ANgxo
         P38/QnMLpP2TPKoox2QdIkuLD4j0oppq0g8jdLTN8DCYwvDSqoS50/1YiazgqTGW/DcX
         AbXA==
X-Forwarded-Encrypted: i=1; AHgh+Roy5JtU4UNiiV+6n3rBazDSPp0HuTZeN96VsCfknwVCmcghn1WzK2PzrVKkslEFE+gzZ9y4UA53xZLkMzsH@vger.kernel.org
X-Gm-Message-State: AOJu0YwmqFJUqOqwC8/2LJB9sQv1jhkpw6/gjc1G0ahYiWWqpQx5SFg9
	jtE1MnTgYAz73UjLJMc4/Y6DUDhMaW8sH1HuvF0VhOfQxMOwFXY7pF+T
X-Gm-Gg: AfdE7cmYgwpnlpA6UMy791yxGnxmD9vd7mxJ2uYO4SYMdW0CHIiApyMBShVIzSgvQ1i
	VxmquAGrDnbAh7MkqJa59jW3+1CefYWxdrUsBnP7rH8CLyC2fWtYmcskHCkopvaInWtJq8mnoic
	tJ2XI1CxJOGu700sXlap3PJjaFsLx9ck58sdl3tiU0yD/gybLwQetFmN/YYrYiVK8kRxRU8cgP6
	TAfRrj/yTxrjVy5jNnazulC6A+AU/0TwcOpCogqXTc++3iF62QWuo5fcfABpX+8ccrqv1FwV3dr
	8L8evOd0w2BvYbn9aR0rxgcf/S9Gl4SZKIkTwzCPxYQILdMaoJs6UtMvnANbr0MS7BwalaQMhf+
	gZZ93MBgJXRokX25HgkYb03mEsN1q4htwc30WYvugy1zZhZzIzh2bUcUCj+gtN56lV8S+GJmbD8
	mdN+VT8/IM8bN38kCNxuGCeUlmH4MpnkUHgpKWbJI90KBAqkc=
X-Received: by 2002:a05:6a00:3e12:b0:845:e873:4248 with SMTP id d2e1a72fcca58-8479f3fa66emr1886818b3a.56.1782801344986;
        Mon, 29 Jun 2026 23:35:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:44 -0700 (PDT)
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
Subject: [PATCH 05/27] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:27 +0700
Message-ID: <20260630063449.503996-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	TAGGED_FROM(0.00)[bounces-115275-lists,linux-arm-msm=lfdr.de];
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
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A446D6E0D5B

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/es9356.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 8db81d574624..8ef9e70a9316 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
@@ -501,16 +502,19 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
 	}
 
 	/* power state changes are not independent across functions */
-	mutex_lock(&es9356->pde_lock);
-	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
-	if (ret) {
-		regmap_write(es9356->regmap,
-			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps?ps3:ps0);
-		es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
-	} else
-		dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
-
-	mutex_unlock(&es9356->pde_lock);
+	scoped_guard(mutex, &es9356->pde_lock) {
+		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps0 : ps3);
+		if (ret) {
+			regmap_write(es9356->regmap,
+				     SDW_SDCA_CTL(func, pde_entity,
+						  ES9356_SDCA_CTL_REQ_POWER_STATE, 0),
+				     ps ? ps3 : ps0);
+			es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps3 : ps0);
+		} else {
+			dev_dbg(component->dev, "%s PDE is already %d\n", __func__,
+				ps ? ps0 : ps3);
+		}
+	}
 
 	if (rate)
 		regmap_write(es9356->regmap,
@@ -1092,9 +1096,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
 {
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
 
-	mutex_lock(&es9356->disable_irq_lock);
-	es9356->disable_irq = true;
-	mutex_unlock(&es9356->disable_irq_lock);
+	scoped_guard(mutex, &es9356->disable_irq_lock)
+		es9356->disable_irq = true;
 
 	return es9356_sdca_dev_suspend(dev);
 }
-- 
2.43.0


