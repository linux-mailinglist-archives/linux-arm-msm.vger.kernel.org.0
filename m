Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE69672C93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 00:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjARX0y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 18:26:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjARX0w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 18:26:52 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78E63ABB;
        Wed, 18 Jan 2023 15:26:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 2D6B2CE1FB8;
        Wed, 18 Jan 2023 23:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CA7C433D2;
        Wed, 18 Jan 2023 23:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674084403;
        bh=8d1A2BxJW5rS016farIIlfZ6gGApcbtBGmhfLRei50c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lTsyzwxr4kKlJQkqmKYgS12o1/lylWp1okCa1EKPJLjHnS9IgycIXqGkZW1z/7X0c
         R8gXn6Dv3O1+NN0rqERm9VSchiCKFD52LTbzDeu7fIrUZg7Iub0Et+I0ZR5qdj7b6Y
         H145SbVnm/tM5bLDwzdtUsw3uMg83hYElZbm/TWofpeLrDIy3UBj95Wd2QHkbQtfi7
         MXRW1iG55dn+6/FYZevBHHofKQStsunJ0liWGSWhNW1ZSq1GDOGpVEJW27XeuMIF6n
         ZWa+xjmptMIxpBvWezIu++AbFZntBLdPhtg8E1W/tLWsp+QgPPxSY8ghlYkH3g/ijv
         wn32XF5GIVFMg==
Date:   Wed, 18 Jan 2023 17:26:40 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Vincent Guittot <vincent.guittot@linaro.org>,
        dmitry.baryshkov@linaro.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, danny@kdrag0n.dev
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: correct dynamic power
 coefficients
Message-ID: <20230118232640.qfyuy5n4x33yttup@builder.lan>
References: <20230106164618.1845281-1-vincent.guittot@linaro.org>
 <20230106182849.kr47mdgokd4qa6zw@builder.lan>
 <CAKfTPtBJHWfhXCGojZSvS_DM4+bJnQ9j1GwtE5_YYJFHq9cpRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtBJHWfhXCGojZSvS_DM4+bJnQ9j1GwtE5_YYJFHq9cpRA@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 09, 2023 at 06:02:29PM +0100, Vincent Guittot wrote:
> On Fri, 6 Jan 2023 at 19:28, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Fri, Jan 06, 2023 at 05:46:18PM +0100, Vincent Guittot wrote:
> >
> > Seems like using get_maintainer.pl would have saved you some trouble ;)
> 
> The worst is that I used it but only checked names and not emails
> when I reused the list of the original patch :-(
> 

:)

> >
> > > While stressing EAS on my dragonboard RB3, I have noticed that LITTLE cores
> > > where never selected as the most energy efficient CPU whatever the
> > > utilization level of waking task.
> > >
> > > energy model framework uses its cost field to estimate the energy with
> > > the formula:
> > >
> > >   nrg = cost of the selected OPP * utilization / CPU's max capacity
> > >
> > > which ends up selecting the CPU with lowest cost / max capacity ration
> > > as long as the utilization fits in the OPP's capacity.
> > >
> > > If we compare the cost of a little OPP with similar capacity of a big OPP
> > > like :
> > >        OPP(kHz)   OPP capacity    cost     max capacity   cost/max capacity
> > > LITTLE 1766400    407             351114   407            863
> > > big    1056000    408             520267   1024           508
> > >
> > > This can be interpreted as the LITTLE core consumes 70% more than big core
> > > for the same compute capacity.
> > >
> > > According to [1], LITTLE consumes 10% less than big core for Coremark
> > > benchmark at those OPPs. If we consider that everything else stays
> > > unchanged, the dynamic-power-coefficient of LITTLE core should be
> > > only 53% of the current value: 290 * 53% = 154
> > >
> > > Set the dynamic-power-coefficient of CPU0-3 to 154 to fix the energy model.
> > >
> >
> > This is sounds reasonable.
> >

Dmitry, what do you think about this?

> > But if the math was wrong for SDM845, I would assume that sm8150 and
> > sm8250 are wrong as well, as that's what 0e0a8e35d725 is based on. And
> > should I assume that patches for other platforms are off by 53% as well?
> 
> I don't think that we can assume that there is an error and in
> particular the same 53% error for others.
> 
> >
> > Can you help me understand how to arrive at this number? (Without
> > considering everything else stays unchanged, if needed).
> 
> In order to do the full computation, we need the voltage of each OPP
> which I don't have as they are provided by the LUT at boot IIUC.
> Instead I have used the debugfs output of the energy model and
> compared the value of (perf_state->cost/cpu_max_capacity) with the
> energy and duration figures available in [1].
> 
> In the case of SDM845, it was pretty easy to compare the OPPs of big
> and LITTLE because the duration and the perf result were the same for
> 2 OPPS so we should have :
> 
> (little OPP(1766400)->cost / little max capacity (407)) / (big
> OPP(1056000)->cost / big max capacity(1024)) = little OPP(1766400)
> energy / big OPP(1056000) energy
> 
> (little OPP(1766400)->cost / little max capacity (407)) / (big
> OPP(1056000)->cost / big max capacity(1024)) = 0.90
> 
> but current output gives:
> 
> (little OPP(1766400)->cost / little max capacity (407)) / (big
> OPP(1056000)->cost / big max capacity(1024)) = 1.70
> 
> As we consider everything else constant, it can be simplified by:
> 
> correct_little_dynamic-power-coefficient *  const_A  = 0.90
> 
> Whereas we currently have
> 
> current_little_dynamic-power-coefficient * const_A = 1.70
> 
> and we ends up with
> 
> correct_little_dynamic-power-coefficient  = 0.90 / 1.70 *
> current_little_dynamic-power-coefficient = 154
> 
> That being said, it can be simpler as the energy model provide the power figures
> 
> little OPP(1766400)->power = 351114 uW
> big OPP(1056000)->power = 195991 uW
> ration = 1.79
> 
> [1] results gives
> little OPP(1766400)->power = 193.281 mW
> big OPP(1056000)->power = 216.405 mW
> ratio = 0.89
> 
> The ratios are a bit different and give a
> correct_little_dynamic-power-coefficient  = 144 which is different
> than when using ->cost. This probably comes from rounding and which
> figures have been used to compute the model.
> 
> If you have Voltage of OPP, the formula used in energy model is power
> (uW) = dynamic-power-coefficient * uV^2 * Freq (Mhz) so you can
> compute dynamic-power-coefficient for each OPPs. They should be close
> and then you will have to decide which one is the "best"
> 
> I don't have access to sdm8150 or sdm8250 boards but you can use the
> same process to check that the energy model is aligned with the
> figures in [1]
> 
> [1] https://github.com/kdrag0n/freqbench/tree/master/results
> 
> Regards,
> Vincent

Thanks for the explanation Vincent!

Regards,
Bjorn

> >
> > Regards,
> > Bjorn
> >
> > > [1] https://github.com/kdrag0n/freqbench/tree/master/results/sdm845/main
> > >
> > > Fixes: 0e0a8e35d725 ("arm64: dts: qcom: sdm845: correct dynamic power coefficients")
> > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index 65032b94b46d..869bdb9bce6e 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -198,7 +198,7 @@ CPU0: cpu@0 {
> > >                       reg = <0x0 0x0>;
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <611>;
> > > -                     dynamic-power-coefficient = <290>;
> > > +                     dynamic-power-coefficient = <154>;
> > >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > >                       operating-points-v2 = <&cpu0_opp_table>;
> > >                       interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> > > @@ -222,7 +222,7 @@ CPU1: cpu@100 {
> > >                       reg = <0x0 0x100>;
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <611>;
> > > -                     dynamic-power-coefficient = <290>;
> > > +                     dynamic-power-coefficient = <154>;
> > >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > >                       operating-points-v2 = <&cpu0_opp_table>;
> > >                       interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> > > @@ -243,7 +243,7 @@ CPU2: cpu@200 {
> > >                       reg = <0x0 0x200>;
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <611>;
> > > -                     dynamic-power-coefficient = <290>;
> > > +                     dynamic-power-coefficient = <154>;
> > >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > >                       operating-points-v2 = <&cpu0_opp_table>;
> > >                       interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> > > @@ -264,7 +264,7 @@ CPU3: cpu@300 {
> > >                       reg = <0x0 0x300>;
> > >                       enable-method = "psci";
> > >                       capacity-dmips-mhz = <611>;
> > > -                     dynamic-power-coefficient = <290>;
> > > +                     dynamic-power-coefficient = <154>;
> > >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > >                       operating-points-v2 = <&cpu0_opp_table>;
> > >                       interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> > > --
> > > 2.34.1
> > >


