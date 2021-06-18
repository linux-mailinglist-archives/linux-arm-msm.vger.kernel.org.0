Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB4A3AD18E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234676AbhFRR45 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbhFRR45 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:56:57 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B577C061767
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:54:47 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id l12so11389133oig.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5oh/1ZLh42AYk2P4TsRS4SjWxZLplR+HO5fqto1uLzs=;
        b=zHVb98aPddS/STxZ6A48pGMwaFX7GNVnhmQQieYPTVopIRZPwNSKg30zJzPPTiL2EY
         X8fPZeJGbTAc3XL1M96Xvj4dj6MSAX0vKqWxSTKPOKc46euCjRORfE1do23Bl9f0VGWJ
         4cSe6U1ayyZXa17XSNgBadGkL+QxsC0k4CZ2r829fvr4kPCRmKzwBNosGpbZfo8ubQLK
         ffWiKdwM3751PBAtsy0YlXwHc0KQtPgT2YmJffiMgpL4uM8kI6v+9gE6TX6HrPsb/89W
         0CkGkkjFoG0DgKvvXckIwNjcTSN50aXk1GK5Rj56DbpQP0Tv0Z/KcvFJou6eAFd4UwqG
         DUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5oh/1ZLh42AYk2P4TsRS4SjWxZLplR+HO5fqto1uLzs=;
        b=dE0ljJcQU35v7vHDArXpESMPtex4+4HymHQm/SZqWIC/eQehoM+9/51yfQoHVE/9zr
         IYFU4RM6Fo6cCeNyM+CLiQj7qORj1UiUCOJzM90ILciuiDjAbl+VAJAO279nS3DWYPs7
         0c2F1td5mJZDaX3DvSS9pnH94kPBWhqbNm0HjG2si2rpwNPPYLpApR/PSQ4n/MOnlPvs
         9vXybmnZ7LME6k75LR/l6KNq5roM+tXzxh29dwPPqg/2dLC8WsLs/cfyCu4e+LGAL2C7
         z59jimryjaE4doAUbzIGEf+DJqzPq2ZzCpVg2NFA5ORrLhnA1JI73XilzKH/43x+3tq3
         OWHQ==
X-Gm-Message-State: AOAM53250fdwfMhmEl/Aog8doAVhNEjlr+AmOy02Izg5jBXc9GeMIAz+
        uNAlDB//LRsBILoOayI9kWAx5Lr0BY5jpg==
X-Google-Smtp-Source: ABdhPJzuySRyk/ihyzd1bxyZ7kih5vVebf3rT8wObyqtHflCwKFYj5FH6LRegSCxUP5SMimmF5Odsw==
X-Received: by 2002:aca:b682:: with SMTP id g124mr8107800oif.138.1624038886344;
        Fri, 18 Jun 2021 10:54:46 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z5sm2168454oth.6.2021.06.18.10.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 10:54:45 -0700 (PDT)
Date:   Fri, 18 Jun 2021 12:54:44 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
        viresh.kumar@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] thermal: qcom: Add support for LMh driver
Message-ID: <YMzd5OEhG4PYYv+E@builder.lan>
References: <20210608222926.2707768-1-thara.gopinath@linaro.org>
 <20210608222926.2707768-3-thara.gopinath@linaro.org>
 <YMfBtSap7fR3rdku@builder.lan>
 <4996de55-daa9-18a4-3c03-cf194d85500e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4996de55-daa9-18a4-3c03-cf194d85500e@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Jun 20:38 CDT 2021, Thara Gopinath wrote:
> On 6/14/21 4:53 PM, Bjorn Andersson wrote:
> > On Tue 08 Jun 17:29 CDT 2021, Thara Gopinath wrote:
> > > diff --git a/drivers/thermal/qcom/Makefile b/drivers/thermal/qcom/Makefile
[..]
> > > +static irqreturn_t lmh_handle_irq(int hw_irq, void *data)
> > > +{
> > > +	struct lmh_hw_data *lmh_data = data;
> > > +	int irq = irq_find_mapping(lmh_data->domain, 0);
> > > +
> > > +	/*
> > > +	 * Disable interrupt and call the cpufreq driver to handle the interrupt
> > > +	 * cpufreq will enable the interrupt once finished processing.
> > > +	 */
> > > +	disable_irq_nosync(lmh_data->irq);
> > 
> > The contract between this driver's disabling of the IRQ and the
> > cpufreq-hw driver's enabling it when we're done polling does worry me.
> > 
> > In the case of EPSS, don't we disable the interrupt during the polling
> > there as well? If that's the case wouldn't it be better to implement
> > irq_chip->irq_disable and have the cpufreq-hw driver do the disable in
> > both cases?
> 
> Yes. You are right. In case of EPSS, the cpufreq-hw will have to disable the
> interrupt. I did think of the approach you suggested here. My only issue is
> that we will dispatch the interrupt to cpufreq-hw without it disabling it
> and hence the interrupt could fire again, right ?
> 

Does it fire again before you INTR_CLK it?

Regards,
Bjorn
