Return-Path: <linux-arm-msm+bounces-9753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A8848FBB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 18:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05845B22924
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 17:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F5924A0E;
	Sun,  4 Feb 2024 17:29:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699F024215;
	Sun,  4 Feb 2024 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707067791; cv=none; b=pPObmJ/CFFIgb14FKGI0HYJfi5rIbWlho9RFVoaaiKnOhVrnqVR1saTTMOCJddULJggVk1U1bPMtn7nqyIdov1nuTkeiNci/akaRss27BvyEaW38jY5QkGU2MUEqNurIsqyVvZaKexWuXilAP1h2iohB2eNlHIT1KqFVxQRhKkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707067791; c=relaxed/simple;
	bh=lzSrv4+0HNUHwkpIOl2xT9ERzLM/rHgR5h5G3ipP+LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bS9rL3cDifsINtczbr74/ejSK0f4xzMUuO7m3bgVWM1Ws8qya95Xg2tYliOiT/4yDi0X4fA/uUz4YQuvpRCiopc8kF1HftfvqkCdTaIWp7txHHeRUJaFbbRNSE2nFliN8B55p/QTMTttRM+ycmbJI4R9VlT+bNDrVvTu3r4qQ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (2a02-a420-67-c93f-164f-8aff-fee4-5930.mobile6.kpn.net [IPv6:2a02:a420:67:c93f:164f:8aff:fee4:5930])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 348BA3EF26;
	Sun,  4 Feb 2024 18:29:45 +0100 (CET)
Date: Sun, 4 Feb 2024 18:29:43 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, phone-devel@vger.kernel.org, 
	Pavel Machek <pavel@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, Satya Priya <quic_c_skakit@quicinc.com>
Subject: Re: [PATCH v4 2/2] leds: qcom-lpg: Add PM660L configuration and
 compatible
Message-ID: <vj7mlrrvn7y45fpavdy37eqfxrz3anq43qh4n2flktckuaoeo7@ynlw5rexyi27>
References: <20220719211848.1653920-1-marijn.suijten@somainline.org>
 <20220719211848.1653920-2-marijn.suijten@somainline.org>
 <ZYFS04cznE5bhOeV@hovoldconsulting.com>
 <3lsapoxlqijes5m4nqcbhdfhhs4chq3mcq3jaty7v2zihsqnwu@nn67a4h6425k>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3lsapoxlqijes5m4nqcbhdfhhs4chq3mcq3jaty7v2zihsqnwu@nn67a4h6425k>

On 2023-12-19 10:17:21, Marijn Suijten wrote:
> Hi Johan and Lee,
> 
> On 2023-12-19 09:22:43, Johan Hovold wrote:
> > Hi Marijn and Lee,
> > 
> > On Tue, Jul 19, 2022 at 11:18:48PM +0200, Marijn Suijten wrote:
> > > Inherit PM660L PMIC LPG/triled block configuration from downstream
> > > drivers and DT sources, consisting of a triled block with automatic
> > > trickle charge control and source selection, three colored led channels
> > > belonging to the synchronized triled block and one loose PWM channel.
> > > 
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > > 
> > > Changes since v3:
> > > - Rebased on -next;
> > > - (series) dropped DTS patches that have been applied through the
> > >   Qualcomm DTS tree, leaving only leds changes (driver and
> > >   accompanying dt-bindings).
> > 
> > > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> > > index 02f51cc61837..102ab0c33887 100644
> > > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> > > @@ -1304,6 +1304,23 @@ static int lpg_remove(struct platform_device *pdev)
> > >  	return 0;
> > >  }
> > >  
> > > +static const struct lpg_data pm660l_lpg_data = {
> > > +	.lut_base = 0xb000,
> > > +	.lut_size = 49,
> > > +
> > > +	.triled_base = 0xd000,
> > > +	.triled_has_atc_ctl = true,
> > > +	.triled_has_src_sel = true,
> > > +
> > > +	.num_channels = 4,
> > > +	.channels = (const struct lpg_channel_data[]) {
> > > +		{ .base = 0xb100, .triled_mask = BIT(5) },
> > > +		{ .base = 0xb200, .triled_mask = BIT(6) },
> > > +		{ .base = 0xb300, .triled_mask = BIT(7) },
> > > +		{ .base = 0xb400 },
> > > +	},
> > > +};
> > > +
> > >  static const struct lpg_data pm8916_pwm_data = {
> > >  	.num_channels = 1,
> > >  	.channels = (const struct lpg_channel_data[]) {
> > > @@ -1424,6 +1441,7 @@ static const struct lpg_data pm8350c_pwm_data = {
> > >  };
> > >  
> > >  static const struct of_device_id lpg_of_table[] = {
> > > +	{ .compatible = "qcom,pm660l-lpg", .data = &pm660l_lpg_data },
> > >  	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
> > >  	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
> > >  	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
> > 
> > When reviewing the Qualcomm SPMI PMIC bindings I noticed that this patch
> > was never picked up by the LEDs maintainer, while the binding and dtsi
> > changes made it in:
> > 
> > 	https://lore.kernel.org/r/20220719211848.1653920-2-marijn.suijten@somainline.org
> > 
> > Looks like it may still apply cleanly, but otherwise, would you mind
> > rebasing and resending so that Lee can pick this one up?
> > 
> > Johan
> 
> Coincidentally I haven't touched this device/platform for months... until last
> weekend where I noticed the same.  It does not apply cleanly and I had to solve
> some conflicts:
> 
> https://github.com/SoMainline/linux/commit/8ec5d02eaffcec24fcab6a989ab117a5b72b96b6
> 
> I'll gladly resend this!

Apologies for taking more time than necessary.  According to b4 the patch should
become available at:

https://lore.kernel.org/r/20240204-pm660l-lpg-v5-1-2f54d1a0894b@somainline.org

> Note that I have one more unmerged leds patch around, that hasn't been looked
> at either.  Would it help to send this once again, perhaps with more reviewers/
> testing (Johan, would you mind taking a look too)?
> 
> https://lore.kernel.org/linux-leds/20220719213034.1664056-1-marijn.suijten@somainline.org/

I'll continue looking into clarifying this patch before resending it.

- Marijn

