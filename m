Return-Path: <linux-arm-msm+bounces-23971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AC9915013
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5271C20E88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FB619AD92;
	Mon, 24 Jun 2024 14:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dd05fnfT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B95119AD80
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719239840; cv=none; b=NiRdUOajLATal82wopB3s5DKkkrsTx9hib8NVwU2XC/CMEmK2BcuYIMUFpLpom8NO71ywk+oElV3Kku9JuzVpHHDk3QtyyXveQHiPbU2oTDLfaL0DpzX53X5tp8s9uV/hi33BCzZLlK5DudNzR1lCPag+6H3Tx+tsEyrwn67lFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719239840; c=relaxed/simple;
	bh=IPjzzjFT2d6gGvqkLDQRAXKFQR/gwOcRz1Sr/BoYqw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dv3NDjkNNRgrqHdP69dIpWb2esVURPcNTVvX4+doc91BZwlsNQC9t2Dj/MIE1H3o+Jo8gkXKICDQwZ8c4j3W4inPGRGPFtV+2FTNBJDKmVqXpAjqTo+4UrVE1O68g0FXzQ1N8oIt84llHBphJ1JDOv/FFYrUclgPAZC8CtboYpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dd05fnfT; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-645808a3294so6510057b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719239838; x=1719844638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNxj2+eciL79c7ow++tEl7n5O2NiqPQ3eb3DTJmQ8vU=;
        b=dd05fnfTUZjUG2dpY3BTfuzkIPXFEIudTNhvv/9m6S0sUryPh6dwZF2an7T9+4Jc2/
         MQgdQdk6m9Lv5MTbW/2GeRdt33eXV5uSiU0i8/lUALllQVvjq0MLOoz8Ndoz5zSS6Fn3
         AtwgITHp4xbsJLUM/b36vSF/GKmX7ro8OTvni3soEO/dNozhw69iKmt06HQVAiW4OKG6
         ds2gqWnkbJy4ehk52GQ+TtLMFgoyzXfs4h1/88VFMMIemUcl64OnFjYH7EQ5+R1n3aEO
         SrIbJjKXS5V/+OywqVvsB2+rXIQG9Ao8uQNXxrPYtF0bVlZ1sMmC2Dzh3E0LZqDCGFMI
         7p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719239838; x=1719844638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNxj2+eciL79c7ow++tEl7n5O2NiqPQ3eb3DTJmQ8vU=;
        b=KmX262snO3ao04eYCbkj0sDdwW4t4otG/dZ/6vBJNTlXNTZI9yfmzKrEGkUURrvxyc
         JlxkG8jr/OcamYjPpAyjwkZuGeTMmROf2yb/p3Pdcq4qn8GFg2He9XH6gmL2jamkuhsp
         9B8XiLY35Tyu/8iUGmToej5Ujb1D8eKmfOTg1RNPaVO33Ya5YTx61iQhuM5own+nZ+rr
         uUODZ+i3VmRGDZLWU8uEWH7ukVVRkHm+n7xKv6dslocIxNYkgia0EnthxFSB6cNST/H7
         UMBfCKPMxKy9o2VuOOXXKjPeyaiEnhVkfUWNAE0noQ7/R9KAN5EY/31z9kP8C5boaZX6
         S+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUmBITwhZ+EgMe5BH/N45z8kXc865KLP3Km8wHPaL9MP+FStSbBwKE9Ve+zvf1rOa0cHlntVJnZ+vCBbkadHbSMuuHIHyXB6OMBB0ZQeA==
X-Gm-Message-State: AOJu0YzCBafb2jODO5bWj22DAZyALwIBUthACZtRi9pNeeMR6PZD6oY3
	PzubfU0rGiYDJRmbxLp0P6TMtGPEeIVkxf0U/fjNHd+c/QB6JkRZspmsrbiixNVVXC9pxcq9y3M
	loixrDkq59Ae0qmgdDgi5zDAECml//2T7PJ/WNw==
X-Google-Smtp-Source: AGHT+IF+sGE/evhSAqjM6Wm0LvOAAGz+dKOVItg6rmaDICqHlPY4MY9o2H21baQpedhJD3M2EixIu6TdGsSKPaLLKn0=
X-Received: by 2002:a05:690c:6606:b0:630:de2f:79b8 with SMTP id
 00721157ae682-6433dd746bdmr54389477b3.13.1719239837877; Mon, 24 Jun 2024
 07:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org> <2024062411-neutron-striving-f16c@gregkh>
In-Reply-To: <2024062411-neutron-striving-f16c@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:37:05 +0300
Message-ID: <CAA8EJppDtmNxfjc-f9MA1Za=jvZFqahKtM+FA66jG6Dg=zp1Cw@mail.gmail.com>
Subject: Re: [PATCH v8] usb: typec: ucsi: add Lenovo Yoga C630 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Jun 2024 at 17:25, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jun 21, 2024 at 01:21:26AM +0300, Dmitry Baryshkov wrote:
> > The Lenovo Yoga C630 WOS laptop provides implements UCSI interface in
> > the onboard EC. Add glue driver to interface the platform's UCSI
> > implementation.
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Add driver for the UCSI on the Lenovo Yoga C630 laptop, as implemented
> > by the Embedded Controlller of the laptop.
> >
> > Support for this EC was implemented by Bjorn, who later could not work
> > on this driver. I've picked this patchset up and updated it following
> > the pending review comments.
> >
> > NOTE: the patch depends on the header from the platform driver. Ilpo
> > J=C3=A4rvinen has created an immutable branch based on v6.10-rc1, pleas=
e pull
> > it before merging the patches:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-driver=
s-x86.git tags/platform-drivers-x86-ib-lenovo-c630-v6.11
> >
> >   platform: arm64: add Lenovo Yoga C630 WOS EC driver (2024-06-14 12:51=
:30 +0300)
>
> I have that branch, yet when building this driver as a module I get the
> following errors:
> ERROR: modpost: "yoga_c630_ec_unregister_notify" [drivers/usb/typec/ucsi/=
ucsi_yoga_c630.ko] undefined!
> ERROR: modpost: "yoga_c630_ec_ucsi_get_version" [drivers/usb/typec/ucsi/u=
csi_yoga_c630.ko] undefined!
> ERROR: modpost: "yoga_c630_ec_register_notify" [drivers/usb/typec/ucsi/uc=
si_yoga_c630.ko] undefined!
> ERROR: modpost: "yoga_c630_ec_ucsi_write" [drivers/usb/typec/ucsi/ucsi_yo=
ga_c630.ko] undefined!
> ERROR: modpost: "yoga_c630_ec_ucsi_read" [drivers/usb/typec/ucsi/ucsi_yog=
a_c630.ko] undefined!
>
> So something went wrong :(
>
> I'll unwind that branch pull now as well and wait for a fixed up version
> to be sent.

Could you please share your .config? I could not reproduce the issue
here. The EC driver has all the necessary EXPORT_SYMBOL_GPL()
declarations.

--=20
With best wishes
Dmitry

