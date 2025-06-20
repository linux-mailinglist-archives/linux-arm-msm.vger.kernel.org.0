Return-Path: <linux-arm-msm+bounces-61870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9A2AE14B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 09:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D52B2169C3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 07:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C306F226556;
	Fri, 20 Jun 2025 07:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XWZwS7wx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E15522539C;
	Fri, 20 Jun 2025 07:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750404029; cv=none; b=gv2xNb/hWlYJdiJcohZKdWEAefGpeiBblPVHNrB3794kkpiFci1WzjguB71GR+721QeXVagMtn6NsgvGrNOJm5TfSo0XgoTx1RiMlK1QL/a9l4PR6YZeZYiNCG4p7cIUJSjO9BQPiE6ugxV+/0SCrg4sf8fOHTD6cSNGGa3Unvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750404029; c=relaxed/simple;
	bh=gqjlaZJ+q89fC79xcakYesG1QlqkNn2XS7HbrMbpcjk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VSNr6ck5OakqYolIHqvFVBk215PBz0bD2dqFIYFrkV4gMWOmvdunKJHM1e0J6UwujQESat49l5FFPke8Lz3+B2n+TPixQsKQXA1YUaM+Lt1phw5FROJxXbhoNYCHL7u7d20CVDtsL/v+qLTzziREX8K7XM1T0y2f/yCYRczISEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XWZwS7wx; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E83D24435F;
	Fri, 20 Jun 2025 07:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750404019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gqjlaZJ+q89fC79xcakYesG1QlqkNn2XS7HbrMbpcjk=;
	b=XWZwS7wxCfITzL6ctTmVJLoU51sWuqsriK7h3kkLrhn1MdW31Iapjz3r3DfZrYmDfaPnuz
	77//beURjdLB0DHilkkzjYITcS6Jb0jdHYWx53oztXJpjPRcHwsVyxakC7O64LcSSQv08U
	wkYZFDw72XhjuJIUeWuObMkt4yVH6/zd2Z0+kj8u/OizuYdFPa2payz1AvY8h34XYgijX4
	/ueUpRK4MbyOipFdhPHnlqLdXX0x5wUjoiplOGDClT2r7k4SMLn/9GEDfTH8HDz0nDzQQN
	McT/bRStixeljeTLTW3hi+BmZNmZrUJN/0ThDcOErwWAJ5tMZ1rdt/iMULZpJQ==
Message-ID: <3e97885af5323dec728f40dc0176f7f82cdabf14.camel@bootlin.com>
Subject: Re: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x
 and set MRU to 32768 for better performance.
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Aleksander Morgado <aleksander.morgado@gmail.com>, Manivannan Sadhasivam
	 <mani@kernel.org>
Cc: thomas.perrot@bootlin.com, Adam Xue <zxue@semtech.com>, Aleksander
 Morgado	 <aleksander@aleksander.es>, manivannan.sadhasivam@linaro.org, 
	slark_xiao@163.com, johan+linaro@kernel.org, quic_vpernami@quicinc.com, 
	tglx@linutronix.de, fabio.porcedda@gmail.com, quic_msarkar@quicinc.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	imocanu@semtech.com
Date: Fri, 20 Jun 2025 09:20:16 +0200
In-Reply-To: <CAA3JqEfpuwn5OL6SasVGRU82+2+D5nNXk-WALzcnWnuz9384kQ@mail.gmail.com>
References: <20250528175943.12739-1-zxue@semtech.com>
	 <gt6uyoohzyjlqsbb4wro7vjsyhgwpvca46ixmivo6ybvmejsc3@nc3syx4lk4t3>
	 <CAA3JqEfpuwn5OL6SasVGRU82+2+D5nNXk-WALzcnWnuz9384kQ@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qLElnF2v/FGCh2j2pzne"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefvhhhomhgrshcurfgvrhhrohhtuceothhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudetieefiedvveehgfetueevteduleffffeuleduleeftdffffekveduvedufeffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvdegtdgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtoheprghlvghkshgrnhguvghrrdhmohhrghgrughosehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrnhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepiiiguhgvsehsvghmthgvtghhrdgtohhmpdhrtghpthhtoheprghlv
 ghkshgrnhguvghrsegrlhgvkhhsrghnuggvrhdrvghspdhrtghpthhtohepmhgrnhhivhgrnhhnrghnrdhsrgguhhgrshhivhgrmheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhlrghrkhgpgihirghoseduieefrdgtohhmpdhrtghpthhtohepjhhohhgrnhdolhhinhgrrhhosehkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.perrot@bootlin.com


--=-qLElnF2v/FGCh2j2pzne
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, 2025-06-17 at 16:58 +0200, Aleksander Morgado wrote:
> On Tue, Jun 17, 2025 at 11:27=E2=80=AFAM Manivannan Sadhasivam
> <mani@kernel.org> wrote:
> >=20
> > On Wed, May 28, 2025 at 10:59:43AM -0700, Adam Xue wrote:
> >=20
> > + Thomas and Aleksander (for EM919X related question)
> >=20
> > > Add MHI controller config for EM929x. It uses the same
> > > configuration
> > > as EM919x. Also set the MRU to 32768 to improve downlink
> > > throughput.
> > >=20
> >=20
> > This also affects the EM919X modem. So I want either Thomas or
> > Aleksander to
> > confirm that it doesn't cause any regression.

Sorry, I no longer have the modem to test.

Kind regards,
Thomas Perrot

> >=20
> > Rest looks good to me.
> >=20
> > - Mani
> >=20
> > > 02:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc
> > > Device 0308
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: Device 18d7:0301
> > >=20
> > > Signed-off-by: Adam Xue <zxue@semtech.com>
> > > ---
> > > =C2=A0drivers/bus/mhi/host/pci_generic.c | 4 ++++
> > > =C2=A01 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/drivers/bus/mhi/host/pci_generic.c
> > > b/drivers/bus/mhi/host/pci_generic.c
> > > index 03aa88795209..9bf8e7991745 100644
> > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > @@ -695,6 +695,7 @@ static const struct mhi_pci_dev_info
> > > mhi_sierra_em919x_info =3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .config =3D &modem_sierra_em919x_confi=
g,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dma_data_width =3D 32,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 .mru_default =3D 32768,
>=20
> I cannot test this now, I need to look for the EM9191 that I know I
> have somewhere, but this default MRU update feels right. Hopefully
> Thomas can verify.
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-qLElnF2v/FGCh2j2pzne
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmhVC7AACgkQn8ALBXH+
Cu0yUQv/XPmHO4NAvMPDo/MK58xTroprptIJ6ErWiRESwYazftvufSjs2m9tfWE2
IFkAwq2XRTyBZ62FqxunPUWdDT4warAyblM9/WuIXG3MJAyvyyEGYjbws7Yto4ku
7MOpsHomNe99lJPA9G+6LMwpTQO8oGJ5qCIBI8eKtiZF4+Q6JcF8oVru9tPqjedQ
1TiWT/XKXdF0Y6gZtX1F9IGhK+vJQdk3tcPflNTcdbkl6+g8aCuKZMvovHnEuP8G
J51E/issVj66sK/HlLzggEEcovBf0uO/kPSbMrUxtcUOPnQI/E2wJUdCQZ2QGeLg
Qr0aFwUox+07k7pZ7M9cdwnHCoCjVLKwM/ACh2NNvBhMjRZag5NpLbKMv4psWVFu
JLorw1j8BMIjVUOCJnSoi4RYmq6nWXYmzIahN6hf7Dcy2esm2dvv9lvycLbGnLnW
Colin0TCGyPVe7XP+xw4erugMAYBx9zTbnds3hz/obeO91U5Z9z7uN1/Jl+dAsGX
/pGSVTDZ
=2Jx7
-----END PGP SIGNATURE-----

--=-qLElnF2v/FGCh2j2pzne--

