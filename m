Return-Path: <linux-arm-msm+bounces-26815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 978F993920D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 17:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1048E1F2246F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 15:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6838F16EB51;
	Mon, 22 Jul 2024 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bo6qTyPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68B416D4FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721663380; cv=none; b=rO0Z3uILd2PUuFUOq/+5nQWH+kHTNo+taQEJoWycAetnXk17l8lyOoTF4awNs1s+WYhsltvagl8vJYLP2l91H6PGdexo/2THsE8bJSvmJ5A2Ibvq17G7qxBud3B4aY39tDr0oi2Ip6N+UNgmZjrPYFzsP0UMkm5/rg2qv9M9uec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721663380; c=relaxed/simple;
	bh=FesRx67elQmnqBSPlEkVYKJ2YOBEJnv2sFoRJSW3AlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpwUEdweoNYuQxX70pwe+4GIff/MpSDRmMt6//yIhVhH//e3mdIRpRGN6P91ZeqapF/EJRPFpZ+Y3pIH1TWoBVOU/4SSYSbxnkGHaDPzn6qGFX26YpgQpXl+u6RgggGKMYZOSQNr7uX5PwUNE+YVQDrwjZExOAlvAmNJvWN/y7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bo6qTyPn; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-704473c0698so1807976a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 08:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721663375; x=1722268175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4M370blDs66N01Bpr2CSSKX57GkmsVaqanqtms3bvVw=;
        b=bo6qTyPneLwQDaO/6SirDrWEwp2yLHwIPTb3oNbWXCCtjiFaIG4jR4lfMaiPxjYuaE
         twKYc0EmnZ/4NaidXx+5/8241wmy2Cze/S9JECMGehydMjzH7KcA6bo8IDHE5LHg3pIT
         kvh57CreFUUEtQ2349nHMFdr0H9zM/sftO1VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721663375; x=1722268175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4M370blDs66N01Bpr2CSSKX57GkmsVaqanqtms3bvVw=;
        b=sLjZX+liJzZiB+L+QRsx57vhEuYUi2AAwuxIgvjrpjJGyVbNkHvm4yIZhuvsTg8ZWd
         LsRQYhZsxizoyfVj7CFY/TABzi29mJaJTI666t/vzMXKcsXrmo7n8CGAPBH2x0NH6ek+
         hHihN1O+IWCjBRPtc5CzB6DYQ1tNPsaEVA0IWdGl1HvFUyZJ2qO3IUtVzL/oyf4nZ8mA
         IEpsNWDe24x94ggiH0zCPWj29G43Pcd2b32+unB6uKQ1jFR2HCYnMek8c90jhnpCcvxz
         +UN4pqe8v6E9LpA4gLHja9K0G6BzD/Ji5uNk64THmtS3Gt3JD7sczYNuD/d9yaIkoXa1
         +n/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrdrwfEoj9EysdoS/fRNFgLdD9bgVLymfeHezofixaCxFc75cpfGx6ND6SMHcSEkJEN7ZdzyNJPpt72GqEjUN21EBtMRQ3P9Gl8Av/FQ==
X-Gm-Message-State: AOJu0Yy7ITtjgQEu95DbTrvxTo9mylk7UWbxl4I4fOwrqudeW+3IbZaH
	gjzCuQ9792C59L6OmD2ZYERYnk3jKroFt/iVw03Qu9MeP4w0mTgaJjdiCQyyDTyJKxcvBs7Qodg
	=
X-Google-Smtp-Source: AGHT+IElKljRzFmghZ63kLu6WL60OpjG4uuucR/3VsWZ9hFMPwNdnQrmBoPwKsK0PtjA49DPxr5RuQ==
X-Received: by 2002:a05:6830:6381:b0:707:903a:cb0d with SMTP id 46e09a7af769-7090090689bmr6274897a34.13.1721663375272;
        Mon, 22 Jul 2024 08:49:35 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7acae194dsm36417466d6.107.2024.07.22.08.49.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 08:49:34 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-44f9d7cb5c5so735421cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 08:49:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWl2rUrUGCekBQCUhsfagAWTxuJQ5awT7xrc84dWS94IhPNFPB3EHUodq/k9Y9ompQmJEgbT5YqEO20XC8oduIdu+14f9gEDi+Qn3KhBA==
X-Received: by 2002:a05:622a:5b8e:b0:447:e3e3:77c1 with SMTP id
 d75a77b69052e-44faaa81ca5mr4992061cf.29.1721663373472; Mon, 22 Jul 2024
 08:49:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
 <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org> <ZpUcI3KkIa58zC55@linaro.org>
 <d1603248-afe8-4594-9e2e-81ba208dff00@linaro.org> <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
In-Reply-To: <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2024 08:49:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfvD1OniNBrCrA8C6XjOB15fye8EdnniNmgpu4DnpH6w@mail.gmail.com>
Message-ID: <CAD=FV=XfvD1OniNBrCrA8C6XjOB15fye8EdnniNmgpu4DnpH6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Revert "drm/panel-edp: Add SDC ATNA45AF01"
To: neil.armstrong@linaro.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 15, 2024 at 6:51=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Jul 15, 2024 at 6:02=E2=80=AFAM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> >
> > On 15/07/2024 14:54, Stephan Gerhold wrote:
> > > On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
> > >> On 15/07/2024 14:15, Stephan Gerhold wrote:
> > >>> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
> > >>>
> > >>> The panel should be handled through the samsung-atna33xc20 driver f=
or
> > >>> correct power up timings. Otherwise the backlight does not work cor=
rectly.
> > >>>
> > >>> We have existing users of this panel through the generic "edp-panel=
"
> > >>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works o=
nly
> > >>> partially in that configuration: It works after boot but once the s=
creen
> > >>> gets disabled it does not turn on again until after reboot. It beha=
ves the
> > >>> same way with the default "conservative" timings, so we might as we=
ll drop
> > >>> the configuration from the panel-edp driver. That way, users with o=
ld DTBs
> > >>> will get a warning and can move to the new driver.
> > >>>
> > >>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > >>> ---
> > >>>    drivers/gpu/drm/panel/panel-edp.c | 2 --
> > >>>    1 file changed, 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pa=
nel/panel-edp.c
> > >>> index 3a574a9b46e7..d2d682385e89 100644
> > >>> --- a/drivers/gpu/drm/panel/panel-edp.c
> > >>> +++ b/drivers/gpu/drm/panel/panel-edp.c
> > >>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panel=
s[] =3D {
> > >>>     EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200=
, "Unknown"),
> > >>>     EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200=
, "Unknown"),
> > >>> -   EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "AT=
NA45AF01"),
> > >>> -
> > >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ1=
40M1JW48"),
> > >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ14=
0M1JW46"),
> > >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ1=
40T1JH01"),
> > >>>
> > >>
> > >> How will we handle current/old crd DT with new kernels ?
> > >>
> > >
> > > I think this is answered in the commit message:
> > >
> > >>> We have existing users of this panel through the generic "edp-panel=
"
> > >>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works o=
nly
> > >>> partially in that configuration: It works after boot but once the s=
creen
> > >>> gets disabled it does not turn on again until after reboot. It beha=
ves the
> > >>> same way with the default "conservative" timings, so we might as we=
ll drop
> > >>> the configuration from the panel-edp driver. That way, users with o=
ld DTBs
> > >>> will get a warning and can move to the new driver.
> > >
> > > Basically with the entry removed, the panel-edp driver will fallback =
to
> > > default "conservative" timings when using old DTBs. There will be a
> > > warning in dmesg, but otherwise the panel will somewhat work just as
> > > before. I think this is a good way to remind users to upgrade.
> >
> > I consider this as a regression
> >
> > >
> > >> Same question for patch 3, thie serie introduces a bindings that won=
't be valid
> > >> if we backport patch 3. I don't think patch should be backported, an=
d this patch
> > >> should be dropped.
> > >
> > > There would be a dtbs_check warning, yeah. Functionally, it would wor=
k
> > > just fine. Is that reason enough to keep display partially broken for
> > > 6.11? We could also apply the minor binding change for 6.11 if needed=
.
> >
> > I don't know how to answer this, I'll let the DT maintainer comment thi=
s.
> >
> > The problem is I do not think we can pass the whole patchset as fixes
> > for v6.11, patches 2 & 3 could, patches 1 & 4 definitely can't.
> >
> > Neil
>
> IMO: patch #3 (dts) and #4 (CONFIG) go through the Qualcomm tree
> whenever those folks agree to it. If we're worried about the
> dtbs_check breakage I personally wouldn't mind "Ack"ing patch #1 to go
> through the Qualcomm tree as long as it made it into 6.11-rc1. I have
> a hunch that there are going to be more Samsung OLED panels in the
> future that will need to touch the same file, but if the change is in
> -rc1 it should make it back into drm-misc quickly, right?
>
> Personally I think patch #2 could go in anytime since, as people have
> said, things are pretty broken today and the worst that happens is
> that someone gets an extra warning. That would be my preference. That
> being said, we could also snooze that patch for a month or two and
> land it later. There's no real hurry.

For now I'm going to snooze this patch for a month just to avoid any
controversy. I'll plan to apply it (to drm-misc-next) when I see the
device tree patch land. Since the device tree patch should land as a
fix that should keep things landing in the correct order. ...and, as
per above, the worst case is that if someone has an old DTS and a new
kernel then a panel that was already not working well will print a fat
warning and startup a bit slower.

If somehow I mess up and forget about this patch, feel free to send me
a poke when the device tree patch is landed.

-Doug

