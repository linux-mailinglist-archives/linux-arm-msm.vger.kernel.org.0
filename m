Return-Path: <linux-arm-msm+bounces-26185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CCC93161B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D6D11C21F40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 13:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E576D18E76C;
	Mon, 15 Jul 2024 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kPrBSH5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE8F1741CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721051511; cv=none; b=QkFRFEMUoWdF+R4KDkgn4DanBtitdujMTZeOzUj040/wKxefAQhU2IY9B7K5kLd3uCYr/qfJ7Jv1K2VdZpzSWFVSklTNatCqZnj/71/dRRsb+RZR24JX5boH6m3AqWWqHuS0uClNK5zpggOCkhOPlN+aEdUcSLA8ARR84vtuArc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721051511; c=relaxed/simple;
	bh=ra2iu8Gz+ImwqgdjtFBQAdcGSDiM4U9XizTOJ8q2aDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVmkElfL08KZTtjwvlMDCQ5on8gXGJghYTLIkYgLk7LxdoijlD72Esy61u0qiPRQ7CdIR0DClF0T2mJQz96VCfrzWKM3O30CvYsia8vkT4aqCbAQpDf6w+JeHUdFKh3sYB4CETG3rqDI0d1nCH9i3fFL4Z5mqXf95bJ4YKFFiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kPrBSH5e; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-44c21981043so24876941cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 06:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721051507; x=1721656307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxXwbEHWXO/2KvCuP3hi693DOR1kiAPLV7jI7n5DAfw=;
        b=kPrBSH5eEQqaLzr+7FcGbPxmaIHFD8/leWt9X9ycqy6To0Gw3kMZ+4yjimzoD6Efee
         j7mgtNHIwVMQKNGaE3YhDwubmB++y1jbEQFDxwnnjpUMwJmiOS+AoAiprar60ebuACPI
         /FXjBDOcpGnmyBkh7GewxN7wZK1i5pVbko+UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721051507; x=1721656307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxXwbEHWXO/2KvCuP3hi693DOR1kiAPLV7jI7n5DAfw=;
        b=ZMQvUCyZ9ApYpFIJPBGdUYk5o5tSIdvbnIucHDtYztDiXYmRrSjTDWcoFoY9/DAsor
         FxTKlCaSVpZeNbdMHS90i74tevryLGdbWCKPemyEW5etLlok4FDdSm6J/g3MeLfVH+AC
         DwFIiP3KS5K2Pj+ae1R6ei48ibVZl3INDQ9SCu75n8+cLjlj3T48r4v28pdJpxkHcaiS
         DXr+PwukXs0w8pkkFM7W1I/V13F3iNG5NPxnomQEBdIuPJ9bCV43dMHewzvjCEu+x7T7
         7TCqx2/lWfEvGspnA2BitN/iHme/BbeWOmHummdORvq96Uea8Ka2biRXwWnmdW229We9
         lQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPUixR7T7hK3ECSXZzYhSEsDMxIyF2QHT15sGVSJKJ+raBSBOeufuD/TRkUOL9dUMpNucjovDh7SGgvH8S/T4OWG9CCqNnO3xxe5KMow==
X-Gm-Message-State: AOJu0Yz9AiCBlrD+owS9JezEpm9hXBwgYqWSD9YI5YUXwz2sXEDaQOHm
	wx1hquR3Qry1lXrS5Y3eukb1+kWkdcjceCI+UBnW5ih2A8SgfRmeuWOHbWcbzU/OWozHww1+20U
	=
X-Google-Smtp-Source: AGHT+IHDrfo3Atqp6eCFWS+eoe5ZqAqbeW+r1lQZg+d8LvDFhvz5u1WdVe7YvCZ6c9o84qTe3BfVEg==
X-Received: by 2002:a05:622a:294:b0:447:f2c1:7b92 with SMTP id d75a77b69052e-447fa88fc57mr244530551cf.26.1721051507161;
        Mon, 15 Jul 2024 06:51:47 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b8352bcsm24794391cf.74.2024.07.15.06.51.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 06:51:37 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-447df43324fso493281cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 06:51:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX93oMGOQ7JVd2LuxP7jgZbzrnF5rCfXmp8Lu1sN4eVgVmEKPrD0VWJabtax+wz6VI6ceFqN+15lwwwjCKERyQjH5PR5ah9PKLS6Jez8Q==
X-Received: by 2002:a05:622a:124b:b0:447:e728:d9b with SMTP id
 d75a77b69052e-44f5a31e028mr6194241cf.26.1721051494780; Mon, 15 Jul 2024
 06:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
 <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org> <ZpUcI3KkIa58zC55@linaro.org>
 <d1603248-afe8-4594-9e2e-81ba208dff00@linaro.org>
In-Reply-To: <d1603248-afe8-4594-9e2e-81ba208dff00@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Jul 2024 06:51:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
Message-ID: <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
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

On Mon, Jul 15, 2024 at 6:02=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 15/07/2024 14:54, Stephan Gerhold wrote:
> > On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
> >> On 15/07/2024 14:15, Stephan Gerhold wrote:
> >>> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
> >>>
> >>> The panel should be handled through the samsung-atna33xc20 driver for
> >>> correct power up timings. Otherwise the backlight does not work corre=
ctly.
> >>>
> >>> We have existing users of this panel through the generic "edp-panel"
> >>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works onl=
y
> >>> partially in that configuration: It works after boot but once the scr=
een
> >>> gets disabled it does not turn on again until after reboot. It behave=
s the
> >>> same way with the default "conservative" timings, so we might as well=
 drop
> >>> the configuration from the panel-edp driver. That way, users with old=
 DTBs
> >>> will get a warning and can move to the new driver.
> >>>
> >>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/panel/panel-edp.c | 2 --
> >>>    1 file changed, 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pane=
l/panel-edp.c
> >>> index 3a574a9b46e7..d2d682385e89 100644
> >>> --- a/drivers/gpu/drm/panel/panel-edp.c
> >>> +++ b/drivers/gpu/drm/panel/panel-edp.c
> >>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> >>>     EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, =
"Unknown"),
> >>>     EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, =
"Unknown"),
> >>> -   EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA=
45AF01"),
> >>> -
> >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140=
M1JW48"),
> >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M=
1JW46"),
> >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140=
T1JH01"),
> >>>
> >>
> >> How will we handle current/old crd DT with new kernels ?
> >>
> >
> > I think this is answered in the commit message:
> >
> >>> We have existing users of this panel through the generic "edp-panel"
> >>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works onl=
y
> >>> partially in that configuration: It works after boot but once the scr=
een
> >>> gets disabled it does not turn on again until after reboot. It behave=
s the
> >>> same way with the default "conservative" timings, so we might as well=
 drop
> >>> the configuration from the panel-edp driver. That way, users with old=
 DTBs
> >>> will get a warning and can move to the new driver.
> >
> > Basically with the entry removed, the panel-edp driver will fallback to
> > default "conservative" timings when using old DTBs. There will be a
> > warning in dmesg, but otherwise the panel will somewhat work just as
> > before. I think this is a good way to remind users to upgrade.
>
> I consider this as a regression
>
> >
> >> Same question for patch 3, thie serie introduces a bindings that won't=
 be valid
> >> if we backport patch 3. I don't think patch should be backported, and =
this patch
> >> should be dropped.
> >
> > There would be a dtbs_check warning, yeah. Functionally, it would work
> > just fine. Is that reason enough to keep display partially broken for
> > 6.11? We could also apply the minor binding change for 6.11 if needed.
>
> I don't know how to answer this, I'll let the DT maintainer comment this.
>
> The problem is I do not think we can pass the whole patchset as fixes
> for v6.11, patches 2 & 3 could, patches 1 & 4 definitely can't.
>
> Neil

IMO: patch #3 (dts) and #4 (CONFIG) go through the Qualcomm tree
whenever those folks agree to it. If we're worried about the
dtbs_check breakage I personally wouldn't mind "Ack"ing patch #1 to go
through the Qualcomm tree as long as it made it into 6.11-rc1. I have
a hunch that there are going to be more Samsung OLED panels in the
future that will need to touch the same file, but if the change is in
-rc1 it should make it back into drm-misc quickly, right?

Personally I think patch #2 could go in anytime since, as people have
said, things are pretty broken today and the worst that happens is
that someone gets an extra warning. That would be my preference. That
being said, we could also snooze that patch for a month or two and
land it later. There's no real hurry.

-Doug

