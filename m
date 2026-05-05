Return-Path: <linux-arm-msm+bounces-105996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qId8DbQa+mkJJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:28:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F574D1460
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 094C0306465E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 16:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDD248C3F1;
	Tue,  5 May 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="BOLA12n2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12A448B36F
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998335; cv=none; b=n1Raf0Vrsndf6L+eQ51YI377h4ObWxPdslbBBb70RZe729bQPsBfAeQDlnZ2EVjFFJ1nxWNsDzq0wwTWruAj1qCFqVaY/fugwx76PdAZa3JmswXpCEF86IAw8MJkdMmZij0gaATc9bPFyzd0z7Y882bFk/Z32Ml8OiEHZdRGebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998335; c=relaxed/simple;
	bh=10ad65O0ps7iM6dei8qNX30QY3FkTiMh2oPpwbtxSn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTkDfk+QC0HOTMC34pEU3M59I14iiQOfa/dLB5HUO9L5jRV94hm5msYqC+hQ6t70vPPi/V3bWLZX4ATCVEbsfU7sAqE1tFA5o85EP8gsGx3qMSZTHq6lwP2zD+YAnEQkW4FmrxsMmnKo+PJ7GqLO2mj2p7FvquFlDRaylJZpm54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=BOLA12n2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0046078so47531725e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777998332; x=1778603132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dvgEgjFlnhgVavTSLAwA8kue6OnY1fSQmcbYOk/Oxj8=;
        b=BOLA12n2zlvmTn6BetXu2cIMwXhJbX+fAz/gLq6do6zp3kF4K8bysb/R3kx6QmU/sL
         sy3LWQoP4bi8cfnuP560JUjb7CQJze1XckvA6zXP0cQCyFX4ek6Ex+BhPLyNPHbkcKvi
         mi3Mf1XGJcV9KZdHYB4NPiQe4Be5mJyy0DlMvUJcGYrNtvX/tmmSESSG8uRanKtf6QrH
         +jXCiqbm1qvvfa3oR65MrApVGLhfnE5RhpdCkSitxFVUhnKXbOyeOYf85Na4ivlYhRxp
         29xl5m38ckNZuCyrfLY9/TP0RzuQ/yCbLpPNfD20ghiwdgtgdjyIoXBIwXneCGn1k6w7
         F+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998332; x=1778603132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvgEgjFlnhgVavTSLAwA8kue6OnY1fSQmcbYOk/Oxj8=;
        b=XMiI0mFmjtSXzyxRlY2y2queAt5tuggxEFVLUD0/6Ly59SG/2EYE/xQ1mzstg7wr5F
         +Qs4ph1DVQIbWNNcKRsLnM0aNxIQVfKJReaoxcHl3w/AEBop09ylQKaJONF8wcE34CHo
         r5Zfc5gF1r4CrLdJxaV8DAMyp/U+FrBWXfs2PRYNLhweSjSZpSdxnRyEAs+Gx/B4ukzF
         2LpNVkFlZGSFv0g8en6yq9dHsJudpuslEsY29fckDZG3RlH/0kFtmkMKbpWdnS4eI04r
         kR5vpHAZyu87nmAjTQnzVnnU8gDGocJ/pOi8/R6C9VehLGDQYZ/5SxoJoI8qornXwX2U
         uklg==
X-Forwarded-Encrypted: i=1; AFNElJ//Bfce1RwrO5M4YJY/iVXyPFfPHYzDgnIvrzVBKwFLZkAM20tMV/qT/FgBCG5s2mSROT5y0DzlONzdayMx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7bmQsbAuydyBwO4IjF9zQ6VHRg2p+hq9MpdjqDYrNPOFP3Izn
	mDOIGoIBjk42eDXN5DU/PakNDFr+fRnzhUQTZfewvXkPA5bJ7uVZUGpYlCk8nLkmFGA=
X-Gm-Gg: AeBDiev24jcj96aSFLivJRgRTIfHG6bSQljmgUsFXuAu6xYSop6BkAG83BlIqdbiOad
	45+n1VNjursOXuFoJRDWtnioCavvlSdXz4+CnIj0R+A8UZqpqdpHRnjiJAtCqmEr/qxGnYj7i+f
	vY33KnN8CgynF1ckYksunHLmOx2rbom6IphRzMqRSdAO5AAwOywZxk/B47fKP8bCUIXcD3yYy6n
	B/G7gJyv7OulX6TYddAguoM+NuSSdii4vtbk1A5eADjwKVn3Ur4tyRJT9/GglD9Sl3HDIVs3nRx
	pz1TU2bcgEDhl0Kzp6LXhjCMbpxfr8/8TDRptc0qLn4j+2bl6X/h/J934jjgupeWLqb+kvwLww7
	mJEIIU2D8S6K4roaw2qJ5QFavWF/CTJg4YKZB+FOmFirhVsIIlJzevS0OK09Phk+SRZfQeX8nzO
	twY+SB5mTqr1n4DEPeDji5cfDS13MIjijiAPM2FDr611aYwKsUQ1nZ4+mLA33jbPK7gazKCbJZd
	BFz2UWQlwVNpiGWtSExH1o9vhJuQmKQc/+7zPLB3wWbXE2OiWEWquN74MXOeaJHNfNAX5pPM5lh
	qhhL9GMx+5BSLQCAkWQ=
X-Received: by 2002:a05:600c:3e05:b0:489:1ff1:74df with SMTP id 5b1f17b1804b1-48a9852fbcfmr256956845e9.1.1777998332149;
        Tue, 05 May 2026 09:25:32 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm737620655e9.2.2026.05.05.09.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:25:31 -0700 (PDT)
Date: Tue, 5 May 2026 17:25:28 +0100
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
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
Message-ID: <afoZ-LuVRaX6ixs4@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <d29621c3-07fc-4720-abff-d8901a0d791c@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d29621c3-07fc-4720-abff-d8901a0d791c@lunn.ch>
X-Rspamd-Queue-Id: 87F574D1460
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-105996-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,1c:email,aspen.lan:mid]

On Fri, May 01, 2026 at 11:09:42PM +0200, Andrew Lunn wrote:
> > +					tc956x_emac1_phy: ethernet-phy@1c {
> > +						compatible = "ethernet-phy-id004d.d101";
> > +						reg = <0x1c>;
> > +						reset-gpios = <&tc956x_emac0 1 GPIO_ACTIVE_LOW>;
> > +						reset-assert-us = <20>;
> > +						reset-deassert-us = <20>;
> > +
> > +						pinctrl-names = "default";
> > +						pinctrl-0 = <&qep_irq_pin>;
> > +						interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
>
> What is probably wrong. PHY interrupts are level, not edge.

Thanks (and agree). Will fix.


Daniel.

