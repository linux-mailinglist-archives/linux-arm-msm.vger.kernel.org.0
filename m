Return-Path: <linux-arm-msm+bounces-63293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E96AF05EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 23:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0270F441EE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 21:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBFD26D4E5;
	Tue,  1 Jul 2025 21:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="pp9qTw7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF4D266591
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 21:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751406513; cv=none; b=pXd+w6yNwRu5nlhlzQBX0Y3+3vGKrk2PuyIIRuv+qIx/iPVo6bzvf3BfQHpxq9SOrSoiSMa2Qr1dtg/5ahlDTZyX4ztoZTA8J3vm76PSidb3uA/Xh4PBegMHqgAzaXvMWIhsB9JE9swlgIM37f7+PLgwdL5jdw1/ZJF18CN7ut0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751406513; c=relaxed/simple;
	bh=CNQeL0AVKKXXQObalktsPXjZ3U3vEt/CVME5p+04xrs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ts5K0sqpXz/VaPsmH+gFT5+o8KPIsGwPRHpSIJdlQEuRNzAoAD9imPZAXXpffkrkYDLw0K4mH1l9kWCnaE7Q8cBkQYaNyVVk4iTvwBnM7m0fqxMIYKJXZmnmDGG0SoKG4lWX9sm733PPUmp/rkrCXnqpli9H14Lq7vByEu6vQ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=pp9qTw7E; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <266fdeb50ba3926a3edbda71201ffa021afecd62.camel@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1751406499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNQeL0AVKKXXQObalktsPXjZ3U3vEt/CVME5p+04xrs=;
	b=pp9qTw7ESFqxrGZMSW/YWxUvgzUZ9Z9V2uY85UnxjMqygmm2ZQmGzjGY2PaAJdehfKIQXy
	Susdp+6wxB/qvC4Ddv0hqzQ3XPa70Pyr2kyyMahnfRHMIWUPgxVs6kOixR7QkLiYaa8Nvk
	nr/+NFaPBdylhzdWHp2Co3ggaE86H3R5SRN1jrYGNSkyv8CGlXOuDosIk/iWYVjQ0Eu/Jt
	/fUFPBn2HCBQBRY+XW7NQC3joi9lVBas7SxaRZ4rLmIBaWlPvuzTvbvpPG/+Rx/sCUOHqx
	L/Jh2NQ/3qcyAvtYU4QyUsunaEZl89zN7FCj7Da0N7f9gkUo/lvoD3AWLljGCQ==
Subject: Re: [PATCH 0/3] Add x1e Dell Inpsiron 14p
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, Bryan O'Donoghue	
 <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 01 Jul 2025 18:48:07 -0300
In-Reply-To: <86116ada-51e6-4eef-bff1-f8b10a5edacc@gmail.com>
References: 
	<20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
	 <86116ada-51e6-4eef-bff1-f8b10a5edacc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT

On Tue, 2025-07-01 at 22:43 +0200, Aleksandrs Vinarskis wrote:
>=20
> On 4/24/25 01:53, Bryan O'Donoghue wrote:
> > Add in a dtsi for the Dell Inspiron 14p.
> >=20
> > I'm currently using this as a daily driver including sending this
> > series
> > from. Its reasonably stable on 6.15-rcX.
> >=20
> > The first two patches can be applied without dependency, the final
> > patch
> > relies on patches staged for -next in the media tree to be applied,
> > presently.
> >=20
> > https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/2a=
b7f87a7f4bf392e3836a2600f115a1baa1415c
> > https://lore.kernel.org/linux-media/20250407-b4-media-comitters-next-25=
-03-13-ov02e10-v4-0-211e3e6fae90@linaro.org/
> >=20
> > Working for me included in this series:
> >=20
> > - USB
> > =C2=A0=C2=A0 Both Type-C USB ports
> > =C2=A0=C2=A0 Type-A port
> > =C2=A0=C2=A0 Fingerprint reader
> > - WiFi
> > - Bluetooth
> > - RGB Camera
> > - Toucpad, keyboard
> > - Display
> >=20
> > Working for me but not included:
> > - Audio jack
> > - Iris
> >=20
> > Not working:
> > - Speaker output
> > =C2=A0=C2=A0 Still WiP haven't touched this in a while
> >=20
> > - Battery
> > =C2=A0=C2=A0 Dell has its own Embedded Controller likely from the x86
> > platform reused
> > =C2=A0=C2=A0 on Qcom which we need to reverse engineer or get some
> > information on to
> > =C2=A0=C2=A0 make faster progress on.
> >=20
> > - cDSP
> > =C2=A0=C2=A0 Haven't tried to bring this up.
> >=20
> > - EVA
> > =C2=A0=C2=A0 No driver haven't tried it.
> >=20
> > - Bugs
> > =C2=A0=C2=A0 Occasionally when resuming I get a fencing error with hype=
rlock
> > and
> > =C2=A0=C2=A0 freedreno, TBH it looks like something in the GPU or SMMU
> > according to
> > =C2=A0=C2=A0 Rob Clark: https://pastebin.com/AWjCyaap
> >=20
> > =C2=A0=C2=A0 Ath12k has been splatting for me up to 6.14 when removing =
a
> > SSID.
> > =C2=A0=C2=A0 I switched on ath12k debug when going to 6.15 and predicta=
bly
> > couldn't
> > =C2=A0=C2=A0 reproduce the bug, either because the timings have changed=
 as a
> > result
> > =C2=A0=C2=A0 of Heisenbugging or because a fix has been slipped into at=
h12k.
> >=20
> > =C2=A0=C2=A0 Other than those two I'm pretty happy with this system.
> >=20
> > =C2=A0=C2=A0 The DTS is based on Aleksandrs Vinarskis XPS, Lenovo T14s =
and
> > Qcom CRD.
> > =C2=A0=20
> >=20
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>=20
> Hi,
>=20
> Just noticed that the device name is misspelled in a few occasions,
> need=20
> to s/inspirion/inspiron/. DT filename is wrong, model name in DT is=20
> wrong, one of commit messages is wrong. Firmware paths and compatible
> in=20
> DT are correct.

(BTW, in this submission in particular, firmware paths are not
consistent with existing models: the XPS uses lowercase 'dell')

> Otherwise, is the plan to wait for CAMSS to land, and then land this=20
> one, or perhaps the rest of it can go in already? There is also
> Latitude=20
> that was recently submitted which is very similar, perhaps those
> should=20
> be unified (CC: Val), probably easier to do if Inspiron lands first.
>=20

I have a unified patchset pretty much ready to go since yesterday.
With the way I have it, landing any one of the non-unified
submissions would only increase churn. I'll submit it now.

> Regards,
> Alex
>=20
> > ---
> > Bryan O'Donoghue (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: arm: qcom: Add Dell I=
nspiron 14 Plus 7441
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: qcom: Add support for =
X1E80100 Dell Inspirion 14
> > Plus 7441
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: qcom: x1e80100-dell-in=
spiron14-7441: Switch on
> > CAMSS RGB sensor
> >=20
> > =C2=A0 Documentation/devicetree/bindings/arm/qcom.yaml=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0 arch/arm64/boot/dts/qcom/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0 .../qcom/x1e80100-dell-inspirion-14-plus-7441.dts=C2=A0 | 1490
> > ++++++++++++++++++++
> > =C2=A0 3 files changed, 1492 insertions(+)
> > ---
> > base-commit: f7570505263aff2b63142f0d68fa607cd60eb060
> > change-id: 20250417-qcom-linux-arm64-for-6-16-dell-inspiron14p-
> > ed68cd65ebad
> >=20
> > Best regards,

