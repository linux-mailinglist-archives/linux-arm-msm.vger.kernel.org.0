Return-Path: <linux-arm-msm+bounces-110228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RAqBHpdIGWrQuQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:04:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F965FEEE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3AC930160C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 08:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FE43B47D6;
	Fri, 29 May 2026 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyzZTbtr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B1F3A9D95
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041752; cv=pass; b=SqEo9wxglSkPR7dREgqzegY/NbPEQzobYfdB7c45jAIg40LkPJmBC8y4V9PPyJOeY3NNyvHMeEJLKFVCHo34SE2tvNAhiqxeaklZHYs6YYBN8AEc+P7s0yuenRxqyFstLFvDt/E6JJAbjk4WN4RCGzgfXQtcdZIurDZqx6A/Nww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041752; c=relaxed/simple;
	bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XS49OEC6b7Mjtrg3Zh+jo6jMqBCAnSRBYYIVY06gD0/LpJBZKh0tKkTwW4JdfU7Glz+06xzjyFtPKQxCLr/ExPRPCGo+uEgLJSN4+hKSHMVjuhrgF9y3eKy3Zs8+VSujI9iKniP9vwlUVSL9dplK60fH+Am2OJTfxHCSBYapGKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyzZTbtr; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf22d29dabso2848575ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041749; cv=none;
        d=google.com; s=arc-20240605;
        b=QqYOBOqR3M1gXAbugNP/dk1qi7DnQ13qpL4bml72nCEAOk9jADTJgr56Sd9nzHYOAC
         Dkstv9tftsrzqFLzjq9z1JlO/SdCs5wF7XMbdMiI715Jv+0xQvspS5/kMNqU/bkKak74
         PsjbvzFpYO/YErerF1fKp5bJH0boI6Hya4L0nyobIJRz0lr4vv/+unUdqU9ydfcun9za
         y47SwiQ5dHqS2ZVHtazyBjdNw5n19FIx30hdHRbwL9NmCNsQplWkPu/E3gQ07QluXBUZ
         nlzL5iEOZnJJRRXzpn6jsNij/pwUMJJtHkh1UmMl7RNosdeE8Sxea9CnZ36WGiBfId1O
         +Dyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        fh=cNlNbveluoqUI6gACrFMDFNT6CXj7k84Paj3CjqO4Fc=;
        b=cDkSGfpyHyHUqW2djMbxJ0NDX8WLg6heG1gS4LgotLXq41AtCG5WwhdhoTk99S4Kdz
         /peymCNiUfAIWpa7LwXCjmEx9w1YCMEN9F28LdR9B7Q9N/7WdCrdhrIc081a2vLWbz9R
         HoicLg/sGfLw9g5wQtv3Kg5GZlMZbjbrDmmAhV8pidk7Pxt4XbIlisBQvE7ZsGYoUcD/
         gWtoDM8ufgJK8nzNTfHJnbXVVMMJReULBQxWrsuL1qkaxBSY9+N2SeKwIf2S5S54fom9
         JIbMGmqFM4NH29HhnmahY3GPlyALGC9km7Eecq0vzj36LysQBe7iH7rMZHC/m5dOsxgh
         p75w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780041749; x=1780646549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=DyzZTbtrZ1n2pUax8yd/K5VlIptCfq8x17Y1bBwWhPrIij0QTiJOPUXga9Wk1PStt/
         Z/UX82Dpe1ItakllYC6viWCR6Nre9Fnb6f60qOEMga+MfWzZ9OF6lLU5CPCWDvZacO+0
         KvFL6AHvHXA7EM47EcHtijw8SuWz3liQi0gcdlWIi47OWjg8JDj0BULD+kZ29dnPnP4k
         vUtHvuLIgjrRORImdUB7i4bk7qjvA5BoJixLH8dryHWOir77N0KT8m147f2PoC5TxDye
         KSSpFvXYuOOLLoFaA59M593VjSX5/qQmA2vbWvJTivlCCErGxgg5GEUYH9Qkc/j/nQ+5
         Ycpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041749; x=1780646549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=YjSLqq+gtRMt86S7UbHDaJMtBF30uzYECmQkrMnb9L7nwpVUQ+d/hoSiyM5k0hZ31/
         keCUD+2wegOnRb3HJzXJv9qg5boD85OD2wvbDWIkQjNGVO4/zdDASdqnQzWnKAUo47Q1
         jYmqbCwiVkwfMJiYk8zh+EBCdFjR5X2EXaaVISK+8F3kt271RJD7GRuuE/Aeld2CdlNX
         L1VMuXxiQtKbViL0EoYivRRMd2NvAvT/9Ehbrov21yB/FTIUQLuaOmAGjXdWoXDZCTKd
         4rKuh+zKcChHO9wIQPWQOW94x1VDSbyDDslWz+OrWR+ayZPFtZz3taFrVcyUQsaZv3Ty
         c83g==
X-Forwarded-Encrypted: i=1; AFNElJ+ZWCSQopFwPC/xAvgQVALgohR9vsOYdBux7Q3mgPSDLJ8+jVIlwtKaEiet5HRJ3/Y8Flh/kdHsoXMV2+bA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Jfh1muQjV6YtioEaWMaHiFziTrqu3fi/a7fgvwY8tw0uzT2l
	kztRma7mFLJGePifh2B/CVHmOQn4mK/QrxANwCeqVo5gnqCSV+Xe4lEHIOcQyoXYjHIWfzcYyD6
	ofF77m/i+zsUmE5KZmZu3T/M00GtCMag=
X-Gm-Gg: Acq92OH35BmyTjfc+dnEJG4anqPhj9v1GrUmmMyFXXh1Am6r2NHcPk2CViGrcgq12rZ
	xE6s9jcCTPyc7kfTcjNhxdvKRNJEIeej6DXxK3JqwcNGjFZt48DtAd31zrjhSjr6h5W/gp3MADH
	G8HxFoxPExq4taAEiB2tokpVRxSAUYmaUPVn+eCkFYef0Pu2INNEv3u+fm0CYj0C0c2N+esKeoE
	Z++o54oeExQhudWTfg+ESEUhkvuMqBzNrIEToCuvQyUsM3+26sjMzvimnMLP5bdJvfRJe/fsvkR
	/qhtPPUhEKENRvIag30=
X-Received: by 2002:a17:903:fa5:b0:2ba:6ca2:be0 with SMTP id
 d9443c01a7336-2bf2053340bmr25566605ad.4.1780041749021; Fri, 29 May 2026
 01:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com> <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Fri, 29 May 2026 11:02:17 +0300
X-Gm-Features: AVHnY4KLQby2GKgYCaNbHrRuPj0X0-ETK3PqgCK0q7F1iL-UnUKeln5tOfAvRio
Message-ID: <CANhJrGNyB7aqMhR5DiLXd6OPmsE4Vox=K7UwMPZ1ZZc2-Ciw3w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] regulator: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Karel Balej <balejk@matfyz.cz>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Samuel Kayode <samkay014@gmail.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110228-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,matfyz.cz,samsung.com,collabora.com,linaro.org,iki.fi,kemnade.info,baylibre.com,atomide.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,baylibre.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 31F965FEEE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ke 27.5.2026 klo 13.48 Uwe Kleine-K=C3=B6nig (The Capable Hub)
(u.kleine-koenig@baylibre.com) kirjoitti:
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

--=20

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

