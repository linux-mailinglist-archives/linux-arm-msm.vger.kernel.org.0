Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 819BB143981
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 10:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgAUJcG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 04:32:06 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55357 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbgAUJcF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 04:32:05 -0500
Received: by mail-wm1-f68.google.com with SMTP id q9so2138451wmj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 01:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=imtrsyE4PqkfOuBH2bEU5/ycShpe5DgMQpGEtomyMa0=;
        b=rtcJ+LQlDZ/dhGfo9Iu5OJd4+HKMy2yzD9iSGdalzOoIEncUjzsz5/aNNTd5RjsSc8
         zO8R7IWeVumQmIJtNgo4RVZt7gUhd5yZRRBQqVDryoKs8BU04+PpGfSZJNvnjsH/62yj
         utNq7GGLPGyTxTb1yb3mltp6nzJAjgAWU6qQKOTamwB12SgQZpUurDCVdShHDY4zSwRt
         27hnYDJCXhMMgdvO1mW+7T9xCr4uphzvbjrusTEF0ylfATpdKENfYomQu6F+lwzn6RUS
         UpDbh4WVRvpRmqp5fb/B2A+GM9Tidwg6k1/Hgf4wLH/tybPmLM/Hd8ve+be8A6ZldBH9
         pQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=imtrsyE4PqkfOuBH2bEU5/ycShpe5DgMQpGEtomyMa0=;
        b=DBU9nS8F9D0wfL7hE5bDdfAkmEoCXB104JX2eBulte9LY2twiYU3xyrggpKrCf6R9O
         UWbGRlCoLsNm608CVQgcw/uHQDcM+DOT53EB5RstKeik3OwUF9iyrx3IEEm3AX0XRtRb
         M0sXOzrL+F+deJBG097KE/3TrnWljBBX8A/EMHl/Lt91uVe48O0F3Y68NAVecgwkdX5S
         2UWmqxvczaizRXr0eWgBNnX3yUJRXV6UasGLJ3Kj+QrbC5XIy5tTPQAW93OMjMXdBt/D
         ofNNo34nGghij58WaFmy2GElxXJdD4OiuvugIGgPG98jk0PN8qVQ7Ltv8+O3z0px1XWr
         ttag==
X-Gm-Message-State: APjAAAVBo2N9aCk5xM17i7kyDADalyp5ptaHsbb5yvTidzND1U1bhtVQ
        u1sa5rihQlSRYdr4Eb1jdH8utg==
X-Google-Smtp-Source: APXvYqxXLTNXCnqXFHWAqOhNn4BqFUdupPBlV6/fm+9Ho9HF0rYCv/gYw3ZqBCY91j9ikIx2kYRjiw==
X-Received: by 2002:a1c:a584:: with SMTP id o126mr3199652wme.163.1579599122625;
        Tue, 21 Jan 2020 01:32:02 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id g7sm51210925wrq.21.2020.01.21.01.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 01:32:01 -0800 (PST)
Date:   Tue, 21 Jan 2020 09:31:58 +0000
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     Dietmar Eggemann <dietmar.eggemann@arm.com>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Morten.Rasmussen@arm.com, Chris.Redpath@arm.com,
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
Message-ID: <20200121093158.GA154455@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <20200117105437.GA211774@google.com>
 <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
 <20200120150918.GA164543@google.com>
 <8332c4ac-2a7d-1e2d-76e9-7c979a666257@arm.com>
 <b02da0ed-9e0b-36db-9813-daa334cbf2ba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b02da0ed-9e0b-36db-9813-daa334cbf2ba@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Monday 20 Jan 2020 at 18:38:41 (+0000), Lukasz Luba wrote:
> I think we could avoid this additional argument 'cpumask'. I have
> checked the cpufreq_cpu_get function, which should do be good for this:
> 
> ---------->8-------------------------
> static int _get_sharing_cpus(struct device *cpu_dev, struct cpumask *span)
> {
>         struct cpufreq_policy *policy;
> 
>         policy = cpufreq_cpu_get(cpu_dev->id);
>         if (policy) {
>                 cpumask_copy(span, policy->cpus);

That should be with 'policy->related_cpus', but yes if the policy
cpumasks have been populated this approach is OK I think.

>                 cpufreq_cpu_put(policy);
>                 return 0;
>         } else {
>                 return -EINVAL;
>         }
> }
> --------------------------8<-------------------------------

Thanks,
Quentin
