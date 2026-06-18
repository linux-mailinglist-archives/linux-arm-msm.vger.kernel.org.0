Return-Path: <linux-arm-msm+bounces-113750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rQJNBznTM2qXGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:15:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC4869FAD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:15:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CWCa1EKF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113750-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113750-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28FB8316D8E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B304435295C;
	Thu, 18 Jun 2026 11:11:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D2A3EC2DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:11:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781073; cv=none; b=stKjLY5pQALcfB9GBGmGouyAuddTrGbaYljCoKzBKdUgVC2oB1zijtJAzjj4pN3iBj7D8t4pfsxMHu51HjFkyC3Ue37eVDW1YcuVwyMfEPQsi0bDpkZrDB4t3pW09rPMC9kMjLk/3ajEkvObZlV+P2EourvWcuzxic2O7HzCdug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781073; c=relaxed/simple;
	bh=eziIqUM2ippJniFv9WY9EBHuapZTIBxPkHGk8fWEWcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOsgYQNTt/xYn1dI7YFzKgOsVJUx8ySoCMPoCyVLeBQyOzGs/1R10oETJviNKFK+DonCZlv+xdw+nVfu7eW2s+EtH8rhO2wOTZXbg2ISXtwBKCp0SMsIel/o7lwY6ZcDy/N7A9/KdqlyNqEdmuoUOfl1/cprppyBkmdWoFrvHI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWCa1EKF; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6ab886da6so5109005ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781071; x=1782385871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=;
        b=CWCa1EKF+Lcade8Uk1r6+4kGuWvDjCXfxNdVKtNQFKcypQwlIKFE1qd0A/8kSvD3gX
         jonqqcIlk4/VQBHbuMWiD1xIlDy3sU1YO7tp4XnbzWKoAc1PyAcCE85jXf8pwf5Vg8+6
         W3urDQgtUhUa6EQEa5kQk/bEC2UjC5dw2IAJ4kYUNhbBx+UwbJsVmvBee98MSe90qa9w
         8Frgx9OLOWqUDLuMCZ45/q1LO81g92l7X2s66R2FzbZ3tyDnLplWaDpiKZ8n7iO3ckHj
         GGynEr3lBHR0ndKQoxszQz/mpI8sR5DX8RzKLR/VrJnXJRR0kw2BE7XP7TPGYQ9Yjf9H
         UQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781071; x=1782385871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=;
        b=fJ0SWiRKTTHHXD0k+KPoVKtZntxhb/lTSXZbDh9laGhkE4bS+W0BMQvtHrERa272gb
         Oa+hB1SW1w7hphTXIo1pZSAEY7XJPHaQ5lt8sNmgdLWXV66eTpfSc9lc9uw/K1Iauwtn
         oIWVygpjCN1Kzt1uq+sFlrAgf0+Agvw2Y720yd/LGQ0aCdrRT/v2kkQWrwXnB5d4iih2
         k0tAKsD5/ZShZxABCtXXE3MYNHq0ajgbDDibjHj7f0I7RBDuM0KYFO2AI5GsSc+9Zy/3
         l0r0lPvb5+azQRcUJVKyiKvNmcjq2zYpjVawg5BjQUA1T2cku5MVAbiF2zggboxLIfF2
         S1NA==
X-Forwarded-Encrypted: i=1; AFNElJ+0uSxiL4s01H/yNStOuR7uJmKuV27BhMqAUMSgRumLQRVxXTCtJzcGtGiGVGSzgRTyYrq/c/1D/DhvQP32@vger.kernel.org
X-Gm-Message-State: AOJu0YxOcMRSDh3UIaAcrjwCBAAPk73gFauVxNQv1FhiirXVOQB8L5Qn
	BUfqpx6fBhSGw8kDgVJlAwJ6p/+Zlx7ci/zwuf7vdYsTmSaGPQbZIFeU
X-Gm-Gg: AfdE7ckZUzzxKlJ9uVktbCLl2n3GEs7N9jY9c6qghfsgw9tvAqu5SQgpBwCSceWv3Wb
	gREsfHYC0Gy5/Gfn+OZDq2SpRoWe2cFbydIG9JrLdnxXV9r9V40z9PZ5dC1JQGD4Y9en8X732WX
	nqTZXX0J7tCMnJ3NNltROyCfflruMalhTvnnFJ8cQhnkwIEKTNBBhfhVHUHvco49ckUD7/a/DKS
	X9QAw7ciiNsRvCW1wuOsXcRapxo3StmffdqnOEAoHj73r/TVY43LWFrJ/RZ9ZO0Hfw6QtzBdSV4
	bfB7c4it42gK0SYsZXbRY+sZUcFOLUgzKLVmPbk/WIC9/z87IZH0RH5Nk3AbprFeSsgiLIpVb6h
	ilnWmcHfbpQOpOJqWdSxPQXpS4D8BTjqL3iLexM+HSutgSKGZ3wI82bxroEyYlxwBjxiarxkyw1
	OziszzdJz9p3p45cvoOpFcGMq+ORBcN4s5tuvwn4ycN+YGeTA=
X-Received: by 2002:a17:902:ecc1:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c6bbfa1958mr84967955ad.8.1781781071349;
        Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
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
Subject: [PATCH 73/78] ASoC: codecs: wm8958: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:22 +0700
Message-ID: <20260618110827.232983-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113750-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 7FC4869FAD1

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8958-dsp2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 8ff0882732e7..b6e5f1beb2b4 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -864,9 +864,8 @@ static void wm8958_enh_eq_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "ENH_EQ", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->enh_eq = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -876,9 +875,8 @@ static void wm8958_mbc_vss_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC+VSS", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc_vss = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -888,9 +886,8 @@ static void wm8958_mbc_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
-- 
2.43.0


