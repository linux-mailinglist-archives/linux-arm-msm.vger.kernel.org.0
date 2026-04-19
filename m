Return-Path: <linux-arm-msm+bounces-103636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xyFVEWpZ5WnCiQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 00:38:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76514425B37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 00:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D729A300A7DC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 22:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2CF30EF7B;
	Sun, 19 Apr 2026 22:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2XFwuer"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230B2FB969
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776638308; cv=none; b=qWyOV+dUfRi+Aw71i0qLfJ+aXfxRw5TkrRhFgMEhF6oOY98w7ldivJ1ONUWcVk7Cxm4rx6V6ekkTF105dcwMuqhj2VP4FBqJhJqahbATN6nMOIPAnufXhOqLQHNoUGLiR+oEuDganp7wX+31Fqt/W4ktRwtEmp1DPdSZmG9kyTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776638308; c=relaxed/simple;
	bh=FUdqs8G4xwhD/VXXAjrPpZWDZq3wYXxHJeq5QFisxbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bycmNwdKrhsDNP7LxoVG0AwKY0mjyCqAGFk9KUPrPwelcwUJ2xRANI5G30SfHkSowOw++7IJR0befSBgsZOljhS4VaYiC9zrf8gib5vYyGw+h42PEprcUJ+Oz89u/TCjZicy4Z1BfwxE8cmSJ36/+aisXJcCueZjvnMZgXAanKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2XFwuer; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d9e22176a7so1351501a34.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 15:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776638306; x=1777243106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeLIlLS6xhhKIOicu0WwjZofN4fneA1R4+99jdOi6J8=;
        b=p2XFwuerkqqQtesQvOPuW5A/cqIFi0kzEjEtuZdO0zqevgOVjO2JJ7mN70pzKnpeM6
         E6OysWeXhiHUAFIQK+3C1j7mysDk5hTO3YbRqDRjr3uybiHI830ldxgAzcirix2Wqc6Z
         uD9QpZdnTkaO9d137jzl7Bnrl3XRQPPi71jVcKo23LR3gYUvJ7yaBgRAZyAAQRZZk47b
         gFgXV8AIEpDdPvL/JCwkbP1lNzfFV6waLfUg4sW7f5224qO1z5JCyU1N6Em/VvdvDb3a
         RhejPa0qe9W6BBNLc9JyNKGWxuhGdyU4RDjfQv5tadxFmV+t1jm/5uTmo2jDxBwl/mgy
         /XUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776638306; x=1777243106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yeLIlLS6xhhKIOicu0WwjZofN4fneA1R4+99jdOi6J8=;
        b=Qk0WtwcoJzkWOVowde3F6rhLdEz0NKugNvGM3rrBshZj+MPcqP7YENzhVB+N+hYZFF
         nvKGSBHOuIK7I2ZvtIPIiP08/DtTCvYeP4iAuD9WuXdNASLupD5hOxpyajfzbCiSW1pu
         hIlYG1UFpywxSutONnIhvY5JGMMLrxsVys5yfDvvPbmjaPlTFtjjhV7yB/MkIozhp/6s
         FNdOwsWuqZBVugxiz1qC7h/DipiK/hVhLQ8jRnyTd5jRQLXgZvrEbNSH0Rea+lfZjprf
         jsNbMfqab+0bPjy4pKmrfZGPbnaShjjwN5sXyHzbG9JQ1vTDA0BRG6OrMnVE8xaHwQXc
         ErKA==
X-Forwarded-Encrypted: i=1; AFNElJ9mhiaReuNCTWhZfSUPKVwtNMUWSUecFsZvLQuZetUECye8vqmfFpTvnCIFgOWIz29+RKPKfBRqcUcvRySo@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwTDQ5L5youdrp1xK91Z/siXUPbIqpRn1g491x2X+aX5z/INu
	Pd+wc+6tjrvt/nrNsWYCweJIqZNO/VIw+KOZu1qFxC2Rw4C91B/PM5AH
X-Gm-Gg: AeBDiesu8nyqcCPKU5ogS130NcdxD4UwaufGYCn5rG1KRQEWszIAkTTC5YOvavgtjYA
	Ctec2BS2xwjVHmFrdZ9LbXevpE4blY7VIEHENDiyVI0EacMgXQGcB6elzNP1k65sLqnU9XOuFYO
	1Ti+z4MRmqzB0XMe3+8jR2EAtYv3UN2TJEcLjG17CJm4Fyz2YCBn0Eh+kw/P64D9wCgdrce4SlN
	xGSstZFWkEAikMRqZH0/YN23clj5WAk8x/Mner2XLCN6f/EwTxWOF2tYhfAVWQUnJdVGaXRwfY7
	ZChBN179luZvctUDBjEWK9q5BLx0nrsT98SfonaxfhChprsuAHSGRxn5x8MDLqgjwWavl8+3hTp
	e78xnlevzASV9bLyYGdsndJvQw2/TmFtmQJvXQmeVNPo2QE6I07qoEcFxTEeUnB4sChiaJBVzFB
	dD6spEhg9Xp+lCSogbhoYmaYVUyqxJ6AbzS4XmUq+JcsjRc8yPuEjhkTIsIYUyWSzzbCmC4P46X
	jWnQ2+8/81V1eTb48ZLTRMbfalBsUZGS7iYNt+9yJnhHcLdvMzMKgF1Bow=
X-Received: by 2002:a05:6830:411a:b0:7d7:d2e4:6373 with SMTP id 46e09a7af769-7dc951fb364mr7104813a34.20.1776638306240;
        Sun, 19 Apr 2026 15:38:26 -0700 (PDT)
Received: from nukework.gtech (c-98-34-199-138.hsd1.tx.comcast.net. [98.34.199.138])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc975b057bsm7891589a34.20.2026.04.19.15.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 15:38:25 -0700 (PDT)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject:
 Re: [PATCH v4 1/4] arm64: dts: qcom: ipq9574: Add gpio details for eMMC
Date: Sun, 19 Apr 2026 17:38:24 -0500
Message-ID: <3675281.vFx2qVVIhK@nukework.gtech>
In-Reply-To: <20260202073322.259534-2-varadarajan.narayanan@oss.qualcomm.com>
References:
 <20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260202073322.259534-2-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103636-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mrnukeme@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 76514425B37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Monday, February 2, 2026 1:33:19=E2=80=AFAM Central Daylight Time Varada=
rajan=20
Narayanan wrote:

Hi Varadarajan,

> The RDP433 has NAND and eMMC variants. Presently, only NAND variant is
> supported. To enable support for eMMC variant, add the relevant GPIO
> related information.
>=20
> Do not enable NAND by default here. Enable it in board specific DTS.
>=20

This commit references sdc_default_state in the .dtsi file, without definin=
g it.=20
It creates a silent dependency on the board .dts, who must now define the p=
ins.=20
This makes no sense to me for boards that don't have eMMC. As an example, i=
t=20
breaks most downstream OpenWRT boards.

Was this new dependency accidental?

Alex

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan
> <varadarajan.narayanan@oss.qualcomm.com> ---
> v4: Move sdhc properties from emmc dts to SoC dtsi
>=20
> v3: Disable nand in ipq9574-rdp-common.dtsi and enable it where required.
>     Add 'Reviewed-by: Konrad Dybcio'
> ---
>  .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 32 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  9 ++++++
>  2 files changed, 41 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi index
> bdb396afb992..e4ae79b2fcd9 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -169,6 +169,38 @@ data-pins {
>  			bias-disable;
>  		};
>  	};
> +
> +	sdc_default_state: sdc-default-state {
> +		clk-pins {
> +			pins =3D "gpio5";
> +			function =3D "sdc_clk";
> +			drive-strength =3D <8>;
> +			bias-disable;
> +		};
> +
> +		cmd-pins {
> +			pins =3D "gpio4";
> +			function =3D "sdc_cmd";
> +			drive-strength =3D <8>;
> +			bias-pull-up;
> +		};
> +
> +		data-pins {
> +			pins =3D "gpio0", "gpio1", "gpio2",
> +			       "gpio3", "gpio6", "gpio7",
> +			       "gpio8", "gpio9";
> +			function =3D "sdc_data";
> +			drive-strength =3D <8>;
> +			bias-pull-up;
> +		};
> +
> +		rclk-pins {
> +			pins =3D "gpio10";
> +			function =3D "sdc_rclk";
> +			drive-strength =3D <8>;
> +			bias-pull-down;
> +		};
> +	};
>  };
>=20
>  &qpic_bam {
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> b/arch/arm64/boot/dts/qcom/ipq9574.dtsi index 86c9cb9fffc9..4b8c58982869
> 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -467,6 +467,15 @@ sdhc_1: mmc@7804000 {
>  			clock-names =3D "iface", "core", "xo", "ice";
>  			non-removable;
>  			supports-cqe;
> +			pinctrl-0 =3D <&sdc_default_state>;
> +			pinctrl-names =3D "default";
> +			mmc-ddr-1_8v;
> +			mmc-hs200-1_8v;
> +			mmc-hs400-1_8v;
> +			mmc-hs400-enhanced-strobe;
> +			max-frequency =3D <384000000>;
> +			bus-width =3D <8>;
> +
>  			status =3D "disabled";
>  		};





