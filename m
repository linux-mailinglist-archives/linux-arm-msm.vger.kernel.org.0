Return-Path: <linux-arm-msm+bounces-12165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE67E85F823
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 13:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1C211C22338
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 12:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FEC60BAF;
	Thu, 22 Feb 2024 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y3oBOrKP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610060899
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708604832; cv=none; b=dC2BI7YqJIIW3f3F4HpelSfky21y66fg1EDa3X36QslQw1TGYAshXwA3yUiMPByL9+KA1ETU8iU+lj/iQA2YMLUbmvsoguU4wvJizZs53osHcKxZfu/T+tcTiefaMNYEnDYyANPsmNq1O/05fMp5F1RKluRu9DrpWRo5EX97Fwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708604832; c=relaxed/simple;
	bh=RqgQ6WWKx6ea08lg/2dT3uWXLimx+QSntv5Wes1ky/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4xV6CLq8VFk5vJw7mgfIAlJA2ajO2iUFyH3Tsa0VZV/p+lHBmOF+KNxb72CgwTS6ed6QiYPQ6P71ndR7sdwogVHg9Vz557cGcoFYj86Wgkt3tM9vudwxjIrgWaxWYPRLRUo5Fes9zAduXXOKYyFPgrCAHsYO4700O1JwsSw7/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y3oBOrKP; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4c84bbdcf45so867389e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 04:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708604830; x=1709209630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jauQlDLtoDoTZv/wYHS4jaWj+p+OfLWIznwN3L3gztY=;
        b=Y3oBOrKP1nTdzndqP2anCnrHfJ8DpwUAegYUMgTBQdBP1y7W7HCGIfgi9g5HfnmyHM
         RdIULV536nWWH73dNf3ddemPSUA5WzkJ2OMUqLVx1cdX8c4rC56JI9sO191Wbtu65jp0
         6qNkIeSdPcF5LK/N7z2d1mfPj57+9syuyjcoUSRssAAho540Je1qcxUxxsyR2crjJzP4
         JRXPX1NBmqFqs3z+niC+xwN7OvMM/3dE1qnVt6UjI4pKmMI4cb6b9CnomS87F6l9XDCH
         TobuL8AOqgypO+8QfDGB0sSREXccHWLW/nwIqrYNzVK7sAapmkobPEzvVZouUMx85sjC
         uMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708604830; x=1709209630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jauQlDLtoDoTZv/wYHS4jaWj+p+OfLWIznwN3L3gztY=;
        b=bQnBhJddIVWyTvn8iuYYi2hZs3R3GKM+g8GIgf9XB1SBpmEWdOghTQJr0ZGMZKyF9T
         nVdlYeXbV/HAVN364Zeurnq3T0prfryj2dRoVz91D9BLOG6XhMUYuIMKiJdtemNN5yDi
         Qf7/Cf2LT2xwR6wg34Cf6jI1jpANLgIilL7Y4C7JZbGerfoxfvjjTszotoP0nxO1pDB9
         swiyJn/oXbBiVBDUcLjDsL1pdfVy2W3NApMWnyN9v25z39VSSy2O7gtunhCt6sIJTMpB
         8do7dRTei4fCyrK3fLKNhlJoFlZ9KIFL7OgqUn6D7BPDf/qom5DlZcVs758U8eEuvr8Q
         +VAw==
X-Forwarded-Encrypted: i=1; AJvYcCWLHNeoVpOFYRUebCiMkeUVs+Z0Zm3Byf/8rZanIW+uWWt5OR7ihXD4G0C4TsbWe40NRyw+DRnjLruLiBQJsTwBTrjfoDLzaUBKopm2gQ==
X-Gm-Message-State: AOJu0YwhTif/5eSgFQI3z+nr9eZXRcXpvcCLZaNYLCniR33KgSb502pz
	+rJb9Y2jKam1hXLiV62jwZvQAH57p9CLww6rnNcW/JDcA8a2S1CX6yzYnkXPAhlPdGrpNat0kws
	T6m7Sx+KR2l4tRDHW+xlAtXgHVyr5pZphL9QcTw==
X-Google-Smtp-Source: AGHT+IFlGGmIhRlgVOJ7guJadgo+TYPb+Ty3wru20Zbb3E4L9+ZKZyhslxKwfpF5Fh/fPrLioG3sC4Re2RH2PFEfGYU=
X-Received: by 2002:a1f:66c1:0:b0:4c8:8149:848e with SMTP id
 a184-20020a1f66c1000000b004c88149848emr10294476vkc.5.1708604829800; Thu, 22
 Feb 2024 04:27:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216203215.40870-1-brgl@bgdev.pl> <20240216203215.40870-15-brgl@bgdev.pl>
 <d5d603dc-ec66-4e21-aa41-3b25557f1fb7@sirena.org.uk> <CAMRc=MeUjKPS3ANE6=7WZ3kbbGAdyE8HeXFN=75Jp-pVyBaWrQ@mail.gmail.com>
 <ea08a286-ff53-4d58-ae41-38cca151508c@sirena.org.uk> <17bbd9ae-0282-430e-947b-e6fb08c53af7@linaro.org>
 <53f0956f-ee64-4bd6-b44f-cbebafd42e46@sirena.org.uk> <CAMRc=MedCX_TGGawMhr39oXtJPF4pOQF=Jh2z4uXkOxwhfJWRw@mail.gmail.com>
 <52fba837-989b-4213-8af7-f02cd8cb48c8@sirena.org.uk>
In-Reply-To: <52fba837-989b-4213-8af7-f02cd8cb48c8@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 13:26:59 +0100
Message-ID: <CAMRc=MeF7xVjRKetg1A3MNO4yMasPA2GC7MLCBrOiwO5UBv6LA@mail.gmail.com>
Subject: Re: [PATCH v5 14/18] PCI/pwrctl: add a power control driver for WCN7850
To: Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Saravana Kannan <saravanak@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 1:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Feb 22, 2024 at 10:22:50AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Feb 21, 2024 at 12:44=E2=80=AFAM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > Yes, that's the theory - I just question if it actually does somethin=
g
> > > useful in practice.  Between regulators getting more and more able to
> > > figure out mode switching autonomously based on load monitoring and t=
hem
> > > getting more efficient it's become very unclear if this actually
> > > accomplishes anything, the only usage is the Qualcomm stuff and that'=
s
> > > all really unsophisticated and has an air of something that's being
> > > cut'n'pasted forwards rather than delivering practical results.  Ther=
e
> > > is some value at ultra low loads, but that's more for suspend modes t=
han
> > > for actual use.
>
> > Removing it would be out of scope for this series and I don't really
> > want to introduce any undefined behavior when doing a big development
> > like that. I'll think about it separately.
>
> This is new code?

It's a new driver but Qualcomm standard has been to provide the load
values. If it's really unnecessary then maybe let's consider it
separately and possibly rework globally?

Bart

