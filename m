Return-Path: <linux-arm-msm+bounces-12571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E441B867B0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 17:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12CD41C28C16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 16:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA8612BF26;
	Mon, 26 Feb 2024 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VjOpFIK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E79112BF00
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708963377; cv=none; b=eApI1RUJ0XEpuXWiaNYFF9pYk78HEI6eiU/vkrwa18nXQcogrfT0QE4P6Mg/orkFV0bEmdcjFn2GxykVQXClhQ8NIzUauZ6WhiJWp1OAdy4BBLEsnwjryNaIjwkGRGy9FrejvCjiWzIRJARQZ+7Nsjv0rhn7bleA74XfFydTHro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708963377; c=relaxed/simple;
	bh=wTNfxtjjEuUsYp1JNTlYg2x2iUW0rS+mI/kNL5uqq8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzvwpdtQAU7TxwUpgU6IO/RHDLAN3HMaqTj+4+ezHs16B13yRdWACN0PuDHgYPOVaIZp6w1oBlwqdI22KJCTCP5HtpCnbXsQxsap9UHaqv8Ag632e4a2fuYi2OtrT3BOQ9Z01Dltnqj/PsjFAP26C1JINVQkssUQwgxRuyERsXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VjOpFIK3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-512f6f263a6so1231645e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 08:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708963373; x=1709568173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTNfxtjjEuUsYp1JNTlYg2x2iUW0rS+mI/kNL5uqq8k=;
        b=VjOpFIK3xVR7oPT8c2BChY1eaRZ2pxu2+XBHljH/Tq6iGZniqNgXqCzPcVbNdSbx9G
         v8sRQOE8FdooJUpslY416eX9Wc1qqBWjNZiRbP0+1kuRiHw9QN5nyh42T2EvYllMscDl
         BxGlL204M6IAKwDMNkDtvxRozbJpVCbIIk+Fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708963373; x=1709568173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTNfxtjjEuUsYp1JNTlYg2x2iUW0rS+mI/kNL5uqq8k=;
        b=md7M1SWhHXionNUj5/n/DluiPULDWk82lO2lv62Ki71VddduuH+uplI295dWqXkhnm
         K1/EwO8K21AUzUcCa/3dMqFBx5eHtaD/+4fxt6A2XtY5Ylam8aBRmOC/oNzZcav/jDv0
         nnX9lDOEF87OpTYhTv1ijHO3BKWyyZy4JQVZDXWJJUJ97hQmlXbJ3Z320trqed8UrTNh
         l0oShcKBF58zth0PYmEpqau24Rn/Y1VudkDGI70uFqbDRGkKERIEvz1+16sTfeWnYYpv
         JYB37X7mbyGe4HtPcSsa4yFs4IQ30HSEKNe22IXhaaCXvCpripDNXmoRGBYlhhU9vG7q
         lwnw==
X-Forwarded-Encrypted: i=1; AJvYcCWdXlRShgOKIdaTNexEfC63+b3wWzeXOmuy6M3UjK+ec1Una32jPjdvATw1D1g29t/FQR14thtw680seNuyKLncG82Arb1LsbRVTe93IQ==
X-Gm-Message-State: AOJu0YwtEFlCW61yM3DYRY0GaXcmbnPq41lYVADCIJkalQaz+tsGMdK1
	rFsC5D7zbxNyHzyGgSLv2uSDAkhME/3neka75YpRj5sUsq3cBt+JmnmGBQD3mXOPdOZsKemfB4X
	dPvft
X-Google-Smtp-Source: AGHT+IHlE0YhTgz5kZcdby8Y01GlN+X1PjxNt7P+XCJOx9UtznE75QC78NGxABRojPcDmlMZ16NZDw==
X-Received: by 2002:a05:6512:33d5:b0:512:fe39:5d0e with SMTP id d21-20020a05651233d500b00512fe395d0emr2545666lfg.9.1708963373368;
        Mon, 26 Feb 2024 08:02:53 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id j22-20020ac24556000000b0051301a42641sm146634lfm.174.2024.02.26.08.02.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 08:02:53 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512eed6e77cso5110e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 08:02:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrZ4oCbyprzNf5H186UCZrQU6gZc2H4CLJzo46F6AvAconMEprZXPCqqsRURaBAakrVVZtJ2chBYeJChMMmdRRF6O83/dKqaAvJofmFg==
X-Received: by 2002:a50:9f28:0:b0:562:9d2:8857 with SMTP id
 b37-20020a509f28000000b0056209d28857mr330238edf.6.1708962985791; Mon, 26 Feb
 2024 07:56:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
 <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org> <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
 <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org> <CAA8EJporaUuddHHqpyYHiYSu=toHmrDxSHf9msZUJoym4Nz72g@mail.gmail.com>
 <20240222150423.GI2936378@hu-bjorande-lv.qualcomm.com> <CAA8EJpqd=1KV_dN8AURQDcFDDyO+YtbC59gM7ftt+HohGM93hg@mail.gmail.com>
In-Reply-To: <CAA8EJpqd=1KV_dN8AURQDcFDDyO+YtbC59gM7ftt+HohGM93hg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Feb 2024 07:56:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XJVFX-GkL-wiAoi=r6tdiDHkJ_aFSpx6FE6+gFT5xJjA@mail.gmail.com>
Message-ID: <CAD=FV=XJVFX-GkL-wiAoi=r6tdiDHkJ_aFSpx6FE6+gFT5xJjA@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 22, 2024 at 9:32=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 22 Feb 2024 at 17:04, Bjorn Andersson <quic_bjorande@quicinc.com>=
 wrote:
> >
> > On Thu, Feb 22, 2024 at 11:46:26AM +0200, Dmitry Baryshkov wrote:
> > > On Thu, 22 Feb 2024 at 11:28, Konrad Dybcio <konrad.dybcio@linaro.org=
> wrote:
> > > >
> > > >
> > > >
> > > > On 2/22/24 10:04, Dmitry Baryshkov wrote:
> > > > > On Thu, 22 Feb 2024 at 10:56, Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
> > > > >>
> > > > >>
> > > > >>
> > > > >> On 2/22/24 00:41, Dmitry Baryshkov wrote:
> > > > >>> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@qu=
icinc.com> wrote:
> > > > >>>>
> > > > >>>> The max frequency listed in the DPU opp-table is 506MHz, this =
is not
> > > > >>>> sufficient to drive a 4k@60 display, resulting in constant und=
errun.
> > > > >>>>
> > > > >>>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-t=
able to
> > > > >>>> fix this.
> > > > >>>
> > > > >>> I think we might want to keep this disabled for ChromeOS device=
s. Doug?
> > > > >>
> > > > >> ChromeOS devices don't get a special SoC
> > > > >
> > > > > But they have the sc7280-chrome-common.dtsi, which might contain =
a
> > > > > corresponding /delete-node/ .
> > > >
> > > > What does that change? The clock rates are bound to the
> > > > SoC and the effective values are limited by link-frequencies
> > > > or the panel driver.
> > >
> > > Preventing the DPU from overheating? Or spending too much power?
> > >
> >
> > Perhaps I'm misunderstanding the implementation then, are we always
> > running at the max opp? I thought the opp was selected based on the
> > current need for performance?
>
> Yes. My concern was whether the Chrome people purposely skipped this
> top/turbo freq for any reason. In such a case, surprising them by
> adding it to all platforms might be not the best idea. I hope Doug can
> comment here.

Thanks for thinking of us! In this case, I think the only users left
of the sc7280 Chrome devices are folks like Rob and then a few folks
on Qualcomm's display team (like Abhinav), so if they're happy with
the change then I have no objections.

In any case, I'm not aware of any reason why this would have been
skipped for Chrome. The Chrome devices were always intended to support
4K so I assume this was an oversight and nothing more. ...of course,
as Abhinav points out Chrome devices are currently limited to HBR2 + 2
lanes DP so they can't go 4K60 anyway.

In any case, in case it matters, feel free to have:

Acked-by: Douglas Anderson <dianders@chromium.org>

