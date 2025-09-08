Return-Path: <linux-arm-msm+bounces-72662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9891FB49C7C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 23:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 538C33A7F18
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E82A2E62A4;
	Mon,  8 Sep 2025 21:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LF7dlFDI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720CC1C863B;
	Mon,  8 Sep 2025 21:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757368794; cv=none; b=QogpHh7wI42Rvp+4m6ur10VXaHm2XrCw7PuLfNnJ6j9bqh9FD3GzU4QzekKWFJbiP0E/ukUsMMWhJW8ugeIHiqrxUpcdD0hBgHiP639u8EcXrThBgRCBa963iO5dsfur7vho5f0mq4kj+rCRBZeXlNgO3Cm0oXv8oOMOuSPHRn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757368794; c=relaxed/simple;
	bh=pcF4XTkfaUSr501beAEhTtxZ4XbyrQgb5NrCV68riMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avdKpwQi6tiLafEmpI6NT3aThXYyqo21T7Cx5MB65s49k//FWoK6pfJG+65UuO6ILHQJZi6HHCux52g0SMT2ZIMx7q6Zpa/lWCy0nxQOETyd+KPAnbBoDiIMUFWDhSS+Rs9Lnc6PMnxRTJVbKPRmfRp/iXqt0SRFC2+ijLzj0Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LF7dlFDI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAAE2C4CEF7;
	Mon,  8 Sep 2025 21:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757368793;
	bh=pcF4XTkfaUSr501beAEhTtxZ4XbyrQgb5NrCV68riMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LF7dlFDIec05cBgnVwxuxzoPA9lzwFIN7E4r1Czq8H/zWMtRppnYjb86LObWJMAla
	 QIb5LV7exXDnBK6CkPoZZMNsxkZz+nTFuLmEsKfaJlTTel6NQz2S8RorNT4hcf94Kd
	 PSMDOFekS3F1n/83o/BqNnZhsBBrKv3wyoG1M4bSFlJ5M4xG7Y8p7UtdJ2ZwR9zT8l
	 Ni7CG3qNIa/bgSxUX5McQtF+hucb7jFTDeViD7qE23qHsu8jNG9jdTdkyhigkqQALS
	 TpoaJNphMRb7u6Oo8zeQZCt6ApVotucTqmrrlwdwpPvsYXNEddAJDb2fCg0J8w6JfW
	 rZLmq2Ftfk08A==
Received: by venus (Postfix, from userid 1000)
	id B0FCA180B26; Mon, 08 Sep 2025 23:59:51 +0200 (CEST)
Date: Mon, 8 Sep 2025 23:59:51 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] platform: arm64: thinkpad-t14s-ec: new driver
Message-ID: <kshw3zf3rbpc4ytb6ofucannuv2uax6lz74q53qs73xcbxpl5z@qr6mgnj6olkm>
References: <20250906-thinkpad-t14s-ec-v3-0-3ce6ec21ae89@collabora.com>
 <20250906-thinkpad-t14s-ec-v3-2-3ce6ec21ae89@collabora.com>
 <f16a858d-fb41-4cc9-a138-7bfe5ee2800f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b42yzd7r3ovd6qno"
Content-Disposition: inline
In-Reply-To: <f16a858d-fb41-4cc9-a138-7bfe5ee2800f@oss.qualcomm.com>


--b42yzd7r3ovd6qno
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] platform: arm64: thinkpad-t14s-ec: new driver
MIME-Version: 1.0

Hi,

On Mon, Sep 08, 2025 at 09:28:12AM +0200, Konrad Dybcio wrote:
> On 9/6/25 3:12 AM, Sebastian Reichel wrote:
> > Introduce EC driver for the ThinkPad T14s Gen6 Snapdragon, which is in
> > theory compatible with ThinkPad ACPI. On Linux the system is booted with
> > device tree, which is not supported by the ThinkPad ACPI driver
> > (drivers/platform/x86/lenovo/thinkpad_acpi.c). Also most of the hardware
> > compatibility is handled via ACPI tables, which are obviously not used
> > when booting via device tree. Thus adding DT compatibility to the
> > existing driver is not worth it as there is almost no code sharing.
>=20
> [...]
>=20
> couple nits, feel free to ignore

I will do a v4 adding events for thermal zone status update (just
debug prints for now), as I noticed the unknown event id messages
in my dmesg after doing a full kernel compile.

> > +#define T14S_EC_EVT_NONE			0x00
> > +#define T14S_EC_EVT_KEY_FN_4			0x13
> > +#define T14S_EC_EVT_KEY_FN_F7			0x16
> > +#define T14S_EC_EVT_KEY_FN_SPACE		0x1F
> > +#define T14S_EC_EVT_KEY_TP_DOUBLE_TAP		0x20
> > +#define T14S_EC_EVT_AC_CONNECTED		0x26
> > +#define T14S_EC_EVT_AC_DISCONNECTED		0x27
> > +#define T14S_EC_EVT_KEY_POWER			0x28
> > +#define T14S_EC_EVT_LID_OPEN			0x2A
> > +#define T14S_EC_EVT_LID_CLOSED			0x2B
> > +#define T14S_EC_EVT_KEY_FN_F12			0x62
> > +#define T14S_EC_EVT_KEY_FN_TAB			0x63
> > +#define T14S_EC_EVT_KEY_FN_F8			0x64
> > +#define T14S_EC_EVT_KEY_FN_F10			0x65
> > +#define T14S_EC_EVT_KEY_FN_F4			0x6A
> > +#define T14S_EC_EVT_KEY_FN_D			0x6B
> > +#define T14S_EC_EVT_KEY_FN_T			0x6C
> > +#define T14S_EC_EVT_KEY_FN_H			0x6D
> > +#define T14S_EC_EVT_KEY_FN_M			0x6E
> > +#define T14S_EC_EVT_KEY_FN_L			0x6F
> > +#define T14S_EC_EVT_KEY_FN_RIGHT_SHIFT		0x71
> > +#define T14S_EC_EVT_KEY_FN_ESC			0x74
> > +#define T14S_EC_EVT_KEY_FN_N			0x79
> > +#define T14S_EC_EVT_KEY_FN_F11			0x7A
> > +#define T14S_EC_EVT_KEY_FN_G			0x7E
>=20
> Please use lowercase hex consistently across the file
>=20
> [...]

Changed in v4.

> > +enum thinkpad_t14s_ec_led_status_t {
> > +	T14S_EC_LED_OFF =3D	0x00,
> > +	T14S_EC_LED_ON =3D	0x80,
> > +	T14S_EC_LED_BLINK =3D	0xc0,
>=20
> These conveniently translate to: BIT(7) and BIT(6)|BIT(7), meaning
> BIT(7) could mean "ON" and BIT(6) could mean "pulse" (can you pulse
> a disabled LED? arcane secrets..)

FIELD_PREP would also be an option, but I don't think this becomes
more readable by using either and kept this as-is.

> [...]
>=20
> > +	if (brightness =3D=3D LED_OFF)
> > +		new_state =3D T14S_EC_LED_OFF;
> > +	else if (led->cache !=3D T14S_EC_LED_BLINK)
>=20
> =3D=3Ds are easier to logically follow than !=3D, but this is totally
> potayto/potahto
>=20
> [...]

Changed in v4.

> > +static int thinkpad_t14s_led_blink_set(struct led_classdev *led_cdev,
> > +				       unsigned long *delay_on,
> > +				       unsigned long *delay_off)
> > +{
> > +	struct thinkpad_t14s_ec_led_classdev *led =3D container_of(led_cdev,
> > +			struct thinkpad_t14s_ec_led_classdev, led_classdev);
> > +
> > +	if (*delay_on =3D=3D 0 && *delay_off =3D=3D 0) {
> > +		/* We can choose the blink rate */
>=20
> "can't"?

I will change this to:

"Userspace does not provide a blink rate; we can choose it"

> Needless to say, amazing work on piecing all this together,
> Sebastian!

Thanks. Btw. I tried the suspend logic from your X13s EC driver as
the ACPI DSDT ECNT functions are exactly the same for X13s and T14s
and you obviously got the logic from there. But I haven't noticed
any difference and the PM handler is commented out in your driver.
Thinkpads typically have a breathing animation on their power and
LID leds when the machine is suspended. My expectation is, that the
EC enables at least this animation when being programmed correctly.

Greetings,

-- Sebastian

--b42yzd7r3ovd6qno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmi/UdQACgkQ2O7X88g7
+priXQ//UJN4u610JRMKybsrPycmlYGKHFJl87pyIrZfaQykkmH48LxrKrbP71qG
T9e/NWDXuIiJc58+Lc9hrEx8OcFtR3Bg9xAI75ydiu4J46JjgRFQeAlLdhmz6e1W
qSNgrbh7n3V4UL1nJk9FI1PM+8XZ5D+F7/Sje2Sh8hvm+PA0PCUIDHkMzuylYdPt
F6HQv8M+RIDsKzDORP2TfDnOo4SL0i+prRGZ2lC6e4vidWPXXMfe5+zLmJrPbYHa
gsH7zzIEa0zI5UG3VCvxb5DJLfUOybjIr4hSYZMdPhV6k2AsikQYa8l7CVcH0IDz
EB0xwrNs36fYgW9WxerByOAQm9vcshV1otCYMBPtqrOtOD1bqEwyYKTW+Zrk0BRr
PMvKHqSPXc662xnbjLa/nfxsuNWTv4dXVY3zWzW2YCB1E1rDWu755RDArdEPGvSd
o3qN4BurUXc2fEqk2Soiz5MfIwRZTm2gLfmSH9gDLvlK9ZTU3UamS9KeOT3GXxxu
RPXdsDpfojWigdzxZmMwL/wu2vY95jeYtlLaFKslPdggkLLAgK7phcF6O9MmlDH4
cO6HTc4ukH9f/MvpvjNxwpuHPQ14JEW5Nn+0agsJpulqBhv0hTMhQT5Iex10AuYd
ElZf4Pkq/XnseDDmZkao9sNVydIJhOXr+IVcFFVbT9EqKM+ryZs=
=xR/1
-----END PGP SIGNATURE-----

--b42yzd7r3ovd6qno--

