Return-Path: <linux-arm-msm+bounces-115336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gh+uJjGLQ2q0awoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:24:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D96E21A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:24:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nh9YFOlB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115336-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115336-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CDF030B3081
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E2A37DEB6;
	Tue, 30 Jun 2026 09:14:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE86A3E1204
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:14:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810887; cv=pass; b=gMHc02MwjE4M0DTBC+NyQp6yPKnYexIAlPjG5yeZ0ZwMW0IFTF9IdiAUzvHkiI+KnaLiub4i2Etx013ESuxLl0kQNwdgLzl4akm4FX5FUWlQvXXdTtwRR+LZv2l0rjbo7Zlx50iavGaH1dYSO0nIWaattktr2MZvcU8bWPsMg7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810887; c=relaxed/simple;
	bh=28Bm4BVWDzLcCgztJ1mFPF8i5A1Q5I+HyUvoNTsRLVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMp928BKSbkGoqUpdMmMOOzBr8Z6mbBpfHkqoJP8TTkpLovg0VnbZP2vtwq9gyI4lbPP6Px+bS+O/fX/Q6wDL6SKExKhmSAAEGlgu9oV12bWaXgBk6yvzfsphrCmJd6Szm1GM70kTDK57NqElhutCjXhHtyuWIfP2cyJm9teuuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nh9YFOlB; arc=pass smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c9f10fa7a3so19994995ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 02:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782810885; cv=none;
        d=google.com; s=arc-20260327;
        b=Jjt3MH/n64OtAovScuWOYjLlxEKUfk7N0xYrao7RjsL2ggxCN+khakrqvCgKzicv6V
         VUBBBIGRHlDdBTbw1GkgMeAdCsNHurXEXupN+AhZlg3vRuWk0U7BNDB8HCDZKSO4Ft9h
         TJMOTkV7VLfJZ+hhpuNBfZ3bMa/amxOaHlwPYlUwCvA314jljFQk8YGsA+ENSYj6VdPZ
         zfYfhyknVWyGBLeKf58I7MuSTIXmdr4Wa0UhhEvcoNKd3hbZL6t+hAFDZa1r4LpdLZuZ
         txzsQQrsKBe9IydhEkGuWXVSVshYZbbAL5E1vMA35oCTt5X72u5YmDqICux6k/3XOYE1
         m08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        fh=mTHuWSs/cYDtgeRPbqAEyaGgeZ2ryd8LRyCJo5fcmDs=;
        b=qYpjypgVpI53oNmmKyzNFnojcj0Ha9uF2CB0cd/DQqu4fYsPuxlweARsKIphDIs2Zz
         AwEjGGob0zghOAUfN1X4aMt5hgx2QdJGW8ojukWZXkvBvr/2ZuVPUgTaOQqLY9IYKvaQ
         AhKtEuMOeFDQqwzwQuMQDEybkZWV837+T/x/QLBIyV6cR2wsNk8S4XJz7MAuwZy5gQJQ
         BOI7WSuXvCjMwZ/yPTWqX/0dVmbqAV8zewMpTnBnEO7UsK0mw6+WFJdZB6igz1l6Lca+
         7RGQI/lkrHzOdqyp6lM2vJmufGaNm0SHY+1CqOlPgVQVaDf8HiApkmo+XFWxbKUYVUj4
         YOsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782810885; x=1783415685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        b=nh9YFOlBrTRJ/Wk4PSue1LldgGjMqTizMNEn8x2hKr0CEU7C3qcKMGwG/tVr//2t00
         qyN+6H3Cs4c0mmcx8899C3pfPAxz28x2nMJOFPxbs3eGES1IVoyI1YSp48DYccsRZe/9
         yw2WMI/1p6rniAMef2FFxYtRBecNBHkWB0UBQJcV1/y/OwHv/jHsA9BDwU7KQ1gBLNJr
         VGSaiwxMCJtE/Z5hlIWhEIVdKIlqg2Abrgo/UihL5UhNyjTIaBZdI3R3AGwjnN1Gcyge
         hPnGNObCgAzkgNefXDouBPtleOxMtnV7kDLTwqQXruEGyk7cJEE0Q32K6Sd3i7m3kB6B
         Ajug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810885; x=1783415685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        b=VvKTOFoo2EZvmEptLPo3nkizEoTmPsKkmxwIf2AUqOfKy9xO5pX3w++Ye45+mRGJgt
         NiZOJDO93ck9JqRS4kHN8JbMCl0AmXp4+VF+r28OmX70+vHX/h7JTtW9aRmYRXx576mV
         Mhh4+ESVjM/fKVipSlcp4MlzlgrFQO0jIAJi/1s1PmInPxLNjM09D6YonNRvuGfI6XsA
         fY0/7+64iQt2dhWsTbG3n4GKbYRr+h6Sy7Ou7LpDrXsB9guiNNiNkFybhtP6rVXQV4in
         MmHCfMfK+fYcBRthyETLOTjvXsvitL2Oe6xTsVFXGYTd4LbUSwCrZSiSN062vkAd0oAa
         py+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoheCEwDmT58QjA+jprSRjHrGuPIqjnxDVV4lk1BBBlTw3yxWZ48DXr4JeEDqCRtAEahuMXvEFvGYdV4MLp@vger.kernel.org
X-Gm-Message-State: AOJu0YztXVIb3QC67rVG6NIG+v/GBYCHQHSPjTIezci8QCGHHD5mxbQ1
	JLDHYeahIj4SpvNdWt/6b7847lnI/KtQTCrMJv82sBuZ4WxTCPuMw++AzggRlYEqw0JGAJjxCo/
	j9vmNgch1a2w9lnLtHpWnb+upnF0xw44=
X-Gm-Gg: AfdE7cm92JZS2PvMMI0L8/rMqfsJe6IS9vMRqsTvwkIybQKAzvnieuk/xFNtrvK6Pcu
	4f82MBKze/MlU5G/TtKnN6P+bixtDuBD1e5SlvGKuu+4h4r3JVsAVraK265jKuDq1URrOdhJzUm
	fF1A9yxwDXxPWKjOqa3jxEPJhVHRXMh/2TIAvHhLZKP+y3VWM+WYNAHQE6LbAyamoiA5uYGmzBQ
	CGUgVglQSqQfTmbEOAlMxXk9FsBhLp4OzwAUv0vz/48f1k5si6+Z4b5OdAMo61Q6oSOgKnbXOFh
	/tOxu0eobRw6msx18HZ5mlcwUNU=
X-Received: by 2002:a17:902:fd83:b0:2c9:97a7:3276 with SMTP id
 d9443c01a7336-2ca2ea335c2mr19419135ad.39.1782810884946; Tue, 30 Jun 2026
 02:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
 <20260630063449.503996-10-phucduc.bui@gmail.com> <20260630092821.650c30ec@bootlin.com>
In-Reply-To: <20260630092821.650c30ec@bootlin.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 30 Jun 2026 16:14:33 +0700
X-Gm-Features: AVVi8CdpcGsQO7j2elPBPz0Nft0JM37FEMmCfPqP7T8On5LblxvKpA_DrRSwZCQ
Message-ID: <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com>
Subject: Re: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex locks
To: Herve Codina <herve.codina@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:herve.codina@bootlin.com,m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115336-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,foursemi.com,diasemi.com,gmail.com,perex.cz,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB8D96E21A5

On Tue, Jun 30, 2026 at 2:28=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi,
>
> On Tue, 30 Jun 2026 13:34:31 +0700
> phucduc.bui@gmail.com wrote:
>
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> >  sound/soc/codecs/idt821034.c | 121 +++++++++++++++--------------------
> >  1 file changed, 51 insertions(+), 70 deletions(-)
> >
> > diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.=
c
> > index 084090ccef77..078de6c9c395 100644
> > --- a/sound/soc/codecs/idt821034.c
> > +++ b/sound/soc/codecs/idt821034.c
> > @@ -6,6 +6,7 @@
> >  //
> >  // Author: Herve Codina <herve.codina@bootlin.com>
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/bitrev.h>
> >  #include <linux/gpio/driver.h>
> >  #include <linux/module.h>
>
> Alphabetic order. Move <linux/cleanup.h> after <linux/bitrev.h>.
>
> ...
>
> > @@ -456,7 +457,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcon=
trol *kcontrol,
> >
> >       ch =3D IDT821034_ID_GET_CHAN(mc->reg);
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       if (IDT821034_ID_IS_OUT(mc->reg)) {
> >               amp =3D &idt821034->amps.ch[ch].amp_out;
> > @@ -466,21 +467,18 @@ static int idt821034_kctrl_gain_put(struct snd_kc=
ontrol *kcontrol,
> >               gain_type =3D IDT821034_GAIN_TX;
> >       }
> >
> > -     if (amp->gain =3D=3D val) {
> > -             ret =3D 0;
> > -             goto end;
> > -     }
> > +     if (amp->gain =3D=3D val)
> > +             return 0;
> >
> >       if (!amp->is_muted) {
> >               ret =3D idt821034_set_gain_channel(idt821034, ch, gain_ty=
pe, val);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >       }
> >
> >       amp->gain =3D val;
> >       ret =3D 1; /* The value changed */
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 1; /* The value changed */
>         return ret;
>
> Call directly
>         return 1; /* The value changed */
>
> >  }
>
> ...
> > @@ -521,7 +519,7 @@ static int idt821034_kctrl_mute_put(struct snd_kcon=
trol *kcontrol,
> >       ch =3D IDT821034_ID_GET_CHAN(id);
> >       is_mute =3D !ucontrol->value.integer.value[0];
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       if (IDT821034_ID_IS_OUT(id)) {
> >               amp =3D &idt821034->amps.ch[ch].amp_out;
> > @@ -531,20 +529,17 @@ static int idt821034_kctrl_mute_put(struct snd_kc=
ontrol *kcontrol,
> >               gain_type =3D IDT821034_GAIN_TX;
> >       }
> >
> > -     if (amp->is_muted =3D=3D is_mute) {
> > -             ret =3D 0;
> > -             goto end;
> > -     }
> > +     if (amp->is_muted =3D=3D is_mute)
> > +             return 0;
> >
> >       ret =3D idt821034_set_gain_channel(idt821034, ch, gain_type,
> >                                        is_mute ? 0 : amp->gain);
> >       if (ret)
> > -             goto end;
> > +             return ret;
> >
> >       amp->is_muted =3D is_mute;
> >       ret =3D 1; /* The value changed */
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 1; /* The value changed */
>         return ret;
>
> Call directly
>         return 1; /* The value changed */
>
> >  }
> >
> > @@ -629,7 +624,7 @@ static int idt821034_power_event(struct snd_soc_dap=
m_widget *w,
> >       ch =3D IDT821034_ID_GET_CHAN(id);
> >       mask =3D IDT821034_ID_IS_OUT(id) ? IDT821034_CONF_PWRUP_RX : IDT8=
21034_CONF_PWRUP_TX;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       power =3D idt821034_get_channel_power(idt821034, ch);
> >       if (SND_SOC_DAPM_EVENT_ON(event))
> > @@ -638,8 +633,6 @@ static int idt821034_power_event(struct snd_soc_dap=
m_widget *w,
> >               power &=3D ~mask;
> >       ret =3D idt821034_set_channel_power(idt821034, ch, power);
> >
> > -     mutex_unlock(&idt821034->mutex);
> > -
> >       return ret;
>
> Instead of
>         ret =3D idt821034_set_channel_power(idt821034, ch, power);
>         return ret;
>
> return directly:
>
>         return idt821034_set_channel_power(idt821034, ch, power);
>
> and remove the 'ret' variable (no more used)
>
> >  }
> >
>
> ...
> > @@ -771,7 +764,7 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai=
 *dai, unsigned int fmt)
> >       u8 conf;
> >       int ret;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       conf =3D idt821034_get_codec_conf(idt821034);
> >
> > @@ -785,12 +778,10 @@ static int idt821034_dai_set_fmt(struct snd_soc_d=
ai *dai, unsigned int fmt)
> >       default:
> >               dev_err(dai->dev, "Unsupported DAI format 0x%x\n",
> >                       fmt & SND_SOC_DAIFMT_FORMAT_MASK);
> > -             ret =3D -EINVAL;
> > -             goto end;
> > +             return -EINVAL;
> >       }
> >       ret =3D idt821034_set_codec_conf(idt821034, conf);
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D idt821034_set_codec_conf(idt821034, conf);
>         return ret;
>
> return directly:
>         return idt821034_set_codec_conf(idt821034, conf);
>
> and remove the 'ret' variable.
>
> >  }
> >
> > @@ -802,7 +793,7 @@ static int idt821034_dai_hw_params(struct snd_pcm_s=
ubstream *substream,
> >       u8 conf;
> >       int ret;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       conf =3D idt821034_get_codec_conf(idt821034);
> >
> > @@ -816,12 +807,10 @@ static int idt821034_dai_hw_params(struct snd_pcm=
_substream *substream,
> >       default:
> >               dev_err(dai->dev, "Unsupported PCM format 0x%x\n",
> >                       params_format(params));
> > -             ret =3D -EINVAL;
> > -             goto end;
> > +             return -EINVAL;
> >       }
> >       ret =3D idt821034_set_codec_conf(idt821034, conf);
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Idem here:
>         return idt821034_set_codec_conf(idt821034, conf);
>
> and remove 'ret'.
>
>
> >  }
> >
> > @@ -897,11 +886,11 @@ static int idt821034_reset_audio(struct idt821034=
 *idt821034)
> >       int ret;
> >       u8 i;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       ret =3D idt821034_set_codec_conf(idt821034, 0);
> >       if (ret)
> > -             goto end;
> > +             return ret;
> >
> >       for (i =3D 0; i < IDT821034_NB_CHANNEL; i++) {
> >               idt821034->amps.ch[i].amp_out.gain =3D IDT821034_GAIN_OUT=
_INIT_RAW;
> > @@ -909,23 +898,22 @@ static int idt821034_reset_audio(struct idt821034=
 *idt821034)
> >               ret =3D idt821034_set_gain_channel(idt821034, i, IDT82103=
4_GAIN_RX,
> >                                                idt821034->amps.ch[i].am=
p_out.gain);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               idt821034->amps.ch[i].amp_in.gain =3D IDT821034_GAIN_IN_I=
NIT_RAW;
> >               idt821034->amps.ch[i].amp_in.is_muted =3D false;
> >               ret =3D idt821034_set_gain_channel(idt821034, i, IDT82103=
4_GAIN_TX,
> >                                                idt821034->amps.ch[i].am=
p_in.gain);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               ret =3D idt821034_set_channel_power(idt821034, i, 0);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >       }
> >
> >       ret =3D 0;
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 0;
>         return ret;
>
> return directly
>         return 0;
>
> >  }
> >
> ...
>
> >
> > @@ -1079,23 +1061,22 @@ static int idt821034_reset_gpio(struct idt82103=
4 *idt821034)
> >       int ret;
> >       u8 i;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       /* IO0 and IO1 as input for all channels and output IO set to 0 *=
/
> >       for (i =3D 0; i < IDT821034_NB_CHANNEL; i++) {
> >               ret =3D idt821034_set_slic_conf(idt821034, i,
> >                                             IDT821034_SLIC_IO1_IN | IDT=
821034_SLIC_IO0_IN);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               ret =3D idt821034_write_slic_raw(idt821034, i, 0);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >       }
> >       ret =3D 0;
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> return 0;
>
> >  }
> >
>
> Best regards,
> Herv=C3=A9
>

Hi Herv=C3=A9,

Thank you for the very detailed review.
I hadn't realized I had missed so many issues.
I'll fix them all and include the updates in v2.

Best regards,
Phuc

