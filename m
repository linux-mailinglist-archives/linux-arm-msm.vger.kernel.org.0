Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66CC241EF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 19:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgHKRJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 13:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729063AbgHKRI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 13:08:59 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2BAC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 10:08:58 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f10so7099195plj.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 10:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U/LoGq0HIUxWR6wxEnbNNeVy3Nlv9Q8atdOZrD4e+MM=;
        b=F5iNq4K3IrZVYA2vewPWJUKEeodc1BPFfkm9Y/v3S2WH6GSz+iFHtFrldbJkdLcAcy
         ApSQSPBGA4ZfuLa1Ez2oAzfmLbILMXaKhqt8JDgoAjyzRLy8JlwHR9o0z89ILrGRbh1w
         3ZCSfULDPzXyH2yKM/pdEqJyM8h8ijwLqgZfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U/LoGq0HIUxWR6wxEnbNNeVy3Nlv9Q8atdOZrD4e+MM=;
        b=ShFxZxTnsiJpc6IFEdJapIsiI+waSo1Wsco+e/ObEfO3fMj3/sW6SxT5MWt/CXLrs6
         to3qi4wH8VOwOxsiizB1ipNZK7mSttxOZzx2GC8NR5Br1Gfbk2aBD+qi3RgZhYbPmeIR
         MUWqMdMvA+I9WWEKMhE71pw7DbqWkuFMDnV27V56qRZyYNCkLO9OatiN5KLM0cUXJp88
         jXuvE367yZcmEnSigSTZJ5Hsy1Pe1TJMbBZ9kA5fP90xd6u1R1Yc6WXv6eItT7+DGjJg
         0sl5nqO83Yv2An2gSISahUhdjkavVRC/X5RWF2t8oNJUoc9xV+kyzdobeCVFXe00dpYe
         BC7g==
X-Gm-Message-State: AOAM533H6+RVhVUVudFlmr8jaHLP5u2FNOQpQ8i2cALW4Q7AwldXVfE1
        FONVDEmZgjfFIUPGX+lz9PRl7g==
X-Google-Smtp-Source: ABdhPJxJwzuTSsWM5Dyi8lOQuxBgiSNX46Im5TDs4AWI6brl6YKffzQnnzswh7/UymLW1TBHEdtDbQ==
X-Received: by 2002:a17:90a:13c7:: with SMTP id s7mr2023781pjf.233.1597165738051;
        Tue, 11 Aug 2020 10:08:58 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id n1sm20319524pfu.2.2020.08.11.10.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 10:08:57 -0700 (PDT)
Date:   Tue, 11 Aug 2020 10:08:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     sbhanu@codeaurora.org
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, rnayak@codeaurora.org,
        Pradeep P V K <ppvk@codeaurora.org>,
        devicetree-owner@vger.kernel.org
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7180: Add bandwidth votes for
 eMMC and SDcard
Message-ID: <20200811170855.GK3191083@google.com>
References: <1595328381-29552-1-git-send-email-sbhanu@codeaurora.org>
 <20200724171018.GZ3191083@google.com>
 <7ffcb56e9e6723f4bae687e0f491cb93@codeaurora.org>
 <20200727191029.GA3191083@google.com>
 <e83f559bb8691cd602f35e3bd739e5c4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e83f559bb8691cd602f35e3bd739e5c4@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 28, 2020 at 04:49:05PM +0530, sbhanu@codeaurora.org wrote:
> On 2020-07-28 00:40, Matthias Kaehlcke wrote:
> > Hi,
> > 
> > On Mon, Jul 27, 2020 at 12:20:38PM +0530, sbhanu@codeaurora.org wrote:
> > > On 2020-07-24 22:40, Matthias Kaehlcke wrote:
> > > > Hi Shaik,
> > > >
> > > > On Tue, Jul 21, 2020 at 04:16:21PM +0530, Shaik Sajida Bhanu wrote:
> > > > > From: Pradeep P V K <ppvk@codeaurora.org>
> > > > >
> > > > > Add the bandwidth domain supporting performance state and
> > > > > the corresponding OPP tables for the sdhc device on sc7180.
> > > > >
> > > > > Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
> > > > > Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> > > > > ---
> > > > >
> > > > > Changes since V1:
> > > > > 	- Incorporated review comments by Bjorn Andersson.
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 15 +++++++++++++++
> > > > >  1 file changed, 15 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > > b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > > index 68f9894..d78a066 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > > @@ -684,6 +684,9 @@
> > > > >  			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> > > > >  					<&gcc GCC_SDCC1_AHB_CLK>;
> > > > >  			clock-names = "core", "iface";
> > > > > +			interconnects = <&aggre1_noc MASTER_EMMC &mc_virt SLAVE_EBI1>,
> > > > > +				<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_EMMC_CFG>;
> > > > > +			interconnect-names = "sdhc-ddr","cpu-sdhc";
> > > > >  			power-domains = <&rpmhpd SC7180_CX>;
> > > > >  			operating-points-v2 = <&sdhc1_opp_table>;
> > > > >
> > > > > @@ -704,11 +707,15 @@
> > > > >  				opp-100000000 {
> > > > >  					opp-hz = /bits/ 64 <100000000>;
> > > > >  					required-opps = <&rpmhpd_opp_low_svs>;
> > > > > +					opp-peak-kBps = <100000 100000>;
> > > > > +					opp-avg-kBps = <100000 50000>;
> > > > >  				};
> > > > >
> > > > >  				opp-384000000 {
> > > > >  					opp-hz = /bits/ 64 <384000000>;
> > > > >  					required-opps = <&rpmhpd_opp_svs_l1>;
> > > > > +					opp-peak-kBps = <600000 900000>;
> > > > > +					opp-avg-kBps = <261438 300000>;
> > > > >  				};
> > > > >  			};
> > > > >  		};
> > > > > @@ -2476,6 +2483,10 @@
> > > > >  			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
> > > > >  					<&gcc GCC_SDCC2_AHB_CLK>;
> > > > >  			clock-names = "core", "iface";
> > > > > +
> > > > > +			interconnects = <&aggre1_noc MASTER_SDCC_2 &mc_virt SLAVE_EBI1>,
> > > > > +				<&gem_noc MASTER_APPSS_PROC &config_noc	SLAVE_SDCC_2>;
> > > > > +			interconnect-names = "sdhc-ddr","cpu-sdhc";
> > > > >  			power-domains = <&rpmhpd SC7180_CX>;
> > > > >  			operating-points-v2 = <&sdhc2_opp_table>;
> > > > >
> > > > > @@ -2489,11 +2500,15 @@
> > > > >  				opp-100000000 {
> > > > >  					opp-hz = /bits/ 64 <100000000>;
> > > > >  					required-opps = <&rpmhpd_opp_low_svs>;
> > > > > +					opp-peak-kBps = <160000 100000>;
> > > > > +					opp-avg-kBps = <80000 50000>;
> > > > >  				};
> > > > >
> > > > >  				opp-202000000 {
> > > > >  					opp-hz = /bits/ 64 <202000000>;
> > > > >  					required-opps = <&rpmhpd_opp_svs_l1>;
> > > > > +					opp-peak-kBps = <200000	120000>;
> > > > > +					opp-avg-kBps = <100000 60000>;
> > > > >  				};
> > > > >  			};
> > > > >  		};
> > > >
> > > > Does the sdhci-msm driver actually have BW scaling support at this
> > > > point?
> > > >
> > > 
> > > yes
> > > 
> > > > There is commit 4ece9795be56 ("mmc: sdhci-msm: Add interconnect
> > > > bandwidth scaling support"), whose commit message says "make sure
> > > > interconnect driver is ready before handling interconnect scaling.".
> > > >
> > > > I haven't seen any patch adding the scaling support (supposedly by
> > > > adding dev_pm_opp_set_bw() calls?). Did I miss it? If not it seems
> > > > it would make sense to post it in a series together with this patch,
> > > > as far as I can tell this patch alone does nothing in practical terms.
> > > >
> > > > grep sdhc /sys/kernel/debug/interconnect/interconnect_summary
> > > >   8804000.sdhci                          0            0            0
> > > >   7c4000.sdhci                           0            0            0
> > > >   7c4000.sdhci                           0            0            0
> > > >   8804000.sdhci                          0            0            0
> > > >   ...
> > > 
> > > "mmc: sdhci-msm: Use OPP API to set clk/perf
> > > state"(https://lkml.org/lkml/2020/4/8/425) and "mmc: sdhci-msm: Add
> > > interconnect bandwidth scaling
> > > support"(https://lkml.org/lkml/2020/3/12/60)
> > > with these two patches scaling will be supported for sdhci-msm driver.
> > 
> > Are you testing with exactly these patches or with the ones that landed
> > upstream? At least the second one changed substantially
> > 
> > > the values  in  grep sdhc
> > > /sys/kernel/debug/interconnect/interconnect_summary will be zero
> > > during
> > > device is in suspend state...
> > 
> > Yes, I forgot to mention that I started MMC IO before looking at
> > 'interconnect_summary'.
> > 
> > > and the values in  grep sdhc
> > > /sys/kernel/debug/interconnect/interconnect_summary during device in
> > > resume
> > > state will be like the following::
> > > 
> > > cicalhost / # cat
> > > /sys/kernel/debug/interconnect/interconnect_summary | grep
> > > sdh
> > >   8804000.sdhci                          0        60000       120000
> > >   7c4000.sdhci                           0       300000       900000
> > >   7c4000.sdhci                           0       300000       900000
> > >   8804000.sdhci                          0        60000       120000
> > >   8804000.sdhci                          0       100000       200000
> > >   7c4000.sdhci                           0       261438       600000
> > >   8804000.sdhci                          0        60000       120000
> > 
> > On my system the bandwidth is never set:
> > 
> > 3.590152] sdhci_msm 7c4000.sdhci: DBG: old/new frequencies (384000000
> > Hz) are same, nothing to do
> > https://elixir.bootlin.com/linux/v5.7.8/source/drivers/opp/core.c#L847
> > 
> > This happens every time, even after the bandwith is set to 0. The
> > problem
> > seems to be that opp_table->clk doesn't change for target_freq = 0.
> > 
> > My system is based on v5.4, so it is possible that my kernel is missing
> > some
> > relevant patch from upstream.
> Hi matthias,
> 
> In order to aviod confusion this patch is continuation of the below patch::
> "mmc: sdhci-msm: Add interconnect bandwidth scaling support"
> (https://lkml.org/lkml/2020/6/9/160).

My kernel contains this patch.

As you told me in private, the patch "opp: Fix dev_pm_opp_set_rate()
to not return early" (https://patchwork.kernel.org/patch/11707003/) is
needed, which fixes exactly the problem I described.

It seems the tree you tested was not based on the maintainer tree or upstream,
please make that clear when someone reports issues. Since you said it works
for you I wasted time trying to chase down a missing patch which did not exist
(yet).
