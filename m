Return-Path: <linux-arm-msm+bounces-63294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C4CAF062C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 00:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 585DE3A2EBB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 22:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA4827FB25;
	Tue,  1 Jul 2025 22:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwmLeB8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218ED27A903;
	Tue,  1 Jul 2025 22:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751407502; cv=none; b=G+nYqzJCuc54K061giN6le4/zKzfKbpgMtw3s0rj8Dz8bdgwCz+9W+raxxx1i/Zh3B/T35IhOoFS/YQuFh/ttQ8KUqoRGRIZyprnZvMXGYiQIf7LFTTi9V/RuEIV/VH+irsJ17XNklM7He6Mg9AbCRcRwEvB/8BmfDy25q57rxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751407502; c=relaxed/simple;
	bh=ppyu9gsbxrpZ5wf+weVHPIJpVDOSetdVu4g7Nd8pDvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkZ0BjRVOAp7lJo9AAFI4z0W68zutkp3WIO6YbGEAnoZsiVBVUhgP2YewOBARnKUcwbaivdsEfTL33tiJSLoyqnmd0Gp1jHfY8zVvHvcIqBxDIXcB+bHp6WlwVCUGV8d+Tzf1/iBU9fjx+33DgkV9nu/I5pAqMeN73jYQXDarQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwmLeB8m; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a522224582so3243676f8f.3;
        Tue, 01 Jul 2025 15:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751407499; x=1752012299; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mlce9+BeXYIb9jHut9yceCFyP7M78KNxQm8S2SUpS/U=;
        b=MwmLeB8mGz//ZMuq/BTLY+TnncIOEtP202I7IQwmrTgkzwgfaHT0zTrhWxfRpuYDHE
         mmuVR0PAdz5tmodedL1n1LvKs6DkvdLW7GAXdccUkDEEzbr5maUhVNUSkR+jc+ODW1bs
         qaDJ2cN39O3UpXibbvkBsFLppMb61NqZX78P2ev0DZBtpkBSQbSncUrDDIm+c7/2OnE6
         1Ecb5ZwepOd803b0s+v2CY88HK3zqc0qA2Z3Xyi0iJcS4qX0WyFqyVw80tlTEZ9XhDQs
         Vdxjsc1HLgTywnGd/XTY0zcSriLbRm2JZIIiLS9ESk0KBSGuoiEqzxCzxTdBKwyhCGVz
         3J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751407499; x=1752012299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlce9+BeXYIb9jHut9yceCFyP7M78KNxQm8S2SUpS/U=;
        b=vb5kHlolGVF759B6AQmPjmZtAcjDoSYBR0BZp75ip68QU+E5GDIhJc0QVsynCXcPqP
         ouOHZd5iBgeVRwShTkW8YPAsc5BrgxeSszWPoX7NDZbPGGDPf21w6EWemgTdan2UmR8O
         /Lm4z8YtM17y4SEUKrOq7iuPJi43Ul0ljswltfLBrD11FNlWRWGwlfjJJRcJd1GRyYo+
         xyL8RxP04JdW3nFRbGPwFjjeil7pYNKtPS+P/iGQk6m+3awzJNfNwcZ6Tm1ZC23+JtsY
         /fb3k15BRy2RvzxA5ahZVnaAW/pt5ykZAfLcroKv5/AFsGo4eggTXG4kvf4xB5dZogAC
         SUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXD/KsHnOoIfnv/6Ffmiez0COV2OgXR6eQE691zz4GUiSW9nWIBE6hqEaCZNVhCjaRu7Us57zlbgy4vZHP@vger.kernel.org, AJvYcCWRx0aJ5/dnmwirQNlhhzWURx7EbZGAapHfW/C6ISw5iUxBd4DJ5YefpMqM2HU+NZvYqs8jztillBV6@vger.kernel.org, AJvYcCXK7E/ABVzWBfSI2eatrn33Xz17Z+/h3blsxJzKAY8KU0B8cs0mbSorrlIYrC98vubgzRzMNIAoNG2PUTC3zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDVq/iBkpFawpXFPlLYtLNc/Fwq9GA6oOwcnWpNPoE6LQc3XmM
	1osrDjPJzEWHOgA3G7ejiu9Y6AD4sqTDbjpio9rTjKam0Ix3GSty6e4Nj+SmSDcVutU8z/SaVvW
	nVBHuQcPN9cF0ZmSdRkv+exE5v0NHdw==
X-Gm-Gg: ASbGncuiKN4CcqzmMrsnEZ99YXNia1m7XpQ4lUoOOVdb+D1DX1LpX5K0ySEhYqe/Grr
	mMHl1WL0da2jWpyWpVjb6IFS1+4YAqCAIPvuuWqxl9xnEuOBY6RdgF2dvJoxR87PYWFzxkrLny2
	nGWJiCRZo2k9EDqfs2e49S9uLP3QI7n9SXQAFCONJXfnQ=
X-Google-Smtp-Source: AGHT+IHjLaG9uF4AM4EItWeYaIVJxKo6+RzYJTHMBps8viAftxipMeaZJC6Qc8Ep9KjZU4hh3ATWv5tQbD/6trWHavg=
X-Received: by 2002:a05:6000:4287:b0:3a4:f7dc:8a62 with SMTP id
 ffacd0b85a97d-3b1fb0666bdmr139399f8f.0.1751407499166; Tue, 01 Jul 2025
 15:04:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
 <86116ada-51e6-4eef-bff1-f8b10a5edacc@gmail.com> <266fdeb50ba3926a3edbda71201ffa021afecd62.camel@packett.cool>
In-Reply-To: <266fdeb50ba3926a3edbda71201ffa021afecd62.camel@packett.cool>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 2 Jul 2025 00:04:48 +0200
X-Gm-Features: Ac12FXzuppBAG49XsmSbJt1Ald2C7YNcvTNDKcyljW0_CK-KpUrTr0TdTrfqVzQ
Message-ID: <CAMcHhXqcf5F+02+9XnpXWSvUrkhmfbaAtK9sJtghD4sh9yKA9w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add x1e Dell Inpsiron 14p
To: Val Packett <val@packett.cool>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Jul 2025 at 23:48, Val Packett <val@packett.cool> wrote:
>
> On Tue, 2025-07-01 at 22:43 +0200, Aleksandrs Vinarskis wrote:
> >
> > On 4/24/25 01:53, Bryan O'Donoghue wrote:
> > > Add in a dtsi for the Dell Inspiron 14p.
> > >
> > > I'm currently using this as a daily driver including sending this
> > > series
> > > from. Its reasonably stable on 6.15-rcX.
> > >
> > > The first two patches can be applied without dependency, the final
> > > patch
> > > relies on patches staged for -next in the media tree to be applied,
> > > presently.
> > >
> > > https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/2ab7f87a7f4bf392e3836a2600f115a1baa1415c
> > > https://lore.kernel.org/linux-media/20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-0-211e3e6fae90@linaro.org/
> > >
> > > Working for me included in this series:
> > >
> > > - USB
> > >    Both Type-C USB ports
> > >    Type-A port
> > >    Fingerprint reader
> > > - WiFi
> > > - Bluetooth
> > > - RGB Camera
> > > - Toucpad, keyboard
> > > - Display
> > >
> > > Working for me but not included:
> > > - Audio jack
> > > - Iris
> > >
> > > Not working:
> > > - Speaker output
> > >    Still WiP haven't touched this in a while
> > >
> > > - Battery
> > >    Dell has its own Embedded Controller likely from the x86
> > > platform reused
> > >    on Qcom which we need to reverse engineer or get some
> > > information on to
> > >    make faster progress on.
> > >
> > > - cDSP
> > >    Haven't tried to bring this up.
> > >
> > > - EVA
> > >    No driver haven't tried it.
> > >
> > > - Bugs
> > >    Occasionally when resuming I get a fencing error with hyperlock
> > > and
> > >    freedreno, TBH it looks like something in the GPU or SMMU
> > > according to
> > >    Rob Clark: https://pastebin.com/AWjCyaap
> > >
> > >    Ath12k has been splatting for me up to 6.14 when removing a
> > > SSID.
> > >    I switched on ath12k debug when going to 6.15 and predictably
> > > couldn't
> > >    reproduce the bug, either because the timings have changed as a
> > > result
> > >    of Heisenbugging or because a fix has been slipped into ath12k.
> > >
> > >    Other than those two I'm pretty happy with this system.
> > >
> > >    The DTS is based on Aleksandrs Vinarskis XPS, Lenovo T14s and
> > > Qcom CRD.
> > >
> > >
> > > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Hi,
> >
> > Just noticed that the device name is misspelled in a few occasions,
> > need
> > to s/inspirion/inspiron/. DT filename is wrong, model name in DT is
> > wrong, one of commit messages is wrong. Firmware paths and compatible
> > in
> > DT are correct.
>
> (BTW, in this submission in particular, firmware paths are not
> consistent with existing models: the XPS uses lowercase 'dell')
>

Good catch

> > Otherwise, is the plan to wait for CAMSS to land, and then land this
> > one, or perhaps the rest of it can go in already? There is also
> > Latitude
> > that was recently submitted which is very similar, perhaps those
> > should
> > be unified (CC: Val), probably easier to do if Inspiron lands first.
> >
>
> I have a unified patchset pretty much ready to go since yesterday.
> With the way I have it, landing any one of the non-unified
> submissions would only increase churn. I'll submit it now.
>

Nice, then my assumption was wrong, ignore it.

Thanks,
Alex

> > Regards,
> > Alex
> >
> > > ---
> > > Bryan O'Donoghue (3):
> > >        dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
> > >        arm64: dts: qcom: Add support for X1E80100 Dell Inspirion 14
> > > Plus 7441
> > >        arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on
> > > CAMSS RGB sensor
> > >
> > >   Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
> > >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> > >   .../qcom/x1e80100-dell-inspirion-14-plus-7441.dts  | 1490
> > > ++++++++++++++++++++
> > >   3 files changed, 1492 insertions(+)
> > > ---
> > > base-commit: f7570505263aff2b63142f0d68fa607cd60eb060
> > > change-id: 20250417-qcom-linux-arm64-for-6-16-dell-inspiron14p-
> > > ed68cd65ebad
> > >
> > > Best regards,

