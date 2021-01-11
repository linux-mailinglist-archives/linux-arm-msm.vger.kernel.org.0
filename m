Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5572F1E49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 19:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390491AbhAKSwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 13:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390481AbhAKSwU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 13:52:20 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5EFC06179F
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 10:51:40 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id r9so646917otk.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 10:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KVj6BnsPKy8SIQbULpp08lDUGf3xvM9pSNxXwuEntqU=;
        b=DSRYzE6gg2fWi8taP0AAwnHeXUX6VhBeyaw1JlTmLumDHIAXhg12uBb4eQ6C5daeIa
         GEEgAYkALwnVO1Sn7hVautHZ/TO5oVk5GfWQdkFj2Wdkv5o3NFhwJcniA7xj73wJOzup
         pe9WQWoC0DM6jqJrxM/wRhhs8gNCqKpky2chUE13TcoTLylJijKjiNmtehZ02WXnFT9F
         kNJzcTzhOCNwR+jLTe+wXRoCdaiUvTzaStOUdoUiZgyXwZACGyplD2u8qbjjxe9Q0e+Y
         +F2GtWnVJe6XWpdI44wEoRoxbpIr4nhRDoIo+paIxmnVmg1zBIXd8wJa5s6N8miS1Sfq
         EzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KVj6BnsPKy8SIQbULpp08lDUGf3xvM9pSNxXwuEntqU=;
        b=Uz488hSgbCIITMP4b9tYv5cCSHuLUSfSViaondMkgNl4uT8ffxZMbRZ2hpvZFWaK9Y
         V2qi1w4oXZgJrPwoSdF/DWjgF6tly0mow1/GgLj/LYfQDj75IIXrSUhjrDbwBXy7JfWk
         jteQincqzFiai5NMTI7rl+a7gW7n/X7CPj4GFeDAS5Z30Gxe33SvKtmaER1NLFgEB/kQ
         SVLftQYGeZH2Son1/4sBwbYmzrC1xR5CwT6xzOCp2cgFuq50pPRjVeLdX0e5JYaoy8YM
         tMfiNf8DKfs0/5qWyVxXk2SI9rvD87dCC9TQ6T8d04dqNBSsiPLTNmGmjZ047WZBVHoQ
         KQeQ==
X-Gm-Message-State: AOAM530NTJMxWDOOGC0/W//MduVo7qfy9RwoSEO58f+pBgpURkdpTaIR
        iOsipyxw6T/GDjU068rz3Vda+w==
X-Google-Smtp-Source: ABdhPJyrDydloeIe9rSHIcI2/i7IlBIQCuS+Qo3pA5HAo2Ec/TC8ivXka89YkCeNxz9whh/82LnTFw==
X-Received: by 2002:a9d:7419:: with SMTP id n25mr404582otk.280.1610391099557;
        Mon, 11 Jan 2021 10:51:39 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p18sm64347ood.48.2021.01.11.10.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 10:51:38 -0800 (PST)
Date:   Mon, 11 Jan 2021 12:51:37 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] soc: qcom: geni: move struct geni_wrapper to header
Message-ID: <X/yeOZoML/yhlg4T@builder.lan>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-3-vkoul@kernel.org>
 <X/xwHeRAs4Cl/efj@builder.lan>
 <20210111174342.GB2771@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111174342.GB2771@vkoul-mobl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 Jan 11:43 CST 2021, Vinod Koul wrote:

> On 11-01-21, 09:34, Bjorn Andersson wrote:
> > On Mon 11 Jan 09:16 CST 2021, Vinod Koul wrote:
> > 
> > > I2C geni driver needs to access struct geni_wrapper, so move it to
> > > header.
> > > 
> > 
> > Please tell me more!
> > 
> > Glanced through the other patches and the only user I can find it in
> > patch 5 where you use this to get the struct device * of the wrapper.
> 
> That is correct. The dma mapping needs to be done with SE device.
> 
> > At least in the DT case this would be [SE]->dev->parent, perhaps we
> > can't rely on this due to ACPI?
> 
> I would have missed that then, but I somehow recall trying that.. Though
> I have not looked into ACPI..
> 
> Given that we would need to worry about ACPI, do you recommend using
> parent or keeping this
> 

We get the wrapper by the means of dev_drv_getdata(dev->parent),
so afaict we need to figure out how to get hold of the wrapper for ACPI
to work either way.

We then need to lug around the wrapper's device for your uses and
exposing the wrapper struct solves this for us. So I'm okay with your
proposal.

Regards,
Bjorn
