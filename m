Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 908E3452A00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 06:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236275AbhKPFtQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 00:49:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236228AbhKPFsi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 00:48:38 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C211EC04E202
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 19:59:39 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id cq22-20020a17090af99600b001a9550a17a5so1058924pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 19:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OD3I3LT4cd/NlKPjbaF84wzyVeqal/CYdheaDHtLVBQ=;
        b=D9MB2cD5ZTkPvVciUtxG5JCdjR2f3TJaJMYV4Psbq6km1huVNqG90Z9WsVwtBhdtF1
         pRMI2ngvEhfcNAykf2cSbWFTiawhSocFdkW7PyhJ0fujnACiPPsLtxnPDzVbQVmH9fZb
         0ZCztGz76Gw8tS/4WQKcVnoG0VuQzoynuTlu2yKYzl3Z/xmf+kYDGDrhE+JZSnwwnQtg
         RPJpIg9qUBdSsRlhxVEWhxVUi3VxECVoDYQHrmITOfoOm0hSUXirR4CbluK9+hFau0uh
         c6ohN0DXxkW5yF2ysEYfuofWIaV8ZKHFx2SXBaVjXJyGG/RwVdmm6PW26nKgsAlDzAFF
         FMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OD3I3LT4cd/NlKPjbaF84wzyVeqal/CYdheaDHtLVBQ=;
        b=DsEnXVT1JDgcxNHdjYVW3TgsoEVTW0DEmwHiMOCnGBbowXZfjAuyHz4goASmWG/erb
         HH1pagIt0NLv4oORW1ViycCB8ZucfMXSIrwBApYeMlq500ARVmCVmnY+dRjtEwl3+gC6
         2a/hTb221qQGDJ8ieoN5eJtickEbztRZ3344Z495PzYzzIrBq5Twc8+Tq5YXB9pVBN+T
         91hD7vk4KtMlw0jrX2ESy5rAHAbPVt0W6k4mXe5t/yyDxkImvUdDlo5OGQcqpcOQUx6T
         RyAu7qMBJJmsQjovfB9QzzB1glB208PqUelWa1sCOaIjR8a7fPAZigzoV9fVE4tlBRUf
         MZWQ==
X-Gm-Message-State: AOAM533LJCxLaAtOFb+sPY6U02geuLOgp2A96x0sk0WoYbaxfzpb+pH1
        HxBWuWwHoi+hIgWlabIOKgEPgw==
X-Google-Smtp-Source: ABdhPJzxtLF3JUXA2rr0FEnL3UDohuQb6rtrfCfIfhUdDORN4CRvGDf9QXb8ooZiRKQLCrfECHUN/g==
X-Received: by 2002:a17:90a:3045:: with SMTP id q5mr4961611pjl.58.1637035178534;
        Mon, 15 Nov 2021 19:59:38 -0800 (PST)
Received: from localhost ([223.226.77.81])
        by smtp.gmail.com with ESMTPSA id n13sm16560345pfj.188.2021.11.15.19.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 19:59:37 -0800 (PST)
Date:   Tue, 16 Nov 2021 09:29:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Thara Gopinath <thara.gopinath@linaro.org>, rafael@kernel.org,
        bjorn.andersson@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: freq_table: Initialize cpuinfo.max_freq to
 correct max frequency.
Message-ID: <20211116035935.wmazontuznhys6qu@vireshk-i7>
References: <20211115195011.52999-1-thara.gopinath@linaro.org>
 <5ae2c644-4743-c62c-b17c-96945a0e6a01@kali.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ae2c644-4743-c62c-b17c-96945a0e6a01@kali.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-11-21, 19:23, Steev Klimaszewski wrote:
> Hi Thara,
> 
> On 11/15/21 1:50 PM, Thara Gopinath wrote:
> > cpuinfo.max_freq reflects the maximum supported frequency of cpus in a
> > cpufreq policy. When cpus support boost frequency and if boost is disabled
> > during boot up (which is the default), cpuinfo.max_freq does not reflect
> > boost frequency as the maximum supported frequency till boost is explicitly
> > enabled via sysfs interface later. This also means that policy reports two
> > different cpuinfo.max_freq before and after turning on boost.  Fix this by
> > separating out setting of policy->max and cpuinfo.max_freq in
> > cpufreq_frequency_table_cpuinfo.
> > 
> > e.g. of the problem. Qualcomm sdm845 supports boost frequency for gold
> > cluster (cpus 4-7). After boot up (boost disabled),
> > 
> > 1.  cat /sys/devices/system/cpu/cpufreq/policy4/cpuinfo_max_freq 2649600
> > <- This is wrong because boost frequency is
> > 
> > 2.  echo 1 > /sys/devices/system/cpu/cpufreq/boost  <- Enable boost cat
> > /sys/devices/system/cpu/cpufreq/policy4/cpuinfo_max_freq 2803200	<-
> > max freq reflects boost freq.
> > 
> > 3.  echo 0 > /sys/devices/system/cpu/cpufreq/boost <- Disable boost cat
> > /sys/devices/system/cpu/cpufreq/policy4/cpuinfo_max_freq 2803200	<-
> > Discrepancy with step 1 as in both cases boost is disabled.
> > 
> > Note that the other way to fix this is to set cpuinfo.max_freq in Soc
> > cpufreq driver during initialization. Fixing it in
> > cpufreq_frequency_table_cpuinfo seems more generic solution
> > 
> > Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> > ---
> >   drivers/cpufreq/freq_table.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
> > index 67e56cf638ef..6784f94124df 100644
> > --- a/drivers/cpufreq/freq_table.c
> > +++ b/drivers/cpufreq/freq_table.c
> > @@ -35,11 +35,15 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy,
> >   	struct cpufreq_frequency_table *pos;
> >   	unsigned int min_freq = ~0;
> >   	unsigned int max_freq = 0;
> > +	unsigned int cpuinfo_max_freq = 0;
> >   	unsigned int freq;
> >   	cpufreq_for_each_valid_entry(pos, table) {
> >   		freq = pos->frequency;
> > +		if (freq > cpuinfo_max_freq)
> > +			cpuinfo_max_freq = freq;
> > +
> >   		if (!cpufreq_boost_enabled()
> >   		    && (pos->flags & CPUFREQ_BOOST_FREQ))
> >   			continue;
> > @@ -57,8 +61,8 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy,
> >   	 * If the driver has set its own cpuinfo.max_freq above max_freq, leave
> >   	 * it as is.
> >   	 */
> > -	if (policy->cpuinfo.max_freq < max_freq)
> > -		policy->max = policy->cpuinfo.max_freq = max_freq;
> > +	if (policy->cpuinfo.max_freq < cpuinfo_max_freq)
> > +		policy->cpuinfo.max_freq = cpuinfo_max_freq;

You need to keep the check of policy->max here and update policy->max,
else you will never run at boost freq. I think this is what Steev
reported as well ?

So basically something like this:

	if (policy->max < max_freq)
		policy->max = max_freq;

	if (policy->cpuinfo.max_freq < cpuinfo_max_freq)
		policy->cpuinfo.max_freq = cpuinfo_max_freq;

-- 
viresh
