Return-Path: <linux-arm-msm+bounces-45055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC06DA1154C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 00:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB490164626
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 23:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B73C2139D2;
	Tue, 14 Jan 2025 23:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Azom7ZDg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDD41D47BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 23:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736896977; cv=none; b=k9IS1JOY5AeM67nHt21mL+kHwJ/jbBgyxQa7HhRjgHZSMAPcLQcWGgw1qqLmoLwwNy1PgrJop9aQcsCJj8Kh6qcpxv62H5mYfmxt+iG1DgS0b2qH4k4sPOghl1Yb13EjFMY8dHRpDmCEWYQXVIqCZ39OuDxMszPF1dsubO6giks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736896977; c=relaxed/simple;
	bh=190YAZ2XHY6FkkWUewXL+8WRF2p39IlXVfSiWtRHOMs=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnpUjmX9Io/Zz/qcFKP1NwsTAMrksghKL05WwmWxvfw+vU0/nuGFrUK+31YVpVWd7RCehsmfbFEYl8uCJJaV2przkpPc+hrYazK+VXVlMyRPdykVgx1PEeTWQvEZfYNsRW9MlPRgl/EAk0lp6DrH4A7OvZDQqHaMd1YIXJrT7OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Azom7ZDg; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d8f99cb0d9so43277276d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 15:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736896975; x=1737501775; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7Lgxko9uVGZsuMx2gafWthQbaIDbF0yPzFdPsX8fXI=;
        b=Azom7ZDgF0tfmJolIkhWLEO32qeuvEwNTo73erpe7ihQvZOZZgZcSUeUDl3mZRXK6I
         CfcK15xR4JygrOQ+6yNndhKK31KHPQwKY8zO2RoqWj3SZjq6bd98CXDscF8PmzqjF02y
         DC/zYdwiooHIkSoUUvgGEa112u/UxBJJaRAjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736896975; x=1737501775;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7Lgxko9uVGZsuMx2gafWthQbaIDbF0yPzFdPsX8fXI=;
        b=BCJw/qSON5FHwk9QPUh/Rolx+1a1eqaqWZbbBpGh/4oSu0mo4SbmK2kDQvwMgZSnH3
         zet6cIS9UqIyBEupK7BE+nwAnGiNB03d3ymlFSKgWn8yrB+BH92a8ZZ/jACXqAxOU7dS
         sz3WU4rYwUw5vSWaQtRgQQMND6mHb33wsBZYIbEwYyqmYP4cCAJdUmD0GCscq3sT2mMZ
         dLCByyMr7A7WliLAcGdqS0Hx1Y1FNHdoq6VKT6MfowMCSEtOF4qYCHZ0sDZE/JhQQnmu
         26Of2nkcDFQSlfRUI6T/Iw0ZVSSQr3FLJqrVe/C9iW9acHHAoHkHbKB2A9Q0JB9sjnuM
         qSrw==
X-Forwarded-Encrypted: i=1; AJvYcCXeOLc58yLMxJyYozgAJJLlRIYMh8sKc03xOA2Y0cVRV8eKN1yLbIc9+CfjbEmmwJCkmRhFGTokxMgrhRkS@vger.kernel.org
X-Gm-Message-State: AOJu0YzvSaMuxyT6/P9/l5gszbiX8OnM8TSde1JOGjwsKz6gQHKWEp2e
	eycHsEYxlFr2toLdzGavD6hh1oexHs1n2GjfU/Il2HUFuFlmiZmV1vW8pSF4GxfYlFsuCDk8KMb
	ztNJNrd8koBoZVdaPyq/kyAlYGkaFhVJCZQhQ
X-Gm-Gg: ASbGncseZS31FTaNpHxNHrW1yqR6ddoiCyKxif8FAa/TjOPf2ZmkA9wzMnKKs+TR5EJ
	gzmQ3aiSNZfxpXjAWIgnAL4hs05xfF1whgn8I0lyWZoKGMtwaSftWacwkRmAAGK9jdQ==
X-Google-Smtp-Source: AGHT+IH1kgTUMPnbtiGBciMBLmycdZKmyXxo9rET57i4jmCQr51jzLWHtQ8uJQmtzyihKUb4hk4pgWE1ZPT8zcHMCVw=
X-Received: by 2002:ad4:5c68:0:b0:6dd:4c5f:b3d1 with SMTP id
 6a1803df08f44-6df9b1f6e3amr412156276d6.3.1736896975019; Tue, 14 Jan 2025
 15:22:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jan 2025 15:22:54 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250110135843.GA2630182-robh@kernel.org>
References: <20250108012846.3275443-1-swboyd@chromium.org> <20250108012846.3275443-3-swboyd@chromium.org>
 <7a64e927-235b-4d63-af59-f2c80464a9a1@oss.qualcomm.com> <CAE-0n53wX99ry88zOOuq6SPVpraiENheJ1T+HZri82x4gqZJ_w@mail.gmail.com>
 <20250110135843.GA2630182-robh@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Tue, 14 Jan 2025 15:22:53 -0800
X-Gm-Features: AbW1kvZZEICi_ElffHdcdM5qCntX3rhUy_7MsF-zN--bVSuif1_AJXoaGEXBpfg
Message-ID: <CAE-0n50yP2qwvC6nWph4XT2bvDmd4rwrC-Omx33Q4z96r1bmoQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] dt-bindings: bus: Add qcom,soc-sc7180 SoC
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Rob Herring (2025-01-10 05:58:43)
> On Thu, Jan 09, 2025 at 01:51:12PM -0800, Stephen Boyd wrote:
> > Quoting Konrad Dybcio (2025-01-09 06:05:14)
> > > On 8.01.2025 2:28 AM, Stephen Boyd wrote:
> > > > +
> > > > +  '#size-cells':
> > > > +    const: 2
> > > > +
> > > > +  clock-controller@100000:
> > > > +    $ref: /schemas/clock/qcom,gcc-sc7180.yaml#
>
> This makes the above schema be applied twice. Once here and then when
> the compatible matches. That can be avoided by just listing a
> compatible. The QCom display bindings follow that style.

Cool thanks!

>
> > > > +
> > > > +  watchdog@17c10000:
> > > > +    $ref: /schemas/watchdog/qcom-wdt.yaml#
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - '#address-cells'
> > > > +  - '#size-cells'
> > > > +  - clock-controller@100000
> > > > +  - watchdog@17c10000
> > > > +
> > > > +additionalProperties: false
> > >
> > > ..this approach will make any dt node addition under /soc require
> > > an additional bindings change, which sounds like absolute madness
> >
> > We should pretty much know what nodes go under here though, because it's
> > a chip that exists and doesn't change after the fact. I agree that it
> > will be annoying during early development when everyone is modifying the
> > same file to add their node, but that problem also exists with the dts
> > files today so it doesn't seem like total madness. It's also nice to be
> > able to look at one file and quickly find all the schemas for the SoC
> > used, like a table of contents almost or a memory map for the chip.
>
> I don't really care for listing everything either.
>
> We could just generate all the schemas used. Either "give me all the
> schemas matching some compatible patter" or "give me all the schemas
> used to validate the DTB". The latter was possible on a per node basis,
> but I think I dropped that when I changed how we select schemas to
> apply.

It is good enough to list compatible and properties like address-cells
and size-cells and then have patternProperties requiring '@' in the
name?

>
> Speaking of memory maps, I would like a tool which could dump memory map
> from .dts. My primary reason is to find overlapping regions.

Sounds cool. I don't have any need for that though so I'm not going to
jump at writing such a tool.

>
> > One thing that I find annoying is that you have to put the whole soc
> > node and child nodes in the example. Maybe we can omit the example
> > because there are so many child nodes.
> >
> > >
> > > I think additionalProperties: true would be sufficient here, like in
> > > Documentation/devicetree/bindings/soc/imx/imx8m-soc.yaml
> > >
>
> No. You can do:
>
> additionalProperties:
>   type: object
>
> Or a patternProperties entry requiring '@' in the name.

This is to make sure only child nodes can be added, right? I like
checking for '@' in the name so that random nodes can't be added that
don't have a reg property.

