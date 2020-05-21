Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0191DD704
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 21:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730472AbgEUTST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 15:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730451AbgEUTSS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 15:18:18 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5E0C061A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 12:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590088694;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=bWf1mR/GpsJdh9b3Dgo1DbFPgKVtVRZJ3/BYUfDJkr4=;
        b=MifMoORrlTrIrGH8PfxAu7Qpia65Vzleoc3De7uz9MmVK1sQ1lUfjHLmOeiizVk0Jb
        WpKKIvLcwhID0zR/0UP0ONwTEz4EVhu/xBN2YgHBbdJOZyDat2JJ+QIgexJO2LpfLgj9
        Jt9jESz1fFa78Os7LRHqYw+0CY0hWT0Qt/LT1eJridIj8vy4prcTKylg23nQlJ/sLNbi
        xhIL5GzMm+9z81v8ac430/dol06txPRObRq07zLUChcl55PK9qgmubAHyDykEZTFZ530
        Hj2mVyKQsVXoCIowbvembOsBehaqOPiqTuNi+dXfd+e9MWzcBDu3weYvc29pzCgD/9Qw
        Cj+A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Ic/NBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.7.0 DYNA|AUTH)
        with ESMTPSA id C07db0w4LJIEDg6
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 21 May 2020 21:18:14 +0200 (CEST)
Date:   Thu, 21 May 2020 21:18:09 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200521191809.GA253181@gerhold.net>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
 <20200402081349.GA932@gerhold.net>
 <20200403013119.GB20625@builder.lan>
 <20200403100923.GB2652@gerhold.net>
 <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200426123140.GA190483@gerhold.net>
 <20200506211801.GA165066@gerhold.net>
 <20200507104603.GA581328@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507104603.GA581328@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 07, 2020 at 12:46:08PM +0200, Stephan Gerhold wrote:
> On Wed, May 06, 2020 at 11:18:07PM +0200, Stephan Gerhold wrote:
> > Hi,
> > 
> > On Sun, Apr 26, 2020 at 02:31:48PM +0200, Stephan Gerhold wrote:
> > > On Wed, Apr 22, 2020 at 09:55:06PM -0700, Bjorn Andersson wrote:
> > > > On Fri 03 Apr 11:00 PDT 2020, Stephan Gerhold wrote:
> > > > 
> > > > > On Fri, Apr 03, 2020 at 12:09:25PM +0200, Stephan Gerhold wrote:
> > > > > > On Thu, Apr 02, 2020 at 06:31:19PM -0700, Bjorn Andersson wrote:
> > > > > > > On Thu 02 Apr 01:13 PDT 2020, Stephan Gerhold wrote:
> > > > > > > 
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > On Wed, Apr 01, 2020 at 07:50:59PM +0200, Loic Poulain wrote:
> > > > > > > > > The highest cpu frequency opps have been dropped because CPR is not
> > > > > > > > > supported. However, we can simply specify operating voltage so that
> > > > > > > > > they match the max corner voltages for each freq. With that, we can
> > > > > > > > > support up to 1.36Ghz. Ideally, msm8916 CPR should be implemented to
> > > > > > > > > fine tune operating voltages and optimize power consumption.
> > > > > > > > 
> > > > > > > > Thanks for the patch! I was wondering how to enable the higher CPU
> > > > > > > > frequencies for a while now...
> > > > > > > > 
> > > > > > > > I was actually quite excited to see CPR being mainlined for QCS404.
> > > > > > > > If we are trying to add such a workaround (rather than CPR) for MSM8916
> > > > > > > > now, does that mean it's unlikely to see CPR working for MSM8916
> > > > > > > > anytime soon?
> > > > > > > > 
> > > > > > > > AFAICT, there is a WIP branch from Niklas Cassel here:
> > > > > > > > https://git.linaro.org/people/nicolas.dechesne/niklas.cassel/kernel.git/log/?h=cpr-msm8916-mainline
> > > > > > > > but it hasn't been updated for a while. (Not sure if it was working
> > > > > > > > already...)
> > > > > > > > 
> > > > > > > > Can someone explain what is missing to make CPR work for MSM8916?
> > > > > > > > 
> > > > > > > 
> > > > > > > CPR needs to control 3 things; VDD_APC, VDD_MX and MEMACC. On QCS404 it
> > > > > > > seems we don't have to adjust VDD_MX, so the code for this is missing
> > > > > > > from the driver.
> > > > > > > 
> > > > > > > So, afaict, what's missing is that rpmpd.c needs to gain support for
> > > > > > > 8916, then the CPR driver needs to gain a cpr_acc_desc and compatible
> > > > > > > for 8916, it needs to reference the VDDMX power domain and before/after
> > > > > > > we're adjusting the corner of the CPR we need to adjust the MX according
> > > > > > > to the mapping specified in the downstream kernel (i.e.  1->4, 2->5 and
> > > > > > > 3->7).
> > > > > > > 
> > > > > > > 
> > > > > > > Unfortunately, the requirement that VDDMX (VDD_MEM I presume) must be
> > > > > > > higher than VDD_APC most likely needs to be taken into consideration for
> > > > > > > Loic's proposed static voltage scaling as well. Unless VDD_MEM is left
> > > > > > > in Turbo mode from the boot loader I think we need to take VDDMX to
> > > > > > > corner 7 for speeds 998MHz and above (i.e. where we pull VDD_APC to
> > > > > > > 1.35V).
> > > > > > > 
> > > > > > 
> > > > > > I see! I wonder how hard it would be to add MSM8916 to rpmpd,
> > > > > > looking at previous commits it's mainly setting up a few defines?
> > > > > > 
> > > > > > If I understand it correctly, the OPPs from rpmpd could then be
> > > > > > referenced as "required-opps" in the CPU OPP table so that VDD_MX is
> > > > > > scaled together with the CPU frequency, and doesn't need to stay at
> > > > > > turbo mode (like in v3 from Loic) the whole time.
> > > > > > 
> > > > > 
> > > > > I have been thinking about this some more and I think I came up with
> > > > > some changes that make sense (but not entirely sure).
> > > > > 
> > > > > Based on the available downstream sources I guessed the defines to add
> > > > > for MSM8916 to the rpmpd driver. Then I added the VDD_MX OPPs as
> > > > > "required-opps" to the CPU OPP table so it would vote for the appopriate
> > > > > corners (with the mapping you mentioned above).
> > > > > 
> > > > 
> > > > I was not aware it was possible to describe the dependency between the
> > > > CPU opp table and MX in this fashion. If that's the case then this looks
> > > > really good and it should be straight forward to add MSM8916 support to
> > > > the CPR driver as well.
> > > > 
> > > 
> > > Indeed!
> > > 
> > > > > I haven't tested it yet, maybe I can get some feedback first if the code
> > > > > seems reasonable or if I'm missing something obvious? :)
> > > > > 
> > > > 
> > > > Have you tested this yet?
> > > > 
> > > 
> > > I just did. It does not fully work, yet:
> > > 
> > > rpmpd_set_performance() is indeed called as necessary when switching the
> > > CPU frequency. When I set 200 MHz it sets corner 3, with 533 MHz corner 4
> > > and starting with 998 MHz corner 6. So far so good :)
> > > 
> > > However, there is never actually anything sent to the RPM. :(
> > > It bails out in rpmpd_set_performance() before calling rpmpd_aggregate_corner():
> > > 
> > > 	/* Always send updates for vfc and vfl */
> > > 	if (!pd->enabled && pd->key != KEY_FLOOR_CORNER &&
> > > 	    pd->key != KEY_FLOOR_LEVEL)
> > > 		goto out;
> > > 
> > > Seems like we just try to set performance states, but never actually
> > > enable (rpmpd_power_on()) the power domain (pd->enabled == false).
> > > 
> > > I'm not sure which of the components involved here should handle that.
> > > The OPP core when setting required OPPs, the genpd core etc.
> > >
> > > Any ideas?
> > > 
> > > Thanks,
> > > Stephan
> > > 
> > 
> > For now I have added something to qcom-cpufreq-nvmem.c to power on/enable
> > the power domain (not really sure if it belongs there...):
> > 
> > diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > index a1b8238872a2..ed352ead037e 100644
> > --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> >  #include <linux/pm_opp.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/slab.h>
> >  #include <linux/soc/qcom/smem.h>
> >  
> > @@ -370,10 +371,13 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
> >  		}
> >  
> >  		if (drv->data->genpd_names) {
> > +			struct device **pd_dev;
> > +			const char **name = drv->data->genpd_names;
> > +
> >  			drv->genpd_opp_tables[cpu] =
> >  				dev_pm_opp_attach_genpd(cpu_dev,
> >  							drv->data->genpd_names,
> > -							NULL);
> > +							&pd_dev);
> >  			if (IS_ERR(drv->genpd_opp_tables[cpu])) {
> >  				ret = PTR_ERR(drv->genpd_opp_tables[cpu]);
> >  				if (ret != -EPROBE_DEFER)
> > @@ -382,6 +386,12 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
> >  						ret);
> >  				goto free_genpd_opp;
> >  			}
> > +
> > +			while (*name) {
> > +				pm_runtime_get_sync(*pd_dev);
> > +				name++;
> > +				pd_dev++;
> > +			}
> >  		}
> >  	}
> > 
> > I really wonder why this doesn't affect CPR (or does it?).
> > So far I was not able to find anything that would power on/enable
> > the "cpr" power domain either. But I don't have a qcs404 to verify.
> >  
> > As far as I can tell from the log, the corner votes are correctly sent
> > to the RPM now when the CPU frequency is changed.
> > 
> > However...
> > 
> > > > > Also: Is there a good way to validate these changes?
> > > > > I suppose I could check the genpd state but that wouldn't tell me if the
> > > > > corner was applied correctly. Maybe I can check the actual voltage
> > > > > through the SPMI interface, hm...
> > > > > 
> > > > 
> > > > Validating that S2 and VDD_MX changes appropriately in Linux would be a
> > > > pretty good test.
> > > > 
> > 
> > Unfortunately I was not able to see any change in the voltage of L3 yet.
> > On samsung-a5u, /sys/class/regulator/<l3 spmi regulator>/microvolts
> > permanently reports 1300000 uV, even after a few different corner votes.
> > 
> > I'm not sure if:
> > 
> >   - This is normal (maybe some other remoteproc has a higher vote?)
> >     - I tried to disable wcnss, venus and hexagon without difference
> > 
> >   - I'm just missing something in the code
> > 
> >   - This is some peculiarity of the RPM firmware on samsung-a5u.
> >     (Although that seems quite unlikely to me...)
> > 
> > Any ideas? :/
> > 
> 
> I just tried the same on the downstream kernel for samsung-a5u.
> There the L3 voltage doesn't change either, it stays on 1300000 uV
> permanently. So more likely would be either "this is normal" or
> "This is some peculiarity of the RPM firmware on samsung-a5u".
> 
> I don't have a DB410c available for testing, but I'm curious if it would
> work correctly there. So far I have been unable to find any obvious
> mistake in my changes.
> 
> I'm attaching the full diff (including Loic's changes) in case someone
> wants to test this on the DB410c (or some other MSM8916 device).
> Basically you need to:
> 
>   1. CONFIG_QCOM_RPMPD=y
>      CONFIG_ARM_QCOM_CPUFREQ_NVMEM=y
>   2. Run it and change CPU frequencies a bit
>      (either with an automatic CPU governor, or by setting speeds
>       manually with powersave/performance/userspace)
>   3. There should be "set performance state" messages in dmesg
>      for the VDD_MX corner votes
>   4. Identify the spmi l3 regulator using /sys/class/regulator/*/name
>   5. Check the reported voltage in /sys/class/regulator/.../microvolts
> 
> For me it stays on 1300000 uV, permanently. :(
> 

I recently bought another device that does not have signature checks
enabled. For now I have tested with the original firmware there:

With or without my changes it stays at 1287500 uV permanently.
At least this seems somewhat more realistic since this is the
"super turbo" voltage.

I tried disabling various things in case they affect this somehow:
WCNSS in particular sets 1287500 uV for pm8916_l3.
But even with WCNSS disabled, even with the regulator constraints
removed for pm8916_l3 and all changes reverted - it keeps reporting
1287500 uV through the SPMI interface, no matter which CPU frequency
is selected.

This is even more confusing because l3 is still at nominal voltage
(1150000 uV) in the lk bootloader. (I ported a part of the mainline
spmi_regulator driver to lk so I can dump the voltages from there...)
Somehow it gets changed when Linux is booted. Very confusing.

Unlike on my previous test device, testing on downstream was successful:

  - CPU frequency 200MHz - 800MHz results into 1150000 uV
    reported as voltage for l3 through the SPMI interface (corner 4/5)
  - Higher CPU frequencies result into 1287500 uV (corner 7)

Again I ported the spmi_regulator driver from mainline to downstream,
so the way the voltage is read should be the same.

Clearly something must be different/missing in my changes,
but I still have no idea what exactly.
Any suggestions would be highly appreciated :)

Thanks,
Stephan

PS: Does someone know if the RPM firmware on MSM8916 is usually
device-specific? After some funny re-partitioning I managed to get
PSCI working on this device by flashing the HYP/TZ firmware from DB410c.

I was considering also flashing the RPM firmware from DB410c,
but not entirely sure if that would be safe. (Any voltages hardcoded there?)
