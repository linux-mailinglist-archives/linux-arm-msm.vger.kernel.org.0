Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35BB026120E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 15:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729341AbgIHNg0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 09:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729700AbgIHLMp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 07:12:45 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0AEC061796
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 04:12:43 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id m8so4513534pgi.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 04:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SB4HWwyn4bEMyk50Az/5LJqEfzNq85tWE+ULvNub66o=;
        b=QCc21V4RGFZdHlCs8P/JGBESBWGf/qHlsYRngd1C3YHK5KoK7OQm/lnV+12PGiSW3X
         AkSWCPXmzHmgZfCxXA5OmX2OemXmY0uc5KnhGTqLx9DbnqZWwfpb+3wuqyAbN3zsEhCt
         oNiUaD8U/61t8r/7eOmgZr/vm/SCEd56nupJb5kIc9rz6/8ZtWRluTYH18Nbq5Pno8+v
         5uDEbqfzJ7wtVKP3cb0rrqh3+Za4NRfPxSwm/sT4RcIl3rdC+aH/LwKksOpilG7d4amt
         I0gw5uqOCglSw4UZGgYieTHZ7AFU+wFLCm+2/kAv/BzWo9ayDEGKNx4b6206pA/sZwMd
         B2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SB4HWwyn4bEMyk50Az/5LJqEfzNq85tWE+ULvNub66o=;
        b=Y8lhuLmIgfYX8nskQvvQBScpl2hg+fD9J8kL08Zik2fboVl3bOCRADleSIXIiJg1gT
         l4V4yadoXOpNwTH2RvXP5ah21AraSthO+HdkHS9oe1d5gRGTQaQbNQ+l1lLUcvudpQRM
         F7w0JDhIxF49YXG2/C2jXZgxWz+Sku04I2MnR+RJTYy2ZUm/ZGNOgL1B6m1E7wvrkoR5
         t9Z/NsxNaMtJ6uLqnoFqvItf5iuEutt2hh8jt6B6AxoERIRtcQOTwJrMIX1O7TZW2OMq
         l+0+tbxMqm6ZIM9GVfX4t8EHIcyBhnbqfST7jfI2BhxxwaX3VK6PBabk4cP35zkCFpp3
         5F7Q==
X-Gm-Message-State: AOAM53316hsepDgrQH0w+dr+wbXdPZfuENO0tYH5pUeEM7XSGuFd8eby
        pGsrg2Fke86UOWieWXN3JkIZ
X-Google-Smtp-Source: ABdhPJwxZc56N6HdT085RcBdz8AaKL3gzAbetUnDz3ziVZ3GFusju8sGUxiVP/2hMaRkuqODP3g1BQ==
X-Received: by 2002:a05:6a00:15c1:b029:13e:d13d:a0ff with SMTP id o1-20020a056a0015c1b029013ed13da0ffmr617086pfu.27.1599563562549;
        Tue, 08 Sep 2020 04:12:42 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id i1sm18258748pfk.21.2020.09.08.04.12.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 04:12:41 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:42:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     rjw@rjwysocki.net, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, amitk@kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, tdas@codeaurora.org
Subject: Re: [PATCH 7/7] cpufreq: qcom-hw: Use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20200908111234.GC23095@mani>
References: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
 <20200908075716.30357-8-manivannan.sadhasivam@linaro.org>
 <20200908103625.swla4uoxxb3hj2w2@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908103625.swla4uoxxb3hj2w2@vireshk-i7>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 0908, Viresh Kumar wrote:
> On 08-09-20, 13:27, Manivannan Sadhasivam wrote:
> > devm_platform_ioremap_resource() is the combination of
> > platform_get_resource() and devm_ioremap_resource(). Hence, use it to
> > simplify the code a bit.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/cpufreq/qcom-cpufreq-hw.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> > index c3c397cc3dc6..6eeeb2bd4dfa 100644
> > --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> > +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> > @@ -307,7 +307,6 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
> >  	struct of_phandle_args args;
> >  	struct device_node *cpu_np;
> >  	struct device *cpu_dev;
> > -	struct resource *res;
> >  	void __iomem *base;
> >  	struct qcom_cpufreq_data *data;
> >  	const struct of_device_id *match;
> > @@ -333,13 +332,9 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
> >  
> >  	index = args.args[0];
> >  
> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
> > -	if (!res)
> > -		return -ENODEV;
> > -
> > -	base = devm_ioremap(dev, res->start, resource_size(res));
> > -	if (!base)
> > -		return -ENOMEM;
> > +	base = devm_platform_ioremap_resource(pdev, index);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> >  
> >  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> >  	if (!data) {
> 
> Keep such patches at the top, so they could be independently applied.
> 

Okay.

Thanks,
Mani

> -- 
> viresh
