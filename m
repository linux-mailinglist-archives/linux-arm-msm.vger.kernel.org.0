Return-Path: <linux-arm-msm+bounces-106094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNcCHzkP+2kTWAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:51:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBEC4D8F45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56A873037684
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2733ECBEE;
	Wed,  6 May 2026 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="qf95NCfx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43203ECBE6
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060768; cv=none; b=uhI7UhUTF62KKn6abLB2ejDmQp5bIEQzmoweSDIVjhwo8bL0HyBszztPhpBZjczaQXFnw3uuF68yzy5ZQDoP3Pf0a13eWbps3alwIWm4nv6vngLwrIIxP5P1LSz0F0t8LXPFcLB+yALpLxBGVNQvaKYM9fpoW0kUHiWwBPns6yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060768; c=relaxed/simple;
	bh=UfLP1tUzO3A3YXd/nCpoke2Vqju/wUSSq/yG/FR+WW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WD3PcdNXp4CCB9KJZAxrT7wlbfuaOrbBaqFZk9fFnP/Q1uFhEOHplTmFZrak9N2W8ejzT3DTCeroAwlPLL634UWX3mRTe0OvwuzVmIEUz2sfkfDkgX5VI8lNDPaDYNbS1cppOAuqwzyEOOR+Eq4Pyjc/9kgQVheLhRKv8ZXkLRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=qf95NCfx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso66539315e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778060765; x=1778665565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvO5cR5xwJ6Wruq4xsZ8UnvszQRGf9f2UYLH+AJmPFY=;
        b=qf95NCfx8eT8q+22AmgDAhodGtcSDNymauOoWGWblOztJb5IKvE6NaVvy3K+b+D8i/
         c9Y8lg72wraLqzTH0qEnVPAtIfQOJlUlSZCIq1gMShmOkMHVvMfQ0VQYeFpRAzmQssk9
         vIerJMRrg66l8fQCySh2uxli7IpQszcZahsyJ/8YYthhm6qj1wkLXF1n8R3uCUXWFj5o
         lkJlUgz5frR5fjSYlmyuQV/P96ZyqGmzZsPvfp64RCJ6JdKDd/HpNqBUTb0el0RcvyuW
         Hia7rf2sTxsMoiE2s0SGV20z2+TzaHiSq+H4zCrxtAffDGsZeaO7KtkcgYhqTsNyRvps
         9GlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060765; x=1778665565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvO5cR5xwJ6Wruq4xsZ8UnvszQRGf9f2UYLH+AJmPFY=;
        b=YKnSLl/KazsLXjVzjVr1g2YpB+AoG0xNEOqGv4AJ/lBDcRqIz/ea6lth38qKmPDhRY
         QNCWh+ErD/c8IJIZ9P+ccX2ddzVJ/5RX3bsrweIfvQh2xNj9oKZ3L0C9I603L7uRe01Z
         iNekv68ryJmoQmBSvX9zxL27FgmF+JbWq58NjK/PMZOAw9lXpvRHWaoA8o8qYMZd5rne
         QoWR/uYJUSMyLaJRWUhI1/Ee6c3U0gzHHoM77UvR5aNgvogbYKX6qe9+VvAysNBgfQzT
         uyFiIp4NXUlvXZLXMyKE0KxerizBfGim1KMTgY3un+2ky9+Yljz5oEoB3MUXHcU8DAsr
         X7ug==
X-Forwarded-Encrypted: i=1; AFNElJ8oURgMD/GrHel9770ygflT/KnlbVXiSBnpTj9k9a/lX43Keg2PCLslid0rMma0MVuaehcRcpGVYI+c3Mt9@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJvA4RcQV+tWFRv5HDDrAPYhHFdDe2GizRiD76uFDfLtIWlZw
	tKImZIuhuZBShe4P7YEjgWV3NUW7n6JGvrBgYUlwq/tyjJseSAt9x5WAJGVL74eE1rw=
X-Gm-Gg: AeBDievpY98Nm2fsmlpDk4npJHNC+a+CFD4t7rW64+sREHHnDdPJgZ4L1RkfpTkQ94N
	VpWjBOE6K6yBfNAVXSLKv+KgM+66fG7gTi0qWdycsXBw6bnY2s6NkJErfXdhzGuioeU4gcrmCFs
	ohnYDP7V/AzGNhAXF8sSAb1YYZ0FgqwIhCXI5hsia901YJD3I+SQfu+GW8C/bng1l7eq4LYzpM/
	qSucnvhANXNrscfrZsrgeQ/egwPOUO6d/6Ib+l/wdSiDh2HatAa34IP5fb6w0FvHO1k+Q7bGdoe
	ATKgozo1UPlMpf3fQMqtBslKZeWoDitONxnpnsnw4mGqHKxz7BsmvpMPTGlQcmhR7fBrzV0o10J
	M5ZiAI1lsSm3Ok2nV1Qk+YNch/+DAQEht0icO0MbMCL3g3YuNVvA//fZo+T7PvU6aWqtJfyJybF
	1IfWLx1F4YH4JmgdA0+zriGOgG/DdqQzle8zMv183Eyaykbgb+gRaLYx3D6Ao4J04lMYDXG3Eut
	lB/7izoA2RVso8wh78p0AGnwTwCWTbyHzs9OjBFj3NPFn+CwPLUUnfWTBceIaD0voxpMELp49Y2
	84NCUMHi5aQgKMJf0RU=
X-Received: by 2002:a05:600c:a305:b0:48a:5970:2005 with SMTP id 5b1f17b1804b1-48e51e08362mr31054235e9.2.1778060764831;
        Wed, 06 May 2026 02:46:04 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm19233185e9.5.2026.05.06.02.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:46:04 -0700 (PDT)
Date: Wed, 6 May 2026 10:46:00 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 03/12] net: pcs: pcs-xpcs: Preserve BMCR_ANENBLE
 during link up
Message-ID: <afsN2JrKNFw-PV-g@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-4-elder@riscstar.com>
 <91332fc1-11ed-444e-a211-699420cf0108@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91332fc1-11ed-444e-a211-699420cf0108@lunn.ch>
X-Rspamd-Queue-Id: CFBEC4D8F45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-106094-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:email,riscstar-com.20251104.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aspen.lan:mid]

On Fri, May 01, 2026 at 07:06:15PM +0200, Andrew Lunn wrote:
> On Fri, May 01, 2026 at 10:54:11AM -0500, Alex Elder wrote:
> > From: Daniel Thompson <daniel@riscstar.com>
> >
> > Currently the XCPS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
> > is unable to operate at 1000base-X and slower with a PHY connected
> > using SGMII/2500base-X (in our case a Qualcomm QCA8081). The link
> > negotiates speed correctly but the MAC can't get any packets out.
>
> We need to break this down into its components.
>
> I assume you are saying the PHY negotiates the media speed with the
> link partner. That is PHY talking to PHY.
>
> But we also have the PCS talking to the PHY. There can be inband
> signalling here, for SGMII and 2500BaseX. But not for over clocked
> SGMII, which is how some vendors implement 2500BaseX. SGMII signalling
> does not work when overclocked to 2.5G.
>
> > This attracted attention to the ANENABLE bit and we observed that the
> > bit is currently set during config and cleared during link up.
>
> Here we are talking about the PCS ANEBNABLE, not the PHY ANEBNABLE. So
> this is negotiation between the PCS and the PHY.
>
> > Preserving the bit during link up allows the system to work as expected.
>
> >  	int ret;
> >
> >  	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
> >  		return;
>
> Think about this.
>
> >  	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> > -			 mii_bmcr_encode_fixed(speed, duplex));
> > +			 mii_bmcr_encode_fixed(speed, duplex) | an_enable);
>
> And mii_bmcr_encode_fixed().

Thanks for highlighting that... and for being gentle with the clue
stick!

This patch will be gone the next time this patchset is published and
I'll get the phylink configured properly.


Daniel.

