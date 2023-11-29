Return-Path: <linux-arm-msm+bounces-2393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B17B7FD31D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80C32830F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 09:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D971517980;
	Wed, 29 Nov 2023 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUAEW4W+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89341990;
	Wed, 29 Nov 2023 01:47:22 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-332cb136335so4503999f8f.0;
        Wed, 29 Nov 2023 01:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701251241; x=1701856041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tmdrAkRlA6xplH27jHLiMRC8wSQ2FJ2TlbcW+1L16+w=;
        b=iUAEW4W+7JXlTtIRoJoNaa7MYDn2tcTvU7hEJRHTSo0jfX18hprMT1wSwZ6I324hgD
         bpaXg2Nwr4rxir8mXFxyuEIR//SmfV68J+THGc4Q+Jb4RvrtzNpOVRJ7N4Ff26Fq9YSr
         hNErokaEqo2UDR92SK6VAUqo5NactGnMRSQ/m1+/m8ru+vpsTQ1acNcUYvQKsRZAK1pL
         kaLCfth3WSOPYvLgoNAWN9q1m++cCkdZjS364Xjqf3mz/8DALiR1/HZN7QxI8dB5CIgv
         kamO2s/1cuyssflV708I2M4VJA4+DuHb7HawNvWoZT5RsqCPk5IoRu0fmLSggTffXOnI
         NdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701251241; x=1701856041;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmdrAkRlA6xplH27jHLiMRC8wSQ2FJ2TlbcW+1L16+w=;
        b=Cn+AfzRILjJX4eiS+leiIg1Cqzlgldt/J3qF8SndRfVRWa0+3BVRpjQU6t4GJqehnm
         v5uY7EvZ9mm23wUHXDSLjjoPH7c9Puh6+Iu/djK+mTSz+EXFxagaZUYZclIyn42he79W
         e3PZpuvhkVGADOpZ8XxnhTcnSKxL1UZHLYalO5fSZiBSxcBvownswi1S+NWEMUBKuLkC
         bHT/H8lM7REQWilNzfwKuHjnEL6jI+FiKBth9bjPPFl3Y+EXLsfxaon6s1pxf8ZAdlgv
         WbxcflLVjPhouiLrvPImFP+bLXvScs03cNJjP+x1z4+Ar0APu4bLPRr4cZO1m4+1RF5y
         akgw==
X-Gm-Message-State: AOJu0Yyf6ABppgswVoOq/jn/40MniLKGbpn06dF81omXQqG9E2Gc+HJi
	O2U488PCrSN38jo9K+DOZKU=
X-Google-Smtp-Source: AGHT+IFJIqqbIUVybyut0c5TBzi+/U/vvyAeknC6of2fayv2tmhNnbjyqNCL5wYYuMVDFqEuA8CmOg==
X-Received: by 2002:a5d:4cc1:0:b0:332:f8d2:640f with SMTP id c1-20020a5d4cc1000000b00332f8d2640fmr7644053wrt.39.1701251241124;
        Wed, 29 Nov 2023 01:47:21 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id s11-20020adfeccb000000b003316b38c625sm17429283wro.99.2023.11.29.01.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 01:47:20 -0800 (PST)
Message-ID: <656708a8.df0a0220.28d76.9307@mx.google.com>
X-Google-Original-Message-ID: <ZWcIpjkrL6vJMZCy@Ansuel-xps.>
Date: Wed, 29 Nov 2023 10:47:18 +0100
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
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWcGn7KVSpsN/1Ee@shell.armlinux.org.uk>

On Wed, Nov 29, 2023 at 09:38:39AM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 29, 2023 at 03:12:13AM +0100, Christian Marangi wrote:
> > @@ -1310,10 +1302,6 @@ static int at803x_cable_test_start(struct phy_device *phydev)
> >  	 */
> >  	phy_write(phydev, MII_BMCR, BMCR_ANENABLE);
> >  	phy_write(phydev, MII_ADVERTISE, ADVERTISE_CSMA);
> > -	if (phydev->phy_id != ATH9331_PHY_ID &&
> > -	    phydev->phy_id != ATH8032_PHY_ID &&
> > -	    phydev->phy_id != QCA9561_PHY_ID)
> > -		phy_write(phydev, MII_CTRL1000, 0);
> ...
> > +static int at8031_cable_test_start(struct phy_device *phydev)
> > +{
> > +	at803x_cable_test_start(phydev);
> > +	phy_write(phydev, MII_CTRL1000, 0);
> 
> I don't think this is a safe change - same reasons as given on a
> previous patch. You can't randomly reorder register writes like this.
>

Actually for this the order is keeped. Generic function is called and
for at8031 MII_CTRL1000 is called on top of that.

-- 
	Ansuel

