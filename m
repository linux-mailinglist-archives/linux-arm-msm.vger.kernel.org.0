Return-Path: <linux-arm-msm+bounces-89062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6234D20F6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 20:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB5B7308AC22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 19:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5652133ADB2;
	Wed, 14 Jan 2026 19:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXGeSfxY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C298B3033ED
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 19:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768417380; cv=none; b=FbOdj4M5Ub7FQGmXpvenLLwkBSMp/7RvJVTUQLEAMwnVgpfWfKPgnz+DbGtDsBURyVOj2e9VBx9N6g0aPoG0BiDE0Ahh68uDOKZgWGu0y4pheD57XKrxQg8M5Bj2/KTR4rCp+ze8YxUVlnLFPl86Z1xmxuRVvBskAUFC5Hhbreo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768417380; c=relaxed/simple;
	bh=dM8WzcBwVGKmj0SltOmlTIrgVx4XI4wR6LCK9i1T7Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCjjSDVA3nLpDBnj+Hx5FLIVPqRoM9t9RxwCF1kNQhGWaTnflrp8vyiN53pfQkXC3Zg89heAVRJ9y72Ia5FeF0Ae+kGkVqI5QgWP3fYmMkFX8N/fY8IxIK1CcK116+6cwmQ2Le4jgfXLPy5ty+0I+x0O/a5dUnEzWpoBM7yITWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXGeSfxY; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6505d1420daso17470a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 11:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768417377; x=1769022177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zqOxMcid/peC1Iie6lTLw8C1UUftl4S8ZikbVgEoS64=;
        b=hXGeSfxYvNTYCGReSXPE9b9PjCuDj1VBcDNy2XxSceLUtDARcEsOsbGA2UBPl99EQK
         CNNZ7qbPbN08KAdjt+qAuT48BScnz4eVzeo64dce/B2QOFOr3wv6YDM+aY72eBFk2AP/
         Ias9D1lRmxP1kz2BCm+/pvlgur4DVtzMckN15++6Mps8zE20upY4K1jJznafoEoo9Y4u
         1hwPqIroWzijNmnaRh8TaZLa+59VSWerrIl5y0+DTXBZjm+fli81REIkKg8MigUf5v0I
         EEu041ayIRLgePoIlJ4r5MWCGveLrkqErhIvFtRnL+A6sgisyRymHW9dPKHYyBY+36Zk
         /0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768417377; x=1769022177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqOxMcid/peC1Iie6lTLw8C1UUftl4S8ZikbVgEoS64=;
        b=gy7pUWkTbO3iATKE2eH73FpjgOU4qT4gMGVF1E72qr1PdSS7Y3VjmVSSy7bPctVXC3
         s+b1KfbiTC0mmQFzz0HlA4oMiJs8J0AJx6u/oKIbJRyl6Ma/657Vo0Z+3OZ6Mwvi2FSJ
         FwkrZUCslKJgAep0OACUlbdqvVN30FdTzNDQG1O27hJRH5NMjzFos8DF4e2BdXMqWgcS
         1b/EsPNWuqB/9ITqEdosFbr+n4WGEtSDJxlp6eAMO2jBWtiVYbAC+Qid3B5t25lUom6h
         6kxIAyOMWeQrxWoJlPLj0SpLWztKeBuuJoZnHw6NGvW2/VYUSUMZlrvXE4PAtIsZ7WHQ
         ry/g==
X-Forwarded-Encrypted: i=1; AJvYcCV3EXe3SM1C+KeIm8LCfEGQlF2gVLItMbiLdwcBpyToK5KIfOtkvZMMXdhh5XtWfmOmJ3mYAKgCLXt7Sxn2@vger.kernel.org
X-Gm-Message-State: AOJu0YyZEyWLCi5iog14Lt1nWjIWfZjFA84IMutAoxGYe6xpVJoZwV+/
	e5/eEkD51v/+InIL8EzV9zzbLJGmcPC9APQwwF8FHvl6rOzexh+1jt7V
X-Gm-Gg: AY/fxX5Ef67YJi7UmVyRTInkykUECYHbcXaTf/7DUQ3T0+CR6rQUyKDl+lnVErjHYdv
	Yd028vjq12aFTIawva37d+MGmBl19dT4LvwcTHsS9M4AdW+NVXJrjB/J3xiBAsfTkjC1h25Wmai
	LS8BS3kcmIkjrDzq6RcEsSm6x4LBC1wmV/Uwq1glV5IKt01IQo0ZO+f7iw32MQH6f0eVDxIIBIU
	FOfb1BsfLlsKjbxYidBU/DIWGuIra8chM25F4/nmKaIeesTRjx36091b34mHawEKZrZb5zShEbr
	WvVVcZMy0I0T2BLpAnMz4ACjPKckbWSx9Ou8GF8FIeIabNFAzLz0PoACVhZlVFSDhkuDe5CnJKL
	4P+031SWFZ+6TERagX+T2OOxgFyyRW0yTWK/d1whGM7tn/9fwjNCij06ZzjbZ21cMFmnIVououX
	32dOE=
X-Received: by 2002:a05:6402:34d3:b0:64b:5a76:792b with SMTP id 4fb4d7f45d1cf-653ec459a3cmr1649376a12.3.1768417377014;
        Wed, 14 Jan 2026 11:02:57 -0800 (PST)
Received: from skbuf ([2a02:2f04:d703:5400:9b39:8144:8a26:667e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65411877591sm391335a12.5.2026.01.14.11.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 11:02:56 -0800 (PST)
Date: Wed, 14 Jan 2026 21:02:53 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
Message-ID: <20260114190253.ttrookxubevt7aku@skbuf>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <20260114184705.djvad5phrnfen6wx@skbuf>
 <aWfmpq-dJ-mUCvz1@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWfmpq-dJ-mUCvz1@shell.armlinux.org.uk>

On Wed, Jan 14, 2026 at 06:55:34PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 14, 2026 at 08:47:05PM +0200, Vladimir Oltean wrote:
> > On Wed, Jan 14, 2026 at 05:45:24PM +0000, Russell King (Oracle) wrote:
> > > qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
> > > using SGMII, 1000BASE-X and 2500BASE-X.
> > > 
> > > Add an implementation of the .set_mode() method, which can be used
> > > instead of or as well as the .set_speed() method. The Ethernet
> > > interface modes mentioned above all have a fixed data rate, so
> > > setting the mode is sufficient to fully specify the operating
> > > parameters.
> > > 
> > > Add an implementation of the .validate() method, which will be
> > > necessary to allow discovery of the SerDes capabilities for platform
> > > independent SerDes support in the stmmac netowrk driver.
> > 
> > s/netowrk/network/
> > 
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > 
> > Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> According to patchwork (I forgot the RFC tag on the patches) it needs
> linux/phy.h included. Plesae let me know if you'd like me to retain
> your r-b. Thanks.

Ah, ok, I thought that the SPEED_* macros are also phylib-specific like
PHY_INTERFACE_MODE_*, and hence, the phylib header would already be included,
but it seems the SPEED_* macros are provided by include/uapi/linux/ethtool.h.
Go figure...

Please keep the review tag.

