Return-Path: <linux-arm-msm+bounces-2588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CFC7FE229
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 22:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77DF3B20F9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 21:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FEB2B9DA;
	Wed, 29 Nov 2023 21:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtOCbfGZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510138F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 13:41:26 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5d33574f64eso39997b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 13:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701294085; x=1701898885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1ZO88hxLxdvNhHhYibiygRoAvqr8qAWNq84h8JNdaQ=;
        b=PtOCbfGZ0T/92qS339NAXLjbaz1SCLNciYonAil0VSMnZ4BfMBsChhGrkKsJokFNgv
         RT+DI/GACdqm8B1tuE5VOvGJRaB6o3NySXphZHQbxZhfRO+CIS+a62mmtk7bqSPUcAIM
         hvPcDP8SDqDDkhTQRAJLBKrosHvALsQA9vgY272iR12lAG82Bj7f7V45mW9CDfVnkffx
         AhgNtiWun4orgpAoHz7J25NYonELNplN6JajpWnAg6eL14oSejpLxBFwNroJIOHTqPkK
         B6yTdHojyMzvLfbe2KyH1PXbVrPUW7BuMgSSRVdWnqXCoJtlqjysEDc3NWY9wn+y9hJ7
         rqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701294085; x=1701898885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1ZO88hxLxdvNhHhYibiygRoAvqr8qAWNq84h8JNdaQ=;
        b=jj2SdfRPJ7nz3iRy38wCkBM0O3lNj00Zo6uGyaSi+tF+dWDjpqYYenQ2HKQCOH8aF1
         aBjUudgYTy1brFkAxhvDtWwuIIVC5hQn66zXXR0GTrbbRGxGcAaYyLKhcjasuZzB6WIn
         UJVlmne9CqdJV4w38+5O5HkIdndT8TE7A/orxr7z4/IXveHRl1hCc2s43byK7JnW9Pxq
         oLZCFNZ0UK/+B3Dofiz6GoFgFYj3KvcZlEEg8zXefZahQN+POBeJ9rbaYOVIJiQJhQgh
         6qqd6llNYfXWXWzIeufE8fJU2HSLOJ9LKnWOuRRVw22G7H058hA+gKgBfs2sNOM3XJ63
         NZmQ==
X-Gm-Message-State: AOJu0Ywt3Pd6ZZGFMVYdHKAhBhnDDLjITjeQuSIUFqz+lnq93F/9XwzQ
	YpkOxKaNdbDwfWvdxNV3ZGwwPO3115jnseqtU4/yaQ==
X-Google-Smtp-Source: AGHT+IG1Uagfb05AQRCkYJ/sVdTN0npVgY7BidrNhD15Xi7KOYZSxtp9xnbO86r7NF5QEuNER2q641/tZFxOQM6la+4=
X-Received: by 2002:a81:cf08:0:b0:5cd:c65c:8173 with SMTP id
 u8-20020a81cf08000000b005cdc65c8173mr18687170ywi.10.1701294085422; Wed, 29
 Nov 2023 13:41:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <20231129161459.1002323-17-andriy.shevchenko@linux.intel.com>
 <CAOMZO5CZpQjWKimNReUkwHOc-mF8vWoq2HDhjGKSu6E3g5-aVw@mail.gmail.com>
 <ZWduPKmBWkaIdLhi@smile.fi.intel.com> <CAOMZO5C_dhvx70nk1HOSZdw8hMMmED69tdsXgydXdpnxHTJ58Q@mail.gmail.com>
 <ZWdyOc3pCoNihDtD@smile.fi.intel.com>
In-Reply-To: <ZWdyOc3pCoNihDtD@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:41:14 +0100
Message-ID: <CACRpkdap2fe-L0v7ttQULGq7d_zVCb2MmD4w=hHxKacKZH8jng@mail.gmail.com>
Subject: Re: [PATCH v4 16/23] pinctrl: imx: Convert to use grp member
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Fabio Estevam <festevam@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 6:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Nov 29, 2023 at 02:08:38PM -0300, Fabio Estevam wrote:
> > On Wed, Nov 29, 2023 at 2:01=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > It's explained in the first paragraph in the cover letter. Do you
> > > want to copy this into each commit message?
> >
> > Yes, much better to have the information into each commit message.
>
> Here it would be like
> "Because other members will be removed to avoid duplication and
> desynchronisation of the generic pin group description."
>
> Linus, what do you think about this?

I can just add that to each commit while applying if it makes everyone happ=
y.
No need to resend for that.

Yours,
Linus Walleij

