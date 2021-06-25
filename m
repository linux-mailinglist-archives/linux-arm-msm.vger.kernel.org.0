Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDE43B39E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 02:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbhFYAFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 20:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbhFYAFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 20:05:08 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4756BC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 17:02:48 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso7477579oto.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 17:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bF01hBVUbua6rxe/NO/VbUhjq8aqFR4Q3DHqf+MoijU=;
        b=xBdo4W1x6y65z8YFSmxubuT+E3psR48/xCimbLK7uDOLU3KHBBLzWH5xaavRSecJZd
         R/j9KGTjC8GNNcgvuzVPiSCfotO776mQPgJgtjapj184dy0pDrugPgn1izFcJbzlZppZ
         dA14h0IusDnBpW3C6sJD9ZdXy3QBC+Nme8GVfB+Ov/LOAUAXMRMMQGyUaewouK5JgQJP
         Wpy8isLvNL0GaAdBm2KbgHM6qtO5Glp8T+k+WuEmiRi7NNYG4B3BfIwN77GzSI/NXAsl
         dPTzFA+P0T6mxIW/ZsRkgtMAfz9qw0XDRTww/w9af1sXbJO27WEQBc/mnEytrO76kD28
         s6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bF01hBVUbua6rxe/NO/VbUhjq8aqFR4Q3DHqf+MoijU=;
        b=ODy5NJFOvU2//l3LrZDIOq8sWeYLsRiDmlIkdxWAB/3y9cqPfy8/JlzCDAVQFX4NQb
         E2Y6euTrX0aTr4xSzSBNk8O+ubS1xEcIV5NwDLol8arQDBuC5d4ksAkoMF6RDklJde11
         Etr2zn1GzV9Z08Ndrzw7hanZ6kvVIvjyoKDtabC2irKGis1mYaQlA3di1O+GX3c9Y7ol
         TeBLQ1hJiz152Fmnp3yUrASMzlOyu2Rru8LfAlLB4Ik9iBEHEO34nXmrm4O7l7qvMAQt
         x5+UrIpWTW+WQKDzZNGeEDDcW5+KSu/XzPa9hevBvVVCYtAJLYCcuZnOXFkrsfgssxQx
         rg5Q==
X-Gm-Message-State: AOAM532DVeBqjD/js1D8ejSmhnqqCSVM3AMptTcywX2k4JxCtoSi9RRB
        QLsOqMak1/NFoV7Vb7xwRdx6mw==
X-Google-Smtp-Source: ABdhPJw4ScjEMbY6bXVtDZoUUUZod40SM3yRKVyull+VqTCNZWVHQPfWNBtQi2KKd49EoWSsJ4cQxA==
X-Received: by 2002:a05:6830:88:: with SMTP id a8mr7197095oto.14.1624579367592;
        Thu, 24 Jun 2021 17:02:47 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f12sm1011320ooh.38.2021.06.24.17.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:02:47 -0700 (PDT)
Date:   Thu, 24 Jun 2021 19:02:44 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
Message-ID: <YNUdJC1y8lWHg114@yoga>
References: <CABb+yY0sdSinTm788pMFrqEZ6QMC2OwCP7Kkto+pG9h1aGMzwQ@mail.gmail.com>
 <CAL_JsqKdoMwpL_tYC7VQRAG2AC5nR4diShMQCgDseObcgU+egQ@mail.gmail.com>
 <YNEiUMBqGAx1zLVX@yoga>
 <CABb+yY2wy4iSKjn+SihQ=FE=YwcEzUNOpGw_CV22Anzgbba8hA@mail.gmail.com>
 <YNFKpvhXyZbs8RE1@yoga>
 <CABb+yY3RpQYvNBHvpwZearpBPph0uj8YQwX2qu=TX=QAO6OFBw@mail.gmail.com>
 <YNFegmmCzk6JUTN+@yoga>
 <9aae3092-2e2b-9261-f4e7-864b873eb2d4@somainline.org>
 <YNT0HPOJEoJYipyE@yoga>
 <b0ed9294-e4e1-3185-d81f-63e6e8d45692@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0ed9294-e4e1-3185-d81f-63e6e8d45692@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 24 Jun 17:59 CDT 2021, AngeloGioacchino Del Regno wrote:

> Il 24/06/21 23:07, Bjorn Andersson ha scritto:
> > On Tue 22 Jun 09:36 CDT 2021, AngeloGioacchino Del Regno wrote:
[..]
> > > Hello Jassi, Bjorn
> > > 
> > > I've read the entire thread and I can't say that Jassi is entirely wrong
> > > but I also agree with Bjorn on this matter.
> > > 
> > > This driver is here to "simply" manage the register offset in the APCS
> > > IP, which is a pretty straightforward operation.
> > > If you check in this driver, you will see that there's not much
> > > duplication between the various qcom_apcs_ipc_data that we have for
> > > all the different SoCs.
> > > 
> > > Checking further, we can effectively reduce the amount of compatibles
> > > in this driver by simply removing some "duplicated" instances and in
> > > particular:
> > > ipq6018, ipq8074, msm8916, msm8994, msm8998, sdm660
> > > 
> > > and eventually replacing them with either of:
> > > - 8bits_apcs_data    qcom,apcs-apps-global-8bit
> > >                       qcom,apcs-kpss-global-8bit
> > 
> > I don't like those compatibles, simply because the binding is supposed
> > to describe the hardware block, not the fact that Linux _currently_ only
> > pokes this one register.
> > 
> 
> Since you've immediately misunderstood my naming, yeah, that wouldn't be
> the best thing to use as a compatible.
> 

Sorry, that was certainly not my intention.

> > We could probably "qcom,apss-global" as a catch-all for at least sc7180,
> > sc7280, sdm845, sm8150, sm8250 and sm8350.
> > 
> 
> Doesn't look like a bad idea, but if we want to *enforce* writing also
> the platform-specific compatible, I can see patch series going back
> and forth and getting refused because this will not be really understood
> by everyone, I think.
> In this case, if writing the platform compatible is something mandatory,
> the only way to really make sure to avoid losing time with reviews like
> "[...] here you have to write also the platform compatible", is to just
> keep the thing as it is.
> 

My understanding from the DT maintainers is that the dts would be
checked by the schema, but I suspect that you're right in that we might
have some back and forth on the DT binding, but I don't think that's a
big deal.

> > But look at 8996 and 8998, both named "something-hmss-something", with
> > different register layout. And a quick glance seems to indicate that
> > sdm660 isn't a hmss after all :/
> > 
> 
> Starting from the fact that I don't clearly remember what-when-why of
> my research done more than one year ago, I do remember that conclusion
> was that, in this regard, SDM630/660 were "mostly the same" as MSM8998.
> In any case, this is something that, at this point, is better get
> verified, maybe.
> 

Yeah, I presume that someone with the documentation would need to go
through each one of these and see what kind of grouping there might be.

And I also presume that there might be cases where the CPU clocks has
moved into the secure world, so that even though the hardware block is
the same the presence of a in-kernel clock driver in the implementation
might differ.


But just to clarify, I find it annoying having to sprinkle compatibles
all over the place every time I try to get a new board up. So I am not
against us trying to figure this out.

Regards,
Bjorn
