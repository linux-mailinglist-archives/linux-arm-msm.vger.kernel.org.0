Return-Path: <linux-arm-msm+bounces-26570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3682A934F86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 17:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B5B9B23E90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 15:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141AF13FD8C;
	Thu, 18 Jul 2024 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IyNVlFh6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72114372C
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 14:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721314790; cv=none; b=pXIVOS/q0lNGVyNDdQ3wBb485j1ZZtfvjqRNJTsfJulwjh//glnhfXpRX57Le67IqeLT0i7zlUG/CpGmA601EjwWzns9H3Be8uZjB9bBjQ5IvHkTvoP+jOtyXyL1OQRR2FO4/VNVhrI/Upb2F7cWqphshycMys9KoqCZZZUbLoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721314790; c=relaxed/simple;
	bh=e3SitwwNRxOezNxrVf7ltI49ObqvXDJq0gyT1yrldMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VA6kZemgDhE+SkyGUXuuIrdK2CKM4i+jB4MGxAtwK1pBPKUTivnos6bFDiI9Y0wJAxeLqj/+UO4CzzNJIqS+cIEzzI9BwdNddHUObFayk8iz1bCTiWsPB75wO78Gm8Jj1JvjQ5gBno9UKWItRvYQWfHvBacApcTnprXjxh/spM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IyNVlFh6; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6b5f128b199so4871056d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721314786; x=1721919586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3SitwwNRxOezNxrVf7ltI49ObqvXDJq0gyT1yrldMw=;
        b=IyNVlFh6WVlm4CJANTeN4QYuMVSJotgPnddGLfyzIhovgU8E2MVhcaYcbsSrr/Yes3
         H8k71X7olXOTCVrrVUgI/vQRc3enP50rktjLmdi0sX7I2RCUUihzKKdfHAuvjgSh3oL5
         dwBBASADhkLXEjOKKCEmhSdGh29QLzoRWMut0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721314786; x=1721919586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3SitwwNRxOezNxrVf7ltI49ObqvXDJq0gyT1yrldMw=;
        b=Oo09rgXlKjJCOJBLQzRtElPDnrEVSntxu8ovG5k7y1M95XRTiDwyP7/okGrKP2235S
         MS6hlDD7a+q2m1PGivznzvAhFSIb5pu4WFogo7xGXJq20lSkZQknsF3I6TKPXa9ov3rz
         Glyhxvm1LR18z//8c28FF7obWc5tHHELXbgoZbPUN7beIaLFx1VMlElG2HIw71P9nGzx
         Q8rsYzIG/WMrKLx2fSmxXlh+ODKqHZ8OQq6uKYVTYKg/y7hGzof96KbRQubTHltrG7ir
         BBnc3xisO4WtvNRd2ZBwx27IQXIOmyDLee38tjBeyesO6sFrJ7NlYFor19lX9oCSn/HN
         ksEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0PYEObyku/hkkynjilnmDj2b+CiKKpsio10SAj1rCCpWHW6U98JBD9ULaadSqveia0N7eVNilyw7ztiSwdjaOQrFiBj9eLkZzMQfd9A==
X-Gm-Message-State: AOJu0YycLZlPTha7sdHvjzUUQju8ypD/Za7noJ+SxHgQw3sIVF6BuhA3
	nvsSOUiFoz01tsk1b17m5OQIqQ++d2yOTevadjre/SWIgZTw37DjK+8EzBKdELV9tUHCv1BUDFY
	=
X-Google-Smtp-Source: AGHT+IH+XDtlmcDDtCKndKC+57ec++QLhrRuzZGI69KpjLocv4hH8A5joTY9bhOj7rQteOVoqaj30g==
X-Received: by 2002:a05:6214:2b0f:b0:6b4:fbec:952f with SMTP id 6a1803df08f44-6b78cacf392mr66390286d6.25.1721314785554;
        Thu, 18 Jul 2024 07:59:45 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b79c4cfdfbsm8882176d6.17.2024.07.18.07.59.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 07:59:44 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-44a8b140a1bso111741cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 07:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbu/fc6Zhq7JLdM2Xd103igontEROTq36+aWWfu3sX8UoLvdPGnjUZNxOVx6GDNub9WJbM4xKIBj77PdQiHK51j4V6u0VBO0nIS90R1g==
X-Received: by 2002:a05:622a:1f88:b0:447:e423:a463 with SMTP id
 d75a77b69052e-44f969881c0mr1553511cf.3.1721314784304; Thu, 18 Jul 2024
 07:59:44 -0700 (PDT)
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
 <20240718-frightful-naturist-a049ea7c0548@spud>
In-Reply-To: <20240718-frightful-naturist-a049ea7c0548@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jul 2024 07:59:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VaGXMf6Srix6v=Me35BUN4B6ZHwebycka4Dbavqa5Vbw@mail.gmail.com>
Message-ID: <CAD=FV=VaGXMf6Srix6v=Me35BUN4B6ZHwebycka4Dbavqa5Vbw@mail.gmail.com>
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

On Thu, Jul 18, 2024 at 7:56=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Jul 18, 2024 at 07:45:57AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Jul 17, 2024 at 11:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >
> > > On 18/07/2024 02:21, Doug Anderson wrote:
> > > > Conor (and/or) Krzysztof and Rob,
> > > >
> > > > On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@kernel.=
org> wrote:
> > > >>
> > > >> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> > > >>> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has back=
light
> > > >>> control over the DP AUX channel. While it works almost correctly =
with the
> > > >>> generic "edp-panel" compatible, the backlight needs special handl=
ing to
> > > >>> work correctly. It is similar to the existing ATNA33XC20 panel, j=
ust with
> > > >>> a larger resolution and size.
> > > >>>
> > > >>> Add a new "samsung,atna45af01" compatible to describe this panel =
in the DT.
> > > >>> Use the existing "samsung,atna33xc20" as fallback compatible sinc=
e existing
> > > >>> drivers should work as-is, given that resolution and size are dis=
coverable
> > > >>> through the eDP link.
> > > >>>
> > > >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > >>
> > > >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > Can you comment on whether you would consider this bindings a "Fix"
> > > > since it's a dependency for later patches in this series (which are
> > > > "Fix"es) to pass dtbs_check? See:
> > > >
> > > > https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@lina=
ro.org
> > >
> > > The patch itself is not a fix, for sure, but it might be a dependency=
 of
> > > a fix (which you wrote above), thus could be pulled to stable as a
> > > dependency.
> > >
> > > I do not care about dtbs_check warnings in stable kernels, mostly
> > > because dtbs_check warnings depend heavily on dtschema and dtschema
> > > follows mainline kernel. Basically if you had warnings-free v6.8 but =
try
> > > to run dtbs_check now with latest dtschema, your results will differ.
> > >
> > > At some point in the future, I could imagine "no new dtbs_check warni=
ngs
> > > in stable kernels" requirement or at least preference, but so far I
> > > don't think there is any benefit.
> >
> > In this case it's not about whether it makes it to the stable kernel
> > but about which main kernel it goes through.
> >
> > If we land the bindings in drm-misc-next right now then it'll be a
> > long time before it makes it into Linus's tree because of the way that
> > drm-misc-next merges. It will make it to Linus's tree at 6.12. You can
> > see the drm-misc merging strategy at:
> >
> > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
> >
> > If we land the dts change (a fix) through the Qualcomm tree as a fix
> > then it should target 6.11.
> >
> > This means that the 6.11 tree will have a dtbs_check error because it
> > has the dts change (a fix) but not the bindings change (not a fix).
> >
> > One way to resolve this would be to treat this bindings as a "fix" and
> > land it through "drm-misc-fixes". That would make the bindings and
> > device tree change meet up in Linux 6.11.
> >
> > Did I get that all correct?
>
> Is not not fairly established that a dependency for a fix can go onto a
> fixes branch even if it is not a fix in and of itself?

That would certainly be my take on it, but DT folks confirmation was
requested by Neil in:

https://lore.kernel.org/all/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro.org=
/

-Doug

