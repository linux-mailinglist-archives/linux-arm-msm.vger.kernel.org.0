Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C08C16098FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 06:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiJXEBw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 00:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiJXEBv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 00:01:51 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1256A531
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Oct 2022 21:01:49 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f23so7480100plr.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Oct 2022 21:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zkSiz3crf2T+ikAMcFUJLUknPn5PUxv2vZ/hh7siBZ4=;
        b=l+Q97JnNAQ06zAHzXqbTdRWx1QLTeWV7R190V3pPlPg+HC3DM7dF1gB8qWLiFtq+uP
         IFGgiK2TxfZ+jJ4rCpzUiK9kJJFXW6CejOx32JbEIwzVRCOU29fswh2a0GoE8AH0fhmT
         AbTYnU72zgJMxm/Wpu1K25gITMoPe+i9VGprgkPcMDnwJsGAAbzGxFQAMtecOLQQk9r8
         GeD07LwHZnz/1gJ7nj8CeLuvFccIxkgIaa9dDTpkOX1fCgVH0gNmd6qYf2+QDoTpclfQ
         bfyK7ylD0Pl+9271W65/vqvHCYxTY7PqZrl/VHvL6jn1lh+dPxdR0YDs8x05UxDO2Yyh
         tung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkSiz3crf2T+ikAMcFUJLUknPn5PUxv2vZ/hh7siBZ4=;
        b=hpN9fy5ZBMz5ZckJzkQONIczr/JIKC7ijiYWJVo+pCm48I02ZYiYjJUooDgW+LSqn7
         Uxo1SQiW2A4WI9CvMfGnMip0EVS7TSFJq8mT+poUJ7Yy9aXBvxks/mvqoiAOzkd/aMpW
         ildNWR6AfYF55qTqbj16KnmOVvF5qjUNv5bkohUOpAKxVAFjULANOEch86BHKfORzWuP
         A6RbK2VWO3BDhJFD3KvRTLwbtpenH31l7KIOg/tJ+mkQ5l3LRxR7zIm7pTfPvLWr2RIz
         nMGoRHqy/x1ylvPsrJjM7lqolqxNReDyVTinR/XMWkR8vDXRkWQzAh65F+xMgcDRl3RG
         yvSA==
X-Gm-Message-State: ACrzQf0LrhYExC8qaiNZqhfRbcwECqISn/ZGwgUTDL8UFORz17oJd/Mm
        A6MOtVjABhuIfy6SE4JfPA8P
X-Google-Smtp-Source: AMsMyM6izrD95VKfxNC49/7xFe9LascYp5uSU5dAjgNEqhZo/P5Q0QG8IvRmkPuP/P6kq22u256/WA==
X-Received: by 2002:a17:90b:4d0c:b0:20b:c983:2d85 with SMTP id mw12-20020a17090b4d0c00b0020bc9832d85mr72770137pjb.45.1666584108931;
        Sun, 23 Oct 2022 21:01:48 -0700 (PDT)
Received: from thinkpad ([117.193.210.252])
        by smtp.gmail.com with ESMTPSA id 5-20020a630205000000b00442c70b659esm16520472pgc.91.2022.10.23.21.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 21:01:47 -0700 (PDT)
Date:   Mon, 24 Oct 2022 09:31:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        viresh.kumar@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        rafael@kernel.org, robh+dt@kernel.org, johan@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/4] cpufreq: qcom-hw: Add CPU clock provider support
Message-ID: <20221024040140.GA221610@thinkpad>
References: <20221019135925.366162-1-manivannan.sadhasivam@linaro.org>
 <20221019135925.366162-4-manivannan.sadhasivam@linaro.org>
 <b88de305-cb1f-7251-ccb8-4ea3b62bc322@linaro.org>
 <20221021093140.GC93287@thinkpad>
 <20221024030648.dthglkkcy5wtziwd@baldur>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221024030648.dthglkkcy5wtziwd@baldur>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 23, 2022 at 10:06:48PM -0500, Bjorn Andersson wrote:
> On Fri, Oct 21, 2022 at 03:01:40PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Oct 20, 2022 at 08:39:50AM +0300, Dmitry Baryshkov wrote:
> > > On 19/10/2022 16:59, Manivannan Sadhasivam wrote:
> > > > Qcom CPUFreq hardware (EPSS/OSM) controls clock and voltage to the CPU
> > > > cores. But this relationship is not represented with the clk framework
> > > > so far.
> > > > 
> > > > So, let's make the qcom-cpufreq-hw driver a clock provider. This makes the
> > > > clock producer/consumer relationship cleaner and is also useful for CPU
> > > > related frameworks like OPP to know the frequency at which the CPUs are
> > > > running.
> > > > 
> > > > The clock frequency provided by the driver is for each CPU policy. We
> > > > cannot get the frequency of each CPU core because, not all platforms
> > > > support per-core DCVS feature.
> > > > 
> > > > Also the frequency supplied by the driver is the actual frequency that
> > > > comes out of the EPSS/OSM block after the DCVS operation. This frequency is
> > > > not same as what the CPUFreq framework has set but it is the one that gets
> > > > supplied to the CPUs after throttling by LMh.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >   drivers/cpufreq/qcom-cpufreq-hw.c | 67 +++++++++++++++++++++++++++++--
> > > >   1 file changed, 63 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> > > > index a5b3b8d0e164..4dd710f9fb69 100644
> > > > --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> > > > +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> > > > @@ -4,6 +4,7 @@
> > > >    */
> > > >   #include <linux/bitfield.h>
> > > > +#include <linux/clk-provider.h>
> > > >   #include <linux/cpufreq.h>
> > > >   #include <linux/init.h>
> > > >   #include <linux/interconnect.h>
> > > > @@ -54,6 +55,7 @@ struct qcom_cpufreq_data {
> > > >   	bool cancel_throttle;
> > > >   	struct delayed_work throttle_work;
> > > >   	struct cpufreq_policy *policy;
> > > > +	struct clk_hw cpu_clk;
> > > >   	bool per_core_dcvs;
> > > >   };
> > > > @@ -482,6 +484,54 @@ static void qcom_cpufreq_hw_lmh_exit(struct qcom_cpufreq_data *data)
> > > >   	free_irq(data->throttle_irq, data);
> > > >   }
> > > > +static unsigned long qcom_cpufreq_hw_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> > > > +{
> > > > +	struct qcom_cpufreq_data *data = container_of(hw, struct qcom_cpufreq_data, cpu_clk);
> > > > +
> > > > +	return qcom_lmh_get_throttle_freq(data) / HZ_PER_KHZ;
> > > > +}
> > > > +
> > > > +static const struct clk_ops qcom_cpufreq_hw_clk_ops = {
> > > > +	.recalc_rate = qcom_cpufreq_hw_recalc_rate,
> > > > +};
> > > > +
> > > > +static int qcom_cpufreq_hw_clk_add(struct qcom_cpufreq_data *data, u32 index)
> > > > +{
> > > > +	struct platform_device *pdev = cpufreq_get_driver_data();
> > > > +	struct device *dev = &pdev->dev;
> > > > +	char *clk_name = devm_kasprintf(dev, GFP_KERNEL, "qcom_cpufreq%d", index);
> > > > +	static struct clk_init_data init = {};
> > > > +	int ret;
> > > > +
> > > > +	init.name = clk_name;
> > > > +	init.flags = CLK_GET_RATE_NOCACHE;
> > > > +	init.ops = &qcom_cpufreq_hw_clk_ops;
> > > > +	data->cpu_clk.init = &init;
> > > > +
> > > > +	ret = clk_hw_register(dev, &data->cpu_clk);
> > > > +	if (ret < 0) {
> > > > +		dev_err(dev, "Failed to register Qcom CPUFreq clock\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get, &data->cpu_clk);
> > > 
> > > This doesn't look corresponding to the DT bindings you are adding.
> > > of_clk_hw_simple_get() would return a single clock per dt node, whichever
> > > arguments were passed, while you are adding clocks correspoding to CPU
> > > clusters.
> > > 
> > > From what I see according to the bindings, you should register a single
> > > provider using the of_clk_hw_onecell_get() function.
> > > 
> > 
> > Well, that won't work either :( The detail that I missed in first place is
> > that the clock providers are added for the same DT node for each policy. So
> > there is a single clock under the clock provider for a policy but they all
> > belong to the same DT node.
> > 
> > This works when a clk provider gets added and then followed by "clk_get()"
> > (that's what happening during the ->init() callback). But each time a new
> > provider gets added, it is replacing the old for the same DT node.
> > 
> > The problem here is, we do not know how many policys are going to be there
> > during the probe time. I'll think about a proper solution and update.
> > 
> 
> You could get this by looping over all the cpus and count how many
> unique qcom,freq-domains you have.
> 

I just counted the number of "freq-domainX" register spaces defined in cpufreq
node and used that as the domain count.

> But it seems like a bigger problem is that you need to register your
> clock "provider" at a device-level, rather than a policy level. I did
> some experiments with moving most of the resource management to probe
> and it did look quite promising, but in the end I figured out a shorter
> path to per-core frequency voting and threw that code out again.
> 
> It seems however that this would be a good idea to pick up.
> 

This is what exactly I've done now (not posted yet). Moving the resource
management is indeed the correct way since the resources are static and not
tied to the CPUs. Plus it allows us to use devm_ helpers for tieing all the
resources to the device.

> 
> Beyond resolving Viresh request though, we have the problem that on
> SM8350 and SC8280XP (at least), the L3 cache is controlled by per-core
> registers residing in the register blocks hogged by the cpufreq driver,
> and is configured in unit of Hz. So we can't directly use the osm-l3
> model - without hacking up the drivers to allow for overlapping ioremap.
> 
> We could probably extend the cpufreq driver to express this as a path
> between each core and the L3 cache and just ignore the unit (kBps vs Hz)
> (i.e.  duplicate osm-l3 in the cpufreq driver).
> But it doesn't seem unreasonable to me to express this as a clock per
> CPU and just add another opp-hz value to the opp-table, now that this is
> supported.
> 
> This design would also allow for profiling based mechanisms to pick
> these clocks up and issue clk_set_rate(), if such mechanisms would be
> desirable.
> 

This sounds reasonable to me. Let's discuss this offline and come up with a
design.

Thanks,
Mani

> Regards,
> Bjorn

-- 
மணிவண்ணன் சதாசிவம்
