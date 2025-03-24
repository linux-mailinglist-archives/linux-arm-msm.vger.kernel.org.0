Return-Path: <linux-arm-msm+bounces-52278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73511A6D55E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A26C33A930D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2629825C6EA;
	Mon, 24 Mar 2025 07:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZOKWWML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218E618DB34
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742802383; cv=none; b=ZvUtNihWrKZVCc28S5Uw3L+mKlcbpCVlChp6VHuaEU4D4AY3Ydf5gOGlmiBuxXs99FtyVultDICZkDGtzvaUQTZsSHgwLJCGJogtXkxM5WvinuNXXdteud7ILlBiwjVEjQLz9lUtq8Zjrr+jCRwXgakaHH3Bvi/FvB/XxaK68+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742802383; c=relaxed/simple;
	bh=TfODWm1M0ZXJmeY4LnW3qCr7DVndKYh/sG0G7/aLfkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XglBzZmInf55SsELiNtTAZZqkj0bPWPFb3Tq7sHzMPYYz5gBPGLf45D6NFqq5YW2+apYRPhM7MNL/2ItHPzLu6yOMV26vftTBe9lc73uQDMI6P1SdNuvYc6CVLUNESQhqlvJaq+ryVB0lu5dRC+YQuNWw1SXMDgqOz6bU8Gg6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZOKWWML; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5439a6179a7so4261077e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802379; x=1743407179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMUWST69DWBxdXQICnizeifSpfvf4a4EPHYJz2w7L2o=;
        b=UZOKWWMLbFESlQNxJVDLDc8jAvBy+ZFkkMuLV7bfl8MRWOYIaV8vO1eiPPZfT/am8x
         SFkeSeC9WehpbjP+3tlFe6XOdYi/sJOZ/RPn8HUzVaKlxin3SIIPcxGwR8BGktVLkadP
         1CQ3U/Jf4k7DMTV53wB6pFIlutR456nexuCp9AVggaiYjOfBbPVMdHLKeZwQY8VKZCow
         O6ghBKCOZBIKRgNWF2F6R2b/aTHhdF/vih884BPfPpkR+HJ+9/BsFLei8vDaUKIMrxNF
         IFUiZcRVh3SeqNH24Mqj3N3A1wRYIb8MTDfmPqtwqhifeCkU8P4NKx3K1k0Tto9lR88P
         H8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802379; x=1743407179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMUWST69DWBxdXQICnizeifSpfvf4a4EPHYJz2w7L2o=;
        b=uCybMcHeZVj7P8lqq6ep/R6WP/7C0JfawWp5Wlz4607C2N53dcECNQAehKMVmeC8qG
         tVpIHaiMthJcvlgJea+02IcfHaLv1dqxRAXWSFlR17mVgKqTgyvafeEI4zhWj718rPN3
         KVFoGyXruM+8QILwJBiN7gp+XZcKewA2czGiIzC9SVArtxkWpej4rpPrH61B1SCDncik
         YQk270ZVobTps6kaPr9iZl0jLTqc3gFsEciELMoG7mJ6uoXLQ9tsDlndIuxzXsjByu3X
         dpJ+HkMOJBng4OnoUYeuyiR6YH215pDJBqof4frbK/VYWHaNlMLO4MZtjJW24h1m5Q+x
         i8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFTAYS5He2oWMhLpOGjThbwMgn3hvB4jlUwArCH8iBM9f9YrmxGRFXmqG7CzU/4xyHI0NuOVh5zanDYlXx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9YtqBqJVQ9X8GZ2GTKuvYWSPZY4crjWkNeiCVnHNZ8kHXIuJA
	dAfy4NTIeQYsj9rb0z9/vAdHrAlS5t9174S1+NwXXFXPM9Fj8hfAaxDFi9YQVEn0qfUsddePFVv
	2OJMsByIwqTlU9vePrnS+V3ZpLIrnBTGSWJz4fNujH/MEUYOpcLE=
X-Gm-Gg: ASbGncsBOQzI6sezcJxJE1QekeftQU78aWU9oAZHtNiiUmr14VvA3EZB5kb5/LZrajY
	/3JF9tK8Zl+3x4QqOM04CSYYoLl0jDWgBF/gl/Z9HkkhAyQpmN2FtBWE/9P88YqX0PyRqcNt0tf
	jlbgB+IZ3Q5gW9jAB5/dGbsioix8+tnVkvWg==
X-Google-Smtp-Source: AGHT+IHWv/VboFhXNK2XpXps/bxwKIcYKOMez6LLCx8aPGa5SQF6NbUgEgHeVW4eBz5VO9FuBCLn09W/ZghHhKDVfRE=
X-Received: by 2002:a05:6512:b83:b0:549:744c:fffb with SMTP id
 2adb3069b0e04-54ad609d72dmr3944521e87.23.1742802379177; Mon, 24 Mar 2025
 00:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com> <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:46:07 +0100
X-Gm-Features: AQ5f1JrbrVSW1XDO8yz8UbRJofr062hFHRQi78f3pNkQKYxPx9YmO_59Oy_iH1I
Message-ID: <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: Peng Fan <peng.fan@nxp.com>
Cc: Steev Klimaszewski <steev@kali.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 8:33=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> > With this patchset applied, the wcd938x codec used in the Thinkpad
> > X13s stops working:
> >
> > wcd938x_codec audio-codec: soundwire device init timeout
> > wcd938x_codec audio-codec: ASoC: error at
> > snd_soc_component_probe on
> > audio-codec: -110
> > snd-sc8280xp sound: ASoC: failed to instantiate card -110 snd-
> > sc8280xp sound: probe with driver snd-sc8280xp failed with error -110
>
> Thanks for help testing. But per current in-tree DTS, the reset is using
> GPIO_ACTIVE_LOW, so it should work.
>
> I am not sure whether you are using firmware published DTS,
> if yes, could you please help check the codec node to dump
> the reset-gpios property under /sys/firmware/devicetree/xx ?

I'm also a bit puzzled.

I think maybe this device has some DTB that comes from the vendor
with the wrong polarity :/

If this is the case we need to add a quirk to gpiolib to force this
GPIO into active low,  something like this:

From dfe3d2a12a63135e917abacd0d3a29ce347a6cf9 Mon Sep 17 00:00:00 2001
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:44:45 +0100
Subject: [PATCH] Fix WCD938x polarity

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2e537ee979f3..3baaddedb7b6 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -220,6 +220,15 @@ static void of_gpio_try_fixup_polarity(const
struct device_node *np,
                 * treats it as "active low".
                 */
                { "ti,tsc2005",         "reset-gpios",  false },
+#endif
+#if IS_ENABLED(SND_SOC_WCD938X)
+               /*
+                * This codec is used in laptops with deployed devicetrees
+                * that fail to specify the correct active low property for
+                * the reset line.
+                */
+               { "qcom,wcd9380-codec", "reset-gpios",  false },
+               { "qcom,wcd9385-codec", "reset-gpios",  false },
 #endif
        };
        unsigned int i;
--=20
2.48.1

Maybe you can fold this into your patch if it helps. And if there are more
of the codecs with this problem, we need a similar patch in each one
of them.

Yours,
Linus Walleij

