Return-Path: <linux-arm-msm+bounces-77696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2DABE6E6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 09:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 631ED3A7048
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 07:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC262311586;
	Fri, 17 Oct 2025 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b="mR9mfrq9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBC123B60C;
	Fri, 17 Oct 2025 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760685211; cv=none; b=cxGdM1WZuhOsW49RKjJYG7uh4S5vjswRA4GYCnJrdEnUQYrF+g5bxp3+t53EVXUzQ78uKV8x6TcmPSzH/bOPO1kgYYhmrA/Z9wIsWfDHjikscRKlrOj9XHmn6+5FoXhI22xA3YRfl2pgtYv8oBRTbC/LtPqs77IK27LS/SM01l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760685211; c=relaxed/simple;
	bh=xN4LN3ZOHc6lC4RDOQKMn7iNewkLfY6kTLmXWvcDkCs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EA85j25kVXRHnwW4Yen1CdHVpJLQh2Lr9ZCx+lwG+4CSbG4GUCB2hHy3Ck5HAQTZKuCdNtC7gXY05/l+vnWQMBwUmTLDIEkFfDssHaBsMCaRrBFVXCQwn+jzFoZpGa42vsZZEhBtAC2RelgFIVaOtckoJJM/V55Vm1Dvqp7/8Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com; spf=pass smtp.mailfrom=joelselvaraj.com; dkim=pass (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b=mR9mfrq9; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelselvaraj.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=joelselvaraj.com;
	s=protonmail3; t=1760685199; x=1760944399;
	bh=XZ0y0x47KXEaW/FqBaoha0+6MvP5HERJCdzBJ7hziJo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mR9mfrq94vGkrvWy0W0qS7mNkXAcgKzI5fuspU/OBawddPbWmnnUO9EaCPdO3M7lX
	 pbH04+99ox3kQ376hpnjs/dlghlmu0pK6Wr2+YZ1YbCRdNfnbsizmaCkH9XkT2RCog
	 apEpkmtspj8lBO1W+zVJrWBKh1+w6b8pyQ87uMgd8m2xAm4oFf51WhEW2C25+iqv9E
	 FhkpPmay678p9OKWR9S6nParXcTtNTTmId8e63uHAJZ/fCl/9Z3K/m1d4AopVckZ9i
	 Pk4+BhahsinbY0ujVYJIQrdSl7IEw7CxWNjxayIxL1Nz06nuuhWpRySu6MqJEG4Ixo
	 OrXiEdzRyH02w==
Date: Fri, 17 Oct 2025 07:13:15 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: fix touchscreen properties
Message-ID: <267eb29d-b506-43df-9380-3d79798c772c@joelselvaraj.com>
In-Reply-To: <8a5eecdd-d80f-4955-8ab7-cf6fd991a3b7@oss.qualcomm.com>
References: <20250919-shift-axolotl-fix-touchscreen-dts-v1-1-60e26ad4e038@joelselvaraj.com> <8a5eecdd-d80f-4955-8ab7-cf6fd991a3b7@oss.qualcomm.com>
Feedback-ID: 113812696:user:proton
X-Pm-Message-ID: cfc2211d903c068688da7ddae29ce3a7fa9c81b6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Konrad Dybcio,

On 10/6/25 9:49 AM, Konrad Dybcio wrote:
> On 9/19/25 11:02 AM, Joel Selvaraj via B4 Relay wrote:
>> From: Joel Selvaraj <foss@joelselvaraj.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 17 ++++++++-------=
--
>>   1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/ar=
m64/boot/dts/qcom/sdm845-shift-axolotl.dts
>> index 89260fce6513937224f76a94e1833a5a8d59faa4..d4062844234e33b0d501bcb7=
d0b6d5386c822937 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
>> @@ -434,20 +434,19 @@ &i2c5 {
>>   =09status =3D "okay";
>>
>>   =09touchscreen@38 {
>> -=09=09compatible =3D "focaltech,fts8719";
>> +=09=09compatible =3D "focaltech,ft5452";
>>   =09=09reg =3D <0x38>;
>> -=09=09wakeup-source;
>=20
> All the changes look good given your commit message, but you dropped
> this wakeup-source property without explanation. It's fine to do so
> if it's intended, but please mention it if so

In reference to the touchscreen/edt-ft5x06.c driver which is used here,=20
I am bit confused how wakeup-source works. Does specifying wakeup-source=20
in dts automatically makes "device_may_wakeup(dev)" return true, even if=20
device_init_wakeup is NOT configured in the driver? I noticed some=20
drivers do:

device_init_wakeup(dev,device_property_read_bool(dev, "wakeup-source"));

but the edt-ft5x06 driver doesnt do the init, but directly checks for=20
may_wakeup in suspend/resume.

Few scenarios based on the driver code and my understanding:
1. if device_may_wakeup will return true when wakeup-source is=20
specified, I probably want to just remove it, because irq and regulator=20
is not disabled during suspend and this will likely cause power drain.

2. The driver has an option to specify wake-gpio. In which case, the=20
touchscreen is put in some low power hibernate mode with irq and=20
regulators still enabled. But the touchscreen controller used in this=20
device doesn't seem to have support for a wake-gpio (atleast based on=20
downstream code). So that is not an option.

3. if device_may_wakeup will always return false since=20
device_init_wakeup is not configured and since no wake-gpio is=20
available, the irq and regulators will be disabled during suspend.=20
Therefore, the device will not wake up from sleep even if wakeup-source=20
is specified as the irq is not going to be triggered.

So probably no point in specifying wakeup-source either way I think? But=20
I am not sure which of these explanation is correct and thus not sure=20
what to mention in the v2 patch commit message. Also, there is a=20
possibility I am not understanding something. A little help from someone=20
will be very nice and sorry if I am obviously missing something.

Thanks,
Joel Selvaraj


>=20
> Konrad
>=20



