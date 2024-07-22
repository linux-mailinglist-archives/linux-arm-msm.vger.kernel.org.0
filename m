Return-Path: <linux-arm-msm+bounces-26814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 833569391FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 17:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FE9328283F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8109B16E887;
	Mon, 22 Jul 2024 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H7JO4+ph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FF616D4FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721663123; cv=none; b=ByA5f0tGLCdTgBoSc9QoUphWS76WmiO/4uW23k3hvPan/UHwVgBcTJVnbRLyajJTRljvavzSju+OwRfpDia5QF8CVIINwZBmjnYuIS+q/VTRQNIIrSHu16DQq2Z5NZ9IfhevdU4QhNTjppir0qlvMroiDpIuxITvXy6ZRbT0agg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721663123; c=relaxed/simple;
	bh=cFDJr/xGdVyJXbvejmGK81i2LvDjiM0dh/CdKN8HWuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8uuOCUWizdIDs3vfvrU5PDGM3wOmG37Pq+8VOpyfVnQMBn7FguL702bwtYF71yCA3kPoeXT0jk4U16b15XgSTtvlVw5hxh3yGTYMgrrLThSss1M6OsqjyMsMpHgzMXW/fR0MJ6cafpAQvK/gsFYktcofAJ9JPUrbLjgE8rAsrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H7JO4+ph; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-447e57103d5so19225751cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721663119; x=1722267919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDPtwwC5v8WJk5FRYY3avsIqqV6M4bWCFDqVrNinJ34=;
        b=H7JO4+phUOHzd+Pt1z4hxDYGS1LEChwF1VhJ/MBmO1UypK/taoywjgjGwpQhIhwt2F
         9gaEzHuOWMlY85ybRWu7v96ffzLxcCYTC/2dEZCob6eV2PT7gIKcCWArROIXnf06ARhw
         z0ZaX5p0K4XoBtyflzNwYpEVSqH9/6zLYQYPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721663119; x=1722267919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDPtwwC5v8WJk5FRYY3avsIqqV6M4bWCFDqVrNinJ34=;
        b=vXohdwW4yTN3Ex4I1hMXkUMGAYnbK7bb8cjt441sL4OnjzUK/pjtWWZnd9+IOHDFXz
         P7RMWcjPKWCnSvKT0XvMyXadKYNOYLxc3gvQc/JLl6fVgRAN7RzmzbEETt7MH7prlWQX
         97+SblCo2N+DyN3pXzsEAQmBPKi8fTo1IxKIFt1YbLL66IpxgKlzIDwBI24c6CHfvi6l
         H1g8JMYgKn9IVtTeFap2fy/NaIH6kmVyTTXLnbea2l9H4WedVPKDtDh+i4yuq/dZdPxE
         Gx684Ppv8XtdrfOEPs9cA6hCzJxXuHXk50U8UYGj3g7Wp6OG10SJhDk4eJSgyrCHDsEp
         Gxpw==
X-Forwarded-Encrypted: i=1; AJvYcCWK8JFEqIGfbF0Pz/a1ve5lzMJzNqkxQnjUDNspswydb/zcsEU4BY2Ptlez1/f3BEIyIGrrXG8gqb3TgHEC7PjtNweg2yPzcMAWbvDsTg==
X-Gm-Message-State: AOJu0Yx8Gz7nea/X8pgUdklnl4CuGHKGDBhP8jrIlUCzuxfo2s3fPpwz
	2o1piLvIv5D/tBXsyScX3FZpprqpSPoXg0pt8yeVbxkbVB6ls2vwisXacMrQomIqBBoCRz5ugok
	=
X-Google-Smtp-Source: AGHT+IFqg2cwfLD3TzutLVUcFgM8Lzx6l9C4h0N7Xa8mda8+opKJ47xUXCbXLd/GwOsW7gMxFcSOXw==
X-Received: by 2002:a05:622a:493:b0:446:36c2:8de2 with SMTP id d75a77b69052e-44fa532fb9dmr105859721cf.43.1721663118675;
        Mon, 22 Jul 2024 08:45:18 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f9cd32cf1sm34615541cf.45.2024.07.22.08.45.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 08:45:17 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-44f9d7cb5c5so733541cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 08:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwNmryWCU1qyKbDpGciy494pDQoJBJKqFB0gm3fWGp9eIfAv+8MPirLvjzhkG6B7bP0JtP6cWlEJ7vS7SB8Q73jYB3TJWeRAH1dayx2A==
X-Received: by 2002:ac8:5f46:0:b0:447:f44d:d0ed with SMTP id
 d75a77b69052e-44faa973763mr4370471cf.1.1721663116858; Mon, 22 Jul 2024
 08:45:16 -0700 (PDT)
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
 <CAD=FV=WyDF8LkPeHXTgsyDA74n+AjuHPQ1896ECDE17aYB9rtg@mail.gmail.com>
In-Reply-To: <CAD=FV=WyDF8LkPeHXTgsyDA74n+AjuHPQ1896ECDE17aYB9rtg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2024 08:45:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WQRt2yVL4KZ0W3LWL2wybvL89NDb64fizMe42_vu=+7w@mail.gmail.com>
Message-ID: <CAD=FV=WQRt2yVL4KZ0W3LWL2wybvL89NDb64fizMe42_vu=+7w@mail.gmail.com>
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

On Fri, Jul 19, 2024 at 10:07=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Thu, Jul 18, 2024 at 7:59=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Thu, Jul 18, 2024 at 7:56=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Thu, Jul 18, 2024 at 07:45:57AM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Wed, Jul 17, 2024 at 11:19=E2=80=AFPM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> > > > >
> > > > > On 18/07/2024 02:21, Doug Anderson wrote:
> > > > > > Conor (and/or) Krzysztof and Rob,
> > > > > >
> > > > > > On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@ker=
nel.org> wrote:
> > > > > >>
> > > > > >> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrot=
e:
> > > > > >>> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has =
backlight
> > > > > >>> control over the DP AUX channel. While it works almost correc=
tly with the
> > > > > >>> generic "edp-panel" compatible, the backlight needs special h=
andling to
> > > > > >>> work correctly. It is similar to the existing ATNA33XC20 pane=
l, just with
> > > > > >>> a larger resolution and size.
> > > > > >>>
> > > > > >>> Add a new "samsung,atna45af01" compatible to describe this pa=
nel in the DT.
> > > > > >>> Use the existing "samsung,atna33xc20" as fallback compatible =
since existing
> > > > > >>> drivers should work as-is, given that resolution and size are=
 discoverable
> > > > > >>> through the eDP link.
> > > > > >>>
> > > > > >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > > > >>
> > > > > >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > >
> > > > > > Can you comment on whether you would consider this bindings a "=
Fix"
> > > > > > since it's a dependency for later patches in this series (which=
 are
> > > > > > "Fix"es) to pass dtbs_check? See:
> > > > > >
> > > > > > https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@=
linaro.org
> > > > >
> > > > > The patch itself is not a fix, for sure, but it might be a depend=
ency of
> > > > > a fix (which you wrote above), thus could be pulled to stable as =
a
> > > > > dependency.
> > > > >
> > > > > I do not care about dtbs_check warnings in stable kernels, mostly
> > > > > because dtbs_check warnings depend heavily on dtschema and dtsche=
ma
> > > > > follows mainline kernel. Basically if you had warnings-free v6.8 =
but try
> > > > > to run dtbs_check now with latest dtschema, your results will dif=
fer.
> > > > >
> > > > > At some point in the future, I could imagine "no new dtbs_check w=
arnings
> > > > > in stable kernels" requirement or at least preference, but so far=
 I
> > > > > don't think there is any benefit.
> > > >
> > > > In this case it's not about whether it makes it to the stable kerne=
l
> > > > but about which main kernel it goes through.
> > > >
> > > > If we land the bindings in drm-misc-next right now then it'll be a
> > > > long time before it makes it into Linus's tree because of the way t=
hat
> > > > drm-misc-next merges. It will make it to Linus's tree at 6.12. You =
can
> > > > see the drm-misc merging strategy at:
> > > >
> > > > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
> > > >
> > > > If we land the dts change (a fix) through the Qualcomm tree as a fi=
x
> > > > then it should target 6.11.
> > > >
> > > > This means that the 6.11 tree will have a dtbs_check error because =
it
> > > > has the dts change (a fix) but not the bindings change (not a fix).
> > > >
> > > > One way to resolve this would be to treat this bindings as a "fix" =
and
> > > > land it through "drm-misc-fixes". That would make the bindings and
> > > > device tree change meet up in Linux 6.11.
> > > >
> > > > Did I get that all correct?
> > >
> > > Is not not fairly established that a dependency for a fix can go onto=
 a
> > > fixes branch even if it is not a fix in and of itself?
> >
> > That would certainly be my take on it, but DT folks confirmation was
> > requested by Neil in:
> >
> > https://lore.kernel.org/all/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro=
.org/
>
> FWIW, I'd rather not let this stagnate too long. I'm fairly confident
> in my assertion that this should go into drm-misc-fixes. I'll give it
> until Monday and then I'm just going to land this bindings change in
> drm-misc-fixes. Shout soon if you feel strongly that I shouldn't do
> this. If someone wants to flame me after the fact then so be it.

Landed in drm-misc-next fixes as per the flow chart [1] since the
"samsung,atna33xc20.yaml" split from "panel-simple.yaml" is in
mainline linux but not in any "rc" candidates yet.

[1/4] dt-bindings: display: panel: samsung,atna33xc20: Document ATNA45AF01
      commit: b6f7d984ebf826069d3dc6fa187b4d1cfb90f965

[1] https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.h=
tml#where-do-i-apply-my-patch

-Doug

