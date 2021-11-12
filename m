Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAC444EF3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 23:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhKLW2n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 17:28:43 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:41878 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhKLW2n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 17:28:43 -0500
Received: by mail-oi1-f177.google.com with SMTP id u74so20516649oie.8;
        Fri, 12 Nov 2021 14:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BUI8E3oGDjs22+d7sceAxkA5yMwOf8me7szaNl4i0VM=;
        b=lrsUvoiRDTcs1qQz4hPuK/7nkjJ9kqeV2Tn7PECzv7fHwEkf0pLlPzyGBTpHnCrViI
         Rrd1HVd80gTwZlZbfvrbSUBK+vBdC0TrBsx4tjFPXyGcQOTM2LhwQN1K1vJr/qmupnR4
         WkSNbptCUdSWARRf2kk+mlvgNxQt2QikkbfPsXxRIce/d8aZFS1I1dJ1mvJC4GUozttp
         +0vjCJOJ5myulCPwouF9ANnnbeMaztdQ1cbeHExX71iK3oeL7gMwDGi8V+PfX199vCSt
         Lnxjscc0cg2AQ9V5g0XpQbtcA5pkykUdgixZS3GZE78qWnrBbmLom/Quot7KdFAuX11z
         tYJg==
X-Gm-Message-State: AOAM530KVo1bNRDhyUvT67Zm5vtXMdSRuSdprGkDh6JvYcTLYeCY2fWG
        Y4kQTE0FJMiUo5cUq86VXA==
X-Google-Smtp-Source: ABdhPJxHvpEyUFxUp7slNOqDou2ziUNdwzzadmm5jNjgk8lG/GXiuJpxydqlr1R5eGnqzYSVu2/NZQ==
X-Received: by 2002:a05:6808:1509:: with SMTP id u9mr27547849oiw.13.1636755951651;
        Fri, 12 Nov 2021 14:25:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t14sm833688otr.23.2021.11.12.14.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:25:50 -0800 (PST)
Received: (nullmailer pid 3485364 invoked by uid 1000);
        Fri, 12 Nov 2021 22:25:50 -0000
Date:   Fri, 12 Nov 2021 16:25:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
Message-ID: <YY7p7jviA3ZG05gL@robh.at.kernel.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-6-bryan.odonoghue@linaro.org>
 <YYlaqTYhe4hbXhFf@robh.at.kernel.org>
 <60841bf0-f5ea-314f-34c6-822a8812000d@linaro.org>
 <CAL_JsqKtesGfaJ+81jaWzB1kD_qXeehv7hrvXh3x=cpo15Ny-g@mail.gmail.com>
 <4195f05a-e926-246c-5276-ec38750909cb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4195f05a-e926-246c-5276-ec38750909cb@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 08, 2021 at 07:36:27PM +0000, Bryan O'Donoghue wrote:
> On 08/11/2021 19:22, Rob Herring wrote:
> > On Mon, Nov 8, 2021 at 12:58 PM Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> wrote:
> > > 
> > > On 08/11/2021 17:13, Rob Herring wrote:
> > > > Looks like the h/w is all part of a
> > > > PMIC, so it should be part of the PMIC binding and probably merged with
> > > > one of the nodes these phandles point to.
> > > 
> > > Not sure I really follow you here.
> > > 
> > > The existing PMIC dts arch/arm64/boot/dts/qcom/pm8150b.dtsi has:
> > > 
> > > pm8150b_gpios: gpio@c000 {
> > >       compatible = "qcom,pm8150b-gpio";
> > > }
> > > Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> > > 
> > > and
> > > 
> > > pm8150b_adc_tm: adc-tm@3500 {
> > >       compatible = "qcom,spmi-adc-tm5";
> > > };
> > > Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
> > > 
> > > to which I'm adding :
> > > 
> > > pm8150b_typec: typec@1500 {
> > >       compatible = "qcom,pm8150b-typec";
> > > };
> > > 
> > > Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> > > 
> > > pm8150b_pdphy: pdphy@1700 {
> > >       compatible = "qcom,pm8150b-pdphy";
> > > };
> > > 
> > > Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
> > 
> >  From what I gather, there is not a 3rd h/w device this binding
> > describes, but it is just a collection of all the data you happen to
> > want for your driver.
> 
> The TCPM "virtual" driver presents as a device to the TCPM API and then uses
> phandle to talk to the PDPHY and typec devices yes.

That's nice, but it doesn't belong in DT.

>  That's assuming a specific structure for a
> > specific OS. Why can't most of this binding be part of
> > "qcom,pm8150b-typec" instead of making up some virtual device?
> 
> I thought it was a better model to have the TCPM be a separate device with
> the pdphy and typec blocks as their own devices.
> 
> #1 Because the address space spans over more than just the pdphy and typec
> device, there's a charger block in between
>
> #2 Because the pdphy and typec have separate IRQ lines and register spaces

I didn't say combine them. That would be once again structuring your h/w 
description to match your driver architecture. Bind your driver to 
"qcom,pm8150b-typec" and then it can retrieve the "qcom,pm8150b-pdphy" 
node which doesn't have a driver. There's no rule that nodes and drivers 
are 1:1, or that a driver can't access DT data in another node.

Your other option is instantiate your own device from the virtual 
driver's initcall based on presence of the 2 nodes above. 

Rob
