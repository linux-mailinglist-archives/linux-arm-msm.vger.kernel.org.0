Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84AD76E823
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2019 17:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfGSPqE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jul 2019 11:46:04 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44683 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbfGSPqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jul 2019 11:46:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id r15so5077037lfm.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2019 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2i7XSW198CMKZZw/oRPpHFSGJvTtzgi6p+v7sLruFk0=;
        b=OJWKwITsKyxbnlS0LH03nJUzIRgDj4HBhyT4vMEyGQ6EN06YQEuUoYb20H6Gsa8zQw
         EwEWDH60b8cY6WpV7NqZXES7EIMgoFu3+J963adyTXX0uQO/Mf2BER3vU6A6a1IvlsaP
         7l49OF0jxezm9cpK+OmzVJs2+RBEvd990hPYR7BC3TrIy5Djh5XaymkzZ5GU4ZUmbjEj
         m7nm/WunQ7jFXL8gQcL2VYadccG9Q4cfQfe4xlZpCsxCkVJuC+wr4Zsrk8uYEAeZ2qOl
         hJRCbd661qmRSRf0MTaGrsgFxcBqfyTsnMBr5cWLjs2R+zioMi3cvaVwx9BIcqxbfHp5
         5YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2i7XSW198CMKZZw/oRPpHFSGJvTtzgi6p+v7sLruFk0=;
        b=HIvTtxDdEggP1ihB0dPStkoHj25Njz5sU2KgVjUHCd0WBgJNiG3uVphiOXujDUk9LP
         jmmWg+4Co3fEVZ7g4CYSijWLdqxgeDeoMCFyxE8WUxiW7YsCXxwo+AD0R2TOtUfgnD0T
         jSJeZ0bdhMsIpkV/BAIzRgoJXghbkrg0NonrxucL2/HCYD7NsnXCvMuF+Il4VmOeQ+qm
         0OUbnr4KdsW21jMdJpaFngJns0SCfuah9Ks21D8ZIhxEzetlZASB9Pv3IeBCiKiEHJdD
         /xuNwmq8swIK3pl5DwvRU3bjAeZFml1IFlyZ7iKr2W/XfL2dGgVTilf9t3Gpq7SeymaM
         syMA==
X-Gm-Message-State: APjAAAXuIavOA/u94cu6iOZ6F/rlFVdE1eHD22Ko/hiX8VXA0rokDW1h
        nKR2tmWIzfc8eE1Y+rNynt0HQw==
X-Google-Smtp-Source: APXvYqyBt2StFCI7rh2Sk0ml59+DBfBzrP0WyeRhK86P9lv3ycCs1xNa4cli07smdEAr/GbdpDk7YQ==
X-Received: by 2002:a19:9111:: with SMTP id t17mr24403978lfd.113.1563551161408;
        Fri, 19 Jul 2019 08:46:01 -0700 (PDT)
Received: from centauri (ua-83-226-229-61.bbcust.telenor.se. [83.226.229.61])
        by smtp.gmail.com with ESMTPSA id k82sm5733963lje.30.2019.07.19.08.45.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 08:46:00 -0700 (PDT)
Date:   Fri, 19 Jul 2019 17:45:58 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/13] arm64: dts: qcom: qcs404: Add CPR and populate OPP
 table
Message-ID: <20190719154558.GA32518@centauri>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-12-niklas.cassel@linaro.org>
 <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
 <20190715132405.GA5040@centauri>
 <20190716103436.az5rdk6f3yoa3apz@vireshk-i7>
 <20190716105318.GA26592@centauri>
 <20190717044923.ccmebeewbinlslkm@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717044923.ccmebeewbinlslkm@vireshk-i7>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 17, 2019 at 10:19:23AM +0530, Viresh Kumar wrote:
> On 16-07-19, 12:53, Niklas Cassel wrote:
> > Here I cheated and simply used get_cpu_device(0).
> > 
> > Since I cheated, I used get_cpu_device(0) always,
> > so even when CPU1,CPU2,CPU3 is attached, dev_pm_opp_get_opp_count(cpu0) is
> > still 0.
> > 
> > I added a print in
> > [    3.836533] cpr_set_performance: number of OPPs for dev: cpu0: 3
> > 
> > And there I can see that OPP count is 3, so it appears that with the
> > current code, we need to wait until cpufreq-dt.c:cpufreq_init()
> > has been called, maybe dev_pm_opp_of_cpumask_add_table() needs
> > to be called before dev_pm_opp_get_opp_count(cpu0) actually returns 3.
> > 
> > cpufreq_init() is called by platform_device_register_simple("cpufreq-dt", -1,
> >                                                           NULL, 0);
> > which is called after dev_pm_opp_attach_genpd().
> > 
> > What I don't understand is that dev_pm_opp_attach_genpd() actually returns
> > a OPP table. So why do we need to wait for dev_pm_opp_of_cpumask_add_table(),
> > before either dev_pm_opp_get_opp_count(cpu0) or
> > dev_pm_opp_get_opp_count(genpd_virtdev_for_cpu0) returns 3?
> 
> Ah, I see the problems now. No, cpufreq table can't be available at
> this point of time and we aren't going to change that. It is the right
> thing to do.
> 
> Now, even if the kernel isn't written in a way which works for you, it
> isn't right to put more things in DT than required. DT is (should be)
> very much independent of the Linux kernel.
> 
> So we have to parse DT to find highest frequency for each
> required-opp. Best is to put that code in the OPP core and use it from
> your driver.

Hello Viresh,

Could you please have a look at the last two patches here:
https://git.linaro.org/people/niklas.cassel/kernel.git/log/?h=cpr-opp-hz

If you like my proposal then I could send out the first patch (the one to
OPP core) as a real patch (with an improved commit message), and
incorporate the second patch into my CPR patch series when I send out a V2.


Kind regards,
Niklas
