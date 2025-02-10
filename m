Return-Path: <linux-arm-msm+bounces-47340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 390EDA2E22A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 03:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 896C07A1C5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 02:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D10620330;
	Mon, 10 Feb 2025 02:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnTxJem3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE7F4A0F;
	Mon, 10 Feb 2025 02:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739153730; cv=none; b=llmo8qhIMhf5COaMnhKbnkr/GzkIZYtzIM2O61PgGCJYtvZGeN4usV/wof/kcQ+iRUff5bjhG0krQTAwZHm6NymebxKG3F0NHPvPDWX0BFXZg+A8ePx6vdIBncqmOUW2OUfTcrPimLKmwAJOFDnsZzatXCv4in1Gttvy/C1LKII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739153730; c=relaxed/simple;
	bh=d4csEdXdPouuvEctBR0STLu2d4Qh4cBW4eqGwtryIGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ph22lGFKTs1LTTxqL8ThfRSqPMvztXnrw41u2mlKp4pqsZaJZjYq2QjBy0H6YmDwPapDd4C7awr9P4XGpIlw7McySpBfbpJ7dLRR0iEb6jhEvljFFqfURCmqRCLPApPA3rmeAqr7EbgsomA3M8aMjmFWO6pYTr27P3t0n6yRiX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnTxJem3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f49837d36so39571355ad.3;
        Sun, 09 Feb 2025 18:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739153729; x=1739758529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3h+K3xR4vN2GfbZyH+TPDkNGsUg4ZtBD2xwpc7ZXYU=;
        b=CnTxJem3IPKOukxPRl5HIcdHkoA9Rjh2xTJASdAu3cLKJFYxCG/GgGycZKGISBw9h6
         Ieqfv9cugBzPdnNfkr5gVR7vZsviRjQG2XWNYNcenV99GDsiRfi7YhRk8r/LcKUkDart
         a+OqnDGpM2V0TdfHJaX39QOcv5DnpgO+BYUUHzs10/kfuyQxQyTOos55d0jCrE2l7bRJ
         Oi4/mOU6ru4ajE1yQGkRed+JxjCen8t/KO6BuPkrTBYfTCV5bKie6ZnMKdXYdx9Ww9VP
         VSlcJ2m54Wne7cHrBFkV5WyutYBXia8TmiDZ//i2l5fGcNNOqXq8oT6H6dD6awBKLk5O
         j8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739153729; x=1739758529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3h+K3xR4vN2GfbZyH+TPDkNGsUg4ZtBD2xwpc7ZXYU=;
        b=VpBnOnKxfijde46PrnSLWFGfkVgB3nzK+hvzbP8yWK5pWhnRjkN4NQZb72gcnPLAkK
         K5xXjBvP3uFoZY2TaQ7aNuLU3SAxIO62tDeEdeQEkbrmy3eBHJgcKNCY4u9uExBUBzO9
         Fb5yf+jDza3UNR0Z71DaleYqyLOMkliOAI/LhQw2lNBRpP/FfB9zEwPSUBs7xiiWJOgc
         YHKr+ojnd1PidvMErreoljJmQZUheuo2wvQphBvZWp82Bvq/Syaw80jY3/BtVXRJEfk1
         fbGptwWrW39JX1ih6dXwaZZO47ALy//yfp+yEXMgQF0uFLsHJA8SLlAskRYOJs+S7Y1Q
         5zSw==
X-Forwarded-Encrypted: i=1; AJvYcCUHFfKyz45NhqqjivKUti031e4uuq6p+vO5DSHBiZ3JpqVASqj2Rp0lDZtfNrb8a9tc6+syQZLOEdN3/GeYlxao@vger.kernel.org, AJvYcCUL8dCI8XUTNt1aRRqHddPegZGI4mkUVrlBWaVJk7brEl1x2qxASKggWRceux1uwHRAz67R6Q/L@vger.kernel.org, AJvYcCV4wLbWHagWsbQ0qkdKUzEfd94G3tFVyPzLyTLc2uUW4evcMSxeaMTjVh/B/IAU8zCjsdMXYmIyx2XF@vger.kernel.org, AJvYcCVhhWr+KmPT6FI0ZGyOCryD8bJW62PfhLgHwomNX6+hpPgpeU2xmydxKsw6l3rm+DrFalIvf67+t8RV@vger.kernel.org, AJvYcCXa1OJiWdt6g5vJe78y3Slgj66Ize98vkbambk0r3hDL9UOn+LUbdbWZaF0LDDV6BIbFDfUtI9FajHGViID@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ep1zToSMAWbEKPxCFApEfXUJRREdtRN9WJCLpqXCRiaBD6W2
	Nl8Cz/9cXdufHcOsku3yp9yosI6Hp7pVhbqvlcGVv3bBBH48O/ON
X-Gm-Gg: ASbGnctrm6ZDN4GGroyoKAQl0YnrQkqORUO3lw1K85WHT9NXrtUPTEQzobDjxWCZZUs
	xZsA49aF95//tRX3FvMALMB2rZKFPDDdGlCvm1Bx1uBER6QrMoEcfaHpfla2hOwJge/4xIwKmDG
	B6KL1pqt9yit+R8BBwJJGsP1e3VDzQKkk7ggnoh+WHjqfAjXZWECrxQOlcGucSDZrNMIbXmxSDv
	PWXJZ1eo6jsD82i//lcRTjtcG9BF6uXBD9mSMUmX1FJfI3HYMAFPCIHFEAma7zASf7WduybQFvE
	JzCsvQter4M++XA=
X-Google-Smtp-Source: AGHT+IEMZLL6A898TuhD34LNu3mPAP0x4lvq9FaS7cJrjdZuV33t4zhik3UfBf9JlIWEEyYiL3+yJA==
X-Received: by 2002:a17:903:2f91:b0:21f:90ae:bf83 with SMTP id d9443c01a7336-21f90aec1bcmr54697905ad.44.1739153728473;
        Sun, 09 Feb 2025 18:15:28 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368d8ccbsm67022615ad.255.2025.02.09.18.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 18:15:27 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C40654208FB4; Mon, 10 Feb 2025 09:15:24 +0700 (WIB)
Date: Mon, 10 Feb 2025 09:15:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Suruchi Agarwal <quic_suruchia@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	john@phrozen.org
Subject: Re: [PATCH net-next v3 02/14] docs: networking: Add PPE driver
 documentation for Qualcomm IPQ9574 SoC
Message-ID: <Z6lhPB1y3BBFI4ux@archie.me>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-2-453ea18d3271@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cfhwIsb4npdCWsvl"
Content-Disposition: inline
In-Reply-To: <20250209-qcom_ipq_ppe-v3-2-453ea18d3271@quicinc.com>


--cfhwIsb4npdCWsvl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 09, 2025 at 10:29:36PM +0800, Luo Jie wrote:
> +The Ethernet functionality in the PPE (Packet Process Engine) is compris=
ed of three
> +components: the switch core, port wrapper and Ethernet DMA.
> +
> +The Switch core in the IPQ9574 PPE has maximum of 6 front panel ports an=
d two FIFO
> +interfaces. One of the two FIFO interfaces is used for Ethernet port to =
host CPU
> +communication using Ethernet DMA. The other is used communicating to the=
 EIP engine
                                    "The other one is used ..."
> +which is used for IPsec offload. On the IPQ9574, the PPE includes 6 GMAC=
/XGMACs that
> +can be connected with external Ethernet PHY. Switch core also includes B=
M (Buffer
> +Management), QM (Queue Management) and SCH (Scheduler) modules for suppo=
rting the
> +packet processing.
> +
> <snipped>...
> +The PPE driver files in drivers/net/ethernet/qualcomm/ppe/ are listed as=
 below:
> +
> +- Makefile
> +- ppe.c
> +- ppe.h
> +- ppe_config.c
> +- ppe_config.h
> +- ppe_debugfs.c
> +- ppe_debugfs.h
> +- ppe_regs.h

If somehow new source files were added, should the list above be updated to
keep up?

> +Enabling the Driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The driver is located in the menu structure at:
> +
> +  -> Device Drivers
> +    -> Network device support (NETDEVICES [=3Dy])
> +      -> Ethernet driver support
> +        -> Qualcomm devices
> +          -> Qualcomm Technologies, Inc. PPE Ethernet support

Literal code block should format above nicer, but plain paragraph is fine.

> +
> +If this driver is built as a module, we can use below commands to instal=
l and remove it:
> +
> +- insmod qcom-ppe.ko
> +- rmmod qcom-ppe.ko

"If the driver is built as a module, the module will be called qcom-ppe."
(I assume that readers know how to insert/remove modules).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--cfhwIsb4npdCWsvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ6lhNQAKCRD2uYlJVVFO
o7e/APoDNBjOLKQmK+f6b5JwODo6N6WVYG5M8j6f2ORiDqF35AD/SZ9dHfFlvBE+
di88znArDOyp/iAzBZn0EJ/Lj0/3Xg0=
=jAqU
-----END PGP SIGNATURE-----

--cfhwIsb4npdCWsvl--

