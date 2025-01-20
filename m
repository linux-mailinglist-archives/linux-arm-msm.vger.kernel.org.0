Return-Path: <linux-arm-msm+bounces-45635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F9A1740C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 22:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 094011889F4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 21:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672F11F0E21;
	Mon, 20 Jan 2025 21:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="L0ji2OCp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD391991A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 21:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737407989; cv=none; b=Phb0mhclfjo40OJDvFr3klPi88+7DuNIdrWUoAUVuhAkUSGdoLjj8ER43kDKu2Q77wCwMT3Enmzar6piKacHtedNfZzMpzqRxpLqjwVVfWzAQ/KQOCMOb/inoHFLauevJE9dji+fMk5XzT7u8k6oMZnrzQmig5UL2l7AK5eH7Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737407989; c=relaxed/simple;
	bh=Vh0uo3++5QP3EBzz/t2XwqmWwVWPTuEQ5w6IKvetKck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbMXk1kwcds+eknQYTldwnoGG90AjmdzSLdpUPlMMsx57jUEvMOo1zq1MFGaOrIuSUzCRHr8T2rwJqr9T0Y6VXJMV4R6fbh4fmLmNSxsDV8d9/KR84ZkcLpAd9su1HEH6ByHpWbrG0UXQcPJn2TKc1q/XqdkBSARMZPqEPJVJ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=L0ji2OCp; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so7289082a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 13:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1737407985; x=1738012785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA6291ZXdac8vRUCwssYg9YOrgMEuOkZxM4d7CqIjqE=;
        b=L0ji2OCpt0f1r6G+IwtimIkYl38IyG76XLQdF1OHl1ns9RhiM0ti2ShsRBmmwF7WiA
         HqBN9B/yyIperqmwYaylYPUIrDpFxLRt/mLfojzejRT7lz81etH5fQtbCa7Cty1mis9u
         jV7KS7Tt2qR6va5XLc2FTH7k9L792Au/9Fvo57yMqJapisBzWUBHc4lpiMA+nA3HYPjS
         DdtRtGf4Slj65XYhiyIOf3VJgYuZykTVW2tZYLmgUVZ8nBz9d0MCjWFR+Vx5y27tEvsR
         BWgkUIlS/ZmqTt5Mg3re/EDGxdjYNkcTmoqYAhwxOu3CPYFkANskTQlU+vaPuADV3xjs
         A/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737407985; x=1738012785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xA6291ZXdac8vRUCwssYg9YOrgMEuOkZxM4d7CqIjqE=;
        b=nY23zfcJvz1b/pzBnA+R9ZemR0hq5ScM/9mOw+ZSbAt+4AHmNLC029WHG47zrJuvYo
         C24SsnPoU6qi8W0g/cTa4q6G0n0or/v2g9mtaIZfhYF7O385rrLaJa6L8I91z62D1DGC
         QL1gnuIq/aIv9O0KdvjxJguAESIFdAtM7bWRujf5nvYeE+1QokmHjGuesGZIXtMMdr2h
         0LloIU6B6HvUkixEZk44yW3bH5H08OZsQ4t3rBTySC3cPhoUKr8Hl8KYqdtJn2Xf1oAg
         qe/MxNOVGW4d07SRWHmKjd1JilznhHa7IltYoFk5xC0wtFTQSRj2cgfpbgu6SO5Dcur5
         GeNA==
X-Forwarded-Encrypted: i=1; AJvYcCXev4l+2AjCFC5hTj+0uzxQWfx2R4lPM+bD91QFwSvMcLx8ADqc8Cp91wnHw406MKQ5bbHLbxz54FCfMj1z@vger.kernel.org
X-Gm-Message-State: AOJu0YyydpmCURw5xMlciq2hbImEgX2Si2Nv5yzg23NBCTMBP1RdiBxy
	Z3a7JGKbDykElcnhgO7jIwReNLJVz3Wn+SOxxMdRpeJhw2YGNZv99oL/zJn6Y953kD5ecusQwXc
	Zy39jzUwPnJiUktS+jJDece2hOW4nuCjIF8SOQQ==
X-Gm-Gg: ASbGncvN0ybw1OioGGbnBQyOastkRAnJJ1zZpr7u5DYIa9tdWOA1B6+igiUXbDB2DP6
	5qM+g/T3TxZNGgEJeJT22yx0G9p5o1XkPwEtM20DIzCwhpPdQdXjz
X-Google-Smtp-Source: AGHT+IHc0RPbhZfwtvndyJ4zIg+YQ8UVHDIXIsBwLqHby4Ix3W/JRyz4+JjwjPuaa8KZKDLV2B9ECoKwhLlQY9BPU3U=
X-Received: by 2002:a05:6402:5246:b0:5d9:ad1:dafc with SMTP id
 4fb4d7f45d1cf-5db7db073f1mr33624336a12.25.1737407984546; Mon, 20 Jan 2025
 13:19:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120144152.11949-1-johan+linaro@kernel.org>
In-Reply-To: <20250120144152.11949-1-johan+linaro@kernel.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Mon, 20 Jan 2025 15:19:33 -0600
X-Gm-Features: AbW1kvY5jMIUKN1EO4Z8z1FKCHGpDSW9Rthw8kq1Lxb5fCHphJX04MTxERkZW2Y
Message-ID: <CAKXuJqhttfPg7JV_n85bb5v6VKye0F4rYTfWdDYMowdgo83oug@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Mon, Jan 20, 2025 at 8:43=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> This series adds support for utilising the UEFI firmware RTC offset to
> the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> Elite machines.
>
> Included is also a patch to switch the Lenovo ThinkPad X13s over to
> using the UEFI offset.
>
> The RTCs in many Qualcomm devices are effectively broken due to the time
> registers being read-only. Instead some other non-volatile memory can be
> used to store an offset which a driver can take into account. On Windows
> on Arm laptops, the UEFI firmware (and Windows) use a UEFI variable for
> storing such an offset.
>
> When RTC support for the X13s was added two years ago we did not yet
> have UEFI variable support for these machines in mainline and there were
> also some concerns regarding flash wear. [1] As not all Qualcomm
> platforms have UEFI firmware anyway, we instead opted to use a PMIC
> scratch register for storing the offset. [2]
>
> On the UEFI machines in question this is however arguable not correct
> as it means that the RTC time can differ between the UEFI firmware (and
> Windows) and Linux.
>
> Now that the (reverse engineered) UEFI variable implementation has been
> merged and thoroughly tested, let's switch to using that to store the
> RTC offset also on Linux. The flash wear concerns can be mitigated by
> deferring writes due to clock drift until shutdown.
>
> Note that this also avoids having to wait for months for Qualcomm to
> provide a free PMIC SDAM scratch register for X1E and future platforms,
> and specifically allows us to enable the RTC on X1E laptops today.
>
> Rob had some concerns about adding a DT property for indicating that a
> machine uses UEFI for storing the offset and suggested that the driver
> should probe for this instead. Unfortunately, this is easier said than
> done given that UEFI variable support itself is probed for and may not
> be available until after the RTC driver probes.
>
> Hopefully this all goes away (for future platforms) once Qualcomm fix
> their UEFI implementation so that the UEFI time (and variable) services
> can be used directly.
>
> Johan
>
>
> Changes since UEFI offset RFC [1]:
>  - clarify that UEFI variable format is not arbitrary (Alexandre)
>  - add missing use_uefi kernel doc
>  - use dev_dbg() instead of dev_err() (Alexandre)
>  - rename epoch define RTC_TIMESTAMP_EPOCH_GPS (Alexandre)
>  - mitigate flash wear by deferring writes due to clock drift until
>    shutdown
>
> Changes since Jonathan's X1E series v3 [3]:
>  - tweak qcom,no-alarm binding update (and drop Krystzof's Reviewed-by ta=
g)
>  - drop no-alarm flag and restructure probe() to clear feature flag befor=
e
>    registering RTC
>  - use UEFI variable offset on X1E
>
> [1] https://lore.kernel.org/lkml/20230126142057.25715-1-johan+linaro@kern=
el.org/
> [2] https://lore.kernel.org/lkml/20230202155448.6715-1-johan+linaro@kerne=
l.org/
> [3] https://lore.kernel.org/lkml/20241015004945.3676-1-jonathan@marek.ca/
>
>
> Johan Hovold (5):
>   dt-bindings: rtc: qcom-pm8xxx: add uefi-variable offset
>   rtc: pm8xxx: add support for uefi offset
>   rtc: pm8xxx: mitigate flash wear
>   arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
>   arm64: dts: qcom: x1e80100: enable rtc
>
> Jonathan Marek (2):
>   dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
>   rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm
>
>  .../bindings/rtc/qcom-pm8xxx-rtc.yaml         |  11 +
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  11 +-
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi  |   4 +-
>  drivers/rtc/rtc-pm8xxx.c                      | 194 +++++++++++++++---
>  include/linux/rtc.h                           |   1 +
>  5 files changed, 185 insertions(+), 36 deletions(-)
>
> --
> 2.45.2
>
>

Tested this on the Thinkpad X13s, as well as booting it into Windows
and verifying that it has the correct clock both ways, which it does.
Thank you!

Tested-by: Steev Klimaszewski <steev@kali.org>

