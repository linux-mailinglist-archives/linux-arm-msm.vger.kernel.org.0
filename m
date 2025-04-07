Return-Path: <linux-arm-msm+bounces-53350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1A2A7D98B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 11:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B01A9188A673
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 09:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689F822A808;
	Mon,  7 Apr 2025 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="sjuRosIT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0042A97
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017652; cv=none; b=QJzQIFepFBk3ydBDxuDT5GMrNsIfMLh1JGj5pFYpjMfKxVSDe07tl7yBTHh3XCYxm92meyBRP+buYwUEQR4iE4vhd/O6N5Y+XjC06iTzFf4qyOE6UzdK0Cqq1BF4Gf/vXsCmseC9p9eJpB+SuThuPqnSlYwSgFPJtujEq5qG4Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017652; c=relaxed/simple;
	bh=ScdXEXK3bUhFt+Yi2JcouhlEsXjMdlf4d3ndS+JkYLo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UAQ9vjATZM1wstlDRm5Pd5O3avLgT8aAwgHVhIG87SuJO+SYYwQCE2sJeRe5/OJY1Up7aAkTPd9ePEzNVXvbKZUhzFhQIEXEvu0cRjORP+F+2FOllqxn1lTijm4cDnlGuqwlLgbogqpukDBjkUyD+bSSz+4AtAA6MAZeKQybbnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=sjuRosIT; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AA7D33F13F
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744017647;
	bh=7GZS6uPYj8uHFMPZTZNVxCqyKS9pg06/fJF5SvkoEvI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sjuRosITQU1Q5wYPeFd2Yfi0XwcnBAQAOjdT/2JJ6iuOYAQU39g8Ky2qWQyEKozXO
	 s4HsN30HCEMdEJ+GRkyvSXpx9tGZclgJsBHhf6qiLI+INq8S0riAzlHA/6dhngjjja
	 pGurOOC4UqyrySrfwa+sPiTO09g5ORbv8+gfOShlgUkzx2QR3VeuG6NGAmSyVv3vkQ
	 q+lR/mTFPc4771JHVOcQtYqkna/0x0wPvL3CnFjoaeH1hFek+p/PAlsqpFUhKvYZiI
	 +f3hJY7ovnvzHTBOJ2apz3NdiYlMH2YMCr3W13KO46ikv4nILA+cy/thRIQszM8I97
	 hqkXOZkLWBVvQ==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac737973c9bso317041766b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 02:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017647; x=1744622447;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GZS6uPYj8uHFMPZTZNVxCqyKS9pg06/fJF5SvkoEvI=;
        b=gZ5TT+QX5Nv/5pwpkKrlMZhMh9LfXYLKxImC+QQBiCHelfxZh6Oay5XZKXyA4rhT5z
         MHrPL/L8pmJcKjiYBzBPkIghk/IlTgG34MTYh4IA62wME+OgV4K+hYjMh0ClZ9IRMk5c
         s3VTYQ6ACmbdGlZO/V4o7rNX7tj0rCG70JiD20uRV+Q6GuKIluGWQE6oF77wuL2Tb/g/
         3Q+zZHPmDnL5YC/z0CuK8y3DqjxWV/CpvvCOb+DD37VaUZ5rtqj5r5PbZPJMWlEu7IJq
         u5GuBlxYnJHZRISwIjvWe/PaSI1bnZAvMWBxfH3d37q1Zpb4HqmzpoHOF5pGC8Ewyq6/
         jHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG6eqVWQfpUAA6Soey6rE6tG/EMKu5vOL5XjFlsC0qGSAvb00MdiSbQaTzzRSuq+fzotMo5gySsaA3kONI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9UCFL6/OCpKA+W5PsVYoWdR5juCNegTmD8VTfFWfTCHiINMNh
	yT8Go3iTW3S9l+ql17vESwmTBrwkUe1eWQ1vqO9Ca4n4jrfA1lklrKVt48SUANB/jTkLkZsqwwY
	V6kp8Xe1fUm/YDhYadP+e1t7v5o4rw0xjZXdlS02T3eOZtC4A9oss0+qiyCF8tQDCCpJpvlTNi/
	S0fLQ=
X-Gm-Gg: ASbGncssAyxCafi2kDvxxSRDXXX5IWUkd/vyLGHL3PFpOdlrzf365vpTPJEyAsbZXAq
	nmSUOmnWhkGzoOmY2uvZEJpYwpCplXvJkFI2Ha5a9KDjxHPZ+bjmvxm5ATPHKp78NhfS4XywWIy
	sOhCvGBHuMhF8TxyLaSW2O0hU0g+WEMW9A+hLZu/SWOTSVZ2LEtiVqBdZYDDgdYjn3DVsfFdij/
	OWb7yYTauouhkrJwFUoHxkoEm03ANOn5neBIGfk7er6mn7s/LtgkCAuDIPomGpDOeUM2jEZRouc
	+V86AJNAutK9XSKyTRKBmLrhdPiVr/bEtCAlt0KUjigWnqhLjI7HkDeQ
X-Received: by 2002:a17:907:7214:b0:ac6:b811:e65b with SMTP id a640c23a62f3a-ac7d1821920mr1055181666b.36.1744017647224;
        Mon, 07 Apr 2025 02:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5RKNwcDAkF0pEvh7xm6VWRcXnybWvXazgwz0pvnQ6TMVJtV3bBp4BF0HHU1KK4D5FiFb2pw==
X-Received: by 2002:a17:907:7214:b0:ac6:b811:e65b with SMTP id a640c23a62f3a-ac7d1821920mr1055178966b.36.1744017646855;
        Mon, 07 Apr 2025 02:20:46 -0700 (PDT)
Received: from gollum (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5c5c5sm709420866b.29.2025.04.07.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:20:46 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:20:43 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Create
 and include a dtsi
Message-ID: <20250407112044.35fe4d8a@gollum>
In-Reply-To: <e326a1e8-5f2e-4b1d-bb72-64f1e32038fa@kernel.org>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
	<20250404090108.3333211-2-juerg.haefliger@canonical.com>
	<e326a1e8-5f2e-4b1d-bb72-64f1e32038fa@kernel.org>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2GAB8FRdlhzjw/4_=O1iMN1";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/2GAB8FRdlhzjw/4_=O1iMN1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Apr 2025 14:51:54 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 04/04/2025 11:01, Juerg Haefliger wrote:
> > Create a dtsi for the HP OmniBook so it can be reused for the HP EliteB=
ook
> > which seems to be the same HW.
> >=20
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> > ---
> >  .../dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1554 +---------------
> >  .../dts/qcom/x1e80100-hp-omnibook-x14.dtsi    | 1557 +++++++++++++++++
> >  2 files changed, 1558 insertions(+), 1553 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.d=
tsi =20
>=20
> Very difficult to review. This should have been rename. You are not
> using b4, so you can tweak -M/-B/-C parameters.

Not sure what that means, but OK :-)


>=20
>=20
> I also do not understand what the DTSI represents. The DTSI files should
> be some sort of common hardware, design, product. Are you sure these
> devices share the design?

Yes, pretty much.

OmniBook:  mainboard 8CBE, version 17.39
EliteBook: mainboard 8CBE, version 17.40

HWinfo from Windows looks identical. DSDT are identical except that the
EliteBook has two additional nodes \_SB_.GPU0.PBRT.RBF5 and
\_SB_.GPU0.PBRT.RBF6. Not sure what those are, maybe due to different BIOS
versions?

Using the current OmniBook dtb works with my EliteBook.

...Juerg


>=20
> Best regards,
> Krzysztof


--Sig_/2GAB8FRdlhzjw/4_=O1iMN1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmfzmOwACgkQD9OLCQum
QreiCxAAmjf9riTwqTB0eq0J5fIEHqYnd6ITtyuOHiWmS57uWKOl/R7354LDEcmm
aYUVLLoOxrPUUBBPsxQg65EF3PumDBGwNEt9m3MH3yAnRZAg8IG0XddBNx+5+Y4F
Uoz8K6kAkE7BV1jxUPlZPg9wopC0Gmk/OPVm2OnXYxyIyfdv9lrVhR9mfkQhIKho
eqgIxqAnjPXvYPpZQ0fhdw/smHpsYXnWhuCvVi9befgEIHqCQPzZXwhkCFojzEes
1dhqZY2zFL2hyL+dio4GzY+tASuik1gY/liOM081MqPfxkq5wDQWfwJEc6Kfrhm8
IXcM0KWNkWtqiRw5QNSxxLnJgsXem72BdE3mld7gzgM0F8fsZ8I0MeDGxWOV6Gr8
FMDDORlla4+/SrDLkyYxvuW7eHY1+UMGIRM1smhdjd9Oj74su8MV3kpp1hHJqLrE
Adjrb/5P/+PWvncwqLabYt1P04BawL4WE586i78HJPCnb+6PpBffqLsGGem5tuzF
/K5EuvwPTN/1tKHYjTVArG39N3RDkQ0Toik/i9M6ODwKK8+GCT0COYH7kc5bS9Mt
/22XuVH7u15Et2VuWysC9Z/ee/0xKotz0SA3WFbpH6igdRLdDwyX7fL2yiU802Oj
cNOXgCJwETZxlQSSVwDjs728jfyMJii4K+o9EcbtxDKRMMgtD5M=
=nyGV
-----END PGP SIGNATURE-----

--Sig_/2GAB8FRdlhzjw/4_=O1iMN1--

