Return-Path: <linux-arm-msm+bounces-77857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BDCBEC68A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 05:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 118604E1D78
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 03:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A2727FB3C;
	Sat, 18 Oct 2025 03:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b="MYBKEFOT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C732737F3;
	Sat, 18 Oct 2025 03:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760759042; cv=none; b=unGGxIlyjaRL0eB5Yn3JJC8mmv+M3Q7Ps7zhywjwHyVt4d9Qx63yAw12+nnldsMfuGmYaK1RtWYqQh2os3eHvjpxc6N1Wnmp+4soMU2HKzoMLCsQ3pMovAxToT1WrpzowNejPV38D4CksfqUiF/35Tu2Dx2rbole5ozApGSLiuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760759042; c=relaxed/simple;
	bh=QUvK43uEdjp4VgrEbeSeV/3sAkcsewJcyFAAteaMPL8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MAS6Gnm1ZhUo4sBpKpcleGrFRtL2e6f4murtWcMK866E/O/yhmwS1Id0JWgiPcJ2I+fxvqcOF/3C6jz4UZ9HLR5LoG3nHCq+6zQuDRzpJ55JkANtOe4DnK/HDR4YECswl72rVO2zB2RfY9aVwFgkidDBAa+H9nthM9JTupVtmnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com; spf=pass smtp.mailfrom=joelselvaraj.com; dkim=pass (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b=MYBKEFOT; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelselvaraj.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=joelselvaraj.com;
	s=protonmail3; t=1760759024; x=1761018224;
	bh=QUvK43uEdjp4VgrEbeSeV/3sAkcsewJcyFAAteaMPL8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MYBKEFOTulr7k4atKLGtbTazwgyQyOzwgxJNoO5VPW1L8mlcfNXOsRBI3EKeGxeAC
	 X6pjklk0eWWFemYdVQgkvgcUcGfa8ks6Gtk/KaLltGGznvVi2dJxfu+fPbO1qifQ1I
	 rvabCdNzC8izkTuuleXrmUBNB2e6YZ5+NoioC5HycjWuYWnCiUr+jIr+aiFsjTXwDs
	 w9jGhO0bdCBnswuseFXUkxivmaCiTV/yzUldp0hbrxFP0c68LOiOtn58+SVcuVMcpz
	 SlVn0zmr9SAUlEEvCq5yQ1q2uH2girHmImKuDDidsVw3bleOTxxH9+zFiUpgLaInU7
	 2OxRqVO61r5vQ==
Date: Sat, 18 Oct 2025 03:43:39 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: fix touchscreen properties
Message-ID: <2a014801-e1ef-47fa-b067-9b566b9d523e@joelselvaraj.com>
In-Reply-To: <8fd387f5-5b4c-48ea-aa3e-f453ddd5b159@oss.qualcomm.com>
References: <20250919-shift-axolotl-fix-touchscreen-dts-v1-1-60e26ad4e038@joelselvaraj.com> <8a5eecdd-d80f-4955-8ab7-cf6fd991a3b7@oss.qualcomm.com> <267eb29d-b506-43df-9380-3d79798c772c@joelselvaraj.com> <8fd387f5-5b4c-48ea-aa3e-f453ddd5b159@oss.qualcomm.com>
Feedback-ID: 113812696:user:proton
X-Pm-Message-ID: 265feb92edfb20b0e6fde8ba253ef90a0d453330
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Konrad Dybcio,

On 10/17/25 4:57 AM, Konrad Dybcio wrote:
>>> All the changes look good given your commit message, but you dropped
>>> this wakeup-source property without explanation. It's fine to do so
>>> if it's intended, but please mention it if so
>>
>> In reference to the touchscreen/edt-ft5x06.c driver which is used here,
>> I am bit confused how wakeup-source works. Does specifying wakeup-source
>> in dts automatically makes "device_may_wakeup(dev)" return true, even if
>> device_init_wakeup is NOT configured in the driver? I noticed some
>> drivers do:
>>
>> device_init_wakeup(dev,device_property_read_bool(dev, "wakeup-source"));
>>
>> but the edt-ft5x06 driver doesnt do the init, but directly checks for
>> may_wakeup in suspend/resume.
>>
>> Few scenarios based on the driver code and my understanding:
>> 1. if device_may_wakeup will return true when wakeup-source is
>> specified, I probably want to just remove it, because irq and regulator
>> is not disabled during suspend and this will likely cause power drain.
>=20
> I think this may be the case
>=20
>> 2. The driver has an option to specify wake-gpio. In which case, the
>> touchscreen is put in some low power hibernate mode with irq and
>> regulators still enabled. But the touchscreen controller used in this
>> device doesn't seem to have support for a wake-gpio (atleast based on
>> downstream code). So that is not an option.
>=20
> IIRC Shift was pretty open about development collaboration.. maybe you
> could reach out to them to confirm on schematics that the GPIO is
> absent?
>=20
>> 3. if device_may_wakeup will always return false since
>> device_init_wakeup is not configured and since no wake-gpio is
>> available, the irq and regulators will be disabled during suspend.
>> Therefore, the device will not wake up from sleep even if wakeup-source
>> is specified as the irq is not going to be triggered.
>>
>> So probably no point in specifying wakeup-source either way I think? But
>> I am not sure which of these explanation is correct and thus not sure
>> what to mention in the v2 patch commit message. Also, there is a
>> possibility I am not understanding something. A little help from someone
>> will be very nice and sorry if I am obviously missing something.
>=20
> I think this is intended for things like double-tap-to-wake, which
> obviously need some hw backing if you don't want to just keep the
> touchscreen online at "full power" 24/7
>=20

Yeah. I think I will remove the wakeup-source for now to avoid potential=20
battery drain. Once I get more info on wake-gpio/low-power mode and test=20
with users that tap-to-wake work as expected, it will be added. For now,=20
this is not something expected to be working. Will send a v2 with=20
updated commit message.

Thank you,
Joel Selvaraj

> Konrad



