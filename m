Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C29073E56CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 11:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239020AbhHJJ1a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 05:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239014AbhHJJ13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 05:27:29 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBC0C0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 02:27:08 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id fa24-20020a17090af0d8b0290178bfa69d97so4476456pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NRaO485jOXyVF0oustzhSd8qBSdNJyzH3A7Z5Nbm+es=;
        b=EN4FC+Zy6qPz5ONRrMSzGs7f2d5IFWEHB+CKaGTlrSFl71+MmJb6AWQ7efO8d+ClIb
         pnmBW2qV3uz+YogPMJIOxazI0Bvoj1dCt91i+6XBfI4J8/HogjbdB3HsDTzg2BkBekw6
         8D0q7W44BuFzkyreb4V+5EVY8FveQYOjxevTlXLNu+I9rWg37oGRNiI9dnTyVA9wEaDy
         3ElJHf+wXX8SN/vvMyi3ziXGw8gJw6iFl6YHA0ajvLilryl5EKx6myt1uXEbG5leYYw6
         E8W2P8Ia8sL2uhsbmaxIi/vfz8yL3Oso9PVdHL+61zufIGdpF/RQ9nmb7wV0dxlDjdmJ
         vqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NRaO485jOXyVF0oustzhSd8qBSdNJyzH3A7Z5Nbm+es=;
        b=bkh2bNxfBL3QHiNjHFrarzmNDsDFbYUJ3ZY8rf4WuiOePGT/jlfedWlskAECDcl5JW
         i3EHavFkY/mAi3gfxK495TiEoQBNRv/KzLMgrXMa5eU3OT5i4j5eLdgyQS/jTbf3qTMo
         n4MhVC4OnBSZIdEu9RDiwVlPiIok84SLTUmWBwHUp0jepVg3iZRIKsDsz/ShtO71o5io
         GMwTwgYnLSdUwwwjD3ooaBps/M2AxWcp9u2utnDauo5fNzol117fNMVCXqn8q+IhtBE1
         eQG1fL5Eg9k+AXK1tW8auFtsNhzsJb5UzQt1WUKRILXvpxQkM5mTs9qHzvzV09UPg956
         DJcw==
X-Gm-Message-State: AOAM532/CULYNGkLKQziUTIPXtF0aPCwt60us33kYeswdKYDAzz/jYf4
        Qp7kE1QlkG6CNWM+Ih/XPSLPcg==
X-Google-Smtp-Source: ABdhPJwxm9hbh/Alhve/g69Hlo8k1hc9s21FDYyYaBSZ0qimtlMyyJ1Zt5kIHCYm6CocEfwRNK9uGw==
X-Received: by 2002:a62:1e83:0:b029:3c8:ac32:3b41 with SMTP id e125-20020a621e830000b02903c8ac323b41mr19067962pfe.0.1628587627673;
        Tue, 10 Aug 2021 02:27:07 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id d9sm21966486pfv.161.2021.08.10.02.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:27:07 -0700 (PDT)
Date:   Tue, 10 Aug 2021 14:57:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     Andy Gross <agross@kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Fabio Estevam <festevam@gmail.com>,
        Kevin Hilman <khilman@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
Message-ID: <20210810092705.ctf43hwhzdepmcrv@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <6449a61f-a5fc-0b81-65b2-7bf77b8a71aa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6449a61f-a5fc-0b81-65b2-7bf77b8a71aa@arm.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-08-21, 10:17, Lukasz Luba wrote:
> Hi Viresh,
> 
> I like the idea, only small comments here in the cover letter.
> 
> On 8/10/21 8:36 AM, Viresh Kumar wrote:
> > Provide a cpufreq driver flag so drivers can ask the cpufreq core to register
> > with the EM core on their behalf. This allows us to get rid of duplicated code
> > in the drivers and fix the unregistration part as well, which none of the
> > drivers have done until now.
> 
> The EM is never freed for CPUs by design. The unregister function was
> introduced for devfreq devices.

I see. So if a cpufreq driver unregisters and registers again, it will
be required to use the entries created by the registration itself,
right ? Technically speaking, it is better to unregister and free any
related resources and parse everything again.

Lets say, just for fun, I want to test two copies of a cpufreq driver
(providing different set of freq-tables). I build both of them as
modules, insert the first version, remove it, insert the second one.
Ideally, this should just work as expected. But I don't think it will
in this case as you never parse the EM stuff again.

Again, since the routine is there already, I think it is better/fine
to just use it.

> > This would also make the registration with EM core to happen only after policy
> > is fully initialized, and the EM core can do other stuff from in there, like
> > marking frequencies as inefficient (WIP). Though this patchset is useful without
> > that work being done and should be merged nevertheless.
> > 
> > This doesn't update scmi cpufreq driver for now as it is a special case and need
> > to be handled differently. Though we can make it work with this if required.
> 
> The scmi cpufreq driver uses direct EM API, which provides flexibility
> and should stay as is.

Right, so I left it as is for now.

-- 
viresh
