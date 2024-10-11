Return-Path: <linux-arm-msm+bounces-34141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E616499A856
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 17:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49D56B23D7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C639198827;
	Fri, 11 Oct 2024 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nw8hTQtL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58901974FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728661920; cv=none; b=SkWYsO1PzKgwtKvKBjw2J5Xphq6RR0V0N8c4mkwe+/dnMFEuuRJY6tx3eHbLZ44K2k+IllsT9bbmBC2GEIxO4bB0kNwK3BaJpXEgFkkg/sx6z4mUlITp7oz91pT4pQFRaaw8B7QVTkObGQr21Aqj1frNIb5PPFbEyyk2rwtgosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728661920; c=relaxed/simple;
	bh=6UJ5GfwpBYKShxF2d6ibtYkVLCghlD4ehemd7bRZPRs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Czxck6aEpioOa5M1VQT+VRpiYEJWlBKIYQtg+OQ4k35mO1gB14MeVGClFs8VlFWWWoIUI/iYBXFiDrA+oh4bQEDA7YSFIEMfXBGH9gZx9jfo5ynLG59jsA7xgutcSGWd1bRTx3r6InQK/Yl34Pa9XGroOt2xa3kFjEpI/t2v0Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nw8hTQtL; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71df468496fso2039868b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728661918; x=1729266718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6UJ5GfwpBYKShxF2d6ibtYkVLCghlD4ehemd7bRZPRs=;
        b=nw8hTQtLMCR1zTRkDSARTuQO8Rk0hHeTUkmra//YKKaCiqM/0EkcleWLPYOV00jJTE
         KM+1cv6UaFDxRcYfDxHaq2lXFHfSWhIZSIqIVNTQBaqnTPgSzRL4v7YEyT4yZ09fwoSK
         cfQ01L/z73KUAjbS+kZKdJhipZz8STpzPYNu47PjIGoN19HTIZwjfJ2+QiKBev+Sayok
         h8xi6qDiJGj2KpdttPAlGR0QxOY61Ek/ZxPMKqja1sDL2czQutL2xcU1Rb2w5nphH4Zo
         zQKxfHqXsBnDlZVFfBOUc6IpIGLGOzcdw7EhJVza6ar0yMkRxRNMtvWnl2XEoOGxUhZp
         HSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728661918; x=1729266718;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6UJ5GfwpBYKShxF2d6ibtYkVLCghlD4ehemd7bRZPRs=;
        b=GZy8fP957aWbMC0R0gbaQutCxHKGjYZEvuSs7svHgK9rwsP4lSB9p4R39drFPAk5Uh
         fmViJE0hJPAhAwcwW28a81m8reRurxKVjKb/tXjnAfTnpNqg0f3y7fGdZu6NseDAUUxH
         K/smut+WYwgtlnM+scHPh1eNRirObaYry++H8b483H4lzs7ZohcWhc9GOhAMKpZeBZQE
         NhrTalHC59gd/OXap5w8vedqpG4CxEgKsmktPXHCDpj3KaS6pPdTK1FNWgP3T+MEvOU8
         6I68/kBH2H4JoOJLFLqgSvfoDFfrcALM+T0OgVLfQJMAXw9+F9e45lcAlNK8GBZ49I7Q
         IN6A==
X-Forwarded-Encrypted: i=1; AJvYcCVqP2Wh4occlDLjxxVBz6GXbrkTrTCmICF61TkeGV/sn+gm0iGvryhYO3KIzRxqdKsDLnWYrjuMAbfN0lgV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xpQTnacvda6fWCEUOgzHt5a+V07l2NMfTOwpCuOuNo7SR189
	I9F/W0/rO0WBjj1BJ1FAnSTlMYngnXcNNjs6E1XEwd5oT7vOfa87XYKlF9+G/w==
X-Google-Smtp-Source: AGHT+IHXvP/nKJu6nisjXBaSGstPi/m/Ba9L/ypRCiSYdHmZq63iI93hDiL09yEy4Wy2zLj7/L28Xg==
X-Received: by 2002:a05:6a00:2d9b:b0:714:1ca1:7134 with SMTP id d2e1a72fcca58-71e37f4eefdmr4698954b3a.18.1728661918079;
        Fri, 11 Oct 2024 08:51:58 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.17.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e3ad716d4sm1248518b3a.200.2024.10.11.08.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:51:57 -0700 (PDT)
Date: Fri, 11 Oct 2024 21:21:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Qiang Yu <quic_qianyu@quicinc.com>
CC: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, abel.vesa@linaro.org,
 quic_msarkar@quicinc.com, quic_devipriy@quicinc.com,
 dmitry.baryshkov@linaro.org, kw@linux.com, lpieralisi@kernel.org,
 neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_3/8=5D_dt-bindings=3A_PCI=3A_qc?=
 =?US-ASCII?Q?om=2Cpcie-x1e80100=3A_Add_=27global=27_interrupt?=
User-Agent: K-9 Mail for Android
In-Reply-To: <3d1d0822-da66-44c8-a328-69804210123c@kernel.org>
References: <20241011104142.1181773-1-quic_qianyu@quicinc.com> <20241011104142.1181773-4-quic_qianyu@quicinc.com> <eyxkgcmgv5mejjifzsevkzm2yqdknilizrvhwryd745pkfalgk@kau4lq4cd7g3> <4802B12B-BAC1-4E99-BDFE-A2340F4A8F24@linaro.org> <3d1d0822-da66-44c8-a328-69804210123c@kernel.org>
Message-ID: <65B34B14-76C3-491D-8A58-6D0887889018@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 11, 2024 9:14:31 PM GMT+05:30, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
>On 11/10/2024 17:42, Manivannan Sadhasivam wrote:
>>=20
>>=20
>> On October 11, 2024 8:03:58 PM GMT+05:30, Krzysztof Kozlowski <krzk@ker=
nel=2Eorg> wrote:
>>> On Fri, Oct 11, 2024 at 03:41:37AM -0700, Qiang Yu wrote:
>>>> Document 'global' SPI interrupt along with the existing MSI interrupt=
s so
>>>> that QCOM PCIe RC driver can make use of it to get events such as PCI=
e
>>>> link specific events, safety events, etc=2E
>>>
>>> Describe the hardware, not what the driver will do=2E
>>>
>>>>
>>>> Though adding a new interrupt will break the ABI, it is required to
>>>> accurately describe the hardware=2E
>>>
>>> That's poor reason=2E Hardware was described and missing optional piec=
e
>>> (because according to your description above everything was working
>>> fine) is not needed to break ABI=2E
>>>
>>=20
>> Hardware was described but not completely=2E 'global' IRQ let's the con=
troller driver to handle PCIe link specific events like Link up, Link down =
etc=2E=2E=2E They improve user experience like the driver can use those int=
errupts to start bus enumeration on its own=2E So breaking the ABI for good=
 in this case=2E
>>=20
>>> Sorry, if your driver changes the ABI for this poor reason=2E
>>>
>>=20
>> Is the above reasoning sufficient?=20
>
>I tried to look for corresponding driver change, but could not, so maybe
>there is no ABI break in the first place=2E

Here it is:

https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=2Egit/c=
ommit/?id=3D4581403f67929d02c197cb187c4e1e811c9e762a

 Above explanation is good, but
>still feels like improvement and device could work without global clock=
=2E
>

It is certainly an improvement but provides a nice user experience as the =
devices will be enumerated when they get plugged into the slot (like hotplu=
g)=2E Otherwise, users have to rescan the bus every time they plug a device=
=2E Also when the device gets removed, driver could retrain the link if lin=
k went to a bad state=2E Otherwise, link will remain in the broken state re=
quiring users to unload/load the driver again=2E

- Mani

=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

