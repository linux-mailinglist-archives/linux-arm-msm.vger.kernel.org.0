Return-Path: <linux-arm-msm+bounces-71413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD09B3EAD3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 17:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E90D3AF7A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 15:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE13341AB7;
	Mon,  1 Sep 2025 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXFrVX3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C48334372;
	Mon,  1 Sep 2025 15:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756740049; cv=none; b=gB9e5r9QFibND6V1YzaPjllndm/o5hHQ5Tc7TPQvnGBGKuQ47U+tLGBguV8pE8UZ/nWdWLoI/YNpODPKYyT2tfdZkatTrNfuBWUzQQygai8pIf3+bogsfse6flXpPtIRHgxGbquvUe8DWMgECttG84mXehXQc0XsxsRrQU82jXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756740049; c=relaxed/simple;
	bh=fYYU8NMNLyVlLnO0IlrsfJJzJO/BBopDiQds5sD+5IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d286CR2tFb81j0b+iu4buvV22V8MXkw5ueBe4NseVqWjLkjaj8Yzaf6S+2S37aSAgEBZB1foaFs3s+E88VmSA/AZ1FoJdSiG0UpCSIsVrL1DZozVFf7jAoH+3xzqkxxUlN8RSSLd6I4dgMNW4c72MXY0nYWvqVvQZSC1xrhPiJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXFrVX3g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87825C4CEF0;
	Mon,  1 Sep 2025 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756740047;
	bh=fYYU8NMNLyVlLnO0IlrsfJJzJO/BBopDiQds5sD+5IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXFrVX3gf/tcrem+lyBbwfdS6AHuCHPQF2/lq5E7UmoBLTnaPBMOwiLE5YhZPSyEq
	 uswqR/b+n/8ZhYJ8bkJ6beLW/OMGHNouJc4fIWvPPJkRo3/CqZgdqgqYvJ03FZWxsM
	 ceFhBIzOPJs8pR5VM4/eXOP772I+SNl8+B3F36xbiRjaVNV9/nNrQKRE7spJ6nMMCw
	 nr0UJmyC2WonGC/h8bIngoF88Vlv1IU3XoEmFCYKIi1FmTs7/qD+H52yYZqABxiHri
	 Zd+AbMrsQYN74WRR/haDxIMbZVs/Mwzy3ucow5Cxjv1pUS7gqW1zSAgtCtVwQOXmwk
	 ZiAihGO1gGPVA==
Received: by venus (Postfix, from userid 1000)
	id 545A41801BA; Mon, 01 Sep 2025 17:20:45 +0200 (CEST)
Date: Mon, 1 Sep 2025 17:20:45 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] platform: arm64: thinkpad-t14s-ec: new driver
Message-ID: <wyv3ounark6jccvhj4vp5qxgmn4bleq6hsqinr4s6r32kld4xp@lhbmetuhydns>
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
 <20250831-thinkpad-t14s-ec-v1-2-6e06a07afe0f@collabora.com>
 <899b2e79-572d-44f3-8dff-0d301f254b1a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <899b2e79-572d-44f3-8dff-0d301f254b1a@linaro.org>

Hello Bryan,

On Mon, Sep 01, 2025 at 09:43:11AM +0100, Bryan O'Donoghue wrote:
> On 31/08/2025 22:28, Sebastian Reichel wrote:
> > Introduce EC driver for the ThinkPad T14s Gen6 Snapdragon, which
> > is in theory compatible with ThinkPad ACPI. On Linux the system
> > is booted with device tree, which is not supported by the ThinkPad
> > ACPI driver. Also most of the hardware compatibility is handled
> > via ACPI tables, which are obviously not used when booting via
> > device tree. Thus adding DT compatibility to the existing driver
> > is not worth it (almost no code sharing).
> 
> What is the name of that driver, you should name it in your commit
> log. Lenovo WMI ?

The existing driver is known as "ThinkPad ACPI" and thus already
referenced in the commit message. You can find it here:

drivers/platform/x86/lenovo/thinkpad_acpi.c

Feel free to suggest a specific wording that I can take over, which
would have helped you to figure that out :)

> [...]
> > +	ret = __i2c_transfer(client->adapter, &request, 1);
> > +	if (ret < 0)
> > +		goto out;
> 
> I realise this is your coding style but suggest newline after these gotos.

I will look into using that style in v2 throughout the file.

> [...]
> > +static int thinkpad_t14s_led_blink_set(struct led_classdev *led_cdev,
> > +				       unsigned long *delay_on,
> > +				       unsigned long *delay_off)
> > +{
> > +	struct thinkpad_t14s_ec_led_classdev *led = container_of(led_cdev,
> > +			struct thinkpad_t14s_ec_led_classdev, led_classdev);
> > +
> > +	/* Can we choose the flash rate? */
> > +	if (*delay_on == 0 && *delay_off == 0) {
> > +		/* yes. set them to the hardware blink rate (1 Hz) */
> > +		*delay_on = 500; /* ms */
> > +		*delay_off = 500; /* ms */
> > +	} else if ((*delay_on != 500) || (*delay_off != 500))
> > +		return -EINVAL;
> 
> Those 500s should probably be defines

Ack.

> Aside from those few nits, great to see someone take this on, glorious in
> fact.
> 
> I don't have this particular hardware myself so I can't test but:
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Thanks for the review.

Greetings,

-- Sebastian

