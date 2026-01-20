Return-Path: <linux-arm-msm+bounces-89777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D997BD3C296
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 09:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 135E95C157A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 08:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DC335A923;
	Tue, 20 Jan 2026 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzQvYKJM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6546342CBD
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898555; cv=none; b=u74FFXK+tIE9LJd/Kv3VNfXUnfkUG+Gbz2f45EmTpB5ZfnI85V8e1raKKtfjfSIZdeyMlHi48qCEPhfwBDPob8S/OmdhjyoEryVRxiUitQxI/Yn9WHuOSgiC+L+4/LBmM7avHAop9airgP1WdCsHSRpx1gGELSPzM6C2n9oYtaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898555; c=relaxed/simple;
	bh=GcURrIEm9qc4C4FHh8U13XmSp6AYgvTR05dw4sSmpIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZXfJkxM3tfpdePfvfcGm7kDYKuJ0FhXvmkNEEWCKqs09xiaTRE/RZPG00euP54pKC/j/YxyGwWkpbiDHw+vxuvsuzWqIIKN0hn2ZlAuQeNeSnucJDKpQK0b0HzkGQglE/GdLSrnxtGnhPYhIEli2cb1MYxSyVOnRDzgVBuiTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzQvYKJM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-655b5094119so746591a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 00:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768898551; x=1769503351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xxc76MSYJQhrdh5EUR+3rjpNU84KqL6b3u3m7jeyrTQ=;
        b=dzQvYKJMG4W9nfeaVGKCEfykzEwWztd+ELd+N2MfAzYX3mS/0pzYECyk6dmnggk1ho
         JqTyzr7OF5s0mMwEZA2EfePriWtGVqkbdJAmrgIzNakjSsf6VavMkv2VAn86Pf+niHGK
         uqqtagoOodqJz4rP4ddxICEJritmRxtKSfRKOAgxd0pRpuOp6VvbZCKkpBmenoEn7mUR
         QJ7VnK2ujmQCy4XUtmjD+ZdxnqWkHub+9LH1Ff/r9eNUiOedRNpBkhKOe4w71xq1RzNB
         UB9R83thH529msMJNciK8QPKvHTsGSaPWFvpDA3TLBLDAXIjI1VKD7k//p74LGLJjiFC
         LLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898551; x=1769503351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xxc76MSYJQhrdh5EUR+3rjpNU84KqL6b3u3m7jeyrTQ=;
        b=N0H02lLIPN4uigJFUgd/E+t4Cc4hLpGvaNqOB4f4nbB3sc6dBAMh96vR26vIiEK/qZ
         HlQ8ltFYkIt+92rH2vkHW45oWr7gjLBvRlRuHeUFbI7vYEzoSDGgHlSgewiiKrD/TjEp
         +C608RouZPrs/KKBuD4o0PAC4Rt09yFuXFDEHV5DpDoJ3mwr5cGU41cVK6Z5LCsMPeAb
         hIuo/WgJeMQlWcbhB7mfIqCVFEmGj0ygHz783Au2MhW7ElrI8bLHoMgIznx7Zp08LvMs
         J/7XLM2JIF4QgyWwpRPbIc3h/N7hzHKpAYVCM7fY7fQX/YV8/6fmIVvCNzWcVd+G4u0o
         IEMg==
X-Forwarded-Encrypted: i=1; AJvYcCVJcR+RigAIUTNb71/9ytHsTuMRj5FwN29nh1rfe0J83QTShb3rZI60u2XPaNCnoBginyViDEDC+brXzBzo@vger.kernel.org
X-Gm-Message-State: AOJu0YygEHYlIg8PsJPLgNARLeqvTchue4I9cGBGE8HwF/cv/o5fpDY1
	HpnEcpdym6aJwEbPCPpVuo5xX7t3mSvjKDEkpa8pgVbCjMsG+DBQLWuo
X-Gm-Gg: AZuq6aLpDRIrM5TdxosM6pauFX+OCImd/oSEx2nZnwGTsyhbn2qvI+aNAVQOODSVSqe
	rgaKt4Czni2iq3vsa4/25Oxz4vdqzKvbXTEcfHtp215abwZj1NT0FesCRiIhSoEeCnTyN3ofBFZ
	2ghk4tIzijmFsdGGBBvE4VAdZ3f8PJU04uwIPLk53Wb6a3gmY0z6iQcV9PywklsAK7vmoiQV04R
	RJTQ57mhU2A5SDtJpCW41tQLVgG7o1E2KwXHsTT5Rr0aODuiXSEtiSki8twD5SIlZXx47KsGczN
	QJElJRePwO7MAwQeprNMpv31+akh86c/v3zh0tV9Vt68A9gPzg/ujHWqqmDGbS4p/mK8SZpEQ3W
	BNDFL5R8g9uY21dENHfFq2ZraU4QVFqeomxJRoDKFzmSkzLONpAIdah+O0soo19wA5x37ppWUUJ
	cM9mY=
X-Received: by 2002:a05:6402:348d:b0:64c:9e19:982d with SMTP id 4fb4d7f45d1cf-654523cc85bmr6267784a12.1.1768898550768;
        Tue, 20 Jan 2026 00:42:30 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:619a:24df:1726:f869])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e72asm1348612966b.11.2026.01.20.00.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:42:30 -0800 (PST)
Date: Tue, 20 Jan 2026 10:42:27 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-phy@lists.infradead.org,
	davem@davemloft.net, maxime.chevallier@bootlin.com,
	alexandre.torgue@foss.st.com, mohd.anwar@oss.qualcomm.com,
	neil.armstrong@linaro.org, hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
	edumazet@google.com, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, vkoul@kernel.org,
	andrew@lunn.ch, pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Message-ID: <20260120084227.j2wgbmjsrpmycpgn@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>

On Tue, Jan 20, 2026 at 05:04:53AM +0000, Russell King (Oracle) wrote:
> On Mon, Jan 19, 2026 at 11:21:25AM -0800, Jakub Kicinski wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > 
> > For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> > ---
> > net: stmmac: add stmmac core serdes support
> > 
> > This commit adds SerDes PHY support to the stmmac core driver, moving it
> > from platform glue into the integrated PCS driver. The SerDes is managed
> > through phy_init/phy_exit for lifecycle and phy_power_on/phy_power_off
> > for the power state.
> > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > > index 2f826fe7229b..4d1902f3a58f 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > 
> > [ ... ]
> > 
> > > static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
> > > {
> > > 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> > > +	struct stmmac_priv *priv = spcs->priv;
> > > +	int ret;
> > >
> > > -	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
> > > +	ret = dwmac_serdes_power_on(priv);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
> > > +		ret = dwmac_serdes_set_mode(priv, spcs->interface);
> > > +		if (ret)
> > > +			return ret;
> >                         ^^^^^^^^^^
> > 
> > If dwmac_serdes_set_mode() fails here, doesn't this leave the SerDes in
> > a powered-on state? dwmac_serdes_power_on() succeeded at this point but
> > there's no corresponding dwmac_serdes_power_off() call before returning
> > the error.
> > 
> > Looking at phylink_major_config(), it appears to discard the return
> > value from phylink_pcs_enable(), so the caller won't know to call
> > pcs_disable() to clean up the power state.
> 
> This AI analysis is incorrect.
> 
> By the time phylink_pcs_enable() has been called, the PCS is already
> plumbed in to phylink. It _will_ have phylink_pcs_disable() called on
> it at some point in the future, either by having the PCS displaced
> by another in a subsequent phylink_major_config(), or by a driver
> calling phylink_stop().
> 
> If we clean up here, then we will call dwmac_serdes_power_off() twice.
> 
> Yes, it's not "nice" but that's the way phylink is right now, and
> without reworking phylink to record that pcs_enable() has failed
> to avoid a subsequent pcs_disable(), and to stop the major config
> (which then potentially causes a whole bunch of other issues). I
> don't even want to think about that horrid scenario at the moment.

More to the point, if dwmac_integrated_pcs_enable() fails at
dwmac_serdes_power_on() (thus, the SerDes is _not_ powered on), by your
own admission of this PCS calling convention, sooner or later
dwmac_integrated_pcs_disable() -> dwmac_serdes_power_off() will still be
called, leading to a negative phy->power_count.

That is to say, if the model is "irrespective of whether pcs_enable()
succeeds or fails mid way, pcs_disable is called anyway()", then these
methods are not prepared to handle that reliably.

