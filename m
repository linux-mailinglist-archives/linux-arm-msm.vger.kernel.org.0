Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49921FC170
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 00:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgFPWMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 18:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgFPWMA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 18:12:00 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1290C061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 15:11:59 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id h22so26285pjf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 15:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IAntcGVr69jG+2U9Kg/0cnUckvFxjteOolkcxbeRc9Y=;
        b=K+ndqAaPDXsilMqepmXfCMFmGehmMghRgs/uYLROhyx6CasKx/nZUoyOyDLdqq2piY
         C/V3d1JkmyubwTahebBr/V7/usnD6QdgIQXr35pyGRbVh4GWwwV8dAs7yvQIDrSWKDAc
         ZHAVHA9KluaJyFPwX8WCoEpPL0TWDallcZXXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IAntcGVr69jG+2U9Kg/0cnUckvFxjteOolkcxbeRc9Y=;
        b=NyB0gACKF2GS0g8S0Hng5sGwGu6c71UiQ/eLDu5jXHRgoutG3U/QbEoN65P9mv/7cE
         BCkntACAOE1AjShXJOK+S2vxy5Wr29C3Aq6LcXQC9LPE3qmHEAWUM0ZhJs7VTs62xqdK
         urZQEsFt3KDWMPYSkx0Rz0Ni+1f/C3/nOG52Ihy4EF/MGpmIzR2jtMPeoxmBEwNO20oy
         se8yo5IweO4wlDvXyF9zx9Ry9HyWXV7mG3XCguAU88zu0Qn0kXo/vLchGgpTBGEYQ9KS
         zGjg562nx7n+cTlMuwFwi5L9oe5h36anvNbcwfeBC5WpQzYDUie0YUwtsry0HZT3aAOh
         +A9Q==
X-Gm-Message-State: AOAM533hTUdmaM6JuySYjn2evx4SEvtLvA38PzuXglkEtvDz6M1eBs4k
        t2zmVB0HmjLk0sKSgQMEJGll2w==
X-Google-Smtp-Source: ABdhPJzSnCJjDw+p1Ezp/HhEv4OF149xFwUoopIq0eaTwuT98NS0ayzkV4ddBqNuQJGzJMA3vaFiHQ==
X-Received: by 2002:a17:90b:19c4:: with SMTP id nm4mr4994217pjb.66.1592345519448;
        Tue, 16 Jun 2020 15:11:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 73sm15563491pge.15.2020.06.16.15.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 15:11:58 -0700 (PDT)
Date:   Tue, 16 Jun 2020 15:11:57 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, saravanak@google.com, nm@ti.com,
        bjorn.andersson@linaro.org, agross@kernel.org, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        vincent.guittot@linaro.org, amit.kucheria@linaro.org,
        lukasz.luba@arm.com, sudeep.holla@arm.com, smasetty@codeaurora.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v6 4/5] cpufreq: qcom: Update the bandwidth levels on
 frequency change
Message-ID: <20200616221157.GA4525@google.com>
References: <20200605213332.609-1-sibis@codeaurora.org>
 <20200605213332.609-5-sibis@codeaurora.org>
 <20200615172553.GU4525@google.com>
 <e21f85d64d72ec637c10dae93e8323bb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e21f85d64d72ec637c10dae93e8323bb@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

after doing the review I noticed that Viresh replied on the cover letter
that he picked the series up for v5.9, so I'm not sure if it makes sense
to send a v7.

On Wed, Jun 17, 2020 at 02:35:00AM +0530, Sibi Sankar wrote:

> > > @@ -112,7 +178,7 @@ static int qcom_cpufreq_hw_read_lut(struct
> > > device *cpu_dev,
> > > 
> > >  		if (freq != prev_freq && core_count != LUT_TURBO_IND) {
> > >  			table[i].frequency = freq;
> > > -			dev_pm_opp_add(cpu_dev, freq * 1000, volt);
> > > +			qcom_cpufreq_update_opp(cpu_dev, freq, volt);
> > 
> > This is the cross-validation mentioned above, right? Shouldn't it
> > include
> > a check of the return value?
> 
> Yes, this is the cross-validation step,
> we adjust the voltage if opp-tables are
> present/added successfully and enable
> them, else we would just do a add opp.
> We don't want to exit early on a single
> opp failure. We will error out a bit
> later if the opp-count ends up to be
> zero.

At least an error/warning message would seem convenient when adjusting/adding
an OPP fails, otherwise you would only notice by looking at the sysfs
attributes (if you'd even spot a single/few OPPs to be missing).

