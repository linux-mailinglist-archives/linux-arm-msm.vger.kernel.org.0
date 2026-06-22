Return-Path: <linux-arm-msm+bounces-113989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y19rOT0tOWrjnwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:40:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8DC6AF7F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:40:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kDTOZwiL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113989-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113989-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 133C63001074
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72A63998B7;
	Mon, 22 Jun 2026 12:40:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC4125B090
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:40:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132023; cv=none; b=Kt3C6VS9VV9jhGpKI0qUYPw7JI/IZynwHUimaPg2fIN9BwMXQPCvzo93mUeUcc2w87CcDQKKGyCYWAYfIJsAk7KW8FOITjbpk8v1Tw+qTT32yrmuR7FragBwghINuosmw0jcdA1clrY2KDAh46PlMyAC3MPhxoOcWxovbfIrNEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132023; c=relaxed/simple;
	bh=tRQkNnHyGByVM4DScIaxku6XOxEkFHdsrhGpAMbItzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DqDE80Qo+t8Bk1tkmA2V9Ds55ForVWeL6gjsGck9EQlnuO8UtPWP2zl+Lvt1yl4Rvp4ypkB0ZcDCpTujW1WGlvTpi8HKQNAuxDXJutWnCXwbjpxi0e6QxCQMSPnHD11sFogUg2HCTgNI+ADfOiptVntjJPRLgis4bpxzc2/9aGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDTOZwiL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59AED1F00A3A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782132022;
	bh=tRQkNnHyGByVM4DScIaxku6XOxEkFHdsrhGpAMbItzc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kDTOZwiLpNUgtYepNA879W1WNTQAPRB0+NAswnjObnAyW1mnJiRz8AtBoM+1ncGmy
	 R6zXS9QWjdQMB1dak5sthFMvjFrr2Lkrt/xZF34VMG+Q+QrSP6Q9DWOCMidMlG/+NH
	 u9Pwv1EqKVqQr8XVU79mzlwIq30XLywSQ5VkmRfABFaN1gp/bp/LZAAPFKuBOn4gbf
	 PMrksPYNf3f7h2ZLe7R7zmGZf5hyAgdy5G8UQxmPLbBWfqpWccUuIuD5Dk4NT71Tbj
	 JqZla5AROj19Ls7QL7tJ1ras6BZfBAHskDX9mcLuXsdpfRmVO5zC9SqoHgpNdo2TqA
	 rY71GZ9cE+YLw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa68d9dc18so4456101e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:40:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fIpfIFCoQ9GW/rmYZfIkey64TWFwRK19G0y/DUJqVberisXNneIYnPGS98yH0d1vpLiHsoQmxXMvueeIv@vger.kernel.org
X-Gm-Message-State: AOJu0YyANt8l67hi20n3BcKi3Iz5iF9DvtOM9g3XW8bNBedigPT8DV8k
	5I9UdUSCAY64TqxWOhQT6VnwWerO9JntQQ+/wB3fyltWjeH4F9QQBRDPE8xsRTiDY6VQ7e/H+7f
	W03q3/UjmKleYtjXJykMq6D2JNf21Fy0=
X-Received: by 2002:a05:6512:ba3:b0:5ad:4c5f:dd9b with SMTP id
 2adb3069b0e04-5ad58e1fe98mr3268157e87.1.1782132021173; Mon, 22 Jun 2026
 05:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260620080406.1970447-1-ruoyuw560@gmail.com> <d104d52e-97a3-479b-8dfd-ddf41a3d05e4@oss.qualcomm.com>
In-Reply-To: <d104d52e-97a3-479b-8dfd-ddf41a3d05e4@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 22 Jun 2026 14:40:08 +0200
X-Gmail-Original-Message-ID: <CAD++jL=WkWs1zBkeCr4cPFhBF_A-3s74O9=fwshMa2X3C+r=YQ@mail.gmail.com>
X-Gm-Features: AVVi8Ce1wZHkkYheNVueKEUnyXipDqjsCpnAIfiBQjWzOXQ1g1qUyoNAI4fGwas
Message-ID: <CAD++jL=WkWs1zBkeCr4cPFhBF_A-3s74O9=fwshMa2X3C+r=YQ@mail.gmail.com>
Subject: Re: [PATCH] bus: qcom-ebi2: Fix clock leak on probe failure
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ruoyu Wang <ruoyuw560@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113989-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:ruoyuw560@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linus.walleij@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE8DC6AF7F4

On Mon, Jun 22, 2026 at 11:15=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 6/20/26 10:04 AM, Ruoyu Wang wrote:
> > qcom_ebi2_probe() enables the EBI2X and EBI2 clocks before it walks
> > child nodes and populates child devices. If reading a child node's reg
> > property fails, or if of_platform_default_populate() fails, probe retur=
ns
> > without disabling either clock.
> >
> > Route those failure paths through the existing clock cleanup labels so =
a
> > failed probe does not leave the clocks prepared and enabled.
> >
> > Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
> > Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> > ---
> > This is a minimal error-path fix for a previously reported leak. A broa=
der
> > devm_clk_get_enabled() conversion was posted in 2023 and reviewed, and =
a
> > similar cleanup was posted in 2024, but neither appears in current upst=
ream:
> > https://lkml.iu.edu/hypermail/linux/kernel/2305.1/00605.html
> > https://lkml.iu.edu/2408.2/09536.html
>
> Someone raised an identical patch last week
>
> https://lore.kernel.org/linux-arm-msm/d1882207-4756-4e65-ba30-b47ccc821fd=
4@oss.qualcomm.com/

...in an obscure and seldom used driver.

So a clear sign that these reporters are using the same AI agent
to find random bugs ;D

Yours,
Linus Walleij

