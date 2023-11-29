Return-Path: <linux-arm-msm+bounces-2420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9106E7FD4DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 12:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B81291C20F6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F951BDE2;
	Wed, 29 Nov 2023 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqNEvVpW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C2E95;
	Wed, 29 Nov 2023 03:04:09 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40b4f6006d5so11968395e9.1;
        Wed, 29 Nov 2023 03:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701255848; x=1701860648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rjk+/1D9AF+cQ5xDbcmA1MBP/vuhlv65HDhCtKVSoZk=;
        b=PqNEvVpW911WnIT3JULjB3wgDwpK5ePh+wNSB/GmLnEWH5osYydhpBvsbQ7/Xz5ocH
         dc1pRYehdHP34IIxLKWnIdSZQvpF5/k9/9LizgWR/vCDrynO0khPxNsOvtB5FavVVXxn
         QCaav1jar7DjpwuVnqW4zHZJ8QqG6xX3KUvI44aWStupV1hpXK7hXkf78Dnk5hj6qW+u
         MEX2nw/5mB9MYjLyyeDNaUwzJbdBg1Wa0QkEEEWcy4twANRwlDTCSsr0ugk7MWyIz9dS
         /96OyLGVbvRQJjYMNhb8v2EaLvkKYAKz914EBjUYoTRdJzmLjQc+YqHpJ81clQWLwUHh
         4N3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701255848; x=1701860648;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rjk+/1D9AF+cQ5xDbcmA1MBP/vuhlv65HDhCtKVSoZk=;
        b=CZdtv/P88MJHWt3eFVf4ghsBXNWjcrtDB3gKuTxGh1bWsfb17P0r8/unxqooJGPoJY
         TxPksoLVzXrVexAqAkAQUerf9odN1TjCHSK9DPv7TwypeWtyhmKDRKq26IQ8ehvdvcp8
         vUiTlUL/IAzoizPfeNussjbdWvCOqyWR8jsJJZvSZA6uMsSjRqf8FOr6ViWgLJ5JFfsq
         +joKQ2ypCoTkhOQalpDvBe2sGPDe3GidY1eArPseQ0BIfcTmVBSoXA+uYJRbFuFJkvsf
         BrxeqB0QuRfMC7Z2W4UGYP9v3vXt6hYAJb5gcgO11bMUI8uh3UQZu/tKaqvPIV60vgnz
         e2Iw==
X-Gm-Message-State: AOJu0YyNS4pJo5Y2TfDg4Nf78oaqnuhx92Wdl5GAfosgR58LQy6z+IxB
	fsA2gnWtehnFHDUD/gRqtXg=
X-Google-Smtp-Source: AGHT+IEBAvm1wqVWEUe9pB+o21b32WHVSL4QBMcx54XwI8du9Wk6l+5lAsEg+hPmovN1+6jfSLOv/g==
X-Received: by 2002:a05:600c:5125:b0:40b:3dae:1ff6 with SMTP id o37-20020a05600c512500b0040b3dae1ff6mr8791416wms.14.1701255847651;
        Wed, 29 Nov 2023 03:04:07 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id q4-20020adfea04000000b003296b488961sm17464741wrm.31.2023.11.29.03.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:04:07 -0800 (PST)
Message-ID: <65671aa7.df0a0220.2a628.a3b9@mx.google.com>
X-Google-Original-Message-ID: <ZWcapJKrMLLmIVZS@Ansuel-xps.>
Date: Wed, 29 Nov 2023 12:04:04 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [net-next PATCH 08/14] net: phy: at803x: drop specific PHY id
 check from cable test functions
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-9-ansuelsmth@gmail.com>
 <ZWcGn7KVSpsN/1Ee@shell.armlinux.org.uk>
 <656708a8.df0a0220.28d76.9307@mx.google.com>
 <ZWcZGO1HWxJnzPrk@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWcZGO1HWxJnzPrk@shell.armlinux.org.uk>

On Wed, Nov 29, 2023 at 10:57:28AM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 29, 2023 at 10:47:18AM +0100, Christian Marangi wrote:
> > On Wed, Nov 29, 2023 at 09:38:39AM +0000, Russell King (Oracle) wrote:
> > > On Wed, Nov 29, 2023 at 03:12:13AM +0100, Christian Marangi wrote:
> > > > @@ -1310,10 +1302,6 @@ static int at803x_cable_test_start(struct phy_device *phydev)
> > > >  	 */
> > > >  	phy_write(phydev, MII_BMCR, BMCR_ANENABLE);
> > > >  	phy_write(phydev, MII_ADVERTISE, ADVERTISE_CSMA);
> > > > -	if (phydev->phy_id != ATH9331_PHY_ID &&
> > > > -	    phydev->phy_id != ATH8032_PHY_ID &&
> > > > -	    phydev->phy_id != QCA9561_PHY_ID)
> > > > -		phy_write(phydev, MII_CTRL1000, 0);
> > > ...
> > > > +static int at8031_cable_test_start(struct phy_device *phydev)
> > > > +{
> > > > +	at803x_cable_test_start(phydev);
> > > > +	phy_write(phydev, MII_CTRL1000, 0);
> > > 
> > > I don't think this is a safe change - same reasons as given on a
> > > previous patch. You can't randomly reorder register writes like this.
> > >
> > 
> > Actually for this the order is keeped. Generic function is called and
> > for at8031 MII_CTRL1000 is called on top of that.
> 
> Okay, but I don't like it. I would prefer this to be:
> 
> static void at803x_cable_test_autoneg(struct phy_device *phydev)
> {
> 	phy_write(phydev, MII_BMCR, BMCR_ANENABLE);
> 	phy_write(phydev, MII_ADVERTISE, ADVERTISE_CSMA);
> }
> 
> static int at803x_cable_test_start(struct phy_device *phydev)
> {
> 	at803x_cable_test_autoneg(phydev);
> 	return 0;
> }
> 
> static int at8031_cable_test_start(struct phy_device *phydev)
> {
> 	at803x_cable_test_autoneg(phydev);
> 	phy_write(phydev, MII_CTRL1000, 0);
> 	return 0;
> }
> 
> which makes it more explicit what is going on here. Also a comment
> above the function stating that it's for AR8031 _and_ AR8035 would
> be useful.
>

Much cleaner thanks for the hint!

-- 
	Ansuel

