Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B65161F8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 04:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgBRDgh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 22:36:37 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46927 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgBRDgh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 22:36:37 -0500
Received: by mail-pl1-f194.google.com with SMTP id y8so7492155pll.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2020 19:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GMlJ1wWVUDMxi0nbbeWDMhla9tCgEqbpniqRdViRdjM=;
        b=HvA8KqO/Q+e62pyy3c/LrFlI13Vd1UgjV3Xh3lSYxPoYeie1cpgAvFezOmsQ8R32FH
         RUs0eYuFZrcMK3A6AIN2F2BuVYF/wc3ITrfXd+mdRbmFEG45e6/omlE4/qPamdiY29/5
         wCaQoKvaBKteTXLGiOAEpC8Bkpzt/QD5tftixp7769SJjmAm8oZ1+bJY86scYP8fH6c7
         9kMfs4F4pZBjh2l9n7fhjJ/fGl+ddp1y81BL5KTVW0NUfPNY7tO7XPtW73f5tNw3IBXF
         JKkcQwX8TKoJkp/jd82z6F1qvnXGFjEti7EghzCwdIfNq+g/cs8AAGe/k/oFM+qVh5xS
         Igrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GMlJ1wWVUDMxi0nbbeWDMhla9tCgEqbpniqRdViRdjM=;
        b=kqJjB2iTPPKjw1O0O1W+2KfMBj5lt7SJ1Zi+75789DbZGu5Nsdt2CflP1nHqpRXDzj
         RAk/eqBQHJnIE97ye7VZwdU/QKgt6ziL0slY3zH11imy57cg3ZPYHqrDY937H/quMV7X
         8LxSvmrVeHL9TbCFFW0sc/8x2ZuV9H829YUMSOYo8YnGkmjWjCv+E05V2yRHTzEYSXt/
         lLNPc7CBotdD+02PebGKWC6cGA76xnePyH5VJYbCAS0QshFW2ciX+HF/1TmZGRBH+dH9
         XSRufSVZ9rPNX2XSUA1+yNCeOl+BqboiLrYz9aROq2ZRN+hiLgs9ct5fVmPo5m9Nsx/Q
         ve7g==
X-Gm-Message-State: APjAAAUkQXeItUefV7jzhj4CQJ/sUMxx/1j13jmUvJjiMRXenkr6783G
        luukeHZWPk+t83B0QqKDHQtskg==
X-Google-Smtp-Source: APXvYqxUnEE6mqEu7xwgGEga0icooVySyy93QsCESjYnuqA5ZoqA++5NWN7QeLrYVw72C/KwTJHppA==
X-Received: by 2002:a17:902:6b03:: with SMTP id o3mr18219766plk.331.1581996996682;
        Mon, 17 Feb 2020 19:36:36 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a10sm2321969pgm.81.2020.02.17.19.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 19:36:35 -0800 (PST)
Date:   Mon, 17 Feb 2020 19:35:42 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        rnayak@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org
Subject: Re: [PATCH v4 2/2] Embedded USB Debugger (EUD) driver
Message-ID: <20200218033542.GY955802@ripper>
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-3-git-send-email-akdwived@codeaurora.org>
 <20200203193533.GL3948@builder>
 <5808f959-f0fc-85be-4bfa-980b5311adeb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5808f959-f0fc-85be-4bfa-980b5311adeb@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 16 Feb 06:14 PST 2020, Dwivedi, Avaneesh Kumar (avani) wrote:

> Thank you very much Bjorn for your comments, will address them and post
> latest patchset soon.
> 
> On 2/4/2020 1:05 AM, Bjorn Andersson wrote:
> > On Thu 30 Jan 20:43 PST 2020, Avaneesh Kumar Dwivedi wrote:
[..]
> > > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > > index d0a73e7..6b7c9d0 100644
> > > --- a/drivers/soc/qcom/Kconfig
> > > +++ b/drivers/soc/qcom/Kconfig
> > > @@ -202,4 +202,16 @@ config QCOM_APR
> > >   	  application processor and QDSP6. APR is
> > >   	  used by audio driver to configure QDSP6
> > >   	  ASM, ADM and AFE modules.
> > > +
> > > +config QCOM_EUD
> > Please aim for keeping the sort order in this file (ignore QCOM_APR
> > which obviously is in the wrong place)
> Please help to elaborate more, do you mean adding configs in alphabetical
> order?

Yes, we want to maintain alphabetical sort order of the config options
in the Kconfig file. Unfortunately I must have missed this as I picked
up QCOM_APR - hence my ask to add you entry further up, even if the
order isn't perfect...

> > 
> > > +       tristate "QTI Embedded USB Debugger (EUD)"
> > > +       depends on ARCH_QCOM
> > > +       help
> > > +         The Embedded USB Debugger (EUD) driver is a driver for the
> > > +         control peripheral which waits on events like USB attach/detach
> > > +         and charger enable/disable. The control peripheral further helps
> > > +         support the USB-based debug and trace capabilities.
> > > +         This module enables support for Qualcomm Technologies, Inc.
> > > +         Embedded USB Debugger (EUD).
> > > +         If unsure, say N.
> > >   endmenu
[..]
> > > +static ssize_t enable_store(struct device *dev,
> > > +				struct device_attribute *attr,
> > > +				const char *buf, size_t count)
> > > +{
> > > +	struct eud_chip *chip = dev_get_drvdata(dev);
> > > +	int enable = 0;
> > You shouldn't need to initialize this as you're checking the return
> > value of sscanf().
> OK
> > 
> > > +	int ret = 0;
> > > +
> > > +	if (sscanf(buf, "%du", &enable) != 1)
> > > +		return -EINVAL;
> > > +
> > > +	if (enable == EUD_ENABLE_CMD)
> > > +		ret = enable_eud(chip);
> > If ret is !0 you should probably return that, rather than count...
> ok
> > 
> > > +	else if (enable == EUD_DISABLE_CMD)
> > > +		disable_eud(chip);
> > > +	if (!ret)
> > ...and then you don't need this check, or initialize ret to 0 above.
> ok
> > 
> > > +		chip->enable = enable;
> > So if I write 42 to "enable" nothing will change in the hardware, but
> > chip->enable will be 42...
> will change enable struct member to bool?
> > 

The problem I meant was hat if buf is "42", then you will hit the
following code path:

int ret = 0;
sscanf(buf, "%du", &enable);
chip->enable = 42;

As enable isn't 1 or 0, neither conditional path is taken, but you still
store the value in chip->enable.

Changing enable to bool won't change this problem, adding an else and
returning -EINVAL; would.

> > > +	return count;
> > > +}
> > > +
> > > +static DEVICE_ATTR_RW(enable);
[..]
> > > +static int msm_eud_probe(struct platform_device *pdev)
> > > +{
> > > +	struct eud_chip *chip;
> > > +	struct resource *res;
> > > +	int ret;
> > > +
> > > +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> > > +	if (!chip)
> > > +		return -ENOMEM;
> > > +
> > > +	chip->dev = &pdev->dev;
> > > +	platform_set_drvdata(pdev, chip);
> > > +
> > > +	chip->extcon = devm_extcon_dev_allocate(&pdev->dev, eud_extcon_cable);
> > Aren't we moving away from extcon in favor of the usb role switching
> > thing?
> 
> i could see that usb role switch has been implemented for c type connector
> and that connector is modeled as child of usb controller, but EUD is not a
> true connector, it intercepts PHY signals and reroute it to USB controller
> as per EUD Command issued by debug appliaction
> 
> i am not sure if i need to implement EUD DT node as child of usb controller,
> if i do so, as per my understanding EUD driver need to set USB controller
> mode(host or device mode) by calling usb role switch API's, please let me
> know if my understanding is correct?
> 

I don't know how to properly represent this, but I would like the USB
guys to chime in before merging something.

> > 
> > > +	if (IS_ERR(chip->extcon))
> > > +		return PTR_ERR(chip->extcon);
> > > +
[..]
> > > +static const struct of_device_id msm_eud_dt_match[] = {
> > > +	{.compatible = "qcom,msm-eud"},
> > Is this the one and only, past and future, version of the EUD hardware
> > block? Or do we need this compatible to be more specific?
> EUD h/w  IP is Qualcomm IP, As of now this is only hw IP available, if
> future version of EUD IP comes, we can modify and add support then?

You can add additional compatibles, but you can't change this one as
existing devicetree files must continue to function.

If you have a number of platforms that works with this very same
implementation then you could make the binding require a specific
platform and qcom,msm-eud (although qcom,eud should be enough?) and then
keep the implementation as is.

I.e. dt would say:
	compatible = "qcom,sc7180-eud", "qcom,eud";

And driver would match on the latter only, for now.

Regards,
Bjorn
