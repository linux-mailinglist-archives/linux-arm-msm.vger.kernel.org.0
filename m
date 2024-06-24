Return-Path: <linux-arm-msm+bounces-23925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 460829148D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E50191F23756
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 11:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C848129A7B;
	Mon, 24 Jun 2024 11:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IG2uhkfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4BB138495
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228848; cv=none; b=WMangNkJheDq4EOpwBIM+4VQvNbQq09kuP+R/R5nu+Od8wFOYDDtdgBufE9u2oQlWiTZUd/FYeHRNnGHlTND2hfdLpdewpi/bFsVmf/QBdKDKvh974uPIj8KfCCIQTD/i91w9ffirTfLNr11vyd27Te4529/6MYtYJmp6PxhCWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228848; c=relaxed/simple;
	bh=/R5v62rxRpq5wDTVHnRxA1Nb98uRg0f9j8o1HaA4ybo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAy8JEz6zo3bCmuAXoykJJPGqaNBOYJgcES1WGybWVCVicxlc8Bv4qt3P91NBGUBV1aSeQjG8r6msQCQGRjN4/DUC1PpDXtVaDqsLJNL8LAhWMj4kmIM0FzPWCn+NDwVrZ9QhrO6EOM1yQrW1IWgOo8TMG1P48yjx5ZC2bV1bFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IG2uhkfG; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-642035f8c4eso15933087b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 04:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719228846; x=1719833646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=upAAWkKErsbFK09qz0Z6svT+EppDhxsUTeUV4G/KK1k=;
        b=IG2uhkfG2oc+X4a+J86ParFNW+Vf2HYV5/BIa+lu36YV9nEuxvxA4w70syTcjD/RWY
         W4IDPc7EFZZOhi3y2zdZkNN6uooJ985IFY5mPhteVHw53QF5pm6g2KOs2X3cfCxcWDpu
         EF2bypBcCphOpY3mKhWx8mUbOqp6MtQoe5xrPewPghlYezS9ofvFoFupbYixW7rJBo+D
         om5oCXxJgGWaiKlpWHo3JiNXtqogTvCNJ5D+n12JjsAAl3TrDGZly4BzondbixLEJqCt
         6aAbJLB1gIc8e7Dmoxw1Gp4il1wxSSz36/N0iScFXM73rUhoG7gAD/fvfWyjTSKu7BJC
         yIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228846; x=1719833646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upAAWkKErsbFK09qz0Z6svT+EppDhxsUTeUV4G/KK1k=;
        b=fBnPzU/fAQjM3RgOd4YjXBNogUCW+7Y1envsTyEH2gsaQXlg0p1EBWzJSpybKawZoa
         rnZLpzpqxfpOb5fWwqPcdss0jX6ceIB6ikvvU4HaCgq+UPkfPzje4Eruw81B376xn0ZB
         odwujbnrofI2lg1hc6Tz0Lh2iU7PCGzLNR0HH4VnxOJMQZSxAJBu3nFfEJmvSivKHMyd
         8UswjZcZX8/oB0Lsmm/NWD1LY29o754DCPMccaz802Uk7y7WHUk8TMQ4gVlbMHqW/aPP
         XEQB1lE1d55dIUi14Vajw/oFmGuNY/5lJwWyi9BgpKuY51A2sNbQT2JL7nkMRNZM8OR3
         BTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0yFGtpmKSHpyCZhOjTN8+Eqw6O+d0950IV73GlZJdwA/o8MX72uN0RvQVd2Au/tbOAaOtZ2dejZRIQvQdCX+ltJ6spFSb+H3LQaHB9w==
X-Gm-Message-State: AOJu0YwVJWUaxxkaW+YvC+kZOFHKp7c40MMaSqkLcg8BvwJP+PQIZ4R9
	TNgo1XDHVSNufXWQf/Jy74YNNY/2TjV40UxC+OOQyHc1XKxhYxnTtnp/jC4QD+tgRG1uQ5ttDqR
	qp6zTyiQ5asiWE0YrqnIKXDxwlvQbJyhmcRnF4A==
X-Google-Smtp-Source: AGHT+IH5Z8/tuCn40/rJtcdV8GxLSpREk/lqsQMXN8cW6J/sXP4inSC19be2plWZfK17N4VZno+uTzXn3dQ/uoLjDag=
X-Received: by 2002:a81:8387:0:b0:61a:d4ea:b856 with SMTP id
 00721157ae682-643ac323d0dmr37721917b3.40.1719228846022; Mon, 24 Jun 2024
 04:34:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <ufc7sq5s5nymjncp5w2446dq5xcmmqbmsuubhpo2fxtsz5dpgg@xtqtmmsio6sr> <722dab04-03f9-49ce-9c7c-4a3a9f898fc9@postmarketos.org>
In-Reply-To: <722dab04-03f9-49ce-9c7c-4a3a9f898fc9@postmarketos.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 14:33:54 +0300
Message-ID: <CAA8EJpqVjkRKWoDfJ=Ga19=gn7i9N-bym+O-TadE819ziJXhoA@mail.gmail.com>
Subject: Re: [PATCH 0/7] qcom: initial support for the OnePlus 8T
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, 
	Frieder Hannenheim <frieder.hannenheim@proton.me>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2024 at 14:33, Caleb Connolly <caleb@postmarketos.org> wrote:
>
>
>
> On 24/06/2024 07:18, Dmitry Baryshkov wrote:
> > On Mon, Jun 24, 2024 at 03:30:24AM GMT, Caleb Connolly wrote:
> >> Add bindings for the SM8250 OnePlus devices, a common devicetree,
> >> touchscreen and display drivers, and a dts for the OnePlus 8T (kebab).
> >>
> >> The OnePlus 8 series is made up of 3 flagship smartphones from 2019,
> >> featuring the Qualcomm X55 5G PCIe modem.
> >>
> >> This series introduces initial support for the 8T, adding drivers for
> >> the 1080x2400 120Hz DSC panel and the Synaptics TCM Oncell touchscreen.
> >>
> >> The panel driver suffers from similar limitations to the LG SW43408
> >> panel found on the Pixel 3, namely that after toggling the reset GPIO it
> >> is not possible to get the panel into a working state.
> >
> > Just to point it out: this is no longer true for SW43408. The panel
> > wakes up and works after toggling the reset. It seems, there is an issue
> > with one of the regulators, but not with the reset and/or panel startup.
>
> Hmm ok, I've heard mixed reports then, I should try it out myself again.

During MAD24 we have seen an issue with the regulators, when the panel
doesn't wake up. But resetting the panel works.

>
> I'll update the cover letter to reflect this. Thanks.
> >
> >> Given the apparent prevelance of this issue, particularly with DSC
> >> panels, I believe this is a bug in the core DSI code, and not a device
> >> or panel specific issue. I think it is still useful to accept these
> >> panel drivers into upstream since, from a users perspective, the panel
> >> is fully functional just by leaving the reset GPIO alone and keeping the
> >> regulator on. The only (theoretical) downside is worse battery life,
> >> which is a small price to pay for a working display.
> >>
> >



-- 
With best wishes
Dmitry

