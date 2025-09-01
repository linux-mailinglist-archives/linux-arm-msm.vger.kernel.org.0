Return-Path: <linux-arm-msm+bounces-71433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 626D5B3EE65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DC4548803D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22735324B1B;
	Mon,  1 Sep 2025 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t900PpJz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C104305078
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 19:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756754558; cv=none; b=EqNrIyad9MuQUWffpZCxbiGbzIiSbfWyrovpWZdCQL/OiPOOtTxUv3goEuSNoo5AZfAmoUDp/Q0s98ycspV2ZUhIRonaKNb7Ok2RAX/VMGzUITCCDfLxvKguKkx1GhWbGxaKiszcTEvWZzEF4qxL1EkhAmgG7g5qCdWG5nr6+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756754558; c=relaxed/simple;
	bh=bEgP0yvmX9KvAOyKB8kFlw77eqxGqe3qY7fzx2tEl08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxBUSkclh65wnrA++W2TS2RV516z6p7pW+mmk+45KsBSMLDncMtjM2wtHT8IDeZCgk/GB7oJqAX58cXCGR1xjFBRcNH5ugSaW38gkaMz9FM0aOV7Amm0RTKzJ9/BPqhK5MMxnMmTF7cDo8YwjFX2+VQX56jnrL7HAD/qgI+sANA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t900PpJz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f6f434c96so2476942e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756754554; x=1757359354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=t900PpJzwxzqo3Y1GxMEGOx/cIe6LnRWPfzvbNBzJxqMURjGzVgSFAzYzWdMr16D6U
         7W1w7wZZ0HJMoXPz7GyCCq/BsiYBWRPDcW5htfmxqYhnN8F6mlZGM+gEK1EdJOlHaYrJ
         WKsNWBvJa6cSDSWG5CJEPYfjCdeMTcxE8h6u8zH1OFaPbiqdpDWntKrdNsePjKoODtIN
         i7EjbzVPr6zp+ZOKNAovXYeyJnDfUoATQx54RbmBAOEuC4eAHvTFTxXZfPHolWh5NQFL
         8Sf+gNRnIGv0aTxL4C6dmSroWmqXlYsIh7L7kcBhqrOzxxF+2OV0DrALd7xXf64j3fDu
         MdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756754554; x=1757359354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=WHjNa8+UfU1oy1w03wGL4myvTxRt4wnk4LTI3F3GbHuK2kqaPoCpHkkB1eAP9cWNqG
         J3PGCMFCrrVg2odmppQf5AqeUWy2JPoysKBnQeWRz1Eti2+MrkDGBhIAiSps58PbQtSz
         jidY0k4+1WJfVNrfy8bBCmqKwGdCA8ZueO2Nh6jgc/zIWbggH6N8wTRx9BYqqSiQNXP7
         ZRh62tUwfMv+l79tZzLDjgCMMCSWOxhV4F4B9K2DDBwggfW8ljT5MAQRHMoAjBL/YTwj
         w3oZKy4gOo9U2OIlJ/79CSPKuiUc1bfSc+sxVLQWSecEZWpwrAWd8Dm1mv3sW9Hqc7j/
         W7eA==
X-Forwarded-Encrypted: i=1; AJvYcCV0vd+0pS4BOtmacmFWhvWzoV+y/ygSrEgVgigkk/09cHZe7gbiK7i5AzomTUKFS/te+/DmiA8fdvqafo9n@vger.kernel.org
X-Gm-Message-State: AOJu0YwAicfj+TMxdXPWZkYPDMOjvHs2zuUYEYknfTvRlvgtl2jAnxuB
	4hmJZvDDLqm4Je0ML23hDAm1ukqQ+AZcgsYQSMjHJswwSKCsRx6svj0mAGua4fO9aUDrkZgp3Sq
	fvSPS7C/co4V/qrKEfwFfqM8wERaZYeZ1rkz7ge3ZcA==
X-Gm-Gg: ASbGncvj6c8iCA+HtlCnKr5WQB8QM1axNwcXC7Bow7wwr704DJcydPGsdDu0XyH0IL0
	z4RNm9dh5N7SrIHBOcBXRDkU80ghKE8G9zzOzAuRuxHK1GbqzAaGfOcSekivVHKEOTwicBGX6Cm
	4c3M5R6Fs7qYKUCIzeGj4jXU28SIz7F9zRFYIK/I1gOvI/wbc5Aq9mgEGpfEl9bYRusSYyMmHLr
	t8gwkiWlJpSWv7WDnoI+UQsQXe4eZ/O34fiOr5YeKacw0J7vw==
X-Google-Smtp-Source: AGHT+IFcWj/MxjmrVdPmxch8QritOIaLTRMlhZkDbys4s6fntW4mvCl/nwD9FPfF52jhBYUT32dL+MvS1Koz6TeQoRU=
X-Received: by 2002:a05:6512:1051:b0:55f:4f46:9f2a with SMTP id
 2adb3069b0e04-55f708b5e26mr2212325e87.19.1756754554484; Mon, 01 Sep 2025
 12:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk> <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
 <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
In-Reply-To: <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 21:22:23 +0200
X-Gm-Features: Ac12FXzmS2jWw7xFpjYhhy0Ln3t9KFQZe_l3JIooPobPNCmkv86DLX_8q8OSWPk
Message-ID: <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:
>
> > That's not a lot of info but it fails in strcmp() which - I suppose -
> > is the one in pinmux_func_name_to_selector(). Any chance you could
> > check what the value of np->name is in imx_pinctrl_parse_functions()?
> > Is it NULL for some reason?
>
> [    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl
>
> https://lava.sirena.org.uk/scheduler/job/1758947#L705

Linus,

FYI: I reproduced the bug on qemu with an older ARMv7 IMX SoC. Should
be able to debug it and figure it out shortly.

Bart

