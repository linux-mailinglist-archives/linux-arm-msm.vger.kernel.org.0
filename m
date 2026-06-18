Return-Path: <linux-arm-msm+bounces-113719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CpDZDjzHM2qhGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:23:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4F69F441
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:23:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=protonmail header.b=nK7bb7ZR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113719-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113719-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=proton.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68C59303E8F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5939C3E5A18;
	Thu, 18 Jun 2026 10:19:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398CF3EAC80
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:19:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777969; cv=none; b=R+q8dcDuPjWrB8CljQVI1u4K6MAdWA+xs6bK8UgppxRZme00uGf5OAfRjEV7bZuI1I4IswRJqmLmgYI22f/x3z3W7E/XsE6LYVlUWhf5sOaIWYzUv+V/pTDDiLUNz0yB6iBwd9W8sH+gGLgSoAdXXxKpgX/+Xp3OZOnfUJ64b+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777969; c=relaxed/simple;
	bh=8Mcydhro1EQOrm5osOZpAWTi5DUtUM3BYZKMBUyg4Pk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YS6hw4Lqj5POHJMKr0LwWKiM09TdAkiFBacXHjacAlK7oEvFvpJ23iYYD2HPXKkM4wzF0+1urUyZvTVzdwFAp4bo1+q/lNQHK2dtBWF3Ncct7Zr+fTLG0RzecEDTGpYpQM7cxJM4J6ZZiLomTYi4gHNt0JNcjiC9KxeMosI5rX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nK7bb7ZR; arc=none smtp.client-ip=185.70.43.22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1781777956; x=1782037156;
	bh=8Mcydhro1EQOrm5osOZpAWTi5DUtUM3BYZKMBUyg4Pk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nK7bb7ZRz/raM9vKiEuw2B8SB72kmXNIWSGb1I9kKZSg3V7AhryINDsgV9HdiqsF8
	 qkPFddqGClntpGCOx1/zZUPfa/Y97PArNKbUadPeQ6xRFZBqUcT3TX871YfQ7/1nzg
	 I4FS+iqDiTf5n3QB20JA2iIQEWNd3S/UW9nNwJhBnpnQoYfOxHCXwnvaJwhHqMQNFd
	 bMrMvJFtKSj+WCI4fQP3eHb2/1sc7LQE15VSmd8wkXT1pKnexeWl4xVE73RugBu5RO
	 dKt96ljAPrGuSpLmoQM7Wg/4cYFJ8CgKmMUUUwAjqKMDJ7+xXGqVMjI+HZwkp3vEam
	 buBKd6G/48d7A==
Date: Thu, 18 Jun 2026 10:19:10 +0000
To: majordomo@vger.kernel.org
From: Clint <t1m3band1t@proton.me>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, Charles Keepax <ckeepax@opensource.cirrus.com>, Support Opensource <support.opensource@diasemi.com>, Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, bui duc phuc <phucduc.bui@gmail.com>
Subject: Re: [PATCH 05/78] ASoC: codecs: aw87390: Use guard() for mutex locks
Message-ID: <5TNHQg1ajwrqUAIsNxt-sPNM5rRRTZgaIB6ssPE1Wymu_gKMW58Xm1iE3BkLh8pyvSGSBb-sxBK-2r_Hveh59vOyQofKZ_C630-gdnT4uMw=@proton.me>
In-Reply-To: <20260617103235.449609-6-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com> <20260617103235.449609-6-phucduc.bui@gmail.com>
Feedback-ID: 162116597:user:proton
X-Pm-Message-ID: 621a7e4fd1b7e784c26703ddbd3c88a4c50a0740
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113719-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[t1m3band1t@proton.me,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS(0.00)[m:majordomo@vger.kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:ckeepax@opensource.cirrus.com,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:phucduc.bui@gmail.com,m:povik@cutebit.org,m:matthiasbgg@gmail.com
 ,m:steveneckhoffopensource@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,chromium.org,cirrus.com,opensource.cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[t1m3band1t@proton.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:dkim,proton.me:mid,proton.me:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFA4F69F441

unsubscribe linux-kernel
unsubscribe linux-sound
unsubscribe linux-arm-kernel


Clint

-------- Original Message --------
On Wednesday, 06/17/26 at 20:34 phucduc.bui@gmail.com wrote:
From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw87390.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..88110e720f85 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -225,11 +225,10 @@ static int aw87390_profile_set(struct snd_kcontrol *k=
control,
 =09struct aw87390 *aw87390 =3D snd_soc_component_get_drvdata(codec);
 =09int ret;

-=09mutex_lock(&aw87390->lock);
+=09guard(mutex)(&aw87390->lock);
 =09ret =3D aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.i=
nteger.value[0]);
 =09if (ret) {
 =09=09dev_dbg(codec->dev, "profile index does not change\n");
-=09=09mutex_unlock(&aw87390->lock);
 =09=09return 0;
 =09}

@@ -238,8 +237,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kco=
ntrol,
 =09=09aw87390_power_on(aw87390->aw_pa);
 =09}

-=09mutex_unlock(&aw87390->lock);
-
 =09return 1;
 }

@@ -280,14 +277,12 @@ static int aw87390_request_firmware_file(struct aw873=
90 *aw87390)
 =09=09return ret;
 =09}

-=09mutex_lock(&aw87390->lock);
+=09guard(mutex)(&aw87390->lock);

 =09ret =3D aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 =09if (ret)
 =09=09dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");

-=09mutex_unlock(&aw87390->lock);
-
 =09return ret;
 }

--
2.43.0




