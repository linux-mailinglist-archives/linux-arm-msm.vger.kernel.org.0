Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6464A68A61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2019 15:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730219AbfGONYL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jul 2019 09:24:11 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37969 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730189AbfGONYL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jul 2019 09:24:11 -0400
Received: by mail-lf1-f67.google.com with SMTP id h28so10984792lfj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2019 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WAAXdPfvBtMOFdHC12T8O6g/xwGXPT4OLR0giQWXBHs=;
        b=ZeN5hXMVWByQHXmIl3lNNWHgq/quaKKWUHLtPlJ991iiaXG7cCNKrkUrLhlKWh62Zu
         wGEa6Z8uQLmuifbiujek4yvUUHybaGxw7Frp5JebiWFkLeqgAhuqU+HYWcEi+shp4ahZ
         jChaAYPJmCakSFmZbrjYSFdM/JkmO3B6dWURshTo6zr/1h01XUSJgx50nxbbRtpTUK92
         ngHdlAnSsRTEBYrZiVK+SJXPMFwHjn0l5BeRFgyNQCytzQa5jgibIm+pdfxojooWqXRG
         a0+rshY0N9JBf8s2Zr8jbGs4oloq+Rj/8Mws92rqbpbfnKWj21brhJS2qS9KW7GxFdds
         xz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WAAXdPfvBtMOFdHC12T8O6g/xwGXPT4OLR0giQWXBHs=;
        b=apjLbntEKRWfrMVk6SRU8ZpU0t96CSQecljJLW50MTDMQ9obFb5bpy+EAbBbMiQmHV
         qg9Ma1tIUmuGeIhT6o9IPoVXKcuO/3bkBsFQz05a1ri70gnC3LMXw//qkHdirOaxtsXC
         moajPRwXP4pVHwuKVFyAmkP0BAsUDXEeT4p6RDvwUKagMg8XXPSibjt44P7+wijC1OWI
         DycUO6X96zIbfDb2+i6iSLMjyKw21KV2gm/iL60AfSNaoOdCvAc+iSMzfzFcpWEPZvEH
         U3fo1ZLUu0UGEfy08mWXsaB3HGnydeW2Z7EmGCO4ZCfFmwcsPCtdFawvXkAXZ1uCRsOk
         jrUQ==
X-Gm-Message-State: APjAAAWYCqBWIqGqdCrLHz5C2enKjrwyDPIr81yihUtetbMKjvEZnuVw
        WZaADmYfzd8bk3DlV5K+laNHXw==
X-Google-Smtp-Source: APXvYqyMkuU4RxekOy7UQ3tzp1JSzua2w50VcgWv5EMQZ8H8oK9ddCNJWjdGC2/aKK1jtE911ufOmg==
X-Received: by 2002:a19:c503:: with SMTP id w3mr10188554lfe.139.1563197048550;
        Mon, 15 Jul 2019 06:24:08 -0700 (PDT)
Received: from centauri (ua-83-226-229-61.bbcust.telenor.se. [83.226.229.61])
        by smtp.gmail.com with ESMTPSA id v22sm2358945lfe.49.2019.07.15.06.24.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 06:24:07 -0700 (PDT)
Date:   Mon, 15 Jul 2019 15:24:05 +0200
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
Message-ID: <20190715132405.GA5040@centauri>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-12-niklas.cassel@linaro.org>
 <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 10, 2019 at 02:33:03PM +0530, Viresh Kumar wrote:
> On 05-07-19, 11:57, Niklas Cassel wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> >  	cpu_opp_table: cpu-opp-table {
> > -		compatible = "operating-points-v2";
> > +		compatible = "operating-points-v2-kryo-cpu";
> >  		opp-shared;
> >  
> >  		opp-1094400000 {
> >  			opp-hz = /bits/ 64 <1094400000>;
> > -			opp-microvolt = <1224000 1224000 1224000>;
> > +			required-opps = <&cpr_opp1>;
> >  		};
> >  		opp-1248000000 {
> >  			opp-hz = /bits/ 64 <1248000000>;
> > -			opp-microvolt = <1288000 1288000 1288000>;
> > +			required-opps = <&cpr_opp2>;
> >  		};
> >  		opp-1401600000 {
> >  			opp-hz = /bits/ 64 <1401600000>;
> > -			opp-microvolt = <1384000 1384000 1384000>;
> > +			required-opps = <&cpr_opp3>;
> > +		};
> > +	};
> > +
> > +	cpr_opp_table: cpr-opp-table {
> > +		compatible = "operating-points-v2-qcom-level";
> > +
> > +		cpr_opp1: opp1 {
> > +			opp-level = <1>;
> > +			qcom,opp-fuse-level = <1>;
> > +			opp-hz = /bits/ 64 <1094400000>;
> > +		};
> > +		cpr_opp2: opp2 {
> > +			opp-level = <2>;
> > +			qcom,opp-fuse-level = <2>;
> > +			opp-hz = /bits/ 64 <1248000000>;
> > +		};
> > +		cpr_opp3: opp3 {
> > +			opp-level = <3>;
> > +			qcom,opp-fuse-level = <3>;
> > +			opp-hz = /bits/ 64 <1401600000>;
> >  		};
> >  	};
> 
> - Do we ever have cases more complex than this for this version of CPR ?

For e.g. CPR on msm8916, we will have 7 different frequencies in the CPU
OPP table, but only 3 OPPs in the CPR OPP table.

Each of the 7 OPPs in the CPU OPP table will have a required-opps that
points to an OPP in the CPR OPP table.

On certain msm8916:s, the speedbin efuse will limit us to only have 6
OPPs in the CPU OPP table, but the required-opps are still the same.

So I would say that it is just slightly more complex..

> 
> - What about multiple devices with same CPR table, not big LITTLE
>   CPUs, but other devices like two different type of IO devices ? What
>   will we do with opp-hz in those cases ?

On all SoCs where there is a CPR for e.g. GPU, there is an additional
CPR hardware block, so then there will also be an additional CPR OPP
table. So I don't think that this will be a problem.

> 
> - If there are no such cases, can we live without opp-hz being used
>   here and reverse-engineer the highest frequency by looking directly
>   at CPUs OPP table ? i.e. by looking at required-opps field.

This was actually my initial thought when talking to you 6+ months ago.
However, the problem was that, from the CPR drivers' perspective, it
only sees the CPR OPP table.


So this is the order things are called,
from qcom-cpufreq-nvmem.c perspective:

1) dev_pm_opp_set_supported_hw()

2) dev_pm_opp_attach_genpd() ->
which results in
int cpr_pd_attach_dev(struct generic_pm_domain *domain,
		      struct device *dev)
being called.
This callback is inside the CPR driver, and here we have the
CPU's (genpd virtual) struct device, and this is where we would like to
know the opp-hz.
The problem here is that:
[    3.114979] cpr_pd_attach_dev: dev_pm_opp_get_opp_count for dev: genpd:0:cpu0: -19
[    3.119610] cpr_pd_attach_dev: dev_pm_opp_get_opp_count for dev: cpu0: 0
[    3.126489] cpr_pd_attach_dev: dev_pm_opp_get_opp_count for dev: cpr@b018000: 3

While we have the CPR OPP table in the attach callback, we don't
have the CPU OPP table, neither in the CPU struct device or the genpd virtual
struct device.

Since we have called dev_pm_opp_attach_genpd(.., .., &virt_devs) which
attaches an OPP table to the CPU, I would have expected one of them to
be >= 0.
Especially since dev_name(virt_devs[0]) == genpd:0:cpu0

I guess it should still be possible to parse the required-opps manually here,
by iterating the OF nodes, however, we won't be able to use the CPU's struct
opp_table (which is the nice representation of the OF nodes).

Any suggestions?


Kind regards,
Niklas
