Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21641CD91B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 13:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729591AbgEKL53 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 07:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729490AbgEKL52 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 07:57:28 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48730C05BD0B
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 04:57:28 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id h4so17749697wmb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ETEJzrILDWcEXSuqI8CJBLVfITRJvsWlV8DeIS56yUg=;
        b=TYCFULo2Suie8IQQbYjij0fXBQIVOUeI8xv90SKGhM5ONz2C0tOD+JZgJvXZWV8rj1
         hVyNLva1zf1dfngbRmXj5nWT2LYLmXJYm7Vc5N0WBGJoZUG4D4sPk5K0DqdkpXUKs68N
         yNDAJiHCn8A02TXqcQ9lyTuTFNdWzUQNC3me3u/1RYQdyg8ABZSWn/yXuzOWlOc3IBmW
         kL+9ZFtfe+DRrR5ZQYEZqeLUyuRzdG+R/pYtfjhI/9bYEanyw2jau41e8wJJxf9efG+h
         7MEwuIBDRDzZqwEk16N8f4DzETeYRYp8/8fZ1m1afV8wanrkOItDXwjd39jiUMqFuWRK
         U3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ETEJzrILDWcEXSuqI8CJBLVfITRJvsWlV8DeIS56yUg=;
        b=ZqDI8h0C74gUinrQY7xD+wJ0xfYU2QWLQr+f7/lMhaPoaahANlegOq4CqoL9w0REiU
         ERnU0AHLkH5cp1ouZ0Vwh9HGs7WBywcG/ptX3ue4wcari8aGIJetEPeJPsotRWe0ns2D
         onKwtV6VmRysqdX1euZfINyhItpSlGrYNM0SZ+Qo5SqUt286G0Wmf+yoJojZwNsXuM2c
         8CTy3bO3VZNWMLLwZeCCQWYtt1tIWb5VjzR2pBPclbvBiGI84oUeihN3X2RYuvE0wofh
         OFeHaLX7vqXfdlsjf+v2KoZQBo0P1s3OL2YIOQfuPloGCjEdqz1NYghiePdnCLTFiwle
         wXJQ==
X-Gm-Message-State: AGi0PubTnBVZmZzHL0TQ6hY/p2MJw3KDpopslglcXg1a/lqp8B4lSJDy
        S4pOUWrbA9GqoIkHTg4cKLXtiQ==
X-Google-Smtp-Source: APiQypIA/BhPOSlxxVRft/M3ndyAAD/wbrIqEL1T+jhl+AK/cIZYzzYwO39nyIGbtRrwMvdTRb8hHw==
X-Received: by 2002:a7b:c755:: with SMTP id w21mr30469520wmk.120.1589198246663;
        Mon, 11 May 2020 04:57:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id y70sm27811096wmc.36.2020.05.11.04.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:57:25 -0700 (PDT)
Date:   Mon, 11 May 2020 12:57:22 +0100
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Dietmar.Eggemann@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org, mka@chromium.org
Subject: Re: [PATCH v7 03/15] PM / EM: update callback structure and add
 device pointer
Message-ID: <20200511115722.GA13741@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-4-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-4-lukasz.luba@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Monday 11 May 2020 at 12:19:00 (+0100), Lukasz Luba wrote:
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 61623e2ff149..11ee24e06d12 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -103,17 +103,12 @@ scmi_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask)
>  }
>  
>  static int __maybe_unused
> -scmi_get_cpu_power(unsigned long *power, unsigned long *KHz, int cpu)
> +scmi_get_cpu_power(unsigned long *power, unsigned long *KHz,
> +		   struct device *cpu_dev)
>  {
> -	struct device *cpu_dev = get_cpu_device(cpu);
>  	unsigned long Hz;
>  	int ret, domain;
>  
> -	if (!cpu_dev) {
> -		pr_err("failed to get cpu%d device\n", cpu);
> -		return -ENODEV;
> -	}
> -
>  	domain = handle->perf_ops->device_domain_id(cpu_dev);
>  	if (domain < 0)
>  		return domain;
> @@ -200,7 +195,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	policy->fast_switch_possible = true;
>  
> -	em_register_perf_domain(policy->cpus, nr_opp, &em_cb);

So this one has no users after this patch right? I suppose you could
squash patch 05 in this one. But no big deal.

Acked-by: Quentin Perret <qperret@google.com>

> +	em_dev_register_perf_domain(cpu_dev, nr_opp, &em_cb, policy->cpus);
>  
>  	return 0;
