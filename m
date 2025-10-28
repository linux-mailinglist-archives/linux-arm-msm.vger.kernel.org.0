Return-Path: <linux-arm-msm+bounces-79227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A38F2C15C2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E1CE188D428
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD98347FF7;
	Tue, 28 Oct 2025 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NeHsIFwW";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="2vHSlY3r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E82A33A024;
	Tue, 28 Oct 2025 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668062; cv=none; b=gPYWDXEzF1MjszI9ANPgBigmB1zeAkVRqg6VxTJ3ANENPvwBIzexHMgf42EeEAEazgyULicjvUyAmRQ/KYvGWwbeBro8viTu+tM9uG9Zcx+DL0qQU5sAu1SIJQsAbXFJHyph0iKFALJvGKipYzydw3dQYNY9fg7i/5IzKBAdl4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668062; c=relaxed/simple;
	bh=MUfAw+CEWCmi/k34obocl0dnwHMT1lqx/Pq21CoUC58=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=d59fS1lDWQg6AiDouJLQgnnWvq3KBet4/mmd7nqbk2PT3IbZ+/Zif0666sQ2V3emKwm9VoIHjuU8gw2ClXbU0iQNjgob+aO7qHOslV0In5JLDYrLLn/QvS7iffDo6F8i+5GL215fQWFQxHX046hI8TWyERIXyTIg5s4Z68U3iRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NeHsIFwW; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=2vHSlY3r; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1761668024; bh=UzHugUE4P/e8xKLy23qcD4u
	xe9eMeMh43cCYTpyYyXk=; b=NeHsIFwW9HcKT0PR4KovvtWCrYAFj63P1CQq+KM0wBuwKHJ5YW
	nWJktFL5JBL7S/76aXRnRV+3+KHAhknUa0QsFGp41XdcxXd+PlIi2JOKLcQvkLtNt4TDK2W+61X
	xFL4gXZZesOUbuzj869KNplBcwIREFtXdtm2BLGIdxzn7F4u0GjzA1al33s8oAwleP/6yCRI0+Z
	xkIVNNlnMgn2VBepKK1iS1Si1hg8OZJja2qJSjTLvTOZBv4ZVsv8Tdm/4qN3CZV306wvS0u7/YU
	C6PTL18jNUjP7pe70oOtLDgrSsnACgfu7Bgy/liZQZ1b8zOXnWuD0L+Tx3JNRX4lSWw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1761668024; bh=UzHugUE4P/e8xKLy23qcD4u
	xe9eMeMh43cCYTpyYyXk=; b=2vHSlY3rAlhU8iqQUTFYwhYRHXGUycY6tXgFrOeMabXEq5stL0
	eYM9qmvrDFltdpzU85Os568J2jbmN2K01QAA==;
Date: Tue, 28 Oct 2025 21:43:43 +0530
From: Piyush Raj Chouhan <pc1598@mainlining.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/2=5D_arm64=3A_dts=3A_qcom=3A_sm815?=
 =?US-ASCII?Q?0=3A_Add_support_for_Xiaomi_Redmi_K20_Pro?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ccdd5d44-2382-44e9-a56d-cbc5da23b13f@oss.qualcomm.com>
References: <20251022054026.22816-1-pc1598@mainlining.org> <20251022054026.22816-2-pc1598@mainlining.org> <ccdd5d44-2382-44e9-a56d-cbc5da23b13f@oss.qualcomm.com>
Message-ID: <5C7DC3D9-8DBB-409C-8672-6388EE01C320@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, konrad=20


>> +
>> +&i2c19 {
>> +	/* goodix,gt9886 @5d  */
>
>I see there's driver support for the GT98*97* - is there a chance you can
>reuse some of it?
>

I am currently testing touch on gtx8 driver which currently is in lkml, on=
ce its merged we could add support for it=2E

https://lore=2Ekernel=2Eorg/linux-input/20250918-gtx8-v1-0-cba879c84775@ma=
inlining=2Eorg

[=2E=2E=2E]
>> +	connector {
>> +		compatible =3D "usb-c-connector";
>> +		power-role =3D "source";
>> +		data-role =3D "dual";
>> +		self-powered;
>> +
>> +		source-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
>> +					 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
>
>Have you verified this is in line with your specific device's
>downstream kernel?

Yes i have verified it=2E

[=2E=2E=2E]
>> +&pm8150l_lpg {
>> +
>> +	status =3D "okay";
>
>ditto> +	led@1 {
>> +		reg =3D <1>;
>> +		color =3D <LED_COLOR_ID_WHITE>;
>> +		function =3D LED_FUNCTION_STATUS;
>> +
>> +		status =3D "disabled";
>
>?

Raphael doesn=E2=80=99t have a white LED=2E I missed cleaning that=2E I=E2=
=80=99ll remove it in the next revision=2E

>
>> +	};
>> +
>> +
>> +	led@2 {
>> +		reg =3D <2>;
>> +		color =3D <LED_COLOR_ID_RED>;
>> +		function =3D LED_FUNCTION_STATUS;
>> +		function-enumerator =3D <0>;
>> +	};
>> +
>> +	led@3 {
>> +		reg =3D <3>;
>> +		color =3D <LED_COLOR_ID_RED>;
>> +		function =3D LED_FUNCTION_STATUS;
>> +		function-enumerator =3D <1>;
>> +	};
>
>Are there really two separate red LEDs?

Yes, it has popup camera with an LED on both side, i have verified functio=
nality of both LEDs=2E=20


[=2E=2E=2E]
>
>> +&usb_1_dwc3 {
>> +	dr_mode =3D "otg";
>> +	maximum-speed =3D "high-speed";
>> +
>> +	/* Remove USB3 phy */
>> +	phys =3D <&usb_1_hsphy>;
>> +	phy-names =3D "usb2-phy";
>
>Is this a physical limitation, i=2Ee=2E missing wires?

Yes it is a physical limitation and downstream configured it similarly,

[=2E=2E=2E]

Thanks for all the rest of improvement suggestions=2E

Best regards
Piyush Raj Chouhan

