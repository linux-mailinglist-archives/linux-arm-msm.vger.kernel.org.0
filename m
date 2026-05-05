Return-Path: <linux-arm-msm+bounces-105995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODMEO/oW+mlRJAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:12:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 368454D1053
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C62133052633
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 15:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3564D48B367;
	Tue,  5 May 2026 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Bo0T+uYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E2E48B368
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996734; cv=none; b=q9uJLTZBI6VZVYjHnnzILrAGcg2Ykvh3yr7DiGgBwa1VI/T1Ex3NA0u4ys0KkHkHyVZDu1E4DKtTbz9ZgiHgw/0AtIT05CGyxIgn4g8nr28fuPa/syyYTrwvSDyQAZXi5aTKJYhReeZH3m/lTsdhFTbDtoXYO4N8Hi1po0i7paU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996734; c=relaxed/simple;
	bh=J84KpcArs6vG8jkcaA8eqYNE61DrVpr3S1BqehpaogI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spi7xEXOKiu+fSnfri++0apeBFi4MYCfdH9VugCSGa4mEJ4SzjJOKGvgwczTEowZZuwIVCaqisDD4h/nRVbfUJD7TYxRtf9QgMx3Hs7a4pDXpa5qF7bu8NZYiDjv8EH1Hc68OBkQJ9FbLJZpAx7A9948O+qxNT6059Fb6X0WOvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Bo0T+uYt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso46190725e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777996729; x=1778601529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01VfL6gZZIzvH10mF1K5m6OM2N7Xtov5WNdZLRl6ixg=;
        b=Bo0T+uYtRK7qzCXjEG3X7Xtxbi0zVegst5mQqt045lBgootaHRNsakmETF2OvOIqRH
         SiERBZDmYy0zmbj7hfj/2yMZMxWd5GEeGXYJ6RNMuMAO0XOLy0tIA/Hj9l0fbiPzuqla
         FpX4JZlutMh3cqH2Rjfo+WYomdT1M8uzLHhtMzvXDu1KYE9r8aMNuXReyCfT2VbVfLX1
         IbYo1QmAQeh1aufH3LfK4WoXWBXcGqARcNIXXOyG84cXbrw4vVqVNqIjiidDrsbmgfDP
         mq00/J2YQDL3W8RVPArxjMrdH2yO7PWsSom2FY3i+xQ6Hpq+Byt6BYdIG6PEOsh2stSK
         G6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777996729; x=1778601529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01VfL6gZZIzvH10mF1K5m6OM2N7Xtov5WNdZLRl6ixg=;
        b=V/eM6zejl+F4kxJNPhTbGvJkvCvPGHqdGEP31y7GtSdQJEHzcwlpZG3JLlpUSLhzOq
         lu9YBVaqOP62kBGoCaWLMfI1eyE6SjGAFOnobqNJQSplcbMEGpUtrpck9FJX0x1tJiOY
         KqlefRhJGD6lf3BkUYQhHXgCT/Evs4qhFUwF+BbHXE4iSiXxNbiyHOugADMhMFaNEJgE
         k8I07TDNBXb9Zp60gnoQNwXeBUVb91+r21wW8ZeZkwh0IWL9iWmpMNs3LdyzaEa6GdbR
         3SoO9ZIPcjerIXwFj75umLlsOHb0wIZXFWM2JE8A0zFDZ1BQVhWRCA2LIabBvRpeTsux
         zDHw==
X-Forwarded-Encrypted: i=1; AFNElJ8P4T5NUpbavyacER0gV15VyGgu13Gw91ROIvVuXSGrpJo8O/n5cqY2RnKe5uZYUiwKirEFU2oej3pwAbxH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+yphz/rrcXh9X5ZJTCcsgUBWLkqBk55v1m+7IrlX6/Ns4ufRK
	dcV8fZCHZVeEmsYwFJZCNWphLX1Fdvg6KCnMriB1bJydc02OGZQusYP7orAFsEHreaA=
X-Gm-Gg: AeBDieuIEhjAXMe4uu+5qJVNu84JVFj68SWJ8p9la8Vrcc5nJ4NUI+9TfWAefotXinc
	/1OAE8uWCyIqjtB+f+7hCmiSXjzwctcQbTHKa72NgERVL4cLendtp8LDfRKwqjcpKxzdd3U7Yhg
	M/6lz9VEyCTtw2sRjwJX900mJ5mOSTisPXO9m/3IC42ZL534S9ZRDrDffMLJ1c0+hnyP7Sti3Mq
	/3IJ9DWlT6NuZyJzRLm+LnvpszHjx4yH3G94OPRKdu3sr9Y27jpELxHYFWYV5HkrSk5Zr5GloMF
	W3j2LJRPDoyD6DvAtBCRUp3WECBRdZnpGlxZFVcPhRl+lqaSZvcwcMgXgqQEfeQqpxGvXwkj/NY
	Y3RnxuVwMnq9naqC6LKw5GGo/iytOoerpp0JeDseeGvhw5ycWbBK8IZSxnyjwM4DkYnZWWTY9bW
	FqRDwKLGnL8mOZ3Q2P3h5SyKvAG46elwS40ge9rMPpk/fGm0VmnSWPewOi2N/RC0n2h4SbLf1JW
	fhGhtAMVkGByaTK3SlX61zp4AtOFJ/tL8JVBawzNyJLuEER+etXdQi5WXP4JjvdtJVRyVkXOzlL
	koHOwhc+NDGSC7Pz1uQ=
X-Received: by 2002:a05:600c:528e:b0:489:ecee:c4ef with SMTP id 5b1f17b1804b1-48d18bde33amr61483785e9.13.1777996729166;
        Tue, 05 May 2026 08:58:49 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm444582355e9.7.2026.05.05.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:58:48 -0700 (PDT)
Date: Tue, 5 May 2026 16:58:45 +0100
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
Subject: Re: [PATCH net-next 02/12] net: pcs: pcs-xpcs: select operating mode
 for 10G-baseR capable PCS
Message-ID: <afoTtdAO23DhOeZ8@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-3-elder@riscstar.com>
 <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>
X-Rspamd-Queue-Id: 368454D1053
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-105995-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,aspen.lan:mid]

On Fri, May 01, 2026 at 06:50:45PM +0200, Andrew Lunn wrote:
> > +static int xpcs_config_operating_mode(struct dw_xpcs *xpcs, int an_mode)
> > +{
> > +	int mdio_stat2, ret;
> > +
> > +	switch (an_mode) {
> > +	case DW_AN_C37_SGMII:
> > +	case DW_AN_C37_1000BASEX:
> > +	case DW_2500BASEX:
> > +		mdio_stat2 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT2);
> > +		if (mdio_stat2 < 0)
> > +			return mdio_stat2;
> > +
> > +		/*
> > +		 * If this XPCS supports 10Gbase-R then it will be the default
> > +		 * which prevents 1000base-X and slower from working correctly.
>
> It would be interesting to know if Toshiba messed up the integration
> of the PCS, or there is an errata for the licensed IP.

I'm afraid I don't know, but it looks like the issue is not unique to
Toshiba!

This is a discovery which, rather to my chagrin, I only made after we
posted the patches (thanks to a hint from Sashiko): there is similar
code in txgbe_xpcs_switch_mode(). I cleary overlooked that when I
originally reviewed the existing XPCS code. I suspect I stopped
scanning that code path due to the PMA related conditional branch...

Regardless of how I missed it, txgbe_xpcs_switch_mode() implements
similar logic to this patch. I think it is using MDIO_PCS_CTRL2_10GBX as
the Reserved value but otherwise looks similar. There are comments that
imply 10Gbase-X isn't implemented by their XPCS which would make
MDIO_PCS_CTRL2_10GBX reserved (but are too vague to be 100% sure).

Right now it looks like xpcs_switch_interface_mode() and my
xpcs_config_operating_mode() are more closely related than I realized
so I plan to move my code into xpcs_switch_interface_mode().

I don't think I can unify the Wangxun and Toshiba code (the waits and
resets in the Wangxun code make that too high risk) but I'm not yet
ready to give up and just make the Toshiba changes into another vendor
quirk!


Daniel.

