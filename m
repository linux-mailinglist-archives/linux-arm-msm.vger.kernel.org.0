Return-Path: <linux-arm-msm+bounces-31077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A4096EF2F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 11:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B51171C21DBB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 09:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3619C1C7B9D;
	Fri,  6 Sep 2024 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMgXCYM8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998C11C7B8A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725614919; cv=none; b=n+J5musAj0iTWBD7gFoXkskDWOSA6Cz7BaSxlBgSWvkCnREwHJ/Tv82OmRVZzVsEkQWVHOE8XRJTOROANhdapeSDgsiTNvScFSc4CAtklMcKBffNYSd9AGW9wQebNTyqNvzuvyyH7o7vXXyCndQs75HXO4PeE+xXHEIil8nrumc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725614919; c=relaxed/simple;
	bh=Pbu3tedF18a4Q/tvljll8BapkmvjMGuU5vrfai36ATk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPWENxcSUk8y0jKq6HUSObJqPGlwpuUXNNNSIwKdhkjJHFbtTEWs7hfjXRrA5wUVF5AV2/RR2Z7S0OfFmRFbWSBnJbLBLC5vvEsmSol1ksgeb4yK+yAPFu4RCbn8v0M1Ol+bosNOw76Ux3uivoCBxR1AuTvOJ4VgXv/Ng3IbKMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMgXCYM8; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6c3f1939d12so15871197b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725614916; x=1726219716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fF3pcbju+s8J9xxsWbSGojiYAmCI0/XO/iQ2e/UjLWE=;
        b=XMgXCYM8ZmuGfZI/9FCWZBW55uECkDhJoQiEFnCBLnjZ9Eyal5lwZXAcErX3omZG8g
         qXANeKYz37E+Ii9wV3sbfaiiJebiQpxvk/3NEfEBV7QhcSe23piNus3hjyIbTqDLl+O7
         uADqblu8qpdA3HL8M+pt3UyKaNHq/7Ls95uE+eMAOufVyC1WGLYoRxtG3VTEYUrcCsjk
         6AkIoX4dvsOmLBv75N8yOXDpsFa+aitJpvzbB8WI9n6SL4vstCRh31WtsHaYhJTrsUMT
         aEuA1KxeUWNMzteXgTef2gcu2NO2KB1rYQ7TFVl+pK5B4uULPn+/TyorxbV7SgqKMuwz
         k+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725614916; x=1726219716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fF3pcbju+s8J9xxsWbSGojiYAmCI0/XO/iQ2e/UjLWE=;
        b=h7L26sfu9WJcWJVy9j6bcQ67ZcmQ21pGpGd3HxMEx0gEv7Ds0TWTqyj+I9I7wW+QkO
         esegrvlNZy/MD0g/TnuVNcc4X02pUjUO2ouljK8kPvxilO9CwGTJeNVxZpbcC2+vUeoD
         ElwigpeNW7mA+2vcX85I72s9i1XF6KqQj0VZLQw/vuPk/tSoaiw3yASBxIBXaPfxqF2S
         +d9T3ZYcqE3K5aK1/ZfYGPIc2cctL1WmMeQu4J6pvey5TIGnn/UvCGNPn5RA96B14O0P
         9GHZNODdTCe+7wjpo2BumCLWs9xO+NtLJ7aFUy3aF27VndH1on9SokV8RlS1MI/lkOAu
         KWLg==
X-Forwarded-Encrypted: i=1; AJvYcCXytP96bDesjfRhoEjS/uEfEst95jyjI6/VoB0m893jRDMUDNFoLpBA2YhjwhWd6qJplgVjL9oneByE8ZfN@vger.kernel.org
X-Gm-Message-State: AOJu0YyrxqngGkXpCR/bYUCK+McfKtmO7bkMOhG8CcXK3If10kk7JXY0
	5jY3PYLTQV5DgadYCIt+wdNcSrCk6IwZY6fVVhKeYXAMLCcL1p8fwDQYjLGXFKjZeOwkPF12YDX
	uVdVe00uqDgjSIFQK28hKOhEJwvQUntf6/q6k9A==
X-Google-Smtp-Source: AGHT+IHieSDyqryWCOWipiJiuoPb3kbzCKPQo3e4n3rpun4twmAHpt0K/zSkbaOjmha9z2Q9UWNSpV0q6mQVrQ94rmM=
X-Received: by 2002:a05:690c:6612:b0:6db:3b2f:a188 with SMTP id
 00721157ae682-6db4516fb00mr24752687b3.32.1725614916403; Fri, 06 Sep 2024
 02:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
 <20240830-nxp-ptn3222-v2-2-4c6d8535cf6c@linaro.org> <6fcaa893-70a4-44f4-afc0-853799e30774@quicinc.com>
 <CAA8EJpoTb_-HtBPv2=FecHvtHYQD4ipqfq3C98ky=qXEXB=_6Q@mail.gmail.com> <237865a2-61fb-4d05-a57d-261710aad821@quicinc.com>
In-Reply-To: <237865a2-61fb-4d05-a57d-261710aad821@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Sep 2024 12:28:25 +0300
Message-ID: <CAA8EJpqa3_ZaC7xo+pWBovKEvJ5utxR7nS1vSRnyskw7GZf-wQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
To: Song Xue <quic_songxue@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Sept 2024 at 11:40, Song Xue <quic_songxue@quicinc.com> wrote:
>
>
>
> On 8/31/2024 7:45 AM, Dmitry Baryshkov wrote:
> > On Sat, 31 Aug 2024 at 02:13, Song Xue <quic_songxue@quicinc.com> wrote=
:
> >> On 8/30/2024 4:20 PM, Dmitry Baryshkov wrote:
> >>> The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that perfor=
ms
> >>> translation between eUSB2 and USB2 signalling schemes. It supports al=
l
> >>> three data rates: Low Speed, Full Speed and High Speed.
> >>>
> >>> The reset state enables autonegotiation of the PHY role and of the da=
ta
> >>> rate, so no additional programming is required.
> >>>
> >>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>> Tested-by: Konrad Dybcio <konradybcio@kernel.org>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/phy/Kconfig           |  11 ++++
> >>>    drivers/phy/Makefile          |   1 +
> >>>    drivers/phy/phy-nxp-ptn3222.c | 123 ++++++++++++++++++++++++++++++=
++++++++++++
> >>>    3 files changed, 135 insertions(+)
> >
> > [trimmed]
> >
> >>> +
> >>> +MODULE_DESCRIPTION("NXP PTN3222 eUSB2 Redriver driver");
> >>> +MODULE_LICENSE("GPL");
> >>>
> >> The I2C driver just realizes the function on reset and PWR. What about
> >> other I2C driver function like I2C interface operations,
> >
> > I don't quite understand what you mean by this. Could you please clarif=
y?
> >
> >>   auto-suspend,
> >
> > I think you mean pm_runtime here. It's a valid case, but granted that
> > it should stay enabled when USB controller is enabled, the gain should
> > be pretty limited. I'll consider a followup patch implementing
> > pm_runtime for the sake of being able to disable I2C host if DWC3
> > controller disables the PHY.
> >
> >> remote wakeup,
> >
> > Not supported by design. PTN3222 doesn't have IRQ pins to report
> > events to the host.
> >
> >> memory maps etc.
> >
> > huh?
> >
> >>   Who will enable these? I think it is not
> >> incomplete I2C driver, if on someday, ptn3222 is used as I2C device.
> >
> > Well, I'm using it as an I2C device.
> >
> Sorry for the delayed response.
> The functions I listed, such as auto-suspend and wake-up, are just
> examples. My main point is that a basic I2C driver should include
> fundamental functions like setting up the I2C bus, configuring the
> clock, and setting the SDA (data line) and SCL (clock line). A basic I2C
> driver shouldn=E2=80=99t be limited to enabling the power supply and rese=
t pin,
> as these features can be handled by other drivers as well.
> If you implement these fundamental functions, I think it will be sufficie=
nt.

I think you have mixed two things. You are describing an I2C bus
device, which PTN3222 isn't. I2C clients do not have to setup
anything. SDA/SCL and clock frequency are handled by the I2C bus
drivers and by the I2C framework.

--=20
With best wishes
Dmitry

