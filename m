Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 978B11C8189
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 07:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgEGFdu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 01:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725783AbgEGFdu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 01:33:50 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0469AC061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2020 22:33:49 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q24so2129323pjd.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2020 22:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W3YxFV8VfEylJrZk8nZnCmLIBO4ug826BTPzfulQtUY=;
        b=hgr4gkw4wO51RwaZaGO9xTW2hmSiEIk8+gUQCi4sd1dL04Ju5Co8OaQ8lN4fUgHJZv
         gogTwPiz2roWWf6Wz+Y2vt+fb8GwrCLyP5BjnyzPDnnqlTNiyDhqZQiZsGfNBIzn9aUR
         quM1qGDbupSPqNHUcD1RuGx7z5nww4bW/Vi8VUHjP+r6rY+giPrzNBPPn8jsGnYn5kaK
         wSANSUojYtXuMU2dS6/RYrJL/ZZlOYPXVrC43LFGUFcSTP/TqZeG/icD07Epb6lE1rQN
         rYdh6DXDi8akHkYg3sasy+q8U8PNSukl4sHXkRAVI9Upr1JTHIMhcQPPs5r5Xty4HngU
         6Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W3YxFV8VfEylJrZk8nZnCmLIBO4ug826BTPzfulQtUY=;
        b=tgdg7OvSHAeX9e1syxbqns9B7mtPFqV6MnsZbMNGaY67xPupMaVZn2MBtXEOL341P9
         dMax3vGasXyUGTsvxo2ffNVJj4z8ETw+bZVy2pOFBe0p5qpoYZNi7+sQ47svXJyaENeb
         YX2baDDNGatGhe7lVc7pGzAfL4VVd/6KkDFtGpdCceb/LwSJlOEENqXUhdlaLdw4DEmV
         P2WfzMqagfNVNjQG5UH0NmsYt27mIUN9f180Koc9ERtHomLOPwuMO36RBBCVrXv7NRoj
         beEHgTTcNjUi2iHbxB88ydULXgT5BRj5yXkCizFEUGrXehi6raJVtiXwgnsMpXv2rw4B
         2wwg==
X-Gm-Message-State: AGi0PuYFVTBOGvLdeGzDuyp88UwkFE2etaRGkVle4IxJh2dWTKfyhbzA
        sdPyjALaR22n5VglEyxE1CzHKQ==
X-Google-Smtp-Source: APiQypLADRc7LnR2xDLXxhylGRQaJotSbwZVbinIZv0EZeNblWprbzgcvNPqpZ4JR8dnbFl//eXvGQ==
X-Received: by 2002:a17:90a:bd81:: with SMTP id z1mr13553155pjr.179.1588829628947;
        Wed, 06 May 2020 22:33:48 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h13sm3409322pfk.86.2020.05.06.22.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 22:33:48 -0700 (PDT)
Date:   Wed, 6 May 2020 22:34:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200507053435.GC3236072@builder.lan>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
 <20200402081349.GA932@gerhold.net>
 <20200403013119.GB20625@builder.lan>
 <20200403100923.GB2652@gerhold.net>
 <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200426123140.GA190483@gerhold.net>
 <20200506211801.GA165066@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506211801.GA165066@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 06 May 14:18 PDT 2020, Stephan Gerhold wrote:

Viresh, Ulf,

Stephan is trying to describe the relationship between the CPU rail and
the memory rail on db410c (where the performance state of the memory
rail needs to be kept above the performance state of the CPU supply.

The latter is modelled as a power-domain and the performance state
changes as expected, but no one enables the power-domain.

What's the appropriate method for ensuring the power-domain is
enabled/disabled as needed? Should it be referenced in the hierarchical
power domain for the CPUs perhaps?

Regards,
Bjorn

> Hi,
> 
> On Sun, Apr 26, 2020 at 02:31:48PM +0200, Stephan Gerhold wrote:
> > On Wed, Apr 22, 2020 at 09:55:06PM -0700, Bjorn Andersson wrote:
> > > On Fri 03 Apr 11:00 PDT 2020, Stephan Gerhold wrote:
> > > 
> > > > On Fri, Apr 03, 2020 at 12:09:25PM +0200, Stephan Gerhold wrote:
> > > > > On Thu, Apr 02, 2020 at 06:31:19PM -0700, Bjorn Andersson wrote:
> > > > > > On Thu 02 Apr 01:13 PDT 2020, Stephan Gerhold wrote:
> > > > > > 
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On Wed, Apr 01, 2020 at 07:50:59PM +0200, Loic Poulain wrote:
> > > > > > > > The highest cpu frequency opps have been dropped because CPR is not
> > > > > > > > supported. However, we can simply specify operating voltage so that
> > > > > > > > they match the max corner voltages for each freq. With that, we can
> > > > > > > > support up to 1.36Ghz. Ideally, msm8916 CPR should be implemented to
> > > > > > > > fine tune operating voltages and optimize power consumption.
> > > > > > > 
> > > > > > > Thanks for the patch! I was wondering how to enable the higher CPU
> > > > > > > frequencies for a while now...
> > > > > > > 
> > > > > > > I was actually quite excited to see CPR being mainlined for QCS404.
> > > > > > > If we are trying to add such a workaround (rather than CPR) for MSM8916
> > > > > > > now, does that mean it's unlikely to see CPR working for MSM8916
> > > > > > > anytime soon?
> > > > > > > 
> > > > > > > AFAICT, there is a WIP branch from Niklas Cassel here:
> > > > > > > https://git.linaro.org/people/nicolas.dechesne/niklas.cassel/kernel.git/log/?h=cpr-msm8916-mainline
> > > > > > > but it hasn't been updated for a while. (Not sure if it was working
> > > > > > > already...)
> > > > > > > 
> > > > > > > Can someone explain what is missing to make CPR work for MSM8916?
> > > > > > > 
> > > > > > 
> > > > > > CPR needs to control 3 things; VDD_APC, VDD_MX and MEMACC. On QCS404 it
> > > > > > seems we don't have to adjust VDD_MX, so the code for this is missing
> > > > > > from the driver.
> > > > > > 
> > > > > > So, afaict, what's missing is that rpmpd.c needs to gain support for
> > > > > > 8916, then the CPR driver needs to gain a cpr_acc_desc and compatible
> > > > > > for 8916, it needs to reference the VDDMX power domain and before/after
> > > > > > we're adjusting the corner of the CPR we need to adjust the MX according
> > > > > > to the mapping specified in the downstream kernel (i.e.  1->4, 2->5 and
> > > > > > 3->7).
> > > > > > 
> > > > > > 
> > > > > > Unfortunately, the requirement that VDDMX (VDD_MEM I presume) must be
> > > > > > higher than VDD_APC most likely needs to be taken into consideration for
> > > > > > Loic's proposed static voltage scaling as well. Unless VDD_MEM is left
> > > > > > in Turbo mode from the boot loader I think we need to take VDDMX to
> > > > > > corner 7 for speeds 998MHz and above (i.e. where we pull VDD_APC to
> > > > > > 1.35V).
> > > > > > 
> > > > > 
> > > > > I see! I wonder how hard it would be to add MSM8916 to rpmpd,
> > > > > looking at previous commits it's mainly setting up a few defines?
> > > > > 
> > > > > If I understand it correctly, the OPPs from rpmpd could then be
> > > > > referenced as "required-opps" in the CPU OPP table so that VDD_MX is
> > > > > scaled together with the CPU frequency, and doesn't need to stay at
> > > > > turbo mode (like in v3 from Loic) the whole time.
> > > > > 
> > > > 
> > > > I have been thinking about this some more and I think I came up with
> > > > some changes that make sense (but not entirely sure).
> > > > 
> > > > Based on the available downstream sources I guessed the defines to add
> > > > for MSM8916 to the rpmpd driver. Then I added the VDD_MX OPPs as
> > > > "required-opps" to the CPU OPP table so it would vote for the appopriate
> > > > corners (with the mapping you mentioned above).
> > > > 
> > > 
> > > I was not aware it was possible to describe the dependency between the
> > > CPU opp table and MX in this fashion. If that's the case then this looks
> > > really good and it should be straight forward to add MSM8916 support to
> > > the CPR driver as well.
> > > 
> > 
> > Indeed!
> > 
> > > > I haven't tested it yet, maybe I can get some feedback first if the code
> > > > seems reasonable or if I'm missing something obvious? :)
> > > > 
> > > 
> > > Have you tested this yet?
> > > 
> > 
> > I just did. It does not fully work, yet:
> > 
> > rpmpd_set_performance() is indeed called as necessary when switching the
> > CPU frequency. When I set 200 MHz it sets corner 3, with 533 MHz corner 4
> > and starting with 998 MHz corner 6. So far so good :)
> > 
> > However, there is never actually anything sent to the RPM. :(
> > It bails out in rpmpd_set_performance() before calling rpmpd_aggregate_corner():
> > 
> > 	/* Always send updates for vfc and vfl */
> > 	if (!pd->enabled && pd->key != KEY_FLOOR_CORNER &&
> > 	    pd->key != KEY_FLOOR_LEVEL)
> > 		goto out;
> > 
> > Seems like we just try to set performance states, but never actually
> > enable (rpmpd_power_on()) the power domain (pd->enabled == false).
> > 
> > I'm not sure which of the components involved here should handle that.
> > The OPP core when setting required OPPs, the genpd core etc.
> >
> > Any ideas?
> > 
> > Thanks,
> > Stephan
> > 
> 
> For now I have added something to qcom-cpufreq-nvmem.c to power on/enable
> the power domain (not really sure if it belongs there...):
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index a1b8238872a2..ed352ead037e 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -26,6 +26,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/smem.h>
>  
> @@ -370,10 +371,13 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>  		}
>  
>  		if (drv->data->genpd_names) {
> +			struct device **pd_dev;
> +			const char **name = drv->data->genpd_names;
> +
>  			drv->genpd_opp_tables[cpu] =
>  				dev_pm_opp_attach_genpd(cpu_dev,
>  							drv->data->genpd_names,
> -							NULL);
> +							&pd_dev);
>  			if (IS_ERR(drv->genpd_opp_tables[cpu])) {
>  				ret = PTR_ERR(drv->genpd_opp_tables[cpu]);
>  				if (ret != -EPROBE_DEFER)
> @@ -382,6 +386,12 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>  						ret);
>  				goto free_genpd_opp;
>  			}
> +
> +			while (*name) {
> +				pm_runtime_get_sync(*pd_dev);
> +				name++;
> +				pd_dev++;
> +			}
>  		}
>  	}
> 
> I really wonder why this doesn't affect CPR (or does it?).
> So far I was not able to find anything that would power on/enable
> the "cpr" power domain either. But I don't have a qcs404 to verify.
>  
> As far as I can tell from the log, the corner votes are correctly sent
> to the RPM now when the CPU frequency is changed.
> 
> However...
> 
> > > > Also: Is there a good way to validate these changes?
> > > > I suppose I could check the genpd state but that wouldn't tell me if the
> > > > corner was applied correctly. Maybe I can check the actual voltage
> > > > through the SPMI interface, hm...
> > > > 
> > > 
> > > Validating that S2 and VDD_MX changes appropriately in Linux would be a
> > > pretty good test.
> > > 
> 
> Unfortunately I was not able to see any change in the voltage of L3 yet.
> On samsung-a5u, /sys/class/regulator/<l3 spmi regulator>/microvolts
> permanently reports 1300000 uV, even after a few different corner votes.
> 
> I'm not sure if:
> 
>   - This is normal (maybe some other remoteproc has a higher vote?)
>     - I tried to disable wcnss, venus and hexagon without difference
> 
>   - I'm just missing something in the code
> 
>   - This is some peculiarity of the RPM firmware on samsung-a5u.
>     (Although that seems quite unlikely to me...)
> 
> Any ideas? :/
> 
> Thanks,
> Stephan
> 
> > > > If this seems like a good approach I can split up the changes in
> > > > reasonable patches and post it separately. For now the full diff below.
> > > > 
> > > 
> > > Please do
> > > 
> > > Regards,
> > > Bjorn
> > > 
> > > > Stephan
> > > > 
> > > >  arch/arm64/boot/dts/qcom/msm8916.dtsi  | 65 +++++++++++++++++++++++++++++-----
> > > >  drivers/cpufreq/cpufreq-dt-platdev.c   |  1 +
> > > >  drivers/cpufreq/qcom-cpufreq-nvmem.c   | 11 ++++++
> > > >  drivers/soc/qcom/rpmpd.c               | 21 +++++++++++
> > > >  include/dt-bindings/power/qcom-rpmpd.h |  7 ++++
> > > >  5 files changed, 96 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > > index b0a82447976a..5b8fce8609d0 100644
> > > > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > > @@ -10,6 +10,7 @@
> > > >  #include <dt-bindings/soc/qcom,apr.h>
> > > >  #include <dt-bindings/sound/qcom,q6afe.h>
> > > >  #include <dt-bindings/thermal/thermal.h>
> > > > +#include <dt-bindings/power/qcom-rpmpd.h>
> > > >  
> > > >  / {
> > > >  	interrupt-parent = <&intc>;
> > > > @@ -108,8 +109,8 @@ CPU0: cpu@0 {
> > > >  			cpu-supply = <&pm8916_spmi_s2>;
> > > >  			operating-points-v2 = <&cpu_opp_table>;
> > > >  			#cooling-cells = <2>;
> > > > -			power-domains = <&CPU_PD0>;
> > > > -			power-domain-names = "psci";
> > > > +			power-domains = <&CPU_PD0>, <&rpmpd MSM8916_VDDMX_AO>;
> > > > +			power-domain-names = "psci", "mx";
> > > >  		};
> > > >  
> > > >  		CPU1: cpu@1 {
> > > > @@ -122,8 +123,8 @@ CPU1: cpu@1 {
> > > >  			cpu-supply = <&pm8916_spmi_s2>;
> > > >  			operating-points-v2 = <&cpu_opp_table>;
> > > >  			#cooling-cells = <2>;
> > > > -			power-domains = <&CPU_PD1>;
> > > > -			power-domain-names = "psci";
> > > > +			power-domains = <&CPU_PD1>, <&rpmpd MSM8916_VDDMX_AO>;
> > > > +			power-domain-names = "psci", "mx";
> > > >  		};
> > > >  
> > > >  		CPU2: cpu@2 {
> > > > @@ -136,8 +137,8 @@ CPU2: cpu@2 {
> > > >  			cpu-supply = <&pm8916_spmi_s2>;
> > > >  			operating-points-v2 = <&cpu_opp_table>;
> > > >  			#cooling-cells = <2>;
> > > > -			power-domains = <&CPU_PD2>;
> > > > -			power-domain-names = "psci";
> > > > +			power-domains = <&CPU_PD2>, <&rpmpd MSM8916_VDDMX_AO>;
> > > > +			power-domain-names = "psci", "mx";
> > > >  		};
> > > >  
> > > >  		CPU3: cpu@3 {
> > > > @@ -150,8 +151,8 @@ CPU3: cpu@3 {
> > > >  			cpu-supply = <&pm8916_spmi_s2>;
> > > >  			operating-points-v2 = <&cpu_opp_table>;
> > > >  			#cooling-cells = <2>;
> > > > -			power-domains = <&CPU_PD3>;
> > > > -			power-domain-names = "psci";
> > > > +			power-domains = <&CPU_PD3>, <&rpmpd MSM8916_VDDMX_AO>;
> > > > +			power-domain-names = "psci", "mx";
> > > >  		};
> > > >  
> > > >  		L2_0: l2-cache {
> > > > @@ -343,40 +344,52 @@ modem_alert0: trip-point@0 {
> > > >  	};
> > > >  
> > > >  	cpu_opp_table: cpu_opp_table {
> > > > -		compatible = "operating-points-v2";
> > > > +		/*
> > > > +		 * FIXME: The naming here is really weird, since MSM8916 does
> > > > +		 * not have kyro. Maybe we should add a more generic compatible?
> > > > +		 */
> > > > +		compatible = "operating-points-v2-kryo-cpu";
> > > >  		opp-shared;
> > > >  
> > > >  		opp-200000000 {
> > > >  			opp-hz = /bits/ 64 <200000000>;
> > > >  			opp-microvolt = <1050000>;
> > > > +			required-opps = <&rpmpd_opp_svs_soc>;
> > > >  		};
> > > >  		opp-400000000 {
> > > >  			opp-hz = /bits/ 64 <400000000>;
> > > >  			opp-microvolt = <1050000>;
> > > > +			required-opps = <&rpmpd_opp_svs_soc>;
> > > >  		};
> > > >  		opp-533330000 {
> > > >  			opp-hz = /bits/ 64 <533330000>;
> > > >  			opp-microvolt = <1150000>;
> > > > +			required-opps = <&rpmpd_opp_nom>;
> > > >  		};
> > > >  		opp-800000000 {
> > > >  			opp-hz = /bits/ 64 <800000000>;
> > > >  			opp-microvolt = <1150000>;
> > > > +			required-opps = <&rpmpd_opp_nom>;
> > > >  		};
> > > >  		opp-998400000 {
> > > >  			opp-hz = /bits/ 64 <998400000>;
> > > >  			opp-microvolt = <1350000>;
> > > > +			required-opps = <&rpmpd_opp_super_turbo>;
> > > >  		};
> > > >  		opp-1094400000 {
> > > >  			opp-hz = /bits/ 64 <1094400000>;
> > > >  			opp-microvolt = <1350000>;
> > > > +			required-opps = <&rpmpd_opp_super_turbo>;
> > > >  		};
> > > >  		opp-1152000000 {
> > > >  			opp-hz = /bits/ 64 <1152000000>;
> > > >  			opp-microvolt = <1350000>;
> > > > +			required-opps = <&rpmpd_opp_super_turbo>;
> > > >  		};
> > > >  		opp-1209600000 {
> > > >  			opp-hz = /bits/ 64 <1209600000>;
> > > >  			opp-microvolt = <1350000>;
> > > > +			required-opps = <&rpmpd_opp_super_turbo>;
> > > >  		};
> > > >  	};
> > > >  
> > > > @@ -1710,6 +1723,40 @@ rpmcc: qcom,rpmcc {
> > > >  					#clock-cells = <1>;
> > > >  				};
> > > >  
> > > > +				rpmpd: power-controller {
> > > > +					compatible = "qcom,msm8916-rpmpd";
> > > > +					#power-domain-cells = <1>;
> > > > +					operating-points-v2 = <&rpmpd_opp_table>;
> > > > +
> > > > +					rpmpd_opp_table: opp-table {
> > > > +						compatible = "operating-points-v2";
> > > > +
> > > > +						rpmpd_opp_ret: opp1 {
> > > > +							opp-level = <1>;
> > > > +						};
> > > > +
> > > > +						rpmpd_opp_svs: opp2 {
> > > > +							opp-level = <2>;
> > > > +						};
> > > > +
> > > > +						rpmpd_opp_svs_soc: opp3 {
> > > > +							opp-level = <3>;
> > > > +						};
> > > > +
> > > > +						rpmpd_opp_nom: opp4 {
> > > > +							opp-level = <4>;
> > > > +						};
> > > > +
> > > > +						rpmpd_opp_turbo: opp5 {
> > > > +							opp-level = <5>;
> > > > +						};
> > > > +
> > > > +						rpmpd_opp_super_turbo: opp6 {
> > > > +							opp-level = <6>;
> > > > +						};
> > > > +					};
> > > > +				};
> > > > +
> > > >  				smd_rpm_regulators: pm8916-regulators {
> > > >  					compatible = "qcom,rpm-pm8916-regulators";
> > > >  
> > > > diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> > > > index f2ae9cd455c1..b0f6bd0fffc1 100644
> > > > --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> > > > +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> > > > @@ -128,6 +128,7 @@ static const struct of_device_id blacklist[] __initconst = {
> > > >  	{ .compatible = "nvidia,tegra210", },
> > > >  
> > > >  	{ .compatible = "qcom,apq8096", },
> > > > +	{ .compatible = "qcom,msm8916", },
> > > >  	{ .compatible = "qcom,msm8996", },
> > > >  	{ .compatible = "qcom,qcs404", },
> > > >  
> > > > diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > > > index f0d2d5035413..c77a30349d08 100644
> > > > --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > > > +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > > > @@ -129,6 +129,16 @@ static const struct qcom_cpufreq_match_data match_data_kryo = {
> > > >  	.get_version = qcom_cpufreq_kryo_name_version,
> > > >  };
> > > >  
> > > > +static const char *msm8916_genpd_names[] = { "mx", NULL };
> > > > +
> > > > +static const struct qcom_cpufreq_match_data match_data_msm8916 = {
> > > > +	/*
> > > > +	 * FIXME: Might need to implement .get_version here to handle
> > > > +	 * different frequencies depending on speedbin/pvs version.
> > > > +	 */
> > > > +	.genpd_names = msm8916_genpd_names,
> > > > +};
> > > > +
> > > >  static const char *qcs404_genpd_names[] = { "cpr", NULL };
> > > >  
> > > >  static const struct qcom_cpufreq_match_data match_data_qcs404 = {
> > > > @@ -301,6 +311,7 @@ static struct platform_driver qcom_cpufreq_driver = {
> > > >  
> > > >  static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
> > > >  	{ .compatible = "qcom,apq8096", .data = &match_data_kryo },
> > > > +	{ .compatible = "qcom,msm8916", .data = &match_data_msm8916 },
> > > >  	{ .compatible = "qcom,msm8996", .data = &match_data_kryo },
> > > >  	{ .compatible = "qcom,qcs404", .data = &match_data_qcs404 },
> > > >  	{},
> > > > diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> > > > index 2b1834c5609a..192ba9099964 100644
> > > > --- a/drivers/soc/qcom/rpmpd.c
> > > > +++ b/drivers/soc/qcom/rpmpd.c
> > > > @@ -115,6 +115,26 @@ struct rpmpd_desc {
> > > >  
> > > >  static DEFINE_MUTEX(rpmpd_lock);
> > > >  
> > > > +/* msm8916 RPM Power Domains */
> > > > +DEFINE_RPMPD_PAIR(msm8916, vddcx, vddcx_ao, SMPA, CORNER, 1);
> > > > +DEFINE_RPMPD_PAIR(msm8916, vddmx, vddmx_ao, LDOA, CORNER, 3);
> > > > +
> > > > +DEFINE_RPMPD_VFC(msm8916, vddcx_vfc, SMPA, 1);
> > > > +
> > > > +static struct rpmpd *msm8916_rpmpds[] = {
> > > > +	[MSM8916_VDDCX] =	&msm8916_vddcx,
> > > > +	[MSM8916_VDDCX_AO] =	&msm8916_vddcx_ao,
> > > > +	[MSM8916_VDDCX_VFC] =	&msm8916_vddcx_vfc,
> > > > +	[MSM8916_VDDMX] =	&msm8916_vddmx,
> > > > +	[MSM8916_VDDMX_AO] =	&msm8916_vddmx_ao,
> > > > +};
> > > > +
> > > > +static const struct rpmpd_desc msm8916_desc = {
> > > > +	.rpmpds = msm8916_rpmpds,
> > > > +	.num_pds = ARRAY_SIZE(msm8916_rpmpds),
> > > > +	.max_state = MAX_8996_RPMPD_STATE,
> > > > +};
> > > > +
> > > >  /* msm8976 RPM Power Domains */
> > > >  DEFINE_RPMPD_PAIR(msm8976, vddcx, vddcx_ao, SMPA, LEVEL, 2);
> > > >  DEFINE_RPMPD_PAIR(msm8976, vddmx, vddmx_ao, SMPA, LEVEL, 6);
> > > > @@ -220,6 +240,7 @@ static const struct rpmpd_desc qcs404_desc = {
> > > >  };
> > > >  
> > > >  static const struct of_device_id rpmpd_match_table[] = {
> > > > +	{ .compatible = "qcom,msm8916-rpmpd", .data = &msm8916_desc },
> > > >  	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
> > > >  	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
> > > >  	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
> > > > diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> > > > index 3f74096d5a7c..70d304a2deae 100644
> > > > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > > > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > > > @@ -51,6 +51,13 @@
> > > >  #define RPMH_REGULATOR_LEVEL_TURBO	384
> > > >  #define RPMH_REGULATOR_LEVEL_TURBO_L1	416
> > > >  
> > > > +/* MSM8916 Power Domain Indexes */
> > > > +#define MSM8916_VDDCX		0
> > > > +#define MSM8916_VDDCX_AO	1
> > > > +#define MSM8916_VDDCX_VFC	2
> > > > +#define MSM8916_VDDMX		3
> > > > +#define MSM8916_VDDMX_AO	4
> > > > +
> > > >  /* MSM8976 Power Domain Indexes */
> > > >  #define MSM8976_VDDCX		0
> > > >  #define MSM8976_VDDCX_AO	1
