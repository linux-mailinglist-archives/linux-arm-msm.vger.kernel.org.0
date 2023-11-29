Return-Path: <linux-arm-msm+bounces-2388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB27FD2E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD8F7B2115D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 09:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3328A15E88;
	Wed, 29 Nov 2023 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bwvjkdm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF01C19A0;
	Wed, 29 Nov 2023 01:36:36 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c87acba73bso86204641fa.1;
        Wed, 29 Nov 2023 01:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701250595; x=1701855395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vm1kAQ0JMuQUe3cnBM9Rhh/BzmqAbhh8B02CHm4+jb0=;
        b=Bwvjkdm0WEuw3I/8evX6ZJnjQ+nCT1rLdo0WlX0FKe7+FCelZGgm7ieZd2msUhqTYE
         jwcDjBp/WifLTUr4RPddS4YVnApq5+tf6IHsrjBl9s0YZbi9ROARoPlMTG3lLQxsO+Iq
         UYJIGpJA1HfzkVUt02F9PPAFThjsqSMbDn7KZqBJkl2g2cteq+F1DpS2Ak7Xf+OlaiNA
         VnMrEVWeAflAs7tQ8le4YKA7K9c14grHbJrmZAy7ZIPgYriHyXf50+dUzL68/OIYMio1
         uM4Dt79D8WMauVD7UeblaNEeRQbmi2XHdHFNYPLng4FAof5Ft1SFkCuYpHkrr02ucTmt
         qsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701250595; x=1701855395;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vm1kAQ0JMuQUe3cnBM9Rhh/BzmqAbhh8B02CHm4+jb0=;
        b=OCbYhBn3307HKS3f9ncbXDsmtTllM3qv40mpPrfdVg76WlZ9TIioPVGUOfsmsaEZ+e
         oKwbqkS6CJRQD/nOHP5PNqLHFN74amqrCutgVuBOjfGOGcjDpjDOzHsikeSmlFPX4Er7
         6uBpzuPehZPHYoDa4vTRzOpuW634SvO7Tq9rVXzDyDkjVljl14wTedVJv1T381fg2Igh
         aquGIphtkyufrOyvHDCJh5koIDR/fLpFALDxO7ptNkq1Ib7pvNusg9zDg1NgEUatCCvC
         57PWm52z6u7qn78dFUNQtfc9Ye/zB8lOLJLYyW1JXeXlrSdl+2V50YHxxkAIS+sLzHOt
         zH7A==
X-Gm-Message-State: AOJu0YyV6lGJxcqXvDZzr8WkS6PSFRQIGg85dhHPENRDNiThblbFYXuB
	dh/MmR/TClsF7+BviwMfbSU=
X-Google-Smtp-Source: AGHT+IEr3Vmw/i5n3af/FbTqT8x+NPR9LcEYvctICJCvZ1Uzas6jUPr0h3huY0LYDt2mJnzqmXX7cA==
X-Received: by 2002:a2e:b707:0:b0:2c8:8b7c:c77a with SMTP id j7-20020a2eb707000000b002c88b7cc77amr11161552ljo.24.1701250594748;
        Wed, 29 Nov 2023 01:36:34 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id fm21-20020a05600c0c1500b0040b398f0585sm1557066wmb.9.2023.11.29.01.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 01:36:34 -0800 (PST)
Message-ID: <65670622.050a0220.4c0d0.3ee9@mx.google.com>
X-Google-Original-Message-ID: <ZWcGH1IWG8Gs4Gyc@Ansuel-xps.>
Date: Wed, 29 Nov 2023 10:36:31 +0100
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
Subject: Re: [net-next PATCH 02/14] net: phy: at803x: move disable WOL for
 8031 from probe to config
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-3-ansuelsmth@gmail.com>
 <ZWcDUJY8rM6uApO1@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWcDUJY8rM6uApO1@shell.armlinux.org.uk>

On Wed, Nov 29, 2023 at 09:24:32AM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 29, 2023 at 03:12:07AM +0100, Christian Marangi wrote:
> > Probe should be used only for DT parsing and allocate required priv, it
> > shouldn't touch regs, there is config_init for that.
> 
> I'm not sure where you get that idea from. PHY driver probe() functions
> are permitted to access registers to do any setup that they wish to.
> 
> config_init() is to configure the PHY for use with the network
> interface.
> 
> I think this patch is just noise rather than a cleanup.
>

I got it from here [1]

Also on every other driver probe was always used for allocation and
parsing so why deviates from this pattern here?

Also I think it was wrong from the start as on reset I think WoL is
not disabled again. (probe is not called)

[1] https://elixir.bootlin.com/linux/latest/source/include/linux/phy.h#L916

-- 
	Ansuel

