Return-Path: <linux-arm-msm+bounces-90185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NIiMisXcmksawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:25:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FBA66972
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2472D7259EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EFE3B8BDC;
	Thu, 22 Jan 2026 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9Domf+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE5821579F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769081360; cv=none; b=sCjJagbpjnFFOAZuII2v6cAQSX/x0ZXL6JkXepIoIjaSTsBlGyU/FB5dg8d8JPBZgDWidLq0n8lFVWrIOVOO/FhAHBpcekp/bGUhw8fK6yG46gMUCBx2lFs3cZ6wL2GFIsrmWnP7Etcz8ND4P6yI2LHjmJM0QMgHyT5U0AwBIrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769081360; c=relaxed/simple;
	bh=Pa6NJHGR/Ca+AdnYMkYiHJqxxWBxkO2aE6kM3LFtYOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8MtA8tZDCiFsPmjhdcSNJsyLQ7MBCAbZC0g/yMfadFP89E6ZCHn4UA9u36CM2WpMpMvgIWcVjSv1llzWvQ34kZn0rMe8Z6EoZVHEV8wabjV+sQVkWZpGYRVUmh4upqNlX19fXfNSafLKy2mAEQTbWP9hzn3O0ozdpR6ek4ggrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9Domf+z; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-432dee2b55fso114771f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 03:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769081357; x=1769686157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w719Adxu/spsT1aehDZuiWXX85fwgBdKYmTk1wyv4mk=;
        b=h9Domf+zVIBdcbOcrhkOtJDj1PjHEpulnUdQWUnHLNLqDybQqJu+wkEBCd7dIj88Es
         dADLs9GTuoFBhtMcWYxajYsk+2jau6rD7oiy28jXiMVLMH1TcZlR4vnJzhnA2c4KsLjI
         vhITAdDQ1g4jIBDdkY3Xs+Rslf57+2Ub9b6kSIIx/tqpnh6hEO5seBpFHNfVQyC2ywQO
         M0zxgl4Cbbv+mZARPbZi93BUqQcNaoOY5u13flm//pwA5M3Z0oEg4zfDr0Dyw3N9XnR6
         JsobfN1o9m7nlwyJ2V5iobK71TCibtNtbo1qVz0BBch9LgA+5qi0o9bJ/TnNeXDl0sI+
         Mpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769081357; x=1769686157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w719Adxu/spsT1aehDZuiWXX85fwgBdKYmTk1wyv4mk=;
        b=e9Q4YojcJdu0YERQkSYgl8Pj4mMvesXNiU8vaCo7f8oPiJoKSvkMMbxLDzPNjlvXOd
         4U69u4Fb6BxV6dcQBkcNdw8NKVIxwfSHKb5CiTNsMwV9+TuxYmmJpX0DmY+f+fZL008P
         iyXl0PssU69gictAoRHWkHmdxGECSzFtmz/i4KGXbUUkAbgWegQiw4bI5v6ejQ4yBf+R
         ba9/UnXvDwIlkVGSmwZOkrcUSe4FSFOBC6ZjYppBt0G7sDponruL+uDSg8ZvzgjsyeAh
         8cw/+ru0h+CDWb7F+DL4QSlwCMGHlVk21nee+O2Rc3RWRzrd4G7NKKxuvbeBCXpUqKGM
         Iv8A==
X-Forwarded-Encrypted: i=1; AJvYcCUI7i5IqzJYEBxx6EYPnJ5DfvZ+tAGiBawvR2X915VPoy+UNmtNgUh3kjoLF4lLxdroSJBUsHcDgng37VVN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo2eedjyhxftDgtBMGLX7jU3sHC7IBEEXgCEk8IoULQHmMMFtk
	LPWSn8vW7C0afh3iYGNiwnK2iNMHjyzFB8b6XvuuOj/x94mKLu+8Kz7h
X-Gm-Gg: AZuq6aLaj1EoSmy+wZckoGAz940lpvM8e7y3U8bcG96HEC52MbhVciRwr6UwYKBg4Ty
	gXQ1qVutyEctnVAAOdUODKZrEJ2nn1UiRy7UlyryDaRIKBONLsY6NLJH4lQfknV0jzH4FzSCuF4
	pce1xX7XtGj6ekVUJYZ7KajqQkCqHwUGOl91JIy6d7JN+239i4P+UN283WWbib0AnFjQyjQelQj
	8Urag4n9+7ioZtT88Nk4Sce4A7phbPNcRmtU6Q31LVylIP/Vt+EMso2sjpw8X/1AdX86vSyzxXI
	QbLYsk36mLOrlKdVp5ITg9rZ8o3kf6Ool8emn4FIBIhyt3JT714RSxUZGehFxIFphUFOT1cFOh4
	LJZ2V8NKR84kAQnWYx9GlDy6Dupa4h5pLrQ3MrjqhUZasqdz2KDNFusnHYuni0C4JxvPb0GD2g3
	eN1mY=
X-Received: by 2002:a5d:5f83:0:b0:429:bde0:1da8 with SMTP id ffacd0b85a97d-43569bdaa4amr18327128f8f.7.1769081356806;
        Thu, 22 Jan 2026 03:29:16 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:7677:83bc:43db:13ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf58sm44986696f8f.22.2026.01.22.03.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 03:29:16 -0800 (PST)
Date: Thu, 22 Jan 2026 13:29:13 +0200
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
Message-ID: <20260122112913.svzaie4eywk5nc32@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120081844.7e6aq2urhxrylywi@skbuf>
 <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
 <20260120121114.2aedgu42i2wax3yp@skbuf>
 <aXDm0jVOYOZ9l6Wu@shell.armlinux.org.uk>
 <20260121162345.4jpzvwqhfqxd7tl7@skbuf>
 <aXEN6B5_T9uFzVvu@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXEN6B5_T9uFzVvu@shell.armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90185-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,lists.infradead.org,davemloft.net,bootlin.com,foss.st.com,oss.qualcomm.com,linaro.org,gmail.com,vger.kernel.org,google.com,lunn.ch,redhat.com,st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 88FBA66972
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 05:33:28PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 21, 2026 at 06:23:45PM +0200, Vladimir Oltean wrote:
> > On Wed, Jan 21, 2026 at 02:46:42PM +0000, Russell King (Oracle) wrote:
> > > On Tue, Jan 20, 2026 at 02:11:14PM +0200, Vladimir Oltean wrote:
> > > > On Tue, Jan 20, 2026 at 10:12:46AM +0000, Russell King (Oracle) wrote:
> > > > > First, I'll say I'm on a very short fuse today; no dinner last night,
> > > > > at the hospital up until 5:30am, and a fucking cold caller rang the door
> > > > > bell at 10am this morning. Just fucking our luck.
> > > > 
> > > > Sorry to hear that.
> > > > 
> > > > > On Tue, Jan 20, 2026 at 10:18:44AM +0200, Vladimir Oltean wrote:
> > > > > > Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
> > > > > > after calling pcs_disable(), though?
> > > > >
> > > > > No. We've already called mac_prepare(), pcs_pre_config(),
> > > > > pcs_post_config() by this time, we're past the point of being able to
> > > > > unwind.
> > > > 
> > > > I'm set out to resolve a much smaller problem.
> > > > 
> > > > Calling it a full "unwind" is perhaps a bit much, because pcs_pre_config()
> > > > and pcs_post_config() don't have unwinding equivalents, unlike how
> > > > pcs_enable() has pcs_disable(). I don't see what API convention would be
> > > > violated if phylink decided to drop a PCS whose enable() returned an error.
> > > 
> > > While pcs_pre_config() and pcs_post_config() do not have unwinding
> > > equivalents (what would they be?) the issue here is that these could
> > > have changed any state that isn't simply undone by calling
> > > pcs_disable().
> > > 
> > > For example, pcs_pre_config() could have reprogrammed signal routing,
> > > clocking, or power supplies to blocks.
> > > 
> > > This already applies to Marvell DSA pcs-639x.c, where the pre/post
> > > config hooks change the power state of the PCS block (for errata
> > > handling), and the only way that gets undone is via a call to
> > > pcs_disable() which explicitly disables IRQs and power for the PCS. Its
> > > pcs_disable() isn't a strict reversal of pcs_enable(), it does more.
> > > 
> > > We already declare the interface to be dead on pcs_post_config()
> > > failure, but we don't do that for pcs_enable() failure.
> > > 
> > > Maybe I need to explicitly state that pcs_disable() does not directly
> > > balance pcs_enable(), but that _and_ the effects of pcs_pre_config()
> > > and pcs_post_config(). However, that itself will add to the problems.
> > > What if pcs_pre_config() and pcs_post_config() succeed but not
> > > pcs_enable()? pcs-639x needs pcs_disable() to be called, but if we
> > > require pcs_disable() to be balanced with a successful call to
> > > pcs_enable(), that messes up that driver, and pretty much makes it
> > > impossible to work around the errata.
> > 
> > What if we reordered phylink_major_config() such that phylink_pcs_enable()
> > comes first, followed by phylink_pcs_pre_config() -> phylink_mac_config() ->
> > phylink_pcs_post_config()? Superficially looking at pcs-639x, I don't
> > think it would break.
> 
> I'm sorry, but I don't have time to continue this discussion today. I
> woke late, we're trying to cram in the meals (in the middle of delayed
> lunch-time dinner right now), work wants a quick call to discuss a
> project that I missed the meeting for yesterday (which I haven't yet
> had time for...)
> 
> Sorry, but while you may wish to get this sorted, for me this is a very
> low priority issue that can be addressed later. Don't think I will have
> time to review anything you send - and that's not a personal attack,
> it's because I'm barely managing to hold everything together at my
> end, and I don't have the time.

Thanks, this was a good talk, I understood a bit more about the
challenges that need to be overcome. I'll do some testing on the
Turris MOX with a 6390 switch. From my side this shouldn't block the
stmmac integrated PCS from being integrated with the SerDes, but I do
agree that leaving a comment explaining the current phylink_pcs calling
convention, as Jakub requested, would be very useful.

