Return-Path: <linux-arm-msm+bounces-1989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B337F8CD4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 18:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD758281461
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 17:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413022CCD9;
	Sat, 25 Nov 2023 17:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="So91xl6x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554FB11F;
	Sat, 25 Nov 2023 09:35:10 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40b31232bf0so23027495e9.1;
        Sat, 25 Nov 2023 09:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700933709; x=1701538509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=axG3mfbjbz/W134k+YbcMH+7XBFg5Rppc/71KawjxBY=;
        b=So91xl6x4Lu62YfkdGwdY1a14qvPcZipQrTk7c+tEvLDc8T9tqUJN2HY2nVB6t/IZJ
         uDmcPyfdgajXR0n1U1K9HqBoISFIfOpEX5aD28CH8OY3GuTBanq+PQKwoam/KUk8C2A4
         s24RujmGVlxNtMb1Wp1C6HYby72CrLTRzHhk6vXVy8xcf/aDYvb7ocOfM0i0DYCDkWyl
         wuP97dt6XrmaP6SjGElg2YsgdI9v69gGq6DIdBKb+yYVAQI3xxM39teix5pPytJp+3Kn
         Gj8UxKtnhN9i8/ri3GfNtnGaWBVzVlFEnR6MT6WTjsEDHHvkKu1d/crI6bBsNFtTxft4
         8mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700933709; x=1701538509;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axG3mfbjbz/W134k+YbcMH+7XBFg5Rppc/71KawjxBY=;
        b=VdMJfcJ24FNPNt+Qo/af7Y3oH/823TPLmvfrzgYRfXX6YH41euBN36GZwN+pCnONtz
         Ap1ND7YI1J6CPStGR1WiCNJZ4Yuf2ElY54MzwP9LUBwhQ+xomY+CdplGwmvrXPEbcahT
         6JX01KDHK9oF9uOGizoZoXNGKDWDDUah702ClDkQ2QWOxGKpSWot7LI1B4Fdtf7qtQtS
         cQ/w9wtrkiAOPdCiHmysxf2eekbsRkhV9piKAD07/yqtTEhnvtwqI9Q4wfUe5XAZT6Kv
         V2NtqBg9saFzjo2nLSh0GnP91f3MyREJxR7c7qktjQUC2Kbr/L+Stv4IcWICaMRDperf
         Gh2A==
X-Gm-Message-State: AOJu0YwfOCBlbb/FA2F5x2JUzKpFycU49uEO5ssn8WRTH+jFvALA28nP
	KZs/F4bF8ngu4/FVK7FPszs=
X-Google-Smtp-Source: AGHT+IF2k2jTI5R4V86TMAzGvEmeagVATmpSvXj1vel8cBJdrhFvqOUF1JNx7OrJEBc8H5AxuK1DRA==
X-Received: by 2002:a05:600c:a04:b0:408:3a67:f6f5 with SMTP id z4-20020a05600c0a0400b004083a67f6f5mr5297187wmp.18.1700933708421;
        Sat, 25 Nov 2023 09:35:08 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id t16-20020a05600c199000b0040a44179a88sm9027766wmq.42.2023.11.25.09.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 09:35:08 -0800 (PST)
Message-ID: <6562304c.050a0220.44374.e4b3@mx.google.com>
X-Google-Original-Message-ID: <ZWH7iXQy9SMwbyZz@Ansuel-xps.>
Date: Sat, 25 Nov 2023 14:50:01 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH v2 00/11] net: phy: Support DT PHY package
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
 <bf26ba4b-ea21-450d-b2ce-0f68f2d2796a@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf26ba4b-ea21-450d-b2ce-0f68f2d2796a@lunn.ch>

On Sat, Nov 25, 2023 at 06:28:06PM +0100, Andrew Lunn wrote:
> > One example is this:
> > 
> >         ethernet-phy-package@0 {
> >             #address-cells = <1>;
> >             #size-cells = <0>;
> 
> Please extend this example with a compatible, and include a property
> which is global.
>

Hi, don't know if you notice the changelog, I now check with the node
name prefix instead of using compatible ethernet-phy-package. (some
requested and didn't like using it) (easy to reintroduce, was just a
small proposal/idea)

Also in theory the compatible for specific PHY package can also be
skipped. (we can use the select way and match for PHY id. Can also be
introduced easily but shouldn't that be checked in some way? Or it's ok
to have a compatible that will only be used for documentation?)

> > (For Andrew, we are looking intro making this in at803x PHY driver and see
> > what functions can be reused, idea is to move the driver to a dedicated
> > directory and create something like at803x-common.c as the at803x PHY
> > driver is too bloated and splitting it it's a better approach)
> 
> This sounds good.
> 

Thanks, also for Russell, I forgot to include the PHY mode in the
qca807x commit, will include that once I will move the code to the
shared implementation with at803x. (sorry)

-- 
	Ansuel

