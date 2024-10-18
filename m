Return-Path: <linux-arm-msm+bounces-34988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 466DE9A4588
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C964928353A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8188B204945;
	Fri, 18 Oct 2024 18:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DXzff3j0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE3204099
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 18:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275072; cv=none; b=lkAsqhfumGDDkKb4shIUwFXDn7cJRIkvrM3XUnw0K9RbWjiLnRRxBTOnDdMgwxJT2s5LtTlTwjf45u++8N8KWoDl8TYtw6oLBdrNgfCRf7PBBbxtJ1mvz0UDJt/zscdXE5vAijR83tOYffAp5vkPOREakyknibPTJCwWAIqsnXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275072; c=relaxed/simple;
	bh=EZWTd5YEfUElBC+zgolxFMTDjcMyKOuhcgdZbeVkYrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YryioMoj1sIuup7Fq/SXHha6JApwxUew6QxV/E0w7dcLtik+BjhiPk50iyGDsossBezuvSajvpvHN5DzyGdlxY1l+X5U1vImqWJgVcwsU2YIJd5BeY+8ciOOn5LA/z7LxZwCqBaCUHUisp8YTKD2B4168VSVouPpIRRu0Pl4/lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXzff3j0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d533b5412so1694162f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 11:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729275067; x=1729879867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2KLpcc3kNP3MfKRazrnnVCcDA6v7f89BgPr8FP7p0us=;
        b=DXzff3j01fktGydW1SHkVaEky8gfbKE1rnzPI8cXb45HdLPMr+CPjP9U3QVzg5e1qZ
         ENuPRXYra1pt2R8LpUGPb5wTjclkRVrwCn03tY+3eMeIK1hNdKVxTngZhX3nCOxwvs/4
         sUkmUpDDFNiNiChsKzKkuuapvrbkDJI87Vuq2PltxD8IPRqXmIu6vdhbzKohFrLQc6Fa
         xKBnjSVxgLrFHzZGQIwP9IQtQGsBUz3FPaj1Jmtq3oIdKkewI6fPN9Rdsyu15/naeM9n
         eRQresEVCAD2cNEddQrPaRLQ6kOZrwBPODVUISc4JOTK7kXAKIQtUr04GxoCftdmkcAz
         f4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275067; x=1729879867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KLpcc3kNP3MfKRazrnnVCcDA6v7f89BgPr8FP7p0us=;
        b=jFYt95EtlrB2ONMiy0EcdGhSBIAp60vbxdvXj49WHXWKBLIiB1Uzvv6e+buKEgfcPd
         7ASL7U5whC/luR1IH1oZ3suH5oGlBt2aSQCEq95TGNe917bUU9fEG4sn0Xrdeg6M4U5v
         YfVpnYybof3ttwESM83GNQnIqaGwGF1H+E9WRw4Pc6WHOAAHScHcSolpErlbodixW44J
         PNanYSR+0zJrEmGpFeN6JDs8eAjWjPKGQSqLYpJamAZ4eLTowyljKQ3b23ef3YIXy+Rn
         vuU7FoyMeGGxu7TivT0FLZtWoPDraGZhMttwhdW3QZqRJT8MoayysV6qBps/1noGjRiK
         Exdw==
X-Forwarded-Encrypted: i=1; AJvYcCVUrcWKqDhJ220QEScT8/U7O4I0SfL1LsQOvpBcr2joIxUi2CtGF75ylIfLnFPs2dSmjlgWUGu9ldspgthT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ES34jQDqRYTc1UYZDtiQtNk+0cB+ZmdLBrvkrFVNFJWRkCw/
	6/ecSAUpyfLsawKJ8tONHDZQxXbH4xTXoHOPJaO3TyR7fEbp4aUMa6CCbGz4GmU=
X-Google-Smtp-Source: AGHT+IHRbHjwGIbZxx/Le91jjm7kukB7HbwW13XKm2wo1KLNpSv+GG+rS7/87tLkIw7br2Dy0cazRQ==
X-Received: by 2002:a5d:6584:0:b0:374:c8a0:5d05 with SMTP id ffacd0b85a97d-37eb48a0e89mr2478296f8f.50.1729275066852;
        Fri, 18 Oct 2024 11:11:06 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf027a5bsm2485016f8f.13.2024.10.18.11.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:11:06 -0700 (PDT)
Date: Fri, 18 Oct 2024 21:11:04 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <ZxKkuD1cuZXtYiFp@linaro.org>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <20241004-x1e80100-ps8830-v2-2-5cd8008c8c40@linaro.org>
 <af5tlrvbceo6gsatkfj4oitznznscxkt7d5lie5mdvu5wky3t3@sktfucncdjnn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af5tlrvbceo6gsatkfj4oitznznscxkt7d5lie5mdvu5wky3t3@sktfucncdjnn>

On 24-10-06 18:40:51, Dmitry Baryshkov wrote:
> On Fri, Oct 04, 2024 at 04:57:38PM GMT, Abel Vesa wrote:
> > The Parade PS8830 is a Type-C muti-protocol retimer controlled over I2C.
> > It provides both altmode and orientation handling.
> > 
> > Add a driver with support for the following modes:
> >  - DP 4lanes
> >  - DP 2lanes + USB3
> >  - USB3
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/usb/typec/mux/Kconfig  |  10 +
> >  drivers/usb/typec/mux/Makefile |   1 +
> >  drivers/usb/typec/mux/ps8830.c | 424 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 435 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> > index ce7db6ad30572a0a74890f5f11944fb3ff07f635..48613b67f1c5dacd14d54baf91c3066377cf97be 100644
> > --- a/drivers/usb/typec/mux/Kconfig
> > +++ b/drivers/usb/typec/mux/Kconfig
> > @@ -56,6 +56,16 @@ config TYPEC_MUX_NB7VPQ904M
> >  	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
> >  	  redriver chip found on some devices with a Type-C port.
> >  
> > +config TYPEC_MUX_PS8830
> > +	tristate "Parade PS8830 Type-C retimer driver"
> > +	depends on I2C
> > +	depends on DRM || DRM=n
> > +	select DRM_AUX_BRIDGE if DRM_BRIDGE && OF
> > +	select REGMAP_I2C
> > +	help
> > +	  Say Y or M if your system has a Parade PS8830 Type-C retimer chip
> > +	  found on some devices with a Type-C port.
> > +
> >  config TYPEC_MUX_PTN36502
> >  	tristate "NXP PTN36502 Type-C redriver driver"
> >  	depends on I2C
> > diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
> > index bb96f30267af05b33b9277dcf1cc0e1527d2dcdd..4b23b12cfe45a0ff8a37f38c7ba050f572d556e7 100644
> > --- a/drivers/usb/typec/mux/Makefile
> > +++ b/drivers/usb/typec/mux/Makefile
> > @@ -6,5 +6,6 @@ obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
> >  obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
> >  obj-$(CONFIG_TYPEC_MUX_IT5205)		+= it5205.o
> >  obj-$(CONFIG_TYPEC_MUX_NB7VPQ904M)	+= nb7vpq904m.o
> > +obj-$(CONFIG_TYPEC_MUX_PS8830)		+= ps8830.o
> >  obj-$(CONFIG_TYPEC_MUX_PTN36502)	+= ptn36502.o
> >  obj-$(CONFIG_TYPEC_MUX_WCD939X_USBSS)	+= wcd939x-usbss.o
> > diff --git a/drivers/usb/typec/mux/ps8830.c b/drivers/usb/typec/mux/ps8830.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..58990f7860bf77ec12d00f0d3df3a40735bbf9d8
> > --- /dev/null
> > +++ b/drivers/usb/typec/mux/ps8830.c
> > @@ -0,0 +1,424 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Parade PS8830 usb retimer driver
> > + *
> > + * Copyright (C) 2024 Linaro Ltd.
> > + */
> > +
> > +#include <drm/bridge/aux-bridge.h>
> > +#include <linux/clk.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/usb/typec_altmode.h>
> > +#include <linux/usb/typec_dp.h>
> > +#include <linux/usb/typec_mux.h>
> > +#include <linux/usb/typec_retimer.h>
> > +
> > +struct ps8830_retimer {
> > +	struct i2c_client *client;
> > +	struct gpio_desc *reset_gpio;
> > +	struct regmap *regmap;
> > +	struct typec_switch_dev *sw;
> > +	struct typec_retimer *retimer;
> > +	struct clk *xo_clk;
> > +	struct regulator *vdd_supply;
> > +	struct regulator *vdd33_supply;
> > +	struct regulator *vdd33_cap_supply;
> > +	struct regulator *vddat_supply;
> > +	struct regulator *vddar_supply;
> > +	struct regulator *vddio_supply;
> > +
> > +	struct typec_switch *typec_switch;
> > +	struct typec_mux *typec_mux;
> > +
> > +	struct mutex lock; /* protect non-concurrent retimer & switch */
> > +
> > +	enum typec_orientation orientation;
> > +	unsigned long mode;
> > +	int cfg[3];
> > +};
> > +
> > +static void ps8830_write(struct ps8830_retimer *retimer, int cfg0, int cfg1, int cfg2)
> > +{
> > +	if (cfg0 == retimer->cfg[0] &&
> > +	    cfg1 == retimer->cfg[1] &&
> > +	    cfg2 == retimer->cfg[2])
> > +		return;
> > +
> > +	retimer->cfg[0] = cfg0;
> > +	retimer->cfg[1] = cfg1;
> > +	retimer->cfg[2] = cfg2;
> > +
> > +	regmap_write(retimer->regmap, 0x0, cfg0);
> > +	regmap_write(retimer->regmap, 0x1, cfg1);
> > +	regmap_write(retimer->regmap, 0x2, cfg2);
> > +}
> 
> This looks like a reimplementation of regcache. Is it really necessary?

Sure, will use regcache.

> 
> > +
> > +static void ps8830_configure(struct ps8830_retimer *retimer, int cfg0, int cfg1, int cfg2)
> > +{
> > +	/* Write safe-mode config before switching to new config */
> 
> Why is this required?

Data sheet says it needs to be configured into safe mode before
switching modes.

> 
> > +	ps8830_write(retimer, 0x1, 0x0, 0x0);
> > +
> > +	ps8830_write(retimer, cfg0, cfg1, cfg2);
> > +}
> > +
> > +static int ps8380_set(struct ps8830_retimer *retimer)
> > +{
> > +	int cfg0 = 0x00;
> > +	int cfg1 = 0x00;
> > +	int cfg2 = 0x00;
> > +
> > +	if (retimer->orientation == TYPEC_ORIENTATION_NONE ||
> > +	    retimer->mode == TYPEC_STATE_SAFE) {
> > +		ps8830_write(retimer, 0x1, 0x0, 0x0);
> > +		return 0;
> > +	}
> > +
> > +	if (retimer->orientation == TYPEC_ORIENTATION_NORMAL)
> > +		cfg0 = 0x01;
> > +	else
> > +		cfg0 = 0x03;
> > +
> > +	switch (retimer->mode) {
> > +	/* USB3 Only */
> > +	case TYPEC_STATE_USB:
> > +		cfg0 |= 0x20;
> > +		break;
> > +
> 
> The TYPEC_DP clauses should only be used if state->alt->swid is set to
> USB_TYPEC_DP_SID. Other altmodes share id space for their states.

Make sense. Will check svid for DP.

> 
> > +	/* DP Only */
> > +	case TYPEC_DP_STATE_C:
> > +		cfg1 = 0x85;
> > +		break;
> > +
> > +	case TYPEC_DP_STATE_E:
> > +		cfg1 = 0x81;
> > +		break;
> > +
> > +	/* DP + USB */
> > +	case TYPEC_DP_STATE_D:
> > +		cfg0 |= 0x20;
> > +		cfg1 = 0x85;
> > +		break;
> 
> CDE, please.

Will do.

> 
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	ps8830_configure(retimer, cfg0, cfg1, cfg2);
> > +
> > +	return 0;
> > +}
> > +
> 
> -- 
> With best wishes
> Dmitry

Thanks for reviewing.

Abel

