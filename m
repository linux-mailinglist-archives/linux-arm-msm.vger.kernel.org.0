Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0496B5A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2019 06:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfGQEt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jul 2019 00:49:28 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34971 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfGQEt1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jul 2019 00:49:27 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so11282073plp.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2019 21:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O04V+mnqaZZSFIQWw8Fuzbne8J4qoFLTWcKpTxEH+P4=;
        b=PmXILe8OGM0O744zqLu+hX0av+bvqIsNEcGWGbVedAXnUNeXg92pbZFI5Isnxl8Riu
         o5Fi07TzEwaherJbHgIj3g/NFiB7kulMNPTla4EGXbVPg0ZJrPxxWvkY9dzFHSan5GGy
         Lqzl8Nd8pp94VtmeP+5NIOuCewluem5U/c7nqIhJm1wnelU657sNeuEmLYUye8/5L3Pg
         JdPVfPROpeU7N370X+4gnYAwy1AhsPpebl63BbcdD/K1esDBp+wpv+l1Qd+d34/drH4p
         1LbXMZvSUFsnPgZW8umAm8IajXp48gmXPZzwQIvfi7gFBJfapwk0ubfwwr7gIn1a9hUA
         XIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O04V+mnqaZZSFIQWw8Fuzbne8J4qoFLTWcKpTxEH+P4=;
        b=eYLPyC/sQYmyH2wYe86Q4ErDUeEgtbyqVakOLcm2u5QKQThLzN0MYvz2LZE6ehdl5U
         wsPSUxfUA/dNd1pbodEVyVFoDaN6km+duFHra/DTG24zR/J3FBrcBDBMDAqhUfnTp+1b
         fJg7ygae8RK5nQVnHbz2lOykidL4xyEcTC5wKZdaI9HsumSk/Wx1OZvRWufA8YPALyqr
         rZ2JPGjIGL6LgTO8t5veg4QwnW91S85OFHz0ktvXWyboh47rKyknYkO+rrkwLp6ikJba
         1RBBktVsWv4UBm8iRFbCWZGWpAidxIVOY4QTSqD8yFaZT2si8F7h/+JSkaUMILF/C4kU
         jTLg==
X-Gm-Message-State: APjAAAWVcMOpJXI+6o3lhJzhAdi8hEIuaeBcG9ej4/mRpiUaOUiHxaRY
        keG13cKMnUYVdPlbIhOlH6tSfQ==
X-Google-Smtp-Source: APXvYqzTTzcC9YVvGck2+rC0LotBtZoeaU5GmW1J+4869Y2H5VlRHIkIklvo5om68n0sh1xfHuleCQ==
X-Received: by 2002:a17:902:42d:: with SMTP id 42mr38815911ple.228.1563338967066;
        Tue, 16 Jul 2019 21:49:27 -0700 (PDT)
Received: from localhost ([122.172.28.117])
        by smtp.gmail.com with ESMTPSA id g9sm17146851pgs.78.2019.07.16.21.49.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 21:49:25 -0700 (PDT)
Date:   Wed, 17 Jul 2019 10:19:23 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/13] arm64: dts: qcom: qcs404: Add CPR and populate OPP
 table
Message-ID: <20190717044923.ccmebeewbinlslkm@vireshk-i7>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-12-niklas.cassel@linaro.org>
 <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
 <20190715132405.GA5040@centauri>
 <20190716103436.az5rdk6f3yoa3apz@vireshk-i7>
 <20190716105318.GA26592@centauri>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716105318.GA26592@centauri>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-07-19, 12:53, Niklas Cassel wrote:
> Here I cheated and simply used get_cpu_device(0).
> 
> Since I cheated, I used get_cpu_device(0) always,
> so even when CPU1,CPU2,CPU3 is attached, dev_pm_opp_get_opp_count(cpu0) is
> still 0.
> 
> I added a print in
> [    3.836533] cpr_set_performance: number of OPPs for dev: cpu0: 3
> 
> And there I can see that OPP count is 3, so it appears that with the
> current code, we need to wait until cpufreq-dt.c:cpufreq_init()
> has been called, maybe dev_pm_opp_of_cpumask_add_table() needs
> to be called before dev_pm_opp_get_opp_count(cpu0) actually returns 3.
> 
> cpufreq_init() is called by platform_device_register_simple("cpufreq-dt", -1,
>                                                           NULL, 0);
> which is called after dev_pm_opp_attach_genpd().
> 
> What I don't understand is that dev_pm_opp_attach_genpd() actually returns
> a OPP table. So why do we need to wait for dev_pm_opp_of_cpumask_add_table(),
> before either dev_pm_opp_get_opp_count(cpu0) or
> dev_pm_opp_get_opp_count(genpd_virtdev_for_cpu0) returns 3?

Ah, I see the problems now. No, cpufreq table can't be available at
this point of time and we aren't going to change that. It is the right
thing to do.

Now, even if the kernel isn't written in a way which works for you, it
isn't right to put more things in DT than required. DT is (should be)
very much independent of the Linux kernel.

So we have to parse DT to find highest frequency for each
required-opp. Best is to put that code in the OPP core and use it from
your driver.

-- 
viresh
