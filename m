Return-Path: <linux-arm-msm+bounces-55800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C1BA9D92B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 09:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F81B4C2E88
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 07:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD7B1922D4;
	Sat, 26 Apr 2025 07:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="luyXVycX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A76119AD48
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 07:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745653528; cv=none; b=pTBI1iBjH8+40v8jnxDEC9AMced5YU3z93HVAoC70/pgi+XRQKip5DSjc+YLkPEczJi02Dxgdfh3UKaEwB1AQTGVR8hRLYDvzFifKyoMazqo1W+gU6zR+fURaZeX1LxCRe64l71Gi5xGXeXGvWqFyPAaeDgBICcYcESgAOE6z7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745653528; c=relaxed/simple;
	bh=w8RacVv7kD3lnn+AVvnyUBxmiCMUu8RBJaFo4l2EVyM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iupQp1ft4OtjnANtpGM0ZzchCeQnY608FsereojFRDfafFhJJ4EHj4s+b0p/66qvjJGrVPl1obApEsRvT7MFehoL8uRILR7oDv5Uj1UQR1lmlXna8YoleNEMD2SFbKVNCQSc6fA3f3qx11qMrbo/dkOgehzbN5ArX5XG5wrYT3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=luyXVycX; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 73E6B3F2A9
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745653523;
	bh=xQG8aR91QUiXJqe0zGBSMh1PwbLabEkgq2LJTt+r2Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=luyXVycXjIa2SO5y5jEa/CR1zX3NptRZrTjaACkyul+CJYlD0A9+6wjec1ZkUZ0Jp
	 iq0K6St3V54oJC5SdAVMO3oF7P2vZFOb9M2rC6SkNclDUK3TKkFEZ8gkozOQKcKzwH
	 V5V4JicU2ccRdYp0mgwgfau4hlm8OAkGcZJxBW6+BaRxBT3bdDjHAslcwKmOPiKu5g
	 3hsIfy329X2euI1nAllquTfUOS9ODt030zwBNLapZmSD8GIJebiXA7tfEGAkBHk62o
	 atMC+kOw1TLhEDErQEPTK8uF/h5DSFYCjsmUn/BFVC5EggmiGpZqveVgUXTvdco++N
	 QCzRUQ2cgo2Jw==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac28a2c7c48so240714466b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 00:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745653522; x=1746258322;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQG8aR91QUiXJqe0zGBSMh1PwbLabEkgq2LJTt+r2Gg=;
        b=wRZsnqWt1gdb1Q7PaR9OMAG9ZxCAjpe9Ub366TK24GjrBRFl4NLiu/klPApmmgtjdX
         w/SLEGKlWdwhkPjTWvyqT1wz1DKTnJcXBIdnvSLfG8ZWh5DEwHzO1ZznWJE+iGjJNg/x
         XSQlruZwupb4kXvsZpxWwYSCro55Uy88RwjPHGioH3XFSIyLRMwmFKK5axFuwmiVucaY
         ckyPGHJt5VnoJMWG7Tyieq5V7aFsbOkWDCBo5EcOIYD/aEu51gHTFG57Y/x5vpZd46S7
         tt0eQ7N4jNDN70R9djf6o+2Z64+hdk6j3egY7EXaMqcSIoy5b9IRPlVR8iyjU5HP1X+7
         t+0w==
X-Forwarded-Encrypted: i=1; AJvYcCVv/zv32h5O4wlLZNFICHKzzI4N6ANGSYSfpBoRyuViEff4nl+oExs3LY8Z8jgBvAT6VjX9OE2fvute8NIF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9NyN9KQhS/mceRQ3GUAzTvzHWTwQWE5fIDkZ2VzWXawtU00kB
	m+7Siok380B+BdDFWyTZHsua2A4BAN9Irtp/BQKq8O0voC8+trXMjZ2u25qau19oOQ58Du4UzZ6
	pcLw+YnsFg87ghQhDEtukLrW1bV9O/vu7ITfYeyErXlQQL5G3sBORX+BlIoIHt5M6hwHvOFbnq6
	818y4=
X-Gm-Gg: ASbGncvvfEgJBalcqEU5zaQfDqMM2rZpmr+TFyK080SWU3ld4j1G5rGoIZcLyFyijy0
	CUbX1TO/q45ndhHIpxgikTNgPFLOVy/7SFp4Kz5V8AJhhoGfG1fj0ezNFghHzsIXp7yolJGXYd+
	E5ritANXPxtMAy9k7XnWNKgbT9faXUrpDLe2ffYSW/5h8nCNTzgNrGQA7F0390PYgc/ASoj0o+V
	4ewpHXHSaN1y/wEPMVySEX8Km/MTSRSPY1n++jgpQF3MpZrcsjSTB49Qv4J7ogOHjBc/jisuNVv
	wOXWD8+9NYwLufqeplWD8ctJpG9WnTNOqW9hsCsHyyjuwzXJkHSdHg==
X-Received: by 2002:a17:907:7f92:b0:ac7:4f1:65c5 with SMTP id a640c23a62f3a-ace84b4c6f6mr175863366b.54.1745653522576;
        Sat, 26 Apr 2025 00:45:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFac88syXkSEHa373nY7+k8VjAiVo/ZD5gaPuEp01MgkPmzBDXRMO1qk5C5k/b8KxWKQSeAw==
X-Received: by 2002:a17:907:7f92:b0:ac7:4f1:65c5 with SMTP id a640c23a62f3a-ace84b4c6f6mr175860966b.54.1745653522112;
        Sat, 26 Apr 2025 00:45:22 -0700 (PDT)
Received: from smeagol (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1a48sm256429866b.179.2025.04.26.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 00:45:21 -0700 (PDT)
Date: Sat, 26 Apr 2025 09:45:15 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: add
 sound label and pull out the model
Message-ID: <20250426094515.193e5f59@smeagol>
In-Reply-To: <mit327e4qp3hch4xy6qmqmks35tq5w35rw4ybvs5s3q7osxbkv@bzvon2u3jsmn>
References: <20250408145252.581060-1-juerg.haefliger@canonical.com>
	<20250416094236.312079-1-juerg.haefliger@canonical.com>
	<20250416094236.312079-2-juerg.haefliger@canonical.com>
	<mit327e4qp3hch4xy6qmqmks35tq5w35rw4ybvs5s3q7osxbkv@bzvon2u3jsmn>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bs8.Q+hsXAsnuniQCI/K9Ru";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/bs8.Q+hsXAsnuniQCI/K9Ru
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Apr 2025 22:44:42 +0300
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Wed, Apr 16, 2025 at 11:42:34AM +0200, Juerg Haefliger wrote:
> > Add a label to the sound node and pull out the model name to make it
> > explicit and easier to override it from other nodes.
> >=20
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/ar=
ch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
> > index cd860a246c45..9595ced8b2cc 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
> > @@ -174,9 +174,8 @@ linux,cma {
> >  		};
> >  	};
> > =20
> > -	sound {
> > +	sound: sound {
> >  		compatible =3D "qcom,x1e80100-sndcard";
> > -		model =3D "X1E80100-HP-OMNIBOOK-X14";
> >  		audio-routing =3D "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> >  				"SpkrRight IN", "WSA WSA_SPK2 OUT",
> >  				"IN1_HPHL", "HPHL_OUT",
> > @@ -1691,3 +1690,7 @@ &usb_mp_qmpphy0 {
> > =20
> >  	status =3D "okay";
> >  };
> > +
> > +&sound {
> > +	model =3D "X1E80100-HP-OMNIBOOK-X14";
> > +}; =20
>=20
> Usually the DT don't use this idea. Could you please bring the model
> back to the node? The label is fine.

Hm. Maybe I misunderstood but isn't that what Krzysztof requested here?
https://lore.kernel.org/linux-arm-msm/bb95af7c-5e88-4c6a-87db-2ddd1fe211a5@=
kernel.org/

...Juerg


>=20
> > --=20
> > 2.43.0
> >  =20
>=20


--Sig_/bs8.Q+hsXAsnuniQCI/K9Ru
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmgMjwsACgkQD9OLCQum
Qrd7LQ/4+q4xmthISwE892TSn8RgxS/c7Ti1v75eDFMPcuMXBPnbzt7ZLrRKksFf
jILKVaqj/wxNrGx9xcZPy4KLMY3IQL2mSdgsEYtEKE5F0HxasMpFCo3caHZHR4+Z
q5zuBLw0nOpOrDKSatHjlLefxWQdYOWhZlkzullTZrouh2IJ8jrIAVRGk/EJDyym
6dSXwczKPhX3VLyuEdTNnwSpkSS68avDHHxhwc9Hm/ORbY6N91BR+OABZsJ9mGKR
m7jDQUQkWeiqzNJWpyvE/0LmRUBOvHXA9xSEPX1NP5lyieCP6zjLmEfLYp7/wNN7
4JAye09lIYZPKxf+ZiFPIQkzH00+eFC7k+1Gg80PXMJShHU+JzMXbfMp15e3VSVy
hWhso40J6qAaLAuaMwEMR7Gs7Ozxgjzph2E0/oKyft78Sbx5eyHIRDlPoEkCyPP6
8D5dOBXQprpB1YViCsjBekcfye0PqKRqZnZu1d/dQSDbOYk7Uevw2EmGfzSWZ1cc
alfzejgVtLrnzAinWdr0A2YzzV5gqt2l0D/WZ4Ac2zaQC82oXeCCS0Ia8W9nTpIY
WdmwZkJMyf+Pg1aCy9YZ307vltIPDkKitY2NPyoHlS/184AEQuMp9P7dYcUi1Wdw
eKv4spD6t6WZtwJKU0b7xu8bQznbVXt8wXxjP3SFuZtR0GOLvw==
=nqY8
-----END PGP SIGNATURE-----

--Sig_/bs8.Q+hsXAsnuniQCI/K9Ru--

