Return-Path: <linux-arm-msm+bounces-96911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIGvHGsvsWkVrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:01:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 295EC25FE22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EB173044378
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA253C65EE;
	Wed, 11 Mar 2026 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SINjXD+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9033BA234;
	Wed, 11 Mar 2026 09:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219673; cv=none; b=IB7L9DuKrKCO7frjQx9AY7xP5BX+L+UsLY2MJLImGbvlr1qLrYRsOk6mwcflbLCe/1CIEgOMZuzapX91M5zTB9KtcU5dsWaub+TbpxLv4MscYwh5DGQmqadN8UHw+5T9XvQkD7jRKd8dffuCAbSGHkOl/D/qcwsxREhxGccTdGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219673; c=relaxed/simple;
	bh=e2bAAxV6stPQ7dMAjla73fKVc76zMQPyrbsdNH4aF1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7E8zesKpFKwHjTkd1zDOsT1bajGoiQwYOvxYkVRJ97B3OcUvF4fnK39PME70W7cF1Yi0f3GWy2rxc41PPiJs9UGgJ6W+2vMaFY/CK4B6CaRHqqIu+afyGGYjmDH4W8wYgqDlIfSJse9qAqOd4KRpRsjSLVDizqm6dsjhBfS7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SINjXD+I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309F9C4CEF7;
	Wed, 11 Mar 2026 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773219672;
	bh=e2bAAxV6stPQ7dMAjla73fKVc76zMQPyrbsdNH4aF1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SINjXD+IS9hNy8sIv52zZsi6KL7GmM6uvm+lD6Bw2aCa/jzo7RmLqseg/Nhn6tefr
	 QSF7XGi95zt+5eI9npolhCWL1TkdK8US+0mQFh0lwx3r0yNISTPDga5HWEhi58Sjai
	 mfsT6Y+S0pa9Bv38NNogJs4CuX6KZzyaKdB2GVi2fcLNWmqc7XicTyKnBA1TFNdX/w
	 G7wFb9k/zJdjgEN51kQ0HHDZJ3L88h0RoxmkC7Sp5MIxAL0vMMcaRszE25VAmEaIHz
	 CwIo5Tu4Rd+trJiIbV39weBwW8QEpUoJfNw91hiMf/QFTVGsESTNbjsAtv10M/FAfT
	 OA8K9FEQu2j1g==
Date: Wed, 11 Mar 2026 10:01:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: Add back Xiaomi Redmi 5A
Message-ID: <20260311-silky-ludicrous-stoat-ecdcab@quoll>
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
 <20260310-riva-common-v2-4-3bfc23996857@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260310-riva-common-v2-4-3bfc23996857@mainlining.org>
X-Rspamd-Queue-Id: 295EC25FE22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96911-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[devicetree-specification.readthedocs.io:query timed out,6b:query timed out,mainlining.org:query timed out,0.0.0.55:query timed out];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[bq25601.6b:query timed out,barnabas.czeman.mainlining.org:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.55:email];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,6b:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 06:21:34PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add devicetree for Redmi 5A based on msm8917-xiaomi-wingtech.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                |  1 +
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 56 ++++++++++++++++++=
++++++
>  2 files changed, 57 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index e68e161cfec0..6d87be639aac 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -81,6 +81,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-wingtech-wt86518.d=
tb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-wingtech-wt86528.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-wingtech-wt88047.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-yiming-uz801v3.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8917-xiaomi-riva.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8929-wingtech-wt82918hd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8937-xiaomi-land.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8939-asus-z00t.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm6=
4/boot/dts/qcom/msm8917-xiaomi-riva.dts
> new file mode 100644
> index 000000000000..02d9d4fd1b45
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Barnabas Czeman
> + */
> +
> +/dts-v1/;
> +
> +#include "msm8917-xiaomi-wingtech.dtsi"
> +
> +/ {
> +	model =3D "Xiaomi Redmi 5A (riva)";
> +	compatible =3D "xiaomi,riva", "qcom,msm8917";
> +
> +	qcom,board-id =3D <0x1000b 1>, <0x1000b 2>;
> +
> +	battery: battery {
> +		compatible =3D "simple-battery";
> +		charge-full-design-microamp-hours =3D <3000000>;
> +		energy-full-design-microwatt-hours =3D <11500000>;
> +		constant-charge-current-max-microamp =3D <1000000>;
> +		constant-charge-voltage-max-microvolt =3D <4400000>;
> +		precharge-current-microamp =3D <256000>;
> +		charge-term-current-microamp =3D <60000>;
> +		voltage-min-design-microvolt =3D <3400000>;
> +	};
> +};
> +
> +&blsp2_i2c1 {
> +	status =3D "okay";
> +
> +	bq27426@55 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetr=
ee-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +		compatible =3D "ti,bq27426";
> +		reg =3D <0x55>;
> +		monitored-battery =3D <&battery>;
> +	};
> +
> +	bq25601@6b {

Same here.


Best regards,
Krzysztof


