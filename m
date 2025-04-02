Return-Path: <linux-arm-msm+bounces-53044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E6CA79088
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 16:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEBAD1897818
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 13:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CD921B905;
	Wed,  2 Apr 2025 13:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="v4fmPaLc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478EB157493
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 13:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602095; cv=none; b=Kwxbd+/g44xYJXxeEINW2Qr+M2YqQA4Cz7HacLTn83gRzM5SsVJIPzRlM6ORjB+wlPXV65666t+rGNbnUKG6QvsJaNn9CKiV0VAfoVl+sgL6XfWcAa528+yYKGCSjk11zjiTBukn60DJzv/ELfmy1YM8w6G7V1L7MIIgmdxK7wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602095; c=relaxed/simple;
	bh=CG5eB3tDd5xsJ/jOYBTYA69qP6uMiQTIFvTatjTPiDY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZKrgZG8TLHJd1Krb3O/TaRy5QQb6tXtiXjp8DFeVzps8z9pNlX2JQFQAGy4WAYWlgwrwv8mNDub1z/qkepg5fGb+/vJHv3fRSwIEFBwBjqGo23cwp6TGeMVqI0o+i4xRrr3KD7hBZNoiIZKaekqpIpL9dqH7AlBaNiVpYb4sSDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=v4fmPaLc; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 37ECA3F698
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743602091;
	bh=CG5eB3tDd5xsJ/jOYBTYA69qP6uMiQTIFvTatjTPiDY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=v4fmPaLcR0sJ+sXagfSfr1shQYZMFKRxAPQXWQTVMAF0Fg1piZu9Q5onZ+Agcto32
	 vnFsC4oaszc0IAprhoBep965tPQmydS6ghZM8ulhpTUGAbY+CHr5coRcvyVQ0KBuNp
	 lPqFoBB/E9nie2n61qnhAUzsqmjkFG72VQ3/ZFBG68TGbbvzCs1LUhlLQM3KKGpKTi
	 EaDCHIMyN5ZQnH6inu3vagVCBd2JwEK0QeCjY/e8yjyRKbQ2sZfBGQ4iyt8bggoRFb
	 lMcA6hzdJzzkzT0NBH/fCooDqjalvMOdoM3tzWJAece81rpxRJU9pznyf/f8dAFtcf
	 mcXHilHOlf+Yg==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so55239715e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 06:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602091; x=1744206891;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG5eB3tDd5xsJ/jOYBTYA69qP6uMiQTIFvTatjTPiDY=;
        b=jlPfVXi+b2TVFPQcKV7DIgYWpba39gD6DXX18mp88QbHsSLRpfg1y6SW37nl8LcmTv
         tHdbld6/UliJ9Zv/zSZCa75ZGCXPelHFrSTqxadHyKZ/l4nsw1uNix1CzltulS6TrmaP
         KBty6xc+jYCOQnjjFM8Xs423ZxmYRnCtiFkvOx/+M69mrL+gZ0HkVJR3TZuQVhZLiM3X
         lIhsBDIJbyYxoPS0cVcpnPVkG9G1dH8MNEkIYEOfq7uLcLA6pIx0gO1Bio17E3U++Jhd
         4mItFjeffRNUHu0S64KWCIM9Nklf0rwGF+LDG1EIJ2yHN3KosrAyji7L0C/2QRi92Ea1
         NI8g==
X-Forwarded-Encrypted: i=1; AJvYcCWSEoz3YJkMnNhyIF+BVQd/C+Z29qROXKiRGEwoK/wUgLuXu76waRa9gh+W5DMNQ7OJdnC8lAxZMh7gpf1O@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6L3UqN9WzR1eCPRnWbUcVzg2GVlrD+WZyvkf9ylEbLeLCHpVU
	YVbMDH7XERyODxEFhFeSxLGOXvd31ocEkIfIr8uSW/Ih4fkWqjLl68V4++PYZPKGAmiR9bzj6R8
	k4+vfbtvXwLRbDH/Xw1M3+WN83adBp0IE3ESA2kFJ9NYlkQVk1DVDPSIdREeagJy7V7sAekSeGC
	Jz6TI=
X-Gm-Gg: ASbGncti5jZrc0TEN+w1jTCnt9eYRKnf3trh9K6pLIHxfF4s1WtA/WTBfb7SaEnocR5
	wm8vPMyHvFFe3tUJLcCRxbmLnnVPUd3gl2zSMBYNreZ5esoQcwehbviHNlQcxGUyCkKoKomOxqA
	p0XZQgio3je8QoRiwj0jimqTsm3V0PE/EI5/jKy+E1wfL0cUXtTkceEOHwuiDUnehkBOIDQf4yZ
	55ax8w98/8igrQUrzf6tkVM2rJ5Bwt5VXtWEAyEa9bYvmoQe95WtkW5ln9v+e27i28ZWcqwHyzj
	uuex9Gh5GTLo2V4oUOClKIW2ZXNi2r7I+btcrN/XoIldgQcOuvUXKYPe
X-Received: by 2002:a05:600c:3b9c:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-43eb5c2072emr21841325e9.9.1743602090796;
        Wed, 02 Apr 2025 06:54:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqAoRMw1orcBT36O/KAk/YHF2nnwZ4/dFtqfWdwVBT7tQpYvTXtM2QoP91qXVtO9TcFxzZmQ==
X-Received: by 2002:a05:600c:3b9c:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-43eb5c2072emr21841005e9.9.1743602090222;
        Wed, 02 Apr 2025 06:54:50 -0700 (PDT)
Received: from gollum (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6190bc4sm22399685e9.31.2025.04.02.06.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:54:49 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:54:47 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jens
 Glathe <jens.glathe@oldschoolsolutions.biz>, Abel Vesa
 <abel.vesa@linaro.org>, Stephan Gerhold <stephan.gerhold@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-x14: drop bogus USB
 retimer
Message-ID: <20250402155447.0f41fed3@gollum>
In-Reply-To: <20250328084154.16759-1-johan+linaro@kernel.org>
References: <20250328084154.16759-1-johan+linaro@kernel.org>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lRao/ETFr.OIayZzb_CvQcq";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/lRao/ETFr.OIayZzb_CvQcq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Mar 2025 09:41:54 +0100
Johan Hovold <johan+linaro@kernel.org> wrote:

> Jens reported that the sanity checks added to the new ps883x USB retimer
> driver breaks USB and display on the HP X14. Turns out the X14 only has
> a retimer on one of the ports, but this initially went unnoticed due to
> the missing sanity check (and error handling) in the retimer driver.
>=20
> Drop the non-existing retimer from the devicetree to enable the second
> USB port and the display subsystem.
>=20
> Note that this also matches the ACPI tables.
>=20
> Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibo=
ok X Laptop 14")
> Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Tested on an HP EliteBook Ultra which is the same HW but in a more
expensive (?) packaging.

Tested-by: Juerg Haefliger <juerg.haefliger@canonical.com>

--Sig_/lRao/ETFr.OIayZzb_CvQcq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmftQacACgkQD9OLCQum
QrfzvhAAgHLjVHvyXXP5zJfOLJqHphrQda58zyyZ6tler4eI3cjjOZAQDOTFjTbK
L/+R5z1UZLHyeXNNv3q+6RoLJcJvlLdF5F+ms4GNoA1qCyMXvPExJ9ZyaXRpAQoU
sT5krGTsA8UcRk/6IMifywtILNGO9AatALRxL7eAKbDIVJNho/BirNHmWIWvJS8f
sHcC1M9qD1c54+kTZ4omcTPRSJrOCofp2r/kcblWkVSWkh7sUhp7fDbRKk8tB/qm
MkDXIesdoSv9aVRBe0bN29sEbE+em1lYO6824NwLYgVpyQBlD3Q65m/agysV/Vb6
hmR4dI9PkGLnGQMjbKNsIzqa/05oEx+HvByCtsvjfLp3zo3K2sk3LL3guQCSpMaR
pRKr8ayNRjxSSL5PVn1aHqzQfuNtxQPCWcDceXMby9s+VA2KsnhxYWDr3LebUgEk
7eHvZrzHGIxdFzT8DS7G082nR0d1Q7qMVNf1OJBDoEgEgvJHQacUf3OmAo/U0Dzh
xpPDf0GEzSWXjr5pda1CWZvtaWbOVHEpe2ChnauZgOpPums2uAy2kt7xXskYVr1+
ce0s8JdRO3QoGlSdfzVXeM+7o7vqxQDDp54/HEs2NtVPTDatdmthq3UwRjAbYVzQ
HhNzNkVpgeT1piWvDfQTDXGjz/WJqDdN0tihh2yotm9jmaSBPNg=
=qK4+
-----END PGP SIGNATURE-----

--Sig_/lRao/ETFr.OIayZzb_CvQcq--

