Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63AEC184493
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 11:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgCMKPd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 06:15:33 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54676 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgCMKPb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 06:15:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id n8so9252317wmc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2020 03:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A2S0VguwI+vPRoafp0n7H/FnoxCrEJkQC7JvYKj1Y0s=;
        b=GVMDp2vZE2aQwlKRTXncVtfN/X+6h48E0TlmseeRuAA107vTByb4SPEwMedGts2FpH
         0TL7glG8mEnbMDZ+queQzD2z8DhUOZNdJH7ieZjOQnso4/ztWA4Zn75c65eSChADubSd
         0cXZHBjArc0TCK17CXch9WBT9JSoawEIY9faPIiTiyZVLh7CB+EXTkP4tDkHsfeB1+R2
         YXRhfNpkpNTIcVQmQ/Elu9NY3FwXfyvYutM+MW2tImKrOwQKW22UE3kEC/U09RRMs36N
         k87s/4AcSbJhgTuxTtpxn6vzTgZzEV/FulMOW4LM8nYmHWyTFOvERzjfZVu+JYlP2r9S
         epPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A2S0VguwI+vPRoafp0n7H/FnoxCrEJkQC7JvYKj1Y0s=;
        b=ZXNWzK9sapxh6oD36X7NLNbZCpEPu/KF4D4Jxycsd8Ox73M4Q5QDOsLisSnw8NhfaB
         KnYVV+ZgUPjX6diSfYqWSfCNKa40E0JQNdZeyZQqjYYT05zTCecQ6hu4qMC2jiIcQhN7
         HwFXc2rLxTc6YJ2Ow5t5l3kErCH7JMCuGbDGjYah2kKwrm3lEobydGFUwMUkUg397EtM
         VFbYIR+W98sdds9/b0hnuskvySSuemiTf1xvCeTblwPz1bwkNgCM3g7oHTNkc+H6nqu3
         xUpYxrzjzORIpL7RjvJ8ZZbLCC+FoDfq9zTgXLkISQuEFqkTuYe3PcNMhrx87IBtcCcv
         rGEw==
X-Gm-Message-State: ANhLgQ3c8hzO1mHx0zgqY20G4ym/bJMOk2LSVuux36f3JXn6gEGTmmm5
        1OsFZNZxDpQOUORvXctRMFdvGg==
X-Google-Smtp-Source: ADFU+vvfNiM0lhbIk+4DF69YACHaSoOD2UzvSXjcbL/Yevz/3tgRAyjOYY4bwXeZHBIHemSgOn8+hQ==
X-Received: by 2002:a1c:9e85:: with SMTP id h127mr9702121wme.145.1584094528850;
        Fri, 13 Mar 2020 03:15:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id a73sm280921wme.47.2020.03.13.03.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 03:15:28 -0700 (PDT)
Date:   Fri, 13 Mar 2020 10:15:24 +0000
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Morten.Rasmussen@arm.com,
        Dietmar.Eggemann@arm.com, javi.merino@arm.com,
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
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org
Subject: Re: [PATCH v4 2/4] OPP: change parameter to device pointer in
 dev_pm_opp_of_register_em()
Message-ID: <20200313101524.GA150397@google.com>
References: <20200309134117.2331-1-lukasz.luba@arm.com>
 <20200309134117.2331-3-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309134117.2331-3-lukasz.luba@arm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Monday 09 Mar 2020 at 13:41:15 (+0000), Lukasz Luba wrote:
> diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
> index d2b5f062a07b..676b56424886 100644
> --- a/drivers/cpufreq/cpufreq-dt.c
> +++ b/drivers/cpufreq/cpufreq-dt.c
> @@ -275,7 +275,9 @@ static int cpufreq_init(struct cpufreq_policy *policy)
>  	policy->cpuinfo.transition_latency = transition_latency;
>  	policy->dvfs_possible_from_any_cpu = true;
>  
> -	dev_pm_opp_of_register_em(policy->cpus);
> +	ret = dev_pm_opp_of_register_em(cpu_dev, policy->cpus);
> +	if (ret)
> +		dev_dbg(cpu_dev, "Couldn't register Energy Model %d\n", ret);
>  
>  	return 0;

Ah, that answers my comment on patch 01. You're adding the error
messages here.

Isn't this more boilerplate for the drivers ? All they do is print the
same debug message. Maybe just move it inside dev_pm_opp_of_register_em
directly ?

Thanks,
Quentin
