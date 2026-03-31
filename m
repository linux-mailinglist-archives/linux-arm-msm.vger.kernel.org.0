Return-Path: <linux-arm-msm+bounces-100930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFE1O3czy2kbEwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 04:37:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA11363801
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 04:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A8B2302C363
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406F536897F;
	Tue, 31 Mar 2026 02:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="T2/VrcPO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4FF34EF0E;
	Tue, 31 Mar 2026 02:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774924661; cv=none; b=g69PgUQV+9CYbsC0F+oHHhpAA9MGMGjFw+f55oCFLiBXYDyUfi5hES/QedqqXTOPDkwTuz66GQvejvitDfPxUS8j5KQMgY+332PE/R4UFzffX3KG66XwpvQi3FhWX2bgH8UdS6yd4aL1wUOv7ZSXCQZNvvUyTSfjIBFH00hZANU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774924661; c=relaxed/simple;
	bh=SVA2xXx+5ekaMM6clXg6dQYiAHVYTa90/9lM6A+K0OA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lz4+imnLkcbYRkEY4KbPg4E+ShrnpazXNIGVuVpjotY/DFNtVXhiYeP7vTmY0SAXUMXNjEmCiBhUjWfjmmldgkJLTJJdTu4T9W8q9nPn9cJGSN7aFoIhz+ZPfLN9ByzQ6cDJdPqI4iVB/6NI8irlOhgscAKyj6K5lfUinW2AgHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=T2/VrcPO; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774924657; x=1775183857;
	bh=/1inMdodmnjfaFRFqT7EQ00CdVOsNo8SFYi/j0z3d5k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=T2/VrcPOokTWSJv877u0pNyjvkMukDzX5StmrVDKtiapRQzNxsCXtngwzyuiRMci0
	 5fpHEfL6zYRJUCbjomkcjWSa1ZSiW2lHMyoM/GViPhDw2IOgoB50ya2IyjlZJ0yveq
	 kDqV8JebGPF70RWzb2s3xtihUxcjmhzuOaaZVgUQ86pKN9Qa/oN2rDtXfVxWAOixjO
	 lbQJotEoH7nH+N4+DH/uqzan/8r8MtjXww0xpJLT7C45mubDcHDocxOrgjQ7IB4Mwh
	 PwvA/qAHJsdfZojeaYhZ+lMG/V0w28ceWIx3etwpqbMZZNjO3xZcHH1dQLNJnTctqn
	 //zAYoGnNf3wA==
Date: Tue, 31 Mar 2026 02:37:29 +0000
To: Luca Weiss <luca.weiss@fairphone.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
Message-ID: <gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me>
In-Reply-To: <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com> <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: c17686b6bc775463e304c714f9124c1ae694fde5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100930-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,codelinaro.org:url]
X-Rspamd-Queue-Id: 9DA11363801
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Friday, March 6th, 2026 at 8:56 AM, Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
> clocks for the GPU subsystem on GX power domain. The GX clock controller
> driver manages only the GX GDSC and the rest of the resources of the
> controller are managed by the firmware.
>=20
> We can use the existing kaanapali driver for Milos as well since the
> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
> configuration.
>=20
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/Makefile             | 2 +-
>  drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 90ea21c3b7cf..155830140d26 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -182,7 +182,7 @@ obj-$(CONFIG_SM_GPUCC_8350) +=3D gpucc-sm8350.o
>  obj-$(CONFIG_SM_GPUCC_8450) +=3D gpucc-sm8450.o
>  obj-$(CONFIG_SM_GPUCC_8550) +=3D gpucc-sm8550.o
>  obj-$(CONFIG_SM_GPUCC_8650) +=3D gpucc-sm8650.o
> -obj-$(CONFIG_SM_GPUCC_MILOS) +=3D gpucc-milos.o
> +obj-$(CONFIG_SM_GPUCC_MILOS) +=3D gpucc-milos.o gxclkctl-kaanapali.o
>  obj-$(CONFIG_SM_LPASSCC_6115) +=3D lpasscc-sm6115.o
>  obj-$(CONFIG_SM_TCSRCC_8550) +=3D tcsrcc-sm8550.o
>  obj-$(CONFIG_SM_TCSRCC_8650) +=3D tcsrcc-sm8650.o
> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxc=
lkctl-kaanapali.c
> index 3ee512f34967..d3899420d6f2 100644
> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
> @@ -54,6 +54,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_de=
sc =3D {
>  static const struct of_device_id gx_clkctl_kaanapali_match_table[] =3D {
>  =09{ .compatible =3D "qcom,glymur-gxclkctl" },
>  =09{ .compatible =3D "qcom,kaanapali-gxclkctl" },
> +=09{ .compatible =3D "qcom,milos-gxclkctl" },
>  =09{ }
>  };
>  MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
>=20
> --
> 2.53.0
>=20

Was running into gx_clkctl_gx_gdsc being stuck on when GPU was doing runtim=
e pm
and it seems like this GDSC requires GPU_CC_GX_AHB_FF_CLK to be enabled. Th=
ough
it is already in gpu_cc_milos_critical_cbcrs, the GMU firmware appears to b=
e
disabling it.

Relevant downstream change:
https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/3c1f31518edb7b094b9b=
9285287ba49a5c9196d8

>=20
> 

