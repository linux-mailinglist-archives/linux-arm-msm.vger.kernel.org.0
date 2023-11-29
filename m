Return-Path: <linux-arm-msm+bounces-2422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD73F7FD50C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 12:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 099B61C211B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FED1C29B;
	Wed, 29 Nov 2023 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inHOuUAH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728451999;
	Wed, 29 Nov 2023 03:08:57 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b4c2ef584so15059795e9.3;
        Wed, 29 Nov 2023 03:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701256136; x=1701860936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TXoWjQC2UWKNPcPefB1OgmDGBq/ISO9jtkQUDslrPEk=;
        b=inHOuUAHtYRE4PthoG239jN0rmTWOzXMfnJoePFi0BXzzoNWiET5KZhdAIG5HdIM6c
         3L/C03BiOIwbDRThqJCqfCIBusn/7tuS7cVNr/fiwO/3KxsF268YA9YLECBledZy+ZOU
         n5yDt74x3juXc0mumNyN8+s6nI9xmslLXrTENQ+24VhSYGB/8oaGMZtvOYSfjZ5NacB+
         ceGdTG8f6L7p7HSgphtKo4q+V4IrilwJ5GUj/axPYb0BH9Pszh7useIQ/qqyv0ZF8Lky
         nxZZt3e8Bdy50KsOxG/UQIZ08onJPYiaKL222+pVc30lT/Xx73BeGI7Op5yY6f9AsqP+
         T7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701256136; x=1701860936;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXoWjQC2UWKNPcPefB1OgmDGBq/ISO9jtkQUDslrPEk=;
        b=Dm3IE1fwnivzqJke3zxc7wei4YZTyRYx40nOlBxz8GkcpxhXYrTxSNmo11rMixJrxB
         ozgeV+dakIUorOhWtdWEDsTYwBmG5m+BdpswCR1RpJIX8I+0BKV3hUNGHNE+SelHvchr
         kza9XyXAMa+t++nDfl1Bx2VR9Vt0Zvt3CXlcJmmWdGiaK8D8wgXchTtHDM9JEujmKagO
         Kei5IV+7cx7gUDPILS01JkoPTrSgNzvY5svHJAsmjqOohlrMXTZyxTcGNUDD5JIwh9Gv
         tA2QVrmpGdHofbkP990jMJHmdNSjAgCLbKJaR+beYaorB9O93wCd6nU/fUgRaPMiq6S7
         YFXQ==
X-Gm-Message-State: AOJu0YwmYg482q4xqooQf0gceCsOmkQto6tyIDUuHM4RPCdr6fHX/ws7
	FaXotlNwIbt3iLxg17v5R2E=
X-Google-Smtp-Source: AGHT+IFbkxnXnBir5EmXVLk2Ghp/juup515fcZSoe3s9fFLvexV/K2xPgHIZdasPh3uh2Wi9TrGWRg==
X-Received: by 2002:a05:600c:290:b0:40b:377a:2ac1 with SMTP id 16-20020a05600c029000b0040b377a2ac1mr12898477wmk.20.1701256135472;
        Wed, 29 Nov 2023 03:08:55 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id jg28-20020a05600ca01c00b0040841e79715sm1811020wmb.27.2023.11.29.03.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:08:55 -0800 (PST)
Message-ID: <65671bc7.050a0220.35082.4ae4@mx.google.com>
X-Google-Original-Message-ID: <ZWcbxIJfa6pxtoOb@Ansuel-xps.>
Date: Wed, 29 Nov 2023 12:08:52 +0100
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
Subject: Re: [net-next PATCH 06/14] net: phy: at803x: move at8031 specific
 data out of generic at803x_priv
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-7-ansuelsmth@gmail.com>
 <ZWcF6b/Py2gMmwmZ@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWcF6b/Py2gMmwmZ@shell.armlinux.org.uk>

On Wed, Nov 29, 2023 at 09:35:37AM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 29, 2023 at 03:12:11AM +0100, Christian Marangi wrote:
> > Rework everything related to specific at8031 function to specific
> > function and allocate the 2 bool, is_1000basex and is_fiber and the
> > regulator structs to a dedicated qca8031_data struct.
> > 
> > This is needed to keep at803x functions more generic and detach them
> > from specific check of at8031/33 PHY.
> > 
> > Out of all the reworked functions, only config_aneg required some code
> > duplication with how the mdix config is handled.
> > 
> > This also reduces the generic at803x_priv struct by removing variables
> > only used by at8031 PHY.
> 
> You are changing the order that register writes happen, e.g. for the
> set_wol() method. at803x_set_wol() very clearly does stuff like
> configuring the ethernet MAC address _before_ enabling WoL, and that
> can fail. Your new code enables WoL and then calls at803x_set_wol().
> If at803x_set_wol() fails (e.g. because of an invalid MAC address)
> you leave WoL enabled. This is a change of behaviour.
>

Have to think about it, changing the order of the WoL module enable and
setting the MAC should not change anything as the real enablement is the
WoL interrupt. (I guess this is why the WoL module is enabled by default
as the interrupt is disabled by default resulting in the module doing
nothing)

> I haven't checked anything else, but given the above, I think you
> need to think more about how you make this change, and check
> whether there are any other similar issues.
> 

Would it be better to split this in more smaller commit? One for moving
the at8031 function and the other for refactor of some function? 

-- 
	Ansuel

