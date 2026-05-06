Return-Path: <linux-arm-msm+bounces-106133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIACBe9g+2kuaQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:40:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6D94DD6F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1599C3029AB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 15:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69F8480DF0;
	Wed,  6 May 2026 15:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="rJFOKZw/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3B53ED136
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081960; cv=none; b=dIGi79AW2oyZUwAwvXUPG6W8/7zjh7dOFrsyi66IWfVUQtjgR9V/H7YGKcicnVZv/sVOCqGHe9O7psmbJQH+HZOGSERjQN6iLs64YhUmT0ICrKE/JO6Dqb3n0NsRP77xmpBTx3vjJE415t20S2Q+L+J57V2G94ZPmUEu30fE9+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081960; c=relaxed/simple;
	bh=xv+hOIA+jYDagu8VhuQJ1WD+q0s4/2y05KQyVhdDIbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuFh9v/X2sTuMloYNPPPyixO/qQCRGfFt/K/sLUzsDPzoO7yHy1pD/g5h/HbkzZlfqzEP+qJ/HhLCdOJpvd4I8vj3RWEQiqYEh3XWgb8LuAPxEhzxpsbP8nptbBQin4EIWm8zRHRbb1B3ZKIT+HMuMOOZi9bP4szRZqfUgk40IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=rJFOKZw/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488d2079582so68356095e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 08:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778081958; x=1778686758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+RE97dD5fWvLcGBYDBhe9zTaH8AQpDWyp4x6oWJE49c=;
        b=rJFOKZw/70mTgSsbLc54CxHCxw73Br0bANCa2N3+BYqCc91sJvLd7jlmpCRppSuHHU
         UTTSz16Pe3NF7661pFc/DPfuuAHzjBxm9mdIItXuKcyNjocJbvgHxMRdrP7KzDXVjnV5
         jhzbx1Flts8IMgTqUpB7NU16AcD09JdRAOMtb6Mju6/MG3zSa3vHLR+qKGfIHMDVPbpG
         3AhhnuUvLAR0kmwzL1PEL02NXreHkhOoI9buMvzRL3xAtdDfx2g0dH74JnZkM0mCTNYO
         YRO/CUypc4p9+aBxqwoH5Onbje2METCqDFVnCeApiBq+lsk8c5EgYYwmxniFH91gIwZm
         tTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081958; x=1778686758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RE97dD5fWvLcGBYDBhe9zTaH8AQpDWyp4x6oWJE49c=;
        b=ZWUdB5eONfv/K6Fx5N1Wq0EBjAXjqijWmwKcBVWnbDLZk+pyodsWGyAtts4YTq8Ffz
         d51byKs8oEnyni87hmb7eVNcYfC98sJ48H+V8vsmzpUXdlE+stOnC0gmD8pGQjfKQ4/g
         5MWE0upht8XfRWec25t1lP9qlu3jQx69EjOe7jHL6FbnGyc2AJ+1sk9qy7zRCSsIrIDs
         ZO7xdjKicgmZtY4/iTcWxWCsFV2zle2ubi02rXNDIJB//4UfB8tgJ5aYqvbnXKCm6K+K
         8WzxezcGWgqwUVwW2IxNT6PdHJ0bk2HpB/iyXo/47g7LSg0hTKXa8qJ34Ca3e+WL5WIm
         Um3g==
X-Forwarded-Encrypted: i=1; AFNElJ8d9aFW7eazrp4OFibWCYfXMzhq3njuO/mJADPrEqUNlq5PwFBrGCJVybAlwAFcI7W6MUmcU1fSFr9Kp8Ox@vger.kernel.org
X-Gm-Message-State: AOJu0YyBPvOyHHUR6TmLbgke9v9M3m80J6okqWYDzMcSrDJuPRaP+j9g
	FLnFA7VDCEsYEAGluQ12bSYGmlyRPk0Z5CicNG/gl0wuWB7BEAGxTG8/9mnnRbd5KiY=
X-Gm-Gg: AeBDievBxDhf+hqPbVTkZSsLfbhof0o65vothKB3ArPxO7AgZbTXAE1i8SDlaMgj6TP
	rP3hLragtHdsTr0UjplIk+g9xuV65K5iUopLia1fsV3l9RzrP01uU6zeD9BGfw0LA9c7WJWUCB7
	Bl//VQ/Zztt0jLQ4U56VNvRHgViN3BkD1gjhBRBRZ+/nGvyul2D9v1arAesCDhxboaIfBVrgXX+
	Ci+TPY2WnrKVyVcOtPlfl1Z8f206pYhush+NnzpAl85OnXlPuYeukuv6XQ7VHuxpnG3MPg7mg0X
	ZyEtqvz2rWyq/OUa0TGPSJvdjCiq43sGYhn7am9gcoqr26HKH3TJpOtZPLoww8vAgLk0rot5Dd5
	ICJiDWQIj+Ez1DjrfMuwplYXIIpc+qXT+vr2AtoFPson3dG6IJlekpq22zIrQIya2J0Z8A9nPRw
	gcYTGHE6dzd5BJdn4f0o9HeVNMK/F2ol91vRywiZQB0bJTX12LFr5AmAxlpERXmmunl7c97hWvv
	hgfhFH8EzX0LPyFIAZ3LGrlWEfgq7CFU8CuGdG+Ql+0d2aBJwuEGXQfqa6jJ/4JWqs6MYGu96qK
	2RudxMH9R0X/DXCxfK8=
X-Received: by 2002:a05:600c:6209:b0:48a:525b:e157 with SMTP id 5b1f17b1804b1-48e51f2e660mr64800835e9.13.1778081957492;
        Wed, 06 May 2026 08:39:17 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538fb19csm52241905e9.11.2026.05.06.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:39:16 -0700 (PDT)
Date: Wed, 6 May 2026 16:39:14 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Alex Elder <elder@riscstar.com>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
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
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <aftgorkah-Hjrvq2@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
 <4015f47a-af62-441d-b1b8-a8598f963970@lunn.ch>
 <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
X-Rspamd-Queue-Id: 9C6D94DD6F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,riscstar.com,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-106133-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,aspen.lan:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Wed, May 06, 2026 at 10:35:18PM +0800, Xilin Wu wrote:
> On 5/6/2026 10:19 PM, Andrew Lunn wrote:
> > On Wed, May 06, 2026 at 08:59:01PM +0800, Xilin Wu wrote:
> > > On 5/1/2026 11:54 PM, Alex Elder wrote:
> > > > +	/* AXI Configuration */
> > > > +	axi = &td->axi;
> > > > +	axi->axi_lpi_en = 1;
> > > > +	axi->axi_wr_osr_lmt = 31;
> > > > +	axi->axi_rd_osr_lmt = 31;
> > > > +	/* All sizes (2^2..2^8) are supported */
> > > > +	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
> > > > +	plat->axi = axi;
> > > > +
> > > > +	plat->mac_port_sel_speed = speed;
> > > > +	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
> > >
> > > I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I guess
> > > it's required, since the driver clocks down the MAC/PMA/XPCS in its suspend
> > > hook?
> >
> > Nice to see somebody testing WoL.
> >
> > In your testing, is it the PHY doing the WoL, or the MAC? I assume
> > PHY.
> >
> > If i remember the DT correctly, the PHY interrupt is connected to a
> > SoC GPIO, not a GPIO of this chip. So for your board, it is the SoCs
> > GPIO controllers ability to perform the wake which is
> > important. However, where the PHY interrupt is connected is a board
> > design issue. Could the PHY interrupt be connected to the chip? Would
> > the chip be able to wake the system? Should STMMAC_FLAG_USE_PHY_WOL be
> > conditional?
>
> Yes, the PHY is doing the WoL. And I guess this makes sense as it allows the
> MAC to power down during suspend to save power.
>
> The INTN pin of QCA8081 is connected to the ETH_0_INT_N of QPS615. And the
> INTN_WOL pin is connected to a SoC GPIO.

Interesting. That is different to RB3gen2 where INTN is routed to both
(although there is a do-not-fit 0ohm resistor option that could change
that).

Does that mean you don't get phy interrupts reported in /proc/interrupts
before any suspend happens?


> Without this change, I can't get WoL to work. I have a working branch for
> our board here:
> https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.2-8280-wip/

I took a quick look at the DT and I noticed you have an SGMII PHY
attached to both eMAC0 and eMAC1 on your board. This is something we
think should work but were unable to test. Are you able to use both
eMACs concurrently? Would be great to see that confirmed!


Daniel.

