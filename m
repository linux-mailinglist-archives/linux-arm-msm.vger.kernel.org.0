Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E21C998B20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 08:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731569AbfHVGB6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 02:01:58 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40366 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730873AbfHVGB5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 02:01:57 -0400
Received: by mail-pf1-f196.google.com with SMTP id w16so3166633pfn.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2019 23:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IGOK/aeV6wllM58ymB1HOVxByK2+4raXwd9FqZiG31g=;
        b=A6wBWaxdm4l0kPg3WfejXZYMtZSZkafevVrK68W4QcP39sJ+oJ3ScykX9C6MMenFI9
         AAGksjnnQmDD8Sm6eTz9jIrMjeqN02yrRa4m7Nb6In1ryQa3OGETXk1XMXgbjYuEgmRt
         Fd6rjqCxGNiBqSxHFhVFX+xzxUM2yhpqsVsqi1weXRzFmZv5RN6JBCSuQ6UR77OnGdQ0
         SkSwPHRHVM1Gob6a18uzwN1D4MTA05jQ8aNqUShPb3SVBm25EgljzfSrE84Atp07O3jv
         lBaTY1FCIcOfOji/B2qAxZjw6zDg5mNcxEnu+YIeVbDNZRJYJ0wcsKCxQVvrtaZyQ39C
         pxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IGOK/aeV6wllM58ymB1HOVxByK2+4raXwd9FqZiG31g=;
        b=mQldKNeZZpfH1VdNJpJ7I/jEO1ozTP09K+CVFFHO20jk37uoTZv9jS3en56jHygnJ2
         ShiHRaZx1NOks3APs33XSb8dSIrlLY8sKwajTMoe4W6WJApUscRZ42KhmU8RIJ8N60dH
         dQvX9DmITe/EPEF2iFiXhDUGe78l+LyFvUXm79FwbAsV3TfGp6tgBLtRZUERLB7Y5eTA
         zhGupEzQb7yHoPq8gg1CIsnRz9Xr1oKSbY8E/8M3R9H19OWuHo0OITc+1h3FohsN37B4
         ucq8txkCI69zIF6v1bJgxsJ+7fwrUKyqk5UOMud0s0Fqnf3TQgRQi6/tobl3KwV9xbH0
         D3hQ==
X-Gm-Message-State: APjAAAUYFHtaGosXoaxaIdehm3xITcqK952xSfs3vE2gcgxDDcjKJoSh
        Z2nGke/iHfg61EOM1J2L/JbZaQ==
X-Google-Smtp-Source: APXvYqxv4NVeiFvjfAZaGPzviWL08bYWazxBVM3wDB/0/GBKJdrmVajkKdL44cHCfgPLd9Kxn9tb6A==
X-Received: by 2002:a63:6901:: with SMTP id e1mr31280923pgc.390.1566453716840;
        Wed, 21 Aug 2019 23:01:56 -0700 (PDT)
Received: from localhost ([122.172.76.219])
        by smtp.gmail.com with ESMTPSA id q10sm31712808pfl.8.2019.08.21.23.01.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Aug 2019 23:01:55 -0700 (PDT)
Date:   Thu, 22 Aug 2019 11:31:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     YueHaibing <yuehaibing@huawei.com>, agross@kernel.org,
        rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH -next] cpufreq: qcom-hw: remove set but not used variable
 'prev_cc'
Message-ID: <20190822060153.gasv4okmeuvbtmbi@vireshk-i7>
References: <20190821121445.72588-1-yuehaibing@huawei.com>
 <20190822024051.eubzzxh3b2ip2gzv@vireshk-i7>
 <6c485d00652f873b98664ff211e496cd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c485d00652f873b98664ff211e496cd@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-08-19, 10:25, Sibi Sankar wrote:
> @YueHaibing thanks for the patch.
> 
> On 2019-08-22 08:10, Viresh Kumar wrote:
> > On 21-08-19, 20:14, YueHaibing wrote:
> > > drivers/cpufreq/qcom-cpufreq-hw.c: In function
> > > qcom_cpufreq_hw_read_lut:
> > > drivers/cpufreq/qcom-cpufreq-hw.c:89:38: warning:
> > >  variable prev_cc set but not used [-Wunused-but-set-variable]
> > > 
> > > It is not used since commit 3003e75a5045 ("cpufreq:
> > > qcom-hw: Update logic to detect turbo frequency")
> > > 
> > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > > ---
> > >  drivers/cpufreq/qcom-cpufreq-hw.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c
> > > b/drivers/cpufreq/qcom-cpufreq-hw.c
> > > index 3eea197..a9ae2f8 100644
> > > --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> > > +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> > > @@ -86,7 +86,7 @@ static int qcom_cpufreq_hw_read_lut(struct device
> > > *cpu_dev,
> > >  				    struct cpufreq_policy *policy,
> > >  				    void __iomem *base)
> > >  {
> > > -	u32 data, src, lval, i, core_count, prev_cc = 0, prev_freq = 0,
> > > freq;
> > > +	u32 data, src, lval, i, core_count, prev_freq = 0, freq;
> > >  	u32 volt;
> > >  	struct cpufreq_frequency_table	*table;
> > > 
> > > @@ -139,7 +139,6 @@ static int qcom_cpufreq_hw_read_lut(struct
> > > device *cpu_dev,
> > >  			break;
> > >  		}
> > > 
> > > -		prev_cc = core_count;
> > >  		prev_freq = freq;
> > >  	}
> > 
> > @Sibi, you fine with this change ? I will merge it with the original
> > patch then.
> 
> yes the changes seem fine, I missed
> removing prev_cc.

Thanks. Merged into the original patch itself.

-- 
viresh
