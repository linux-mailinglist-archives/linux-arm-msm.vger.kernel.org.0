Return-Path: <linux-arm-msm+bounces-2431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD967FD58B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 12:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD0101C20F82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2671C6B4;
	Wed, 29 Nov 2023 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eik0joN0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E627295;
	Wed, 29 Nov 2023 03:24:13 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40b4744d603so26045895e9.2;
        Wed, 29 Nov 2023 03:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701257052; x=1701861852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yda9H0vxzx9rV+4Nca5ZgoQ7TxEqfzsFC4Xox7G06Tc=;
        b=eik0joN0my9LeKo79nZkyqQ85UAiLMjTZIQgzdO7tEJzSoI3ynWsXYwbqT5uwib2s1
         ZVg9tcT5+64E+tA4E9qUEaEmWE735Io4y7WVYMsVIo44i0bQWAfqfnXQRaL7GMgeZGl6
         n0ZHt64xWkrZSIjYMTCSLgrDiiCxw6aLf4ff2el9kLyvnXsSfVkY3mbX3bb0F9olzUgB
         SXClO/P3CtnIwkOG8nVRtGTdyJlAqhggW8Haewaca5SB+scccr7aI3lTxRPZRToAcbrt
         /afsTfDe/dIzCDetH6MDxAFVao7BCMQ5WXuIyQDhnJ/OMGlP2pNh7ZIPogh4/GyFjmz9
         nwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257052; x=1701861852;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yda9H0vxzx9rV+4Nca5ZgoQ7TxEqfzsFC4Xox7G06Tc=;
        b=iX+IkumYsdTmM4feOItPD9XAMNwR7EAda0n3OptgiHm5tsj6OvDdia5L/uBJWze+ug
         78JVX2SmkMIj4fMiGrcdh6VUvk+syt4zJ33oOPxpDLJw8rasfdje4X0IAghsWQ5Wsj8N
         ocIm0AaLduzvK7gKXku9Z5ZOlfgcqmchzDBzy1WfJZ9zaHVTMD4e2P2kkfRqD8VU7rGZ
         JRe/ZV/3oFUaqvC3CgDc912z0FthDok3lynikHfIKoUIZHmM8iLTaLC7L4D4j9Ja8Oei
         Gz0JgdAIp4Y0DpC5G4SpWV0qVTqzxfRGV5knOh1J1eu5UlfKPeRooBKtXgHLDIAqlSpo
         1YoA==
X-Gm-Message-State: AOJu0Yw1pBAkZ0+ymD130WRDTjZV8IGXL2SkQADa3dm/Xww4Gz2EI5og
	BfpHh22YTd1edZnEwu5mpc4=
X-Google-Smtp-Source: AGHT+IFlNRMxJcfO/JzysNNt2mOPKzqEQFGeunyY0WXd5lkMyJrG6wDUsIGhdoRtbZs+GxtoTKmANQ==
X-Received: by 2002:a05:600c:4f4b:b0:404:6ed9:98d1 with SMTP id m11-20020a05600c4f4b00b004046ed998d1mr10709229wmq.41.1701257052093;
        Wed, 29 Nov 2023 03:24:12 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c198d00b003feea62440bsm1838172wmq.43.2023.11.29.03.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:24:11 -0800 (PST)
Message-ID: <65671f5b.050a0220.83136.4ea5@mx.google.com>
X-Google-Original-Message-ID: <ZWcexG3vpimM3e2u@Ansuel-xps.>
Date: Wed, 29 Nov 2023 12:21:40 +0100
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
Subject: Re: [net-next PATCH 13/14] net: phy: qcom: deatch qca83xx PHY driver
 from at803x
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-14-ansuelsmth@gmail.com>
 <ZWcJ/OgC1+cbFvhk@shell.armlinux.org.uk>
 <65671487.050a0220.dae78.45f0@mx.google.com>
 <ZWceeQFBSZD1hzSk@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWceeQFBSZD1hzSk@shell.armlinux.org.uk>

On Wed, Nov 29, 2023 at 11:20:25AM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 29, 2023 at 11:37:56AM +0100, Christian Marangi wrote:
> > On Wed, Nov 29, 2023 at 09:53:00AM +0000, Russell King (Oracle) wrote:
> > > On Wed, Nov 29, 2023 at 03:12:18AM +0100, Christian Marangi wrote:
> > > > diff --git a/drivers/net/phy/qcom/Makefile b/drivers/net/phy/qcom/Makefile
> > > > index 6a68da8aaa7b..43e4d14df8ea 100644
> > > > --- a/drivers/net/phy/qcom/Makefile
> > > > +++ b/drivers/net/phy/qcom/Makefile
> > > > @@ -1,2 +1,3 @@
> > > >  # SPDX-License-Identifier: GPL-2.0
> > > > -obj-$(CONFIG_AT803X_PHY)	+= at803x.o
> > > > +obj-$(CONFIG_AT803X_PHY)	+= at803x.o common.o
> > > > +obj-$(CONFIG_QCA83XX_PHY)	+= qca83xx.o common.o
> > > 
> > > These PHY drivers can be built as modules. You will end up with several
> > > modules - at803x.ko, qca83xx.ko and common.ko. You don't mark any
> > > functions in common.c as exported, no module license, no author, no
> > > description. common.ko is way too generic a name as well.
> > > 
> > > Please think about this more and test building these drivers as a
> > > module.
> > >
> > 
> > Had some fear about this...
> > 
> > What would be the preferred way for this?
> > 
> > Having a .ko that EXPORT symbol or making the PHY driver .ko to compile
> > the common.o in it?
> 
> I think the former, otherwise we end up with common.o duplicated in
> each module, which becomes unnecessary bloat. This is how the Broadcom
> stuff (which also has a "library") does it.
> 
> > Honestly I would like the second option since I would prefer not to
> > create a .ko with shared function and EXPORT lots of symbols. On SoC it's
> > expected to have only one of the PHY (at max 2 when the qca807x PHY will
> > be implemented, with the at808x also present) so the size increase is
> > minimal.
> > 
> > (just to be more clear, talking about this makefile implementation)
> > 
> > at803x-objs			+= common.o
> > obj-$(CONFIG_AT803X_PHY)	+= at803x.o
> > qca83xx-objs			+= common.o
> > obj-$(CONFIG_QCA83XX_PHY)	+= qca83xx.o
> > qca808x-objs			+= common.o
> > obj-$(CONFIG_QCA808X_PHY)	+= qca808x.o
> 
> That won't work - the -objs needs to list the corresponding .o file
> as well, and it needs to be a different name (you can't do this:
> 
> qca808x-objs			+= common.o qca808x.o
> 
> it has to be something like:
> 
> qca808x-phy-objs		+= common.o qca808x.o
> obj-$(CONFIG_QCA808X_PHY)	+= qca808x-phy.o
> 
> However, I don't like this because it means each module ends up with
> a copy of common.o in it.
> 

Ok will do the .ko library approach np.

> > For name of common.c, is qcom_ethphy_common.c a better name?
> 
> or qcom-phy-lib.c which follows what we have for Broadcom.
>

Think we have to add some reference that it's about ethernet somewhere.

There are already lots of qcom-phy .ko outside net/ 

qcom-ethphy-lib.c ?

-- 
	Ansuel

