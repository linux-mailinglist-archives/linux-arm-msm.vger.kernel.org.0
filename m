Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 849863589B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 10:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfFEIe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 04:34:58 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38169 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfFEIe6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 04:34:58 -0400
Received: by mail-wr1-f68.google.com with SMTP id d18so18518548wrs.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 01:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8g/yZPWG+i1WVLfgMfiKNG8jFuss04L+NM2N8hvdwuU=;
        b=duvNpDjeQMy8g7ArkYr8qMf4P0vqAOFHxA5m7OA3dSPpU8Whx3HYz22J+tcP5H7fOz
         1ZznSkXdDIq1nnKilrD3TGhV6t0zrEzaOq/RDvyjaAgxf+XUcwJDO2lqoZatoK/3+uEv
         E1ftDeSUC01zpeAkA7vyZLU2On3x8YyfiVJahVLLzeMbOahAR0cqVBbKFDa/Ugz1wHB3
         UMHBitPjZbAQiG/2VorRB9SUdv0NGaqay8xKb1H1u2QaGjKA/kIoGylOE3Bfimw5OUx+
         2Ymtzqpo1AFcxBExsqvimaZHp7e8G0QiKtMS1YsnBb+6XhWmqv39jUJRcnuuHgtAq/Ek
         56Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8g/yZPWG+i1WVLfgMfiKNG8jFuss04L+NM2N8hvdwuU=;
        b=hm3nUUHOU5iwHY786qhdr1IQRp/gcCPnXDNNT35ZegQWLHf0Dbywev5gyhcxhj8Qhi
         r2xgqElyS0Rv//yy2ZMJTbyChUc8bwfIhM9g6lna/XZzWuylF7IsNKpxHbIuzbwuFxrZ
         g/or+tcJbhDmPeYCRcpamX9pI2LVTDE+kjx4xqWUaTPEnzGbRLMfv0dX72Pky1dkH2i4
         JW2QFMHN63B0DHLj46RPb+vsqcjDzIQH8IttuCZk3jjIeLFYV/u8IwTAdQFG61tumqoB
         cNIwvmURc5udWrgl8MpnOtEWgnnjmxho0Z90w22NbAopXXACEcvSFqrBA1UYBNwwS7Pa
         nzRg==
X-Gm-Message-State: APjAAAVewlzpxFvxSdDgeU9BgMkI3JfZ0A1mBljjhFAtnjFmV9pnt9s2
        FJ3Jj8ft8DjM/wlkboT7snJG4A==
X-Google-Smtp-Source: APXvYqzBuf1OKbs5PAYFvIiTv6Ji1rE3PaXYvKbhChwv5f9DahKjEOxWETTF4saSPngpiLUNQ3p1Qw==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr8473126wrt.290.1559723696792;
        Wed, 05 Jun 2019 01:34:56 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 128sm2231857wme.12.2019.06.05.01.34.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 01:34:56 -0700 (PDT)
Date:   Wed, 5 Jun 2019 09:34:54 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/8] usb: dwc3: qcom: Start USB in 'host mode' on the
 SDM845
Message-ID: <20190605083454.GO4797@dell>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-7-lee.jones@linaro.org>
 <20190605070029.GN22737@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190605070029.GN22737@tuxbook-pro>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 05 Jun 2019, Bjorn Andersson wrote:

> On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:
> 
> > When booting with Device Tree, the current default boot configuration
> > table option, the request to boot via 'host mode' comes from the
> > "dr_mode" property.
> 
> This has been the default on the MTP, but this is changing as this is
> causing issues when connected downstream from a hub (the typical
> development case for the primary USB port of a phone like device) and
> more importantly we don't have support for the PMIC blocks that control
> VBUS.

My point is not about which mode is currently chosen.  It's more about
the capability of choosing which mode is appropriate for a given
system via DT.

> Once these issues are resolved the dr_mode would be "otg".

OTG doesn't work on this H/W, so we need to specify "host" mode.

> > A property of the same name can be used inside
> > ACPI tables too.  However it is missing from the SDM845's ACPI tables
> > so we have to supply this information using Platform Device Properites
> > instead.
> > 
> 
> Afaict this would install a fall-back property, so in the case that we
> have specified dr_mode in DT (or ACPI) that would take precedence. So

That's correct.

> the commit message should reflect that this redefines the default choice
> to be "host", rather than "otg".

No problem.

> Which is in conflict with what's described for dr_mode in
> Documentation/devicetree/bindings/usb/generic.txt

This implementation only affects ACPI based platforms.  When booting
with DT, the description in that DT related document is still
accurate.

> And this driver is used on a range of different Qualcomm platforms, so I
> don't think this is SDM845 specific.

ACPI based platforms?

All the ones I've seen use the XHCI USB driver directly ("PNP0D10").
 
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index 349bf549ee44..f21fdd6cdd1a 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -468,6 +468,11 @@ static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
> >  
> > +static const struct property_entry dwc3_qcom_acpi_properties[] = {
> > +	PROPERTY_ENTRY_STRING("dr_mode", "host"),
> > +	{}
> > +};
> > +
> >  static int dwc3_qcom_probe(struct platform_device *pdev)
> >  {
> >  	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
> > @@ -603,6 +608,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
> >  			goto platform_unalloc;
> >  		}
> >  
> > +		ret = platform_device_add_properties(qcom->dwc3,
> > +						     dwc3_qcom_acpi_properties);
> > +		if (ret < 0) {
> > +			dev_err(&pdev->dev, "failed to add properties\n");
> > +			goto platform_unalloc;
> > +		}
> > +
> >  		ret = platform_device_add(qcom->dwc3);
> >  		if (ret) {
> >  			dev_err(&pdev->dev, "failed to add device\n");

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
