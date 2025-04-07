Return-Path: <linux-arm-msm+bounces-53435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6D5A7E664
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 18:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4784318877B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 16:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE392209F2D;
	Mon,  7 Apr 2025 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GkZNiVdg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B1720A5E4
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042731; cv=none; b=f2wRvyeTLjPX89AoOk5akm9/9I72WZZHGYNycz7lPyB+w7lpa0/Ledj2ialenn6UmDdgHQatgR+KnJsZ+lEa4yjBf8BstH/lAfjJdCSs9t5Hk+feBKWOrl6vPSPOa3iI2jJyKh4EPy1b+1Qmvx8bFUSQt1Kvp0tdX5VUjr1Oh3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042731; c=relaxed/simple;
	bh=UlaJZxSieBbasfgzz7gGd3ssb1FnKZpa7pEFR1lSHB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZfH0S8UsmRvuXoev1Nixcaf5yKXk01+4nkYVizO8Fzv4k1tf0pnQXnpKJ6LMhjfWUqNWski3rXrUrB0DTuSSEfiD02jysisDaPVVO7i5hEagG94hY3eB2bYBd7a2p+rHVWWDBggFHyaTOOM/K8ZeZUNOCQLcXU4/1+GDZy9T00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GkZNiVdg; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ff2adbba3fso42155007b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 09:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744042728; x=1744647528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JX/CsfcApiydwjMPAUinCGMDhAd2IhhoMg3Tp/JQvVw=;
        b=GkZNiVdgoYrCt4GLU6a3BxGNy+0nOhwhc93/g7IXLv8qM1QFN4qQrQQV3ifhdyKS8x
         rhJcW4WHrF8x70BvUqJt3tusIYRLq0VxUGdiqzs5mX+KmQ36vJCnNOR/ACHAcb43IHxF
         tMYmMWoO4e1x5G/G/zC5C5Ae/YKGpVqG35AZGMZNyjWxgs9eRlyAHDM1LrWwPxhZ2GIY
         QjiX+K1T0CnbATnM3FP/4aYCz+BKHESYs+FL2XbjYGzrtPHl9H2e7x5SHDqzFNN/2LIr
         +ktrOK+lRIcNMlhTkrtOh29EdpiHHBjni56aJBvdC1n1XJ/a41t3n5j7EN0ixexzPoyC
         vb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042728; x=1744647528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JX/CsfcApiydwjMPAUinCGMDhAd2IhhoMg3Tp/JQvVw=;
        b=r2sJ08qp19OdO4TEqi6TfEBTQQiHqEAf1K9jIeun/sLO2ONIwL0E6AdDtJ+aBm27k+
         95PiIlc/RSvpXW0lKWhGBWQBFMA62dooFUnTV3D6hLg60F9FNx6GberBI5awiLrikp6p
         bSvQKl6PPhsVHtA4v7tfFsYmB1tnH4fzcRy9gxCi8JJighKNG+0zkiMEVkBk2g/hVHf/
         ITSy3kUsiCnZQQZ3+cP/sTQEI4z7/R83gZ7KnTfBT9gQBFRsH8ZAj4jIqAvURJTE3sYl
         R08Qsh0PcohKIjbu1xMtDOvV6Kt/iinJZnms49kUSu1KFzvFSQ2Zx+rWEzXaV20g6/Xn
         QyNA==
X-Forwarded-Encrypted: i=1; AJvYcCU74SZznhn24vZVOaaiSqHVr1D8XBqDcI77raC9snwQqR8WvTKwu0puEG3oxsHZx+B7ZEPvHKHUiv6RcHqN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4VMNmWOmlp1OmMmlJT+ntkD2/73uR123NiUeHSvnjZ+kitcJQ
	S1v9lhVjPNzwTgFfprmHeM132cZ21s/hX2igR++iZXQMWLeGdiahSzRQ1R4FM88bSSMoab06jmM
	fpRbkYkGV+kiFzo+69Ydt0Q6cgxjZKsyULswRng==
X-Gm-Gg: ASbGncsTeZyikGdo1u7TYaQgnJ1hBk7rWfK3j5VDUIYaqlBOS+FQ+nLdyHxJAu9B+84
	7Jg36EY4Ceny5mBV3iIBerE0BfJDlUyl/+0eutKQTrnsxWoLTPDavQP1Mq7fPPRX1dAObmFnULQ
	6sQL4Nc+Y4GN4AoSKk8Qu4PF18OkM=
X-Google-Smtp-Source: AGHT+IHKMX4Ob6QTTm80PFpdHe5OW6JJqpgeMbRrvzhWKoI17ZKitrO/G0aPEV6gKHvE71Av+QnfoRhbc/Xsg7bIvR4=
X-Received: by 2002:a05:690c:640b:b0:6fb:1c5a:80ea with SMTP id
 00721157ae682-703f42fc252mr178401657b3.32.1744042728667; Mon, 07 Apr 2025
 09:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <20250407-aloof-fox-of-relaxation-62963a@sudeepholla> <CAL_Jsq+6GG3j3_S94SYLwdGN7x8fjf5WuGL4uHfmgW-fFb=dKQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+6GG3j3_S94SYLwdGN7x8fjf5WuGL4uHfmgW-fFb=dKQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:18:12 +0200
X-Gm-Features: ATxdqUF_J2qNh9UdMVJ6Dqqt88GUYfovrcMe53xm4tXJ8-94vrSIdDD4MBgiib8
Message-ID: <CAPDyKFpX7aqcme9c=TZ3JT_DssRatvXPFWSNN-3k5K8pUZvgeg@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	zhouyanjie@wanyeetech.com, Conor Dooley <conor@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Apr 2025 at 14:49, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 7, 2025 at 7:30=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com=
> wrote:
> >
> > On Fri, Apr 04, 2025 at 12:36:33PM +0200, Ulf Hansson wrote:
> > > On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrot=
e:
> > > >
> > > > The "power-domains" and "power-domains-names" properties are missin=
g any
> > > > constraints. Add the constraints and drop the generic descriptions.
> > > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Docu=
mentation/devicetree/bindings/arm/cpus.yaml
> > > > index 6f74ebfd38df..5bd5822db8af 100644
> > > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > @@ -313,19 +313,15 @@ properties:
> > > >      maxItems: 1
> > > >
> > > >    power-domains:
> > > > -    description:
> > > > -      List of phandles and PM domain specifiers, as defined by bin=
dings of the
> > > > -      PM domain provider (see also ../power_domain.txt).
> > > > +    maxItems: 1
> > >
> > > There are more than one in some cases. The most is probably three, I =
think.
> > >
> >
> > +1, there are users using "perf" and "psci" together now.
>
> Where? That's just wrong.

For SCMI for example, but other QC platforms use it too.

"psci" is for CPU power management - we discussed the bad name "psci"
before, but as it's already widely deployed maybe leave it as is? A
better name would be "power", or something along those lines.
"perf" is for CPU performance scaling.

Kind regards
Uffe

