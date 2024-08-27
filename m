Return-Path: <linux-arm-msm+bounces-29645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 909299612E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 17:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 430E5280F37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 15:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5091BD00D;
	Tue, 27 Aug 2024 15:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qz3BJ7pC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911FD517
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 15:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772993; cv=none; b=mIcdlc0Yn979Bcx2HnCXtaD4yUHMAdyYvEnsfdkC2sTgQTqopgG04i2ClapbB0tQdE1QNG9YT6rapxuy1u+rzSJPZS3qFHaNpcLOADhTXoNZ0o1/suf2dc8kH4SyOt1pyuqrgAHZk48/6nRwlNvxcJokoWpz0rZ1r2MJtb7UuuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772993; c=relaxed/simple;
	bh=xKBxjuzhKzHAYCEFbj9br0eAFH6a2cGlC6D9UNQ53ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhoBQVORSvd7gGQX8kte2IIRyzCS7eYITUq5oDOKCw2yf4GDbi6sDjm875XnsaLsiTM9jnYd95cM7NqVJtya/2pPSxjIontJu8p0EAug54I87jgIU3WU3s7D8GBPvc8DsHdWBw/15ew7oCnmWKGSn0YqthidnXLtM26jFUIVEgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qz3BJ7pC; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a1dcba8142so465277285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 08:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724772990; x=1725377790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP4KpFI1wEFgqr9Fa1v3gv1lXKIWQkFSNhyHX5LJ2uU=;
        b=Qz3BJ7pCA0sntJnHQLeZta96OqzF3XII5SgW00ilnCKSs4e98iAKkaWhvh7WflHDIO
         VWGQjxqeTaB3guO9h9lZrLFpN1WdgF2BLkBG4R6eVwnd18Rt4MTzpcoESyzwCMFCyW7/
         EhtLEvT39Dbhf7+KdIBWGsVJC4PbbCRHxKZiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772990; x=1725377790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zP4KpFI1wEFgqr9Fa1v3gv1lXKIWQkFSNhyHX5LJ2uU=;
        b=j/eo9bWdKZwjnVc9P1vXp8cw48qUmqmFJs3o4qHZQQaaZaAMSWdUIydBsVcJ3+z/Bd
         Q4Y2y5UfRoD2IrflhKf4BUj6Dh2I4QUw6TezppvqTxR7o0jXtoY6UzZ8tjU25N5stalN
         +mmjCjoAcsbZKPb4OAkGJZsDj99q41JG6BEi9X3gpE1l67lxydXbRMl2dyXnqpMrRnMT
         MAqqhoUn8+wXueWaD+UMB6yFW0ObyRokRttI+B2H5SYiNQ275nGBkiylkltfIAy84ltM
         pZConsdGKgBeuSgiyyTPqNU5lflFfCTqAG//OxFUL8CZ8LfPu1sk+Z9laLu4m83QaFnm
         WE0A==
X-Forwarded-Encrypted: i=1; AJvYcCX/bmfRWTqadcFpVKlxxeHuLUO8uiEgPIcKsWUsVmemY9W/SIcBOkpBAujGPpyxYWJVkBMhaPxoQGQRhotU@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWDo+YGalCBF5ibwXF6QlviDHkQgSF8Cpq24wVtoLYMEBTG8/
	4CILsJYSOGYPbRmBJT2oWxFax7pxmZYyDXXe5P+Jg6VmK4JlLYPPv1swdkDeLdNMr+gS02ubjlQ
	=
X-Google-Smtp-Source: AGHT+IHcW9i7Upz2+iYZqyxphgnP5v0Ygm+xRjkNyVvjkivc8bzQ/pI9/WNlt35TPelSwlG9tdhNDw==
X-Received: by 2002:a05:620a:1a92:b0:79e:f878:7ffb with SMTP id af79cd13be357-7a7e4c4bcfdmr662173985a.9.1724772990175;
        Tue, 27 Aug 2024 08:36:30 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a67f3fca30sm561028685a.111.2024.08.27.08.36.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 08:36:29 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6bf7707dbb6so43509716d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 08:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHAlNbQnHu8SEyO0kO2wakefLOtq86BbR2ihPf5RVcJZ88pOu6QDVwOOOMlqsNgv27fvlThWT6A5CFunre@vger.kernel.org
X-Received: by 2002:a05:6214:258c:b0:6b5:2be1:cd6e with SMTP id
 6a1803df08f44-6c32aea3e83mr62311556d6.4.1724772988561; Tue, 27 Aug 2024
 08:36:28 -0700 (PDT)
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
 <CAD=FV=XfvD1OniNBrCrA8C6XjOB15fye8EdnniNmgpu4DnpH6w@mail.gmail.com>
In-Reply-To: <CAD=FV=XfvD1OniNBrCrA8C6XjOB15fye8EdnniNmgpu4DnpH6w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 Aug 2024 08:36:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vp1Trv2JeFtqk2=Zhi0B7io5w402GkG_UhYm2q34q8dw@mail.gmail.com>
Message-ID: <CAD=FV=Vp1Trv2JeFtqk2=Zhi0B7io5w402GkG_UhYm2q34q8dw@mail.gmail.com>
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

On Mon, Jul 22, 2024 at 8:49=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Jul 15, 2024 at 6:51=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Mon, Jul 15, 2024 at 6:02=E2=80=AFAM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> > >
> > > On 15/07/2024 14:54, Stephan Gerhold wrote:
> > > > On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
> > > >> On 15/07/2024 14:15, Stephan Gerhold wrote:
> > > >>> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
> > > >>>
> > > >>> The panel should be handled through the samsung-atna33xc20 driver=
 for
> > > >>> correct power up timings. Otherwise the backlight does not work c=
orrectly.
> > > >>>
> > > >>> We have existing users of this panel through the generic "edp-pan=
el"
> > > >>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works=
 only
> > > >>> partially in that configuration: It works after boot but once the=
 screen
> > > >>> gets disabled it does not turn on again until after reboot. It be=
haves the
> > > >>> same way with the default "conservative" timings, so we might as =
well drop
> > > >>> the configuration from the panel-edp driver. That way, users with=
 old DTBs
> > > >>> will get a warning and can move to the new driver.
> > > >>>
> > > >>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > >>> ---
> > > >>>    drivers/gpu/drm/panel/panel-edp.c | 2 --
> > > >>>    1 file changed, 2 deletions(-)
> > > >>>
> > > >>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/=
panel/panel-edp.c
> > > >>> index 3a574a9b46e7..d2d682385e89 100644
> > > >>> --- a/drivers/gpu/drm/panel/panel-edp.c
> > > >>> +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > >>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_pan=
els[] =3D {
> > > >>>     EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d2=
00, "Unknown"),
> > > >>>     EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d2=
00, "Unknown"),
> > > >>> -   EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "=
ATNA45AF01"),
> > > >>> -
> > > >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "L=
Q140M1JW48"),
> > > >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ=
140M1JW46"),
> > > >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "L=
Q140T1JH01"),
> > > >>>
> > > >>
> > > >> How will we handle current/old crd DT with new kernels ?
> > > >>
> > > >
> > > > I think this is answered in the commit message:
> > > >
> > > >>> We have existing users of this panel through the generic "edp-pan=
el"
> > > >>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works=
 only
> > > >>> partially in that configuration: It works after boot but once the=
 screen
> > > >>> gets disabled it does not turn on again until after reboot. It be=
haves the
> > > >>> same way with the default "conservative" timings, so we might as =
well drop
> > > >>> the configuration from the panel-edp driver. That way, users with=
 old DTBs
> > > >>> will get a warning and can move to the new driver.
> > > >
> > > > Basically with the entry removed, the panel-edp driver will fallbac=
k to
> > > > default "conservative" timings when using old DTBs. There will be a
> > > > warning in dmesg, but otherwise the panel will somewhat work just a=
s
> > > > before. I think this is a good way to remind users to upgrade.
> > >
> > > I consider this as a regression
> > >
> > > >
> > > >> Same question for patch 3, thie serie introduces a bindings that w=
on't be valid
> > > >> if we backport patch 3. I don't think patch should be backported, =
and this patch
> > > >> should be dropped.
> > > >
> > > > There would be a dtbs_check warning, yeah. Functionally, it would w=
ork
> > > > just fine. Is that reason enough to keep display partially broken f=
or
> > > > 6.11? We could also apply the minor binding change for 6.11 if need=
ed.
> > >
> > > I don't know how to answer this, I'll let the DT maintainer comment t=
his.
> > >
> > > The problem is I do not think we can pass the whole patchset as fixes
> > > for v6.11, patches 2 & 3 could, patches 1 & 4 definitely can't.
> > >
> > > Neil
> >
> > IMO: patch #3 (dts) and #4 (CONFIG) go through the Qualcomm tree
> > whenever those folks agree to it. If we're worried about the
> > dtbs_check breakage I personally wouldn't mind "Ack"ing patch #1 to go
> > through the Qualcomm tree as long as it made it into 6.11-rc1. I have
> > a hunch that there are going to be more Samsung OLED panels in the
> > future that will need to touch the same file, but if the change is in
> > -rc1 it should make it back into drm-misc quickly, right?
> >
> > Personally I think patch #2 could go in anytime since, as people have
> > said, things are pretty broken today and the worst that happens is
> > that someone gets an extra warning. That would be my preference. That
> > being said, we could also snooze that patch for a month or two and
> > land it later. There's no real hurry.
>
> For now I'm going to snooze this patch for a month just to avoid any
> controversy. I'll plan to apply it (to drm-misc-next) when I see the
> device tree patch land. Since the device tree patch should land as a
> fix that should keep things landing in the correct order. ...and, as
> per above, the worst case is that if someone has an old DTS and a new
> kernel then a panel that was already not working well will print a fat
> warning and startup a bit slower.
>
> If somehow I mess up and forget about this patch, feel free to send me
> a poke when the device tree patch is landed.

More than a month has passed now. One last warning before I apply this
revert in a few more days.

-Doug

