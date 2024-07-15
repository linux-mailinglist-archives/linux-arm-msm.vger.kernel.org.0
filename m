Return-Path: <linux-arm-msm+bounces-26195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A805993170A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA6041C20DE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF51518EFE4;
	Mon, 15 Jul 2024 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X6hvfRK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4A819148A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721054459; cv=none; b=C2JqnMca4+7T86zjGUzpOf3RDvMlyR3yFFfrtLXROmaTUMgqSeGdcj9S9qLOnjiDG/vJypc0FN+DcbjeV/dH756j29Qj2vdeCFu+Q+DCZF9fzc5vIfC80XJ96d7hMid5DgfhOLn8iqb6rPClUSNl5HpkOKPPJbQqDC5NwC4Cc+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721054459; c=relaxed/simple;
	bh=jukV9cHY7vycRjRD7Z1lBNTibLKLAZ8Wf8W6USecTI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m32CXtR3sVYnylQL1GTWS3wXfVuzRn4QMBPANn/Bkal117CVMxbD41XMIuU9eganN7HeBI3Bkz36qWznwgK+XUygFoxX6+pHADNVhk2lyQxl+vjtYQn2DfpWb+oLtxB1xbxvPRpTDCEO0ZwJKxvk0jnz8GZhb7P8b+VStfRFJuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X6hvfRK4; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6b613921035so27173416d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721054454; x=1721659254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVftpq/uBCl88gfSx31fkg5itYrixVVA/rFufzNQC5I=;
        b=X6hvfRK478AJVfJV+Y6Sn+pNpr6wQWdxEMRco7BxCU7/zXZrYDEOWYtY0Pf9gjuZqh
         9xxT7EnvyNJO1kK9zCg4NuFIvARyoCM5hjcWOXJyJIkM2Wosgl7kHWVB7MllJrgMpRwx
         JrYHXMV9CmEMQXSG+mM8RD5xzVV6X8WuPp12w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721054454; x=1721659254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVftpq/uBCl88gfSx31fkg5itYrixVVA/rFufzNQC5I=;
        b=RCDTLCSlnKsie+lh4zJgWywQwatkkWQWxZYim0Qpv8YSPsl0RUYhG5GeWtYHGwlmqs
         itdNKis0LBu8YJ+qgB7ULWcUVvCLGDPiQt0OAjydVSQDMtvcVpQjDLz2cQ3XajhqZnuI
         rcdpVbo5hHflGu9Ta0pkLthSHUwn9s8xTa4WAnE5FGzv3ba0GwizqmhUcmnLb1yerwkB
         TWQTy+lQY/+rPvfasV0y3P1wr1PKeyAvSHWMwLqd5HowJHSNjrnsKZ4jaNUOpZUi9B0p
         1dDhhKbKub5Hz/+/cO2dxrVBWvez0xtRQZXCJACJZeTh//ZmwFe3CoGnfP4aY5Hd/Llc
         Nl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlNscrI+5Ac440pers3nRR1HmgibRqB/0sdK9B5TGUOKFqK4ib+qIuorN9PBesF2Rr0dgTf1qxBEDkTj5iwAkIDKF3YhTeFEacjJZXXQ==
X-Gm-Message-State: AOJu0YweompTy1lV8iAEH18jk4WXKUPoZJny2MhgIOh0dUNbhoJxmc8S
	xUrTm91ieNbnyLCGew7KscWYN+DRrGip/X/vfUK3YF9reU9/PCl6ypRYH6CzJ9kZP0ZPCebbMg0
	=
X-Google-Smtp-Source: AGHT+IHJYLAL1XjMk4hdcqjSGaW2LZcAWzFZwFtccNmDZOK3yED8IKlQc7EN/7yt6jyB2EftFaqaKw==
X-Received: by 2002:a05:6214:2422:b0:6b7:427a:dc38 with SMTP id 6a1803df08f44-6b7427aeac5mr155125976d6.20.1721054454317;
        Mon, 15 Jul 2024 07:40:54 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b76197da0csm21946116d6.42.2024.07.15.07.40.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 07:40:53 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-44e534a1fbeso484481cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 07:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWamThZMlr3bOCGE2k+hTKC47V7WdzOWebAMYBTILP96QJ2QNuRUyn4575HodMUAQHO0Oieky3mGsMvnMsSGFgpzxz+p9qiXQMLsVPMyg==
X-Received: by 2002:a05:622a:418e:b0:447:dd54:2cd4 with SMTP id
 d75a77b69052e-44f5a2f8968mr4195591cf.22.1721054452519; Mon, 15 Jul 2024
 07:40:52 -0700 (PDT)
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
 <6f8f902b-8192-492a-8354-18590c6c2c06@linaro.org>
In-Reply-To: <6f8f902b-8192-492a-8354-18590c6c2c06@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Jul 2024 07:40:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ugf-SfJYHzEZ0+ekm4zeXpgUi4XzJTuzuwJN1hjns1CQ@mail.gmail.com>
Message-ID: <CAD=FV=Ugf-SfJYHzEZ0+ekm4zeXpgUi4XzJTuzuwJN1hjns1CQ@mail.gmail.com>
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

On Mon, Jul 15, 2024 at 6:57=E2=80=AFAM <neil.armstrong@linaro.org> wrote:
>
> On 15/07/2024 15:51, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Jul 15, 2024 at 6:02=E2=80=AFAM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> On 15/07/2024 14:54, Stephan Gerhold wrote:
> >>> On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
> >>>> On 15/07/2024 14:15, Stephan Gerhold wrote:
> >>>>> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
> >>>>>
> >>>>> The panel should be handled through the samsung-atna33xc20 driver f=
or
> >>>>> correct power up timings. Otherwise the backlight does not work cor=
rectly.
> >>>>>
> >>>>> We have existing users of this panel through the generic "edp-panel=
"
> >>>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works o=
nly
> >>>>> partially in that configuration: It works after boot but once the s=
creen
> >>>>> gets disabled it does not turn on again until after reboot. It beha=
ves the
> >>>>> same way with the default "conservative" timings, so we might as we=
ll drop
> >>>>> the configuration from the panel-edp driver. That way, users with o=
ld DTBs
> >>>>> will get a warning and can move to the new driver.
> >>>>>
> >>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >>>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> >>>>> ---
> >>>>>     drivers/gpu/drm/panel/panel-edp.c | 2 --
> >>>>>     1 file changed, 2 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pa=
nel/panel-edp.c
> >>>>> index 3a574a9b46e7..d2d682385e89 100644
> >>>>> --- a/drivers/gpu/drm/panel/panel-edp.c
> >>>>> +++ b/drivers/gpu/drm/panel/panel-edp.c
> >>>>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panel=
s[] =3D {
> >>>>>      EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d20=
0, "Unknown"),
> >>>>>      EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d20=
0, "Unknown"),
> >>>>> -   EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "AT=
NA45AF01"),
> >>>>> -
> >>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ=
140M1JW48"),
> >>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ1=
40M1JW46"),
> >>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ=
140T1JH01"),
> >>>>>
> >>>>
> >>>> How will we handle current/old crd DT with new kernels ?
> >>>>
> >>>
> >>> I think this is answered in the commit message:
> >>>
> >>>>> We have existing users of this panel through the generic "edp-panel=
"
> >>>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works o=
nly
> >>>>> partially in that configuration: It works after boot but once the s=
creen
> >>>>> gets disabled it does not turn on again until after reboot. It beha=
ves the
> >>>>> same way with the default "conservative" timings, so we might as we=
ll drop
> >>>>> the configuration from the panel-edp driver. That way, users with o=
ld DTBs
> >>>>> will get a warning and can move to the new driver.
> >>>
> >>> Basically with the entry removed, the panel-edp driver will fallback =
to
> >>> default "conservative" timings when using old DTBs. There will be a
> >>> warning in dmesg, but otherwise the panel will somewhat work just as
> >>> before. I think this is a good way to remind users to upgrade.
> >>
> >> I consider this as a regression
> >>
> >>>
> >>>> Same question for patch 3, thie serie introduces a bindings that won=
't be valid
> >>>> if we backport patch 3. I don't think patch should be backported, an=
d this patch
> >>>> should be dropped.
> >>>
> >>> There would be a dtbs_check warning, yeah. Functionally, it would wor=
k
> >>> just fine. Is that reason enough to keep display partially broken for
> >>> 6.11? We could also apply the minor binding change for 6.11 if needed=
.
> >>
> >> I don't know how to answer this, I'll let the DT maintainer comment th=
is.
> >>
> >> The problem is I do not think we can pass the whole patchset as fixes
> >> for v6.11, patches 2 & 3 could, patches 1 & 4 definitely can't.
> >>
> >> Neil
> >
> > IMO: patch #3 (dts) and #4 (CONFIG) go through the Qualcomm tree
> > whenever those folks agree to it. If we're worried about the
> > dtbs_check breakage I personally wouldn't mind "Ack"ing patch #1 to go
> > through the Qualcomm tree as long as it made it into 6.11-rc1. I have
> > a hunch that there are going to be more Samsung OLED panels in the
> > future that will need to touch the same file, but if the change is in
> > -rc1 it should make it back into drm-misc quickly, right?
>
> Not sure the Soc maintainer would accept any patches for -rc1 at this
> point, but Bjorn can try to push both #3 and #4 as fixes for -rc2.

Yeah, I guess it's pretty late for -rc1.


> Not sure #1 would be accepted as fix via any tree, but having a bindings
> error for a kernel release is not a big deal if in-fine the bindings chan=
ge
> has been reviewed and queued for next version.

In general my understanding is that we don't worry too much about
temporary bindings errors as long as things meet up in linuxnext and
get fixed. ...but in this case we're talking about the dts going into
6.11 and the bindings in 6.12 which means that v6.11 will be released
and still have the bindings error. That's non-ideal...

Can we really not consider the bindings as "Fix" since it's required
to pass dts validation for the dts patch which is a "Fix"? If we can
consider this bindings change a Fix then we could land it in
drm-misc-fixes and then things could meet up nicely I think, right?

-Doug

