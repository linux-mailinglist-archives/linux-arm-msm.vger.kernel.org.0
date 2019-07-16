Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2116A6CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 12:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387471AbfGPKxX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jul 2019 06:53:23 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46151 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733037AbfGPKxX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jul 2019 06:53:23 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so19468110ljg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2019 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aLdBWy8x0puFJqMP+CMP1BvowWLtii4YIVQy8EzzjDk=;
        b=U92ZtsfTgeB6f4TOpcdI1K5LyY4Nhzq7WZPAps0kcDVeXKVvFYX1+NBdWTJi/XBGqn
         27smRncu8RpHLBuoI2SpR11VsdaYk9fT5JFG/Jglhbt+N8pUjgf0umUdhBJwNaYrQ5t/
         AxqlH2DXPCHihTwHgR5fhQFV0V9lrU5zeBj7lLHoI3CY9SmZoMdgYxlnMl7ugkLUL73A
         harE0TDALb8uHX8m9zyCXYXaAy0HaOkhX4JwNVLsUwQIYQs+ko+XFHGTSj0JxTu/ucuv
         DfpU0LNUvPF2W0Y7zaoxq2sUVQvqUjyzV/o5Wfd2cBU3yHimtbpwBGCVrNdyEIjlOhGw
         sxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aLdBWy8x0puFJqMP+CMP1BvowWLtii4YIVQy8EzzjDk=;
        b=eIpjTeaHp+zFhUALQbVj0k3jA2jhE1HpisUP9S/iTgyrSaX1dz+cZQnYa890mU4eC/
         DyZztQDCQwPmxICU/o81PrDeufb+B2XsvUax18P7bh1LTfv2DATG+Kmqz13uYFF1D4WU
         eEoW13XHag8th1Iai6HXos0fMohc32m9e2mW5j0sp7jkmMEMJrLZzewbFVctvhKjRfMi
         K5/Kl3ZezfAFrQxRWhSLhyPKxxVRQRr3WC+sObl6/E6H2mNH4lqVfcgzo8qRvWmK05jd
         VgxBvNKVFzPzCBTqSWBC1c74/KyiEXnbqE3MAq1nRMdNm99DzxGdJrpD6FWTbfeE8EGt
         QVVA==
X-Gm-Message-State: APjAAAX/np8s9D44ymx2Z8NsiI3cveQMik5eO0IKBSmyQtlssvA0W6ID
        ZI2QTQ5D6LeMVdUfhURyvHJ17g==
X-Google-Smtp-Source: APXvYqwlDvEMylnX8MY2HOB9XcLmKp2Dd5pzSefpS13DJQ03hH6B2rFS35T95/BvlG3anA2yOCVg4g==
X-Received: by 2002:a2e:9116:: with SMTP id m22mr16663264ljg.216.1563274401194;
        Tue, 16 Jul 2019 03:53:21 -0700 (PDT)
Received: from centauri (ua-83-226-229-61.bbcust.telenor.se. [83.226.229.61])
        by smtp.gmail.com with ESMTPSA id 63sm3705318ljs.84.2019.07.16.03.53.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 03:53:20 -0700 (PDT)
Date:   Tue, 16 Jul 2019 12:53:18 +0200
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
Message-ID: <20190716105318.GA26592@centauri>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-12-niklas.cassel@linaro.org>
 <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
 <20190715132405.GA5040@centauri>
 <20190716103436.az5rdk6f3yoa3apz@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716103436.az5rdk6f3yoa3apz@vireshk-i7>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 16, 2019 at 04:04:36PM +0530, Viresh Kumar wrote:
> On 15-07-19, 15:24, Niklas Cassel wrote:
> > This was actually my initial thought when talking to you 6+ months ago.
> > However, the problem was that, from the CPR drivers' perspective, it
> > only sees the CPR OPP table.
> > 
> > 
> > So this is the order things are called,
> > from qcom-cpufreq-nvmem.c perspective:
> > 
> > 1) dev_pm_opp_set_supported_hw()
> > 
> > 2) dev_pm_opp_attach_genpd() ->
> > which results in
> > int cpr_pd_attach_dev(struct generic_pm_domain *domain,
> > 		      struct device *dev)
> > being called.
> > This callback is inside the CPR driver, and here we have the
> > CPU's (genpd virtual) struct device, and this is where we would like to
> > know the opp-hz.
> > The problem here is that:
> > [    3.114979] cpr_pd_attach_dev: dev_pm_opp_get_opp_count for dev: genpd:0:cpu0: -19
> > [    3.119610] cpr_pd_attach_dev: dev_pm_opp_get_opp_count for dev: cpu0: 0

Here I cheated and simply used get_cpu_device(0).

Since I cheated, I used get_cpu_device(0) always,
so even when CPU1,CPU2,CPU3 is attached, dev_pm_opp_get_opp_count(cpu0) is
still 0.

I added a print in
[    3.836533] cpr_set_performance: number of OPPs for dev: cpu0: 3

And there I can see that OPP count is 3, so it appears that with the
current code, we need to wait until cpufreq-dt.c:cpufreq_init()
has been called, maybe dev_pm_opp_of_cpumask_add_table() needs
to be called before dev_pm_opp_get_opp_count(cpu0) actually returns 3.

cpufreq_init() is called by platform_device_register_simple("cpufreq-dt", -1,
                                                          NULL, 0);
which is called after dev_pm_opp_attach_genpd().

What I don't understand is that dev_pm_opp_attach_genpd() actually returns
a OPP table. So why do we need to wait for dev_pm_opp_of_cpumask_add_table(),
before either dev_pm_opp_get_opp_count(cpu0) or
dev_pm_opp_get_opp_count(genpd_virtdev_for_cpu0) returns 3?



> > [    3.126489] cpr_pd_attach_dev: dev_pm_opp_get_opp_count for dev: cpr@b018000: 3
> > 
> > While we have the CPR OPP table in the attach callback, we don't
> > have the CPU OPP table, neither in the CPU struct device or the genpd virtual
> > struct device.
> 
> If you can find CPU's physical number from the virtual device, then
> you can do get_cpu_device(X) and then life will be easy ?
> 
> > Since we have called dev_pm_opp_attach_genpd(.., .., &virt_devs) which
> > attaches an OPP table to the CPU, I would have expected one of them to
> > be >= 0.
> > Especially since dev_name(virt_devs[0]) == genpd:0:cpu0
> > 
> > I guess it should still be possible to parse the required-opps manually here,
> > by iterating the OF nodes, however, we won't be able to use the CPU's struct
> > opp_table (which is the nice representation of the OF nodes).
> > 
> > Any suggestions?
> 
> -- 
> viresh
