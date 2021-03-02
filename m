Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5655C32A131
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1835222AbhCBEu0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:50:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445668AbhCBDBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 22:01:34 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9EBC061788
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 19:00:54 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id t9so929513pjl.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 19:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JLK9hrTQmVcXX9XKS64j7zwNS+DV0TIxSisRZW1WAqk=;
        b=e9waA3SIsnehYUrQxQNzOGikTt5j4War8OnVavPY9gTc5925wUlLgP6xfSy+W41+LT
         oFwKelZU2ZVDuvErzdquqLOHfENzd35q/H4t6nCj6mKmbEB3XCdHuHenNQYLbrGYq3Op
         z0RWLezpvZBwac1GNNYcicaoHHM50VB7jf7XO9UnPKoiTMUZn/+2u+tNev2ikdz/GeZ0
         wTqevwFFTTncxStWddNBMh5oZZp5bT7ofPLhO2ij7IgZDq/TjROne3eGkfgdrQQYRmWX
         oYnMsc/83izdZiUNSbvE9ElPdq8sEE+PbDB/qvdwUKgh3Q15u47rQSkCF1g0oqJ0foy5
         c9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JLK9hrTQmVcXX9XKS64j7zwNS+DV0TIxSisRZW1WAqk=;
        b=NUfRewa6nFgwcJOBIkTxDACoZqRh/Gr9xvHLn1/H96hcKO4pf5Llqf/2eVRFdVNu9K
         PeGwBF9MbAN5OtcaOD/pzQ67Gs/ELK7CbZe7SJRyfOwxgjayXCjM+x9EDEA+JtXIrGSW
         1s9rjKufdvxSpYzrcTHP0/nK4Z+GtaLYuCnfl2TDJLCr6pSwDq8b7YQp9RoeD7z37Leo
         T3MhFAC/zQxeU4BRYdykCjXo0Vr5Wy2TYJf/iEch4yggOS3yofNwjG0uk7ocIEU97dXZ
         Vo4AanoK+6ppy1vXBO5PKHrP/8m38/x7nY00zlxoa6mbpTWkMzu6wfgfc3cU2gT40VEz
         ErOw==
X-Gm-Message-State: AOAM533x9UMqaMobGf9N+8fkBtFAjqnpru8bw4iw4OKaOQLckXMLyY6R
        ffOXjuFAPvkmkp6VZiWs+hTwFQ==
X-Google-Smtp-Source: ABdhPJypJK87nluWiUUfZjclWy0XnRwjcq+PYKKpDDqLJ6L/4kTSup2WXdbbTosArc+OY6APhlZyUg==
X-Received: by 2002:a17:902:74c4:b029:e4:9e16:18d9 with SMTP id f4-20020a17090274c4b02900e49e1618d9mr1684840plt.21.1614654053940;
        Mon, 01 Mar 2021 19:00:53 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z5sm19752928pfk.21.2021.03.01.19.00.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 19:00:53 -0800 (PST)
Date:   Tue, 2 Mar 2021 11:00:48 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: sc8180x: add ACPI probe support
Message-ID: <20210302030047.GJ24428@dragon>
References: <20210301014329.30104-1-shawn.guo@linaro.org>
 <20210301014329.30104-3-shawn.guo@linaro.org>
 <YDz8PtFy8PpdUlSF@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDz8PtFy8PpdUlSF@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 01, 2021 at 04:37:50PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 01, 2021 at 09:43:29AM +0800, Shawn Guo wrote:
> > It adds ACPI probe support with tile offsets passed over to msm core
> > driver via sc8180x_tile_offsets, as TLMM is described a single memory
> > region in ACPI DSDT.
> 
> ...
> 
> >  config PINCTRL_SC8180X
> >  	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
> > -	depends on GPIOLIB && OF
> > +	depends on GPIOLIB && (OF || ACPI)
> 
> Can you consider dropping OF dependency completely?

Not sure.  Looking at those driver options in drivers/pinctrl/qcom/Kconfig,
I think it's a global thing, and should be addressed separately anyway.

> 
> > +#include <linux/acpi.h>
> 
> No use of this header, see below.

has_acpi_companion() and ACPI_PTR use it.

> 
> (Perhaps you meant mod_devicetable.h)
> 
> ...
> 
> > +static const u32 sc8180x_tile_offsets[] = {
> > +	0x00d00000,
> > +	0x00500000,
> > +	0x00100000
> 
> Leave comma here.

Well, this is to respect the taste of original author of the driver, if
you take a look at sc8180x_tiles[] above and enum after.

> 
> > +};
> 
> ...
> 
> > +static const int sc8180x_acpi_reserved_gpios[] = {
> > +	0, 1, 2, 3,
> > +	47, 48, 49, 50,
> > +	126, 127, 128, 129,
> 
> > +	-1
> 
> -1?
> Is it kinda terminator?

Yes, it is.  I will add a comment there.

> 
> > +};
> 
> ...
> 
> > +	if (pdev->dev.of_node) {
> > +		ret = msm_pinctrl_probe(pdev, &sc8180x_pinctrl);
> > +	} else if (has_acpi_companion(&pdev->dev)) {
> > +		ret = msm_pinctrl_probe(pdev, &sc8180x_acpi_pinctrl);
> > +	} else {
> > +		dev_err(&pdev->dev, "DT and ACPI disabled\n");
> > +		ret = -EINVAL;
> > +	}
> 
> Use driver_data field for this and device_get_match_data() instead of above.

Good suggestion, thanks!

> 
> ...
> 
> > +#ifdef CONFIG_ACPI
> 
> Drop this ugly ifdeffery.
> 
> > +static const struct acpi_device_id sc8180x_pinctrl_acpi_match[] = {
> > +	{ "QCOM040D"},
> 
> > +	{ },
> 
> No comma for terminator line.
> 
> > +};
> > +MODULE_DEVICE_TABLE(acpi, sc8180x_pinctrl_acpi_match);
> > +#endif
> 
> ...
> 
> > +		.acpi_match_table = ACPI_PTR(sc8180x_pinctrl_acpi_match),
> 
> No ACPI_PTR(), please.

Sounds good.

Shawn
