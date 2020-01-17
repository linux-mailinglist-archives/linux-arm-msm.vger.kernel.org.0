Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949A714086E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 11:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgAQKyo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jan 2020 05:54:44 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44466 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgAQKyo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jan 2020 05:54:44 -0500
Received: by mail-wr1-f66.google.com with SMTP id q10so22236765wrm.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2020 02:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZIor9gKMoZIiatH4TckXR6kw5rMM1XpWfkSuSCSgKXE=;
        b=OWTd1xPAQY9tXJXOZoWIjFDzF/j5k4C12aIyvlJSkkdhXlVbD45jelTm6GVI3uVYL7
         n9xkBrIBsIRyofHDfGxI/l2E5DARRbN+kNYjfXDlt0D2NMz3tS9otMH27qG8unAMXkVK
         vbv+o0soDwEv+wngnnE6P2hSuYjaWEszgXFVB2E8sY/8BNNmwio0HXgTBeM5ojO90Xqz
         eXsC84eVsPLNozUlGBGgx1RDyImJeajA48zW6/mFqj9bm+S8xvtQCF24bQIklM7kmSQd
         UX9n+G82Jt0cw5vAEM+XOAz116BMbTc1FuSDri3NMDqzY9VqQE8QDk2hGTzsWxJxyW1O
         /sRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZIor9gKMoZIiatH4TckXR6kw5rMM1XpWfkSuSCSgKXE=;
        b=rCH3Bz79o6IdqE9ITSz9JPFjkaX/6nWS5/YtkPEoYTkTH6VAU3I6EmVfuEFXwT+NGC
         wsD+q8/4a4GQLQH48DOgHzZcUD4miN4OShy8JZ0QGEdNG3QuAgtfl2Kci6OdLT88NoDc
         2052i7l2veo7aTRWkx79mniXlQ6lFPd2IKI+ux8AqE6AD3beAr/8Tw5FAVedwS6g3St5
         CHTCjgypO0nJE+FUlGRP8TTAqPkvrKQdO0cghazygEh/f9LlRVvM8pcU00nsFyzr0I3X
         6Ef6zyoV81y1BHv+NDKJUJaMklmFoz0TBdZaozMcjb86v+P55RuacZCwWfMbtUBYBIOA
         L6Fg==
X-Gm-Message-State: APjAAAUqhgbLZZsjjBT5fAtvlEkPLaaQsv2MVeO4JHa4r78EHTWSgSea
        XKFcXP+W0HYDQMeFtBLm2bFzWQ==
X-Google-Smtp-Source: APXvYqxFsuT0KTxqOuP7M5Z4+OnjHn0WdKusB9YxUQXSRSUEjOMXSk8sV+Vlqk3Ea2XuYbdpzPevfg==
X-Received: by 2002:a05:6000:1288:: with SMTP id f8mr2534273wrx.66.1579258481679;
        Fri, 17 Jan 2020 02:54:41 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id b17sm33252857wrp.49.2020.01.17.02.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 02:54:40 -0800 (PST)
Date:   Fri, 17 Jan 2020 10:54:37 +0000
From:   Quentin Perret <qperret@google.com>
To:     lukasz.luba@arm.com
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Morten.Rasmussen@arm.com,
        Dietmar.Eggemann@arm.com, Chris.Redpath@arm.com,
        ionela.voinescu@arm.com, javi.merino@arm.com,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com, rjw@rjwysocki.net,
        sudeep.holla@arm.com, viresh.kumar@linaro.org, nm@ti.com,
        sboyd@kernel.org, rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, kernel-team@android.com
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
Message-ID: <20200117105437.GA211774@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116152032.11301-2-lukasz.luba@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Lukasz,

Still reading through this, but with small changes, this looks pretty
good to me.

On Thursday 16 Jan 2020 at 15:20:29 (+0000), lukasz.luba@arm.com wrote:
> +int em_register_perf_domain(struct device *dev, unsigned int nr_states,
> +			struct em_data_callback *cb)
>  {
>  	unsigned long cap, prev_cap = 0;
>  	struct em_perf_domain *pd;
> -	int cpu, ret = 0;
> +	struct em_device *em_dev;
> +	cpumask_t *span = NULL;
> +	int cpu, ret;
>  
> -	if (!span || !nr_states || !cb)
> +	if (!dev || !nr_states || !cb || !cb->active_power)

Nit: you check !cb->active_power in em_create_pd() too I think, so only
one of the two is needed.

>  		return -EINVAL;
>  
> -	/*
> -	 * Use a mutex to serialize the registration of performance domains and
> -	 * let the driver-defined callback functions sleep.
> -	 */
>  	mutex_lock(&em_pd_mutex);
>  
> -	for_each_cpu(cpu, span) {
> -		/* Make sure we don't register again an existing domain. */
> -		if (READ_ONCE(per_cpu(em_data, cpu))) {
> +	if (_is_cpu_device(dev)) {
> +		span = kzalloc(cpumask_size(), GFP_KERNEL);
> +		if (!span) {
> +			mutex_unlock(&em_pd_mutex);
> +			return -ENOMEM;
> +		}
> +
> +		ret = dev_pm_opp_get_sharing_cpus(dev, span);
> +		if (ret)
> +			goto free_cpumask;

That I think should be changed. This creates some dependency on PM_OPP
for the EM framework. And in fact, the reason we came up with PM_EM was
precisely to not depend on PM_OPP which was deemed too Arm-specific.

Suggested alternative: have two registration functions like so:

	int em_register_dev_pd(struct device *dev, unsigned int nr_states,
			       struct em_data_callback *cb);
	int em_register_cpu_pd(cpumask_t *span, unsigned int nr_states,
			       struct em_data_callback *cb);

where em_register_cpu_pd() does the CPU-specific work and then calls
em_register_dev_pd() (instead of having that big if (_is_cpu_device(dev))
as you currently have). Would that work ?

Another possibility would be to query CPUFreq instead of PM_OPP to get
the mask, but I'd need to look again at the driver registration path in
CPUFreq to see if the policy masks have been populated when we enter
PM_EM ... I am not sure if this is the case, but it's worth having a
look too.

Thanks,
Quentin
