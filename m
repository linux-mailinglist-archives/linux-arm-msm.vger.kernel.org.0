Return-Path: <linux-arm-msm+bounces-11123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9100E855854
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 01:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE2091C24508
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 00:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76F9EDE;
	Thu, 15 Feb 2024 00:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VyYOmA53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF94623
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 00:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707957320; cv=none; b=XtXFGBskjWmm6bnBLBosWcB8N22gxNbxCa347KN3yPRwTDXokZq+sVGKAUcFqKqQgb9pOm1iLW0omc/CCpaP37zWvzZui4ymKkWzjyMYJn0JvfeuvHOcGmtrz37GRNcEDbSlm+stod9wnuBmptHEbqGmaKtMLMXmMoT3X4hKAo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707957320; c=relaxed/simple;
	bh=w4WycQ34mbgOk/JR3FYy5RCHKedOUbdj9qbAJSxWePQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gw3j8geDcCYHBbhh5JFAkNwedZRvvlltUMtsDS6JPIComjjKsJsDMAc8KJjPSpKSVA9s9f2SHvq8DWToNqR1qigP3OWhWsOM7iI7GGr4KqriYFchlyq99Tp9+RepWXb25b4dp0aIzS/MS7gSFKWDCSSl6cOCCZjuE6ILupwke6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VyYOmA53; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-511531f03f6so348627e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 16:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707957316; x=1708562116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNL4nxS/kOZUdb+wGvan9grg7BH6Hi7Yz7Ks7Xp1aQE=;
        b=VyYOmA53BaQCsUIAYfunhAWxkZUTsz4+KsUCyTKIouk3rnj3RjNj2CxBHyBsog/Vvb
         TEa8I/sryVdSGBcnC4xNjDDmIYpzS13zda79AcIrBgeM2/2Fe0bexjOrupeRqmuJzy8J
         wXFIOSHWBcnuTvwr66+EXQNsQ4/FqJiAOBq40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707957316; x=1708562116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UNL4nxS/kOZUdb+wGvan9grg7BH6Hi7Yz7Ks7Xp1aQE=;
        b=NTX9DrLrYi1KPVHPTBmavsjlp6cne3s/jTAyNcORTNfKlzZsIxBqvWaaM4bfrfnyhZ
         roNjsu4bdYb/KOhVybpW0kXmJS9X+B2fQkPSdLdEC1heEXeyaIQCjK1W/B0aX8rj6Uz6
         9crq1IGZjmSaNJ7VXGi1ImtiDhRB7d7BwSSd+zw/ZNAgwB6KBoqS99ZZABmWfFmaPiHJ
         2sKHQfYZawaY8BKz/DDrmKrJXywD4+WgSyfQPzUWnGPhkQQg7KoAWD7pCCDDWZUk1UtU
         5CTcvmTjZ+aW0mON5pvKjwV41C3WioQqkLFI5tcPPR8rwuXAXrEbDvyDM5pkcvEJPNIw
         qGQA==
X-Forwarded-Encrypted: i=1; AJvYcCXdbHThv8gYtRZKY5d3lCVqZe1a6yprXIjJYCvkd+z6Y2SdfDuqcyiITpw0cF1YkXZ1H01bg1qynvuUMlHFYqvQ6KJUcLo5tahTxsZ6Sg==
X-Gm-Message-State: AOJu0YyrtaXh/l6THdh/Y10up5s1MPA8rkiywPMp7ysdOASflEIO8JdV
	r9A16LG08V4G6fnbrd+QSr19cHEacwVswS3iD++EewY9XqBZfFNCpIHyO//0V0Sl0Xf86HKDfl9
	oPuh+hujaXOyO5sepLgQmrjGner3GxlaAZ+WE
X-Google-Smtp-Source: AGHT+IHXNYpsYAXuGfn6hjikUWsm1VP4Gg+Q/g46rMXkjUWx6LaJPjIh5nCyPdW7FoWi+tNkxkSyFEKZ9ECBKUMe82M=
X-Received: by 2002:a05:6512:48d3:b0:511:9bab:d424 with SMTP id
 er19-20020a05651248d300b005119babd424mr209887lfb.39.1707957316266; Wed, 14
 Feb 2024 16:35:16 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Feb 2024 16:35:15 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WovmtKFiG0OMzpus9=z8UJ+Ev3TrwsVia8pSegvjwUiw@mail.gmail.com>
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-22-swboyd@chromium.org>
 <CAD=FV=WovmtKFiG0OMzpus9=z8UJ+Ev3TrwsVia8pSegvjwUiw@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 14 Feb 2024 16:35:15 -0800
Message-ID: <CAE-0n52qgKrasAw1AbZ97zMk1xz6P4KkxNLi4cBpNKy5wWu+1A@mail.gmail.com>
Subject: Re: [PATCH 21/22] arm64: dts: qcom: sc7180-trogdor: Make
 clamshell/detachable fragments
To: Doug Anderson <dianders@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, cros-qcom-dts-watchers@chromium.org, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Quoting Doug Anderson (2024-02-13 15:34:38)
> Hi,
>
> On Fri, Feb 9, 2024 at 11:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org=
> wrote:
> >
> > + * Copyright 2024 Google LLC.
> > + */
> > +
>
> Tiny nit: should this file have a comment like "/* This file must be
> included after sc7180-trogdor.dtsi */" like the clamshell file?

I was copying the comment for the keyboard include file, but the
detachable doesn't have that include. I can add it here though, that's
fine.

>
>
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/=
arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > index e9f213d27711..c3fd6760de7a 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > @@ -5,8 +5,7 @@
> >   * Copyright 2020 Google LLC.
> >   */
> >
> > -/* This file must be included after sc7180-trogdor.dtsi */
> > -#include <arm/cros-ec-keyboard.dtsi>
> > +#include "sc7180-trogdor-clamshell.dtsi"
>
> nit: Not that it was terribly consistent before, but in lazor you
> remove the "This file must be included after sc7180-trogdor.dtsi"
> because (I guess) it moved to the clamshell file. However, in other
> dts files you don't remove it. pazquel has the exact same comment and
> it's not removed. Pompom has a slight variant of the comment where it
> explains the reason (to modify cros_ec) and it's not removed. Could
> make it more consistent...

Sure I can make it more consistent with the explanation. Which way to go
though? Remove it from the boards and put it into the fragment files?

