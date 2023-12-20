Return-Path: <linux-arm-msm+bounces-5565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82242819D81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 12:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EBC7287861
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 11:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C853C21341;
	Wed, 20 Dec 2023 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dc1lT+rN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44346210F6
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5df49931b4eso45634477b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 03:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703070148; x=1703674948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWZSCVRWyRcXn4WJEnxmsNNdBu46mpN/PeFPjmLZcSo=;
        b=dc1lT+rN4Jk1cfhR9kpv3m6Eokb0zL1DeRVZZFb8FpS+LSLEY8OMDzET4PmijmLtT2
         O7QKXk4qQ3Jy5nnA3nLM5mR9Jjvh/m9GWCQYPWm8HLpMxqTEcT35Si55MWb6/IoNGswR
         pTPVVvXcerCAqo0ODQ9iYkQVgwRgo2fJHz5xiHbQFeyvCyPIiJwGcP2TLQJ1EVqkzx6I
         uZ6mNHj+1s+/uddVt6CzJ7fJfXJxIiDSXJZbFtfFstXzsonly6GuGx05UnTczE/ZVBg+
         GT0h9puyl/ll1mn6Agb31cAHynel0HrCuVSsMRsfqeuGrTLkmWO/nFCL8bZQWpJ+Ut+7
         9qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703070148; x=1703674948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWZSCVRWyRcXn4WJEnxmsNNdBu46mpN/PeFPjmLZcSo=;
        b=p/IbrpCMSfGLm8yt7XNFvSIfWGPVknGleluGSWw/euAJmRYtp1Adw39p0bClA4BXz3
         NS8oa9FrpFsNrGlJZPCwI/YRT/AYCaSNi2j4h8+rkNv8Z8o5FkKdXq4aeKeMzeO/Bau1
         pWGF4yI1ojHsMfq38uIEEhU0W+m0x2pquxXEJp7VJy+DPvz5mbUcHEYgC/dHoRsqXzXu
         WFZn3/kmW9pkwBi0gM/HGk1pXheNp53g/RuE1aXtB2M4jdOX/PJaLKdVFzxtGSDx4SJB
         d/vPNZmuXfGa9+gm2nE8O06dALliqDDSokOGDaHAhlomGE+Go7YLeozDbe/ysr3gXUU5
         DVJg==
X-Gm-Message-State: AOJu0Ywu5i7LHIbNEQLV7VlVv7FYig8P4T2QI7hrvLLmiMGJdJyZHPeK
	EIo4tfHWVhHv/fa+FCW55Ca9GRHyYWiXif5Pv6fBJg==
X-Google-Smtp-Source: AGHT+IGI18zKecLpoICynLSs1R9jI1aHtIpeMLm0ek2fpDCCeCyu36u+kC2bJq5eVNLOe5HR45rwOgyJR2ClP5LV5U0=
X-Received: by 2002:a0d:ea11:0:b0:5e7:ebc6:984 with SMTP id
 t17-20020a0dea11000000b005e7ebc60984mr2065348ywe.84.1703070148183; Wed, 20
 Dec 2023 03:02:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212090611.950-1-quic_aiquny@quicinc.com>
In-Reply-To: <20231212090611.950-1-quic_aiquny@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 12:02:17 +0100
Message-ID: <CACRpkdb6dkw58GwkqYXTDAQtdLazOLyp1CEjnkxDX2v=TDvvMw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: Add lock to ensure the state atomization
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: andersson@kernel.org, kernel@quicinc.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maria,

On Tue, Dec 12, 2023 at 10:06=E2=80=AFAM Maria Yu <quic_aiquny@quicinc.com>=
 wrote:

> Currently pinctrl_select_state is an export symbol and don't have
> effective re-entrance protect design. During async probing of devices
> it's possible to end up in pinctrl_select_state() from multiple
> contexts simultaneously, so make it thread safe.
> More over, when the real racy happened, the system frequently have
> printk message like:
>   "not freeing pin xx (xxx) as part of deactivating group xxx - it is
> already used for some other setting".
> Finally the system crashed after the flood log.
> Add per pinctrl lock to ensure the old state and new state transition
> atomization.
> Also move dev error print message outside the region with interrupts
> disabled.
>
> Fixes: 4198a9b57106 ("pinctrl: avoid reload of p state in list iteration"=
)
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>

Overall this looks good!

> @@ -1262,9 +1263,12 @@ static void pinctrl_link_add(struct pinctrl_dev *p=
ctldev,
>  static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state =
*state)
>  {
>         struct pinctrl_setting *setting, *setting2;
> -       struct pinctrl_state *old_state =3D READ_ONCE(p->state);
> +       struct pinctrl_state *old_state;
>         int ret;
> +       unsigned long flags;
>
> +       spin_lock_irqsave(&p->lock, flags);
(...)
> +       spin_unlock_irqrestore(&p->lock, flags);
(...)
> +       spin_unlock_irqrestore(&p->lock, flags);

Is it possible to use a scoped guard for pinctrl_commit_state()?

#include <linux/cleanup.h>
guard(spinlock_irqsave)(&p->lock);

It saves some code (and no need for flags) and avoid possible
bugs when people add new errorpaths to the code.

Yours,
Linus Walleij

