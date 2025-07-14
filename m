Return-Path: <linux-arm-msm+bounces-64865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B1B047C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 21:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D6724A5465
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 19:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CBA277807;
	Mon, 14 Jul 2025 19:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LCrCnwWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBE61494C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 19:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752520110; cv=none; b=oQc1V1ugzAGPtqljut4b+fRiv8hSybvMjxuAZ1vKLc7sxf8JYSrVh8cwp9E7f0xAYp1MnkwqZybSLk2l+lux8mJZjqzelUEqcO02fv/9tN+1kAQeXr5IFxn8CkaQHpuCrh32Nt6pSUZuN+XoXV2XrSSAtICjnwIqNW74wMNkJ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752520110; c=relaxed/simple;
	bh=VRc50o1TNkXkiKCdb7sYh/BGwOy7+sjpbKW7SRTKiiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Aj/bgYwmsX5xngsGaSkwm/vJQQH8VoDW+iQ8lG8cNh0Zg/fU72LXHuA3eTGHvXtE/A8b8OlQ5KOdI+gaQn3d+IW1KSr9vsP6r63txwgEh3PJuFonhkb/x2HNv3lKh62dFj89z0DZ0tONYKEETi7XKS9TmT6ytekvcgG0vTDcBOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LCrCnwWI; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2ef493de975so2629330fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752520106; x=1753124906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FY8oP8TntW4ytWNHBRG2ykUEsygpkJOVRPFVHGGy1iw=;
        b=LCrCnwWIBTL78Q2Hg9KyuWXNOxsqgoqSLfm/Wy7IPqNc1FixPumgDNLOziNyWcZO6V
         rWAQYgYaiVc9Ffd3e9829lHMzdnSf9neapsXgmg3GvR6IPwHC+wnF/U0mSZ7FrLFjlCx
         TsRX9Prc+ffbpKAIBTizdJ2KroDQZnbZ7i9J0luGrfkAv9PeZnm5dx5tVFUW7bymPkDx
         5DlDGAV6GZIBo1ZHL7y1HxygyknEyWpclkEB2kerzCpXEV5gUp9xehmrXm+b4Gz84hSF
         MlFM9UoVx+5HYKIync+IfP9Gx1+ty9rJ5X4UbQSSEojnFR6g42VuXXbRQbBDKZLtTFl5
         p8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752520106; x=1753124906;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FY8oP8TntW4ytWNHBRG2ykUEsygpkJOVRPFVHGGy1iw=;
        b=LCzKIeS4HtbsMcAr9cTPUNdkmsGKSsNK8kgGIXIsvbFzV0s/pQTSZSkUZxcmhQz5eg
         5P2q6V+YBVL6elWO0f/emWaQu1DwC68+DC63SN3XrrX/XpEnhV2Ojbi7thDcNEC52/Ds
         Jx74Lc1yhlP2Cp4CoVZ/l4UXhW5qYwi2ElQ4AjCm1DgKaiYkYRCebG2/0RFOybRZMoGe
         9P4wrOZ3BkPYS12iNfw7wWrYUaboCM0mj7JSeRO+8vA4WzbUZGjjXUfClYhmlIYdSK3o
         8UNZu2qJv9iitFH+W/Cvt8E5gDcjEI1eoOGsMSX52rp8FfS+NGScpmVT8Fz6Owgq839c
         ig/A==
X-Forwarded-Encrypted: i=1; AJvYcCWmwCuIZOgRw0B5Wj5iY1PAFQ4qLRt9NwmvQawM/1Kvy6x1WzzLDx5m7AHqs8nL31BwE7QkV2Ch+vJNpSNB@vger.kernel.org
X-Gm-Message-State: AOJu0YxQGxo57abRHCVYX4KQKQQp05/KImQh0gffOBaZqmB4h3t5UBfW
	7FYRdvmVqX+QdGCwtm2XfjmOeq0vdKHj9SBuglBza3+1CJrHcTc5K59lCEFEfQAIz9g=
X-Gm-Gg: ASbGncv23O/hfMkveQx9Sx0ZwZQ6bwlTZP/tqy3zsRY7+w0z02metVZdli00bUunE7+
	OcLhSNcwmsdbMZxTioqHMWnG75fU75dfCQ4cee8iOlYH6AEx1eN2sPM/soicLeXipAYxtl3LGqy
	VkyNf/XAzHlUzQQVBFJde4/i8Le3eI0KWnVDKBuOZuh8uCjmaLzaqIrUgiqBF/ie33+owWgmnrh
	ctWe4IzUIov64jncYDiWX6yTuDzv53OWNyajbVM/6sIBSmonHNe/2KbcClf7VLX5jFkU8tiWhaf
	lAoH4xTRE9vThO8TfiVUndvG8ZOz3qe0+VBtEsBa0FoU5b+79oECnEk4ab1iL4EOKPgQup6DOLY
	nAXeIE1xLykDN7SBTMB+1ftTipMbBZQ==
X-Google-Smtp-Source: AGHT+IEzO8bUgBmoo1uzE8f4f/z4iMC9jmOc9/Xzy7X6HZpF2LbcgnghTbE4rOCIVgXQl6Q0I/xJmw==
X-Received: by 2002:a05:6871:5d06:b0:2d5:b914:fe2d with SMTP id 586e51a60fabf-2ff270892c7mr10030939fac.33.1752520106283;
        Mon, 14 Jul 2025 12:08:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116dd664sm2036650fac.42.2025.07.14.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:08:25 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:08:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	davem@davemloft.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <13e48447-37fb-49d8-8c6a-ce5d198506ae@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630143315.250879-5-maxime.chevallier@bootlin.com>

Hi Maxime,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/dt-bindings-net-Introduce-the-ethernet-connector-description/20250630-224035
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250630143315.250879-5-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports representation
config: x86_64-randconfig-r071-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061812.0aBYBa9l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507061812.0aBYBa9l-lkp@intel.com/

smatch warnings:
drivers/net/phy/phy_port.c:130 phy_port_get_type() warn: bitwise AND condition is false here

vim +130 drivers/net/phy/phy_port.c

055cbf51317b1e Maxime Chevallier 2025-06-30  122  /**
055cbf51317b1e Maxime Chevallier 2025-06-30  123   * phy_port_get_type() - get the PORT_* attribut for that port.
055cbf51317b1e Maxime Chevallier 2025-06-30  124   * @port: The port we want the information from
055cbf51317b1e Maxime Chevallier 2025-06-30  125   *
055cbf51317b1e Maxime Chevallier 2025-06-30  126   * Returns: A PORT_XXX value.
055cbf51317b1e Maxime Chevallier 2025-06-30  127   */
055cbf51317b1e Maxime Chevallier 2025-06-30  128  int phy_port_get_type(struct phy_port *port)
055cbf51317b1e Maxime Chevallier 2025-06-30  129  {
055cbf51317b1e Maxime Chevallier 2025-06-30 @130  	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)
                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^
I think BIT(ETHTOOL_LINK_MEDIUM_BASET) was intended.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


