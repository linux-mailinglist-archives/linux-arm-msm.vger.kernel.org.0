Return-Path: <linux-arm-msm+bounces-26641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CC937B6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 19:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D54E71F21653
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 17:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F338145FEA;
	Fri, 19 Jul 2024 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IuMfD/oS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557442C697
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 17:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721408869; cv=none; b=SDeV0jOzw0R8lgz0cM8OYAPGp3cko1Un73u3QbM9EvvwWAf10XeCJXT/M+1aiJrYYzXqFzRweV0Z/9qoJVTVZtbGr4EOhRkaz5GBZ5XYGNM8oo/P4PZ3VXASDOehCJN7ax3gtfV7jOwZi3pqcPMRQ1m5oEy5fIIvfeb2Narpovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721408869; c=relaxed/simple;
	bh=aWJBW7qSepD09tUcrnlrHVc592+V670R8bG1ncdQIrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=glOE47BVLWKxNScSHdYEl14wftBLsCn4s9iPdaOIbfpS5u0EbJxEglrXtplYZ8L4VajbfYyb8BsHyhcmGwNBT2fmu3KtzmRYR3r/n2kJou7TiA7Z4aZoWHJuhoWLvNboJVqQXz8TJdznXbejJgFb9TMiESPi3yzZrbEdz24UiNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IuMfD/oS; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e05ebd3d607so2168905276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721408864; x=1722013664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWJBW7qSepD09tUcrnlrHVc592+V670R8bG1ncdQIrM=;
        b=IuMfD/oSX+ZZTNrShSJvhHrtFKQSOa8lTtiMU/71YMnAlmVq0bXtmAN70k4BJSaRhQ
         5lT81Od350D98U1kpxinFsPhRJYmvtHvr3zEC0hEBSLTZmORyFfQPiurDTN9zktsWtH2
         gWmsMY4RwAxDJtbrud6UfZvfZs4qElM4bVi3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721408864; x=1722013664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWJBW7qSepD09tUcrnlrHVc592+V670R8bG1ncdQIrM=;
        b=T+jIO7p4YxKtzPBfgmmEI+6DkJ/g8W2jVQojyfXL+EtNt1IDxkdW/+Z86esq/4DC0x
         doNTgWf0KJmBndMa66U3Erxwj13L9oZvpp82WHDigL/cgT7hfj1dlda9+6msm+p1ar+I
         5PDVLi1oViwXaftfY4kIKCgkiF5OuDqOourhExpO9/xIeR48O9YamEwhmUhGzMpB7nwa
         v+k1t9/gnj3aOXp8QUkRaCGh09AbFukrgiVhTNKsmxmdDNcsf1riQZFH5eGZ4A58iO/H
         1FWAbFdrfJoerp5naP+VI/u+EDEJONfDfN0atz80Xlk02kQy8W0/b4IpYbXUGh5gXWYE
         SjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAJNka0M8G/78hywM3fIc1Wajh9RNkhgxX0D8m12aRVBcoo4e3lSbaFBcltmKC8hrKwbCBY6tdfBjysmoneCaSxWHFckr2poDDAUI45A==
X-Gm-Message-State: AOJu0YxqObOOVyfWTacNasico1063pEFnYmao+BmkLA/DAyz0bn562z2
	WjBeN/4miRTUQQ2RBlCj4c5wXuUTnTrg2p/s7kH59FojFL84zck6YbnAFePUjN/KnJsgBzQnMYo
	=
X-Google-Smtp-Source: AGHT+IHl1UeAacmv90widP1N047BHv5BX7XCMze529lj7pRZYOAztvoztmUtCo/5kqMQHgJtAJKCRQ==
X-Received: by 2002:a05:6902:1107:b0:e05:ebed:2a84 with SMTP id 3f1490d57ef6-e087045a417mr247786276.45.1721408863985;
        Fri, 19 Jul 2024 10:07:43 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7ac9c3462sm9843626d6.76.2024.07.19.10.07.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 10:07:42 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-447df43324fso310401cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 10:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVg7ms9oMPmMAL2aL0tgmS32Gx1bg4UuWrQ18sJZjVRIboN31Ky5Gy96MOjJuVqVgZUu7qbgUuspQ2Er3wuOTVpgkwBQzNdHi+qb1ST5g==
X-Received: by 2002:a05:622a:191d:b0:447:e0e1:2a7b with SMTP id
 d75a77b69052e-44f9c83d5d8mr2695131cf.23.1721408861491; Fri, 19 Jul 2024
 10:07:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
 <20240715-scorn-canning-a7f23b9e2039@spud> <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
 <e017259b-bc62-4b57-9276-b834237225e1@kernel.org> <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>
 <20240718-frightful-naturist-a049ea7c0548@spud> <CAD=FV=VaGXMf6Srix6v=Me35BUN4B6ZHwebycka4Dbavqa5Vbw@mail.gmail.com>
In-Reply-To: <CAD=FV=VaGXMf6Srix6v=Me35BUN4B6ZHwebycka4Dbavqa5Vbw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 Jul 2024 10:07:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyDF8LkPeHXTgsyDA74n+AjuHPQ1896ECDE17aYB9rtg@mail.gmail.com>
Message-ID: <CAD=FV=WyDF8LkPeHXTgsyDA74n+AjuHPQ1896ECDE17aYB9rtg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 18, 2024 at 7:59=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Jul 18, 2024 at 7:56=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, Jul 18, 2024 at 07:45:57AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Wed, Jul 17, 2024 at 11:19=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > > >
> > > > On 18/07/2024 02:21, Doug Anderson wrote:
> > > > > Conor (and/or) Krzysztof and Rob,
> > > > >
> > > > > On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@kerne=
l.org> wrote:
> > > > >>
> > > > >> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> > > > >>> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has ba=
cklight
> > > > >>> control over the DP AUX channel. While it works almost correctl=
y with the
> > > > >>> generic "edp-panel" compatible, the backlight needs special han=
dling to
> > > > >>> work correctly. It is similar to the existing ATNA33XC20 panel,=
 just with
> > > > >>> a larger resolution and size.
> > > > >>>
> > > > >>> Add a new "samsung,atna45af01" compatible to describe this pane=
l in the DT.
> > > > >>> Use the existing "samsung,atna33xc20" as fallback compatible si=
nce existing
> > > > >>> drivers should work as-is, given that resolution and size are d=
iscoverable
> > > > >>> through the eDP link.
> > > > >>>
> > > > >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > > >>
> > > > >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > >
> > > > > Can you comment on whether you would consider this bindings a "Fi=
x"
> > > > > since it's a dependency for later patches in this series (which a=
re
> > > > > "Fix"es) to pass dtbs_check? See:
> > > > >
> > > > > https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@li=
naro.org
> > > >
> > > > The patch itself is not a fix, for sure, but it might be a dependen=
cy of
> > > > a fix (which you wrote above), thus could be pulled to stable as a
> > > > dependency.
> > > >
> > > > I do not care about dtbs_check warnings in stable kernels, mostly
> > > > because dtbs_check warnings depend heavily on dtschema and dtschema
> > > > follows mainline kernel. Basically if you had warnings-free v6.8 bu=
t try
> > > > to run dtbs_check now with latest dtschema, your results will diffe=
r.
> > > >
> > > > At some point in the future, I could imagine "no new dtbs_check war=
nings
> > > > in stable kernels" requirement or at least preference, but so far I
> > > > don't think there is any benefit.
> > >
> > > In this case it's not about whether it makes it to the stable kernel
> > > but about which main kernel it goes through.
> > >
> > > If we land the bindings in drm-misc-next right now then it'll be a
> > > long time before it makes it into Linus's tree because of the way tha=
t
> > > drm-misc-next merges. It will make it to Linus's tree at 6.12. You ca=
n
> > > see the drm-misc merging strategy at:
> > >
> > > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
> > >
> > > If we land the dts change (a fix) through the Qualcomm tree as a fix
> > > then it should target 6.11.
> > >
> > > This means that the 6.11 tree will have a dtbs_check error because it
> > > has the dts change (a fix) but not the bindings change (not a fix).
> > >
> > > One way to resolve this would be to treat this bindings as a "fix" an=
d
> > > land it through "drm-misc-fixes". That would make the bindings and
> > > device tree change meet up in Linux 6.11.
> > >
> > > Did I get that all correct?
> >
> > Is not not fairly established that a dependency for a fix can go onto a
> > fixes branch even if it is not a fix in and of itself?
>
> That would certainly be my take on it, but DT folks confirmation was
> requested by Neil in:
>
> https://lore.kernel.org/all/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro.o=
rg/

FWIW, I'd rather not let this stagnate too long. I'm fairly confident
in my assertion that this should go into drm-misc-fixes. I'll give it
until Monday and then I'm just going to land this bindings change in
drm-misc-fixes. Shout soon if you feel strongly that I shouldn't do
this. If someone wants to flame me after the fact then so be it.

-Doug

