Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537F22490AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 00:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgHRWS2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 18:18:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:51668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgHRWS1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 18:18:27 -0400
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 69AA320786;
        Tue, 18 Aug 2020 22:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597789106;
        bh=QKSZI3J3mW0bAKJWZPuqJejya5eWTjv/sou73dl/S+4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=v8SmAx6Dcfc89wEfDqt1kmeDO4WnuQLkRXFolTVKDYa8EI7+hfFnddkn/T9/J3ciC
         mD5HXDEjvbbh2RWPfz3lviIg/jsPYV6/O0/IJxHCyCL5+4AxUbtCxdIY7hvpMTQpnG
         YWQCfK9FufDmA68sG1fNEnq/PqND+xOHu5ujf7a8=
Date:   Wed, 19 Aug 2020 00:18:21 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 43/44] dt: document HiSilicon SPMI controller and
 mfd/regulator properties
Message-ID: <20200819001821.651a7dcd@coco.lan>
In-Reply-To: <20200818170755.GA3603438@bogus>
References: <cover.1597647359.git.mchehab+huawei@kernel.org>
        <2f88fed96d67b05fc033356fdbb7e3227955ab34.1597647359.git.mchehab+huawei@kernel.org>
        <20200817201211.GA1437827@bogus>
        <20200818111351.7e3fc780@coco.lan>
        <20200818170755.GA3603438@bogus>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Tue, 18 Aug 2020 11:07:55 -0600
Rob Herring <robh@kernel.org> escreveu:

> > > > +  spmi-channel:
> > > > +    description: number of the SPMI channel where the PMIC is connected    
> > > 
> > > This looks like a common (to SPMI), but it's not something defined in 
> > > spmi.txt   
> > 
> > This one is not part of the SPMI core. It is stored inside a private 
> > structure inside at the HiSilicon spmi controller driver. It is stored 
> > there as ctrl_dev->channel, and it is used to calculate the register offset
> > for readl():
> > 
> > 	offset  = SPMI_APB_SPMI_STATUS_BASE_ADDR;
> > 	offset += SPMI_CHANNEL_OFFSET * ctrl_dev->channel + SPMI_SLAVE_OFFSET * sid;
> > 	do {
> > 		status = readl(base + offset);
> > 	...
> > 
> > The SPMI bus is somewhat similar to I2C: it is a 2-wire serial bus
> > with up to 16 devices connected to it.
> > 
> > Now, most modern I2C chipsets provide multiple independent I2C
> > channels, on different pins. Also, on some chipsets, certain
> > GPIO pins can be used either as GPIO or as I2C.
> > 
> > I strongly suspect that this is the case here: according with
> > the Hikey 970 schematics:
> > 
> > 	https://www.96boards.org/documentation/consumer/hikey/hikey970/hardware-docs/files/hikey970-schematics.pdf
> > 
> > The pins used by SPMI clock/data can also be used as GPIO.
> > 
> > While I don't have access to the datasheets for Kirin 970 (or any other
> > chipsets on this board), for me, it sounds that different GPIO pins
> > are allowed to use SPMI. The "spmi-channel" property specifies
> > what pins will be used for SPMI, among the ones that are
> > compatible with MIPI SPMI specs.  
> 
> Based on this, I think it should be called 'hisilicon,spmi-channel' as 
> it is vendor specific. 

I'm fine with "hisilicon,spmi-channel".

> > > > +
> > > > +          vsel-reg:
> > > > +            description: Voltage selector register.    
> > > 
> > > 'reg' can have multiple entries if you want.  
> > 
> > Yes, I know. I was in doubt if I should either place vsel-reg on
> > a separate property or together with reg. I ended keeping it
> > in separate on the submitted patch series.
> > 
> > What makes more sense?  
> 
> Really, not putting it in DT. Like other things, it's fixed for the 
> chip.

I agree, but, as I said before, without the datasheet, we can only
hardcode a small subset of the LDO settings.

Due to that, I prefer keeping it at DT - either grouped together at "reg" or 
as two separated properties (reg and vsel-reg).

> > > > +description: |
> > > > +  The HiSilicon SPMI controller is found on some Kirin-based designs.
> > > > +  It is a MIPI System Power Management (SPMI) controller.
> > > > +
> > > > +  The PMIC part is provided by
> > > > +  Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml.
> > > > +
> > > > +properties:
> > > > +  $nodename:
> > > > +    pattern: "spmi@[0-9a-f]"
> > > > +
> > > > +  compatible:
> > > > +    const: hisilicon,spmi-controller    
> > > 
> > > Needs an SoC specific compatible.  
> > 
> > What about:
> > 	hisilicon,kirin970-spmi-controller   
> 
> Is 'kirin970' really the SoC name? The older ones are all 'hi[0-9]+'.

This SoC is named Kirin 970. Yet, you can see places where 3670 is
used, like:

	https://en.wikichip.org/wiki/hisilicon/kirin/970

There, it says that Hi3670 is the part number.

Thanks,
Mauro
