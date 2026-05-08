Return-Path: <linux-arm-msm+bounces-106659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIvNMHPK/WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:35:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 724484F5D1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 931D530075CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E1D38911F;
	Fri,  8 May 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ZaHIiKER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B73CFF4B
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239946; cv=none; b=NrIjOpqcl1tQ1KIhXHUxkOBiKgqmTHdXpiapAPLjYob9eF+rkz+5loghwABo5KD6xT/ESlutFUgi7oJaKYEsMbrMGZH3u3uXplaIfemXyQA9EC7w+fWtEJVAv/IVX+V3RkyFmXJx+KLAScND+8pSo1wAsAfLBk6YuiZcuCsrlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239946; c=relaxed/simple;
	bh=0hrQlW5FpcXozs6wxkIBzDktzohYeRr936w21ThvyGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqffNW+TKrAII0Uj7J3r6c0FEyNK4YTf5EGXOy+oXFDV6eplYNw3CISLECvC3BKmfDpB2GMikTETavzCf6Yuqs0HLQ8+625ocJyco+s2k/C2ekStxsJNkyrk007mdU0DtIQ8MkxiIzpK8QKw2Eco1pHJyaV5XfT8VutDuhnogQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ZaHIiKER; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a87edf88b3so1529578e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778239943; x=1778844743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i3oCf6JjY2k4f2DdZmgb+d8lKs1DeUt4qK3/lGPB5dQ=;
        b=ZaHIiKERy56Lq5rIHaZKgnjcuRsSZ7zT/tmUNId1Hlq9QIsgr2+qj5jZ1H5rLFRX0N
         Jol9I7Dcyw3pa19A+JxQKWqbOQdFGk5z59jBQ9V/ctZ02xOZighLDcyPY6UdXAsOqgsc
         GAmgELDtkFL1XH2LUBb3qcSLekBQQLgUcF06jaGtNGAm7ldTYHXz1g9tmlgf0Jv9Y7XT
         lnJPOxCbfKNZQmqyeeL4W/V6m0K0HXty+ikMIcN+IXuBq+CvlH2snRTXfNuDuFwFKroz
         Pq8q7xmqwtQX/f3voJqlapirdvbu06foMHRXNfZesecK7M0XrEvmCeNoWMhIYPlt4ry0
         VqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239943; x=1778844743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3oCf6JjY2k4f2DdZmgb+d8lKs1DeUt4qK3/lGPB5dQ=;
        b=WTpjaFyWwjscU8Lzd+466DqLaeeMIjxe2WjCj4hhSPseXZdFwZetKUiDmDzzEwJBKs
         IpRWtTilfBDPME0990ZN+WJw4H19IJHQF31Y963Fu4YhW1dqk1iRtXk3WHwaxPSjkVfw
         iIx9tnqI20pe5hSL5n38KGx2x45LGYOY28QK0dGIm5+R1eMHA5BPf/iI4Nx2udk8GCOO
         DdsVmIjnpl9PPGUUvV+duNPn4dnWO3AfF3PK9iH2pr0DA8Fm8Ccn4RWppA6P0fZFPLsr
         CHKYtU5um7EZYcWUuNttkeprNWMK8tcRAY9+q1gmMWgb7D1MeE2uCsRJAZu+H8Ya8Xlp
         NN5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9M2i2dH6Gw7f3vo0VWn3Li8HLAI3QYX4JNx1bKIhN0l18eI14f4FsGrGkE+MX3JDpSzH9xTNgsdvpYKvfA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyokufc9Q5AdVSXqanjck/53HTGD77BgvE8r6cgFRfj4+uthI9o
	euAt3V7V8z6i7umNsMmBppRVoyu/3zomjIxaqsIJd36KfHnz7SdMfmmSGH1Ly9/X1ILqMl++8pP
	ixwHG3UY=
X-Gm-Gg: Acq92OH3SPl0gsYrurUvP5gvdir/7lacROM7TkgFUujBrLgOg/ILb4e2abI1BfwGzHA
	y/IpSYF0f9irIMzZgnMsIa6LiimQVFB2MIR7KGYYrbIgiKyl4eG1L4CcjhOEgvTAMlYvcY3Bzcz
	T6zt5Us3tdwIpP/Zu3THi4VMCtuX8hzQEE3PhSDPV//TThMkNmP4kIOU4H0l/4VdiXkQ+qg2hen
	mlrsK406A734N5AAo+cHILUmp2sK6TVxrlyxwPYZ16j3ym7UgSZJL7cw6K3flwPv2/01+rWKbfj
	tRLrO2tnOILW7LnmgfFOtm7UcBxHxtwjfn1tTjnjCZfmlNDxTv89Q9EPSQs3lygqFa1MJqsfaxK
	YefAMcSwg8Z7izXqEAG0VJcY9+o38o0g1ZN4s0OGO0WCuoMpDDJraNriE64H2Ib3tkxouxioj3E
	T4rbkDH3mhVtcLz2iGddf3gPp+xi0iq238eqi4FvAXARvtdPxMESrKA71p4MrePiHLSS+aXHV3a
	AyaXAeUoXlG635MaQPxSXj9REBnPYi4juFDfbTPxvosziZX88oqoN8U4RL6AH4d8V/WM5jN1n60
	agqtkwVEx0NOWH3oczM=
X-Received: by 2002:a05:6000:26c9:b0:43b:3b80:6776 with SMTP id ffacd0b85a97d-4515d3dc30emr18803689f8f.30.1778239532551;
        Fri, 08 May 2026 04:25:32 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454917d57aesm3814079f8f.26.2026.05.08.04.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:25:31 -0700 (PDT)
Date: Fri, 8 May 2026 12:25:28 +0100
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
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <af3IKKkjl0jK8GGB@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
 <afy34kj2hPxIlArO@aspen.lan>
 <ef6df85f-11ac-404d-958a-8cf69b3b6bb6@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef6df85f-11ac-404d-958a-8cf69b3b6bb6@lunn.ch>
X-Rspamd-Queue-Id: 724484F5D1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-106659-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,aspen.lan:mid]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 06:29:15PM +0200, Andrew Lunn wrote:
> On Thu, May 07, 2026 at 05:03:46PM +0100, Daniel Thompson wrote:
> > On Fri, May 01, 2026 at 09:04:58PM +0200, Andrew Lunn wrote:
> > > > +static struct tc956x_mac_speed mac_speed[] = {
> > > > +	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > > > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > > > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M, },
> > >
> > > That looks odd. Some vendors implemented 2500BaseX using SGMII
> > > overclocked. But that is not strictly 2500BaseX. Having the 2500BASEX
> > > entry suggests you have real 2500BASEX, so why have an SGMII entry
> > > with SPEED_2500?
> >
> > This is a consequence of the code that uses this lookup table being
> > called both during initialization and from the fix_mac_speed() callback.
> >
> > During initialization we only have the value in plat->phy_interface to
> > go on so we run the lookup table using plat->phy_interface (which is
> > typically PHY_INTERFACE_MODE_SGMII) and with the maximum permitted
> > speed.
>
> Something sounds wrong here. SGMII only supports 10/100/1G. You should
> never be asked to do SGMII at 2500. It should ask for 2500BaseX.

We weren't being asked. It was just an internal driver trick to common
up some code paths.

However I did a few tests and the internal driver trick doesn't
actually do much we can't achieve a different way. With that changed I
can (and will) remove the PHY_INTERFACE_MODE_SGMII/SPEED_2500 entry
from the table.


> > I haven't got detailed enough notes to allow me to double check but I
> > think there were problems completing the initial MAC reset if we didn't
> > write something sensible to the hardware during initialization.
>
> > During fix_max_speed() we get told to adopt 2500base-x. Reviewing the
> > code I can see we don't propagate that and just use
> > plat->phy_interface for fix_mac_speed(). I will fix the code to that
> > the requested interface propagates properly to the lookup table but I
> > think we would still rely on the SGMII entry to get sane initial values
> > to write to the hardware.
>
> Getting sane values into the hardware is good, but 2500 SGMII is not
> sane :-(

BTW if you are bothered by SP_SEL_SGMII_2500M, that name comes directly
from the TRM and I'd prefer to keep it if I can. The enumerated value
we have to write into the SP_SEL for 2500base-X is "SGMII 2500M".


Daniel.

