Return-Path: <linux-arm-msm+bounces-72986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 550F0B51754
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 14:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FABB1BC6823
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 12:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7475931C57D;
	Wed, 10 Sep 2025 12:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="PPbYFE0W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678F9226D1F;
	Wed, 10 Sep 2025 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757508860; cv=none; b=SO52JIbFzGLW/oI7pf128r0wN3YdErnX+uP+OdAhUNsxHbIuVVZXFwarEg+3x6bcLIhoIL9iqeKoTDxA+bFBLnwSC8c03FEE6HNs3aWyjkzxf817To0Y6p25UWIBy316i7AfQURIgBWPdftV6KyA+pP52aObYJ7e3DqDsHerUNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757508860; c=relaxed/simple;
	bh=7+fsNNidjxNObR90f70OwgFco16kLUQCyb7Ba6apIq4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qa+JRI5cxx2q3DL1FmMGTvllPr5uDpKduganyBzm9GfgAuJ0iWjHuGrqJtGzTt6bhauMoK/htegGlpFj4ZMHCLSeHvbSTJGQAS6GY9grhFVLRSDJqIn+XX/HTd4jkA2A8445VXWh3SIpXQ/6u9k7PYfO+TO0wEADasoOLFigCoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=PPbYFE0W; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757508854; x=1757768054;
	bh=PokhKJSZTXFCrGmMN/e6OXnW4hgUUtPyE2Nv9QDkEkU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PPbYFE0WjYXpLeP3xJkXhRvE7JkuJkEVtJjIKNTdgMH/YUtYX44AW+lTd8ESATSu9
	 yJJpS0VCptZRhalCFAnur7KEPF87eRdwthsLplDtqo5HSwN2pSump+NsGMpXdeSp6j
	 WNecwig7Okb871+Hk98KxTd+VCFSQMHpgy2eNlXJwgM/NKDi3Mij3ZtZjQIHmP7qgH
	 0FWD6VCNvzkBPQXkPv3VLZfjfdasccKpJ8+Bog72jmJvynWfxiup13lFdM0n5gIvSk
	 WNDbPqjyYC+HzwhJyBvKfPalAK4nQ4/KxQKVHTRZigTbQYXi6LzZw+SaDkd5MMAfYE
	 R5XtCoU4r8Tiw==
Date: Wed, 10 Sep 2025 12:54:08 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to led_get()
Message-ID: <jsLJqyPfjA2iFNHMvAxgz-zO1WecVgleSahWgW_B5BshbYat4X1UqUuKpexfxlRxnD3oWlAnHqeLGpne8JebFV-ICVxvr5g-5nI8P2Q6dY8=@vinarskis.com>
In-Reply-To: <b9017909-1643-4cef-bfff-5b672dd73960@oss.qualcomm.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com> <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com> <b9017909-1643-4cef-bfff-5b672dd73960@oss.qualcomm.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 2ce1b8c37d3e00ed785d5c327f7ece8e07ee03ac
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Wednesday, September 10th, 2025 at 14:22, Konrad Dybcio <konrad.dybcio@o=
ss.qualcomm.com> wrote:

>
>
> On 9/10/25 2:01 PM, Aleksandrs Vinarskis wrote:
>
> > From: Hans de Goede hansg@kernel.org
> >
> > Add 'name' argument to of_led_get() such that it can lookup LEDs in
> > devicetree by either name or index.
> >
> > And use this modified function to add devicetree support to the generic
> > (non devicetree specific) [devm_]led_get() function.
> >
> > This uses the standard devicetree pattern of adding a -names string arr=
ay
> > to map names to the indexes for an array of resources.
> >
> > Reviewed-by: Andy Shevchenko andy.shevchenko@gmail.com
> > Reviewed-by: Lee Jones lee@kernel.org
> > Reviewed-by: Linus Walleij linus.walleij@linaro.org
> > Signed-off-by: Hans de Goede hansg@kernel.org
> > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > ---
>
>
> I was thinking, perhaps we should introduce some sort of an exclusive
> access mechanism, so that the e.g. user (or malware) can't listen to
> uevents and immediately shut down the LED over sysfs

It is already done by the original series from Hans (linked in cover),
which was merged few years back. It is also the reason why this
approach is used instead of typically used trigger-source - that
would've indeed allowed anyone with access to sysfs to disable the
indicator.

As per Hans [1], v4l2-core would disable sysfs of privacy indicator:

    sd->privacy_led =3D led_get(sd->dev, "privacy-led")
    led_sysfs_disable(sd->privacy_led);


Of course, this security only holds if one has secure boot enforced,
kernel, modules, _and_ device-tree blobs are signed.

Regards,
Alex

[1] https://lore.kernel.org/all/daf442a6-b4d6-4213-8ec0-10397d682cc4@kernel=
.org/

>
> Konrad

