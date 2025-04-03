Return-Path: <linux-arm-msm+bounces-53110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B62CCA7A531
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 16:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7BA188854D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 14:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DCE24EA99;
	Thu,  3 Apr 2025 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOQ1ccF6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FFA24BCF9;
	Thu,  3 Apr 2025 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690570; cv=none; b=dfD+N/R0gkdgonD22FRK5t2L1x7KNAWckDxgE38axoD/jyLWonfDns+9gdT1hRParji9F5Z0LIaDH+rEfzzcoRmytt67XJii6AcnKiH6VQ52uqypkAHBtqB66ssN9y2d+u1dnpCyLPYf48pUMElDn4OAwj7mbE0I+huxFufL96M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690570; c=relaxed/simple;
	bh=vTwMHvOovCZ//ixEtEQTfu+/vKY6ddXQrx23wvtkghE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZPRl5dTu5LdiAfwsCOZEkhDoCo29KqveVLvrLbn8UYf1irN8M0qHq8ce9QJPRZBb0CwuEgqbznK+r+pVf2hmk81N3Zy0PlR6VeGySW/9aJNKksP5cBekbgKp2i1KC5DNmh3NWnReY+yusT5V2zc4e/DJA8KzqpdEuejTGbO8MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOQ1ccF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC00C4CEE3;
	Thu,  3 Apr 2025 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743690569;
	bh=vTwMHvOovCZ//ixEtEQTfu+/vKY6ddXQrx23wvtkghE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOQ1ccF6zAtk8+uAHm9om+QfLiOLo9bCr0YBI2sXEyUyIcyvqTmExgKoOqnQV/KUI
	 eyreS9A/pfL9+mUwDDaiAZ4quM6uauMhkL7z4oaroHhj89n0SQXXVdYPGsoCzzCpq5
	 ioLOYzq9gN1o2dk6t3C5jUoATUvgHDvoB5Hdd0F3I967pAa/xusNl81EyLMOQ+egIO
	 tYJX8ti9MUocytEeYn4L9YN6x/+R5ci8eRphHI678wg+kGCNe+0pIzpKUoNxt9kA+G
	 FAwMRDfZJp6q8LnTZlflN0rT6YJdUKbYTW9xFrga1gI6vipGNs1Ipf0SeNWFAl/BEl
	 fFd1X+gf0J0ag==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u0LZW-0000000069e-2E6c;
	Thu, 03 Apr 2025 16:29:35 +0200
Date: Thu, 3 Apr 2025 16:29:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org, ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
	conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
	tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH v6 5/6] ASoC: codecs: wcd938x: add mux control support
 for hp audio mux
Message-ID: <Z-6bTj097a1LVn3X@hovoldconsulting.com>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-6-srinivas.kandagatla@linaro.org>
 <Z-z_ZAyVBK5ui50k@hovoldconsulting.com>
 <8613cf45-d202-4577-868c-8caf771c7bc4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8613cf45-d202-4577-868c-8caf771c7bc4@linaro.org>

On Thu, Apr 03, 2025 at 01:19:57PM +0100, Srinivas Kandagatla wrote:
> On 02/04/2025 10:12, Johan Hovold wrote:
> > On Thu, Mar 27, 2025 at 10:06:32AM +0000, Srinivas Kandagatla wrote:
> >> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>
> >> On some platforms to minimise pop and click during switching between
> >> CTIA and OMTP headset an additional HiFi mux is used. Most common
> >> case is that this switch is switched on by default, but on some
> >> platforms this needs a regulator enable.
> >>
> >> move to using mux control to enable both regulator and handle gpios,
> >> deprecate the usage of gpio.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> > 
> >> @@ -3261,11 +3276,26 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
> >>   		return dev_err_probe(dev, wcd938x->reset_gpio,
> >>   				     "Failed to get reset gpio\n");
> >>   
> >> -	wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
> >> -						GPIOD_OUT_LOW);
> >> -	if (IS_ERR(wcd938x->us_euro_gpio))
> >> -		return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> >> -				     "us-euro swap Control GPIO not found\n");
> >> +	wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);

> > Running with this patch on the CRD I noticed that this now prints an
> > error as there is no optional mux (or gpio) defined:
> > 
> > 	wcd938x_codec audio-codec: /audio-codec: failed to get mux-control (0)
> 
> This is not from codec driver, mux control is throwing up this.

Yeah, the error is printed by the mux code, but it's this codec change
that starts triggering it.

> > You need to suppress that error in mux_get() to allow for optional muxes
> > to be looked up like this.

> I have a plan for this,
> 
> I proposed some changes to mux api for exclusive apis at 
> https://lkml.org/lkml/2025/3/26/955
> 
> This should also allow us to easily add an optional api, which I plan to 
> do once i get some feedback on this patch.

It may just be as simple as demoting that dev_err() in mux_get() to
dev_dbg() and possibly make sure any callers log errors themselves.

A quick grep shows there are only 12 users or so and most of them
already seem to be logging mux lookup errors.

Johan

