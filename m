Return-Path: <linux-arm-msm+bounces-18865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2716A8B69CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 07:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0D751F220BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 05:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AFB1759E;
	Tue, 30 Apr 2024 05:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkwCPcx2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043B3171A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 05:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714454225; cv=none; b=MEH023krepuY+TYpYDU7c9AcWXruN/0Cb0SEWPbhHOUhje5wjWtpsPENZ9a/KaR1IZxgzJ4wj9zxo8Qlj5SRQs5ZiTZr0aDqUhwAtsO/B8r4kJeTJJyS362MPOk3EnIGSs6VFcmss3n31LoKkIwqTcVGY/akk+2yNiQhrO4otpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714454225; c=relaxed/simple;
	bh=X1vBe8uy2scxUJixEbvfFTMb+bweVxUZtX/Ylg3mEfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwhXRM5O/ctwUGcUKNAtE5UR4ID5c2DUbjLYZL5bfWGTTFj5OZfI4jwjzm1mN2ypUYfD3kBAWItbLXpUaHT9g6veQB10i8NY7GQOn/Gdo9iMSWd9guKHWiTiz1jZVbbIR7ASBZeGp26S5d/uFjEnLCdeK2bgpulyhEE3Y+1mF8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkwCPcx2; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f28bb6d747so4476005b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 22:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714454223; x=1715059023; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V0avMUsDc59rYN7coX7sm9Yp5eSnR9Q04mgQzckQ9lw=;
        b=UkwCPcx21AW7wq0fo62AYWe9kY7I+Y/Sm2yXQdFYzdRVl5a1cDwqgo0MBpuBFmY7T2
         m0oiCKzu/AJFo9RVdE52gBqpW/YvjBrE73H047CkHbafqXbXqZT4Ma73IQJpPI8djLl2
         nCUB4rcJ/eNdecPqpRHXDvXJ84S0AzgUVYNN3JGobnDbPm3V3baz+0wLswYL1pA5+wuM
         d+Fsq18e9Yi5kuA8DIdOezZ/3AxOIJ1QlsEXIKJsgGt5xn85LczsimC3BgutR7HLve1P
         LpWznJv7iSZD3gcT2Sv3L25YfXLmDUMZqyRMUltodhJLiai1k8a9+jaUPYjJ1hkPfBy/
         H+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714454223; x=1715059023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0avMUsDc59rYN7coX7sm9Yp5eSnR9Q04mgQzckQ9lw=;
        b=LUZ2IzqJZAoQLeQzW3V5ethDCa7R6blR4A47J1ACVkXTinodv1mO0I9JtbNdGg9dNC
         SbF5rfN2z2LVDR5haHO8T2Yhfp1KuhlalBYFFqfhKdO+sY3UOruPIrHsVN1TNPqGKFik
         1a5LjGW5jo2DX0OTdm920XyJH03viNg6BKBdJ1VaLdfDlMfLn6dyuFyx+0cViJJs/sOV
         Wwg/4Xu93p9koWlqgUDK0XKXsETR7tH+oEvomNodAIEYlqFJH/po7IJOzyeCGjX0Li+7
         KHKsxzEq6I/KCcjMAjQKbAuNwJbE0d8OKpQl7Qs/EdI7s4yAQUmmDyhMA3CfVTwxipJQ
         pidg==
X-Forwarded-Encrypted: i=1; AJvYcCWp+9FCTOZ6R+Pm2lrs6rNDR5Hzootum1TOelIla5RiX8bkjzlhzYlod5GHAbmMNDy0/l7SVwicl9clSUQ1Zlqo71eZ6e6R3h3rIyBZTw==
X-Gm-Message-State: AOJu0Yy1kljk8bfjgPjkzOsuFlxFBuHwByZei/f5QGCfB1Nhezcw53SP
	sVUn2pTRjvhZIqCQsIF7qL+wTpFDc+H4Z0zsQNjPBeuty3YV9H6KTOJ5YZ9B9Q==
X-Google-Smtp-Source: AGHT+IFWRZGQxckWXPNLxXAG7MGt/iJLdvfO4+V6xpas6sXD4xSC0z15Fh9sptvi1twg0sW4mfipRw==
X-Received: by 2002:a05:6a20:72a0:b0:1aa:59ff:5d31 with SMTP id o32-20020a056a2072a000b001aa59ff5d31mr14465799pzk.0.1714454223164;
        Mon, 29 Apr 2024 22:17:03 -0700 (PDT)
Received: from thinkpad ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id su11-20020a17090b534b00b002b27eb61901sm602961pjb.21.2024.04.29.22.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 22:17:02 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:46:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v3 1/5] PCI: dra7xx: Add missing header inclusion
Message-ID: <20240430051653.GB3301@thinkpad>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240429102510.2665280-2-andriy.shevchenko@linux.intel.com>

On Mon, Apr 29, 2024 at 01:23:18PM +0300, Andy Shevchenko wrote:
> Driver is using chained_irq_*() APIs, add the respective inclusion.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index d2d17d37d3e0..b67071a63f8a 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -13,6 +13,7 @@
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
மணிவண்ணன் சதாசிவம்

