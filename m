Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8321666065B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 19:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjAFS3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 13:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbjAFS2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 13:28:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82C478A7A;
        Fri,  6 Jan 2023 10:28:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C01C61F0C;
        Fri,  6 Jan 2023 18:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDBAC433EF;
        Fri,  6 Jan 2023 18:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673029731;
        bh=COqjyLV5j1ajbEXuw53ehn2Q19dbjKx1dD0iJ62Rvfo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N25BixGqr149dZlfhgg2awzromGm4Zh9tOgRIUe5RRss9bw2fe3CkEPXFIQd47vae
         QCTq0xef7XUfe2kqNCd8spJ8OYv0QJgsDiCcIJ8LNC8MpxOD0Yr+PbHDy0+cefLmEg
         AThLVE+/ztWNY2IDJCTYy4l+aimYMp2i5WkGXidxZUr8VQZr1WCuL833iDNKuNUJU3
         hHckzgc8jBtiqlO8o/by89KrmBCz2Xl8Gs4HfxMX5DH+J0nwPwkXoXJwbLNSDfLleV
         bvcabo108JPrOWagnIJbrANYZeDhutNIXzrRK5VwjfJZgn2IMSVZQerv+vFhP2LRTG
         GunFh7UZTMHZA==
Date:   Fri, 6 Jan 2023 12:28:49 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     dmitry.baryshkov@linaro.org, agross@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, danny@kdrag0n.dev
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: correct dynamic power
 coefficients
Message-ID: <20230106182849.kr47mdgokd4qa6zw@builder.lan>
References: <20230106164618.1845281-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106164618.1845281-1-vincent.guittot@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 06, 2023 at 05:46:18PM +0100, Vincent Guittot wrote:

Seems like using get_maintainer.pl would have saved you some trouble ;)

> While stressing EAS on my dragonboard RB3, I have noticed that LITTLE cores
> where never selected as the most energy efficient CPU whatever the
> utilization level of waking task.
> 
> energy model framework uses its cost field to estimate the energy with
> the formula:
> 
>   nrg = cost of the selected OPP * utilization / CPU's max capacity
> 
> which ends up selecting the CPU with lowest cost / max capacity ration
> as long as the utilization fits in the OPP's capacity.
> 
> If we compare the cost of a little OPP with similar capacity of a big OPP
> like :
>        OPP(kHz)   OPP capacity    cost     max capacity   cost/max capacity
> LITTLE 1766400    407             351114   407            863
> big    1056000    408             520267   1024           508
> 
> This can be interpreted as the LITTLE core consumes 70% more than big core
> for the same compute capacity.
> 
> According to [1], LITTLE consumes 10% less than big core for Coremark
> benchmark at those OPPs. If we consider that everything else stays
> unchanged, the dynamic-power-coefficient of LITTLE core should be
> only 53% of the current value: 290 * 53% = 154
> 
> Set the dynamic-power-coefficient of CPU0-3 to 154 to fix the energy model.
> 

This is sounds reasonable.

But if the math was wrong for SDM845, I would assume that sm8150 and
sm8250 are wrong as well, as that's what 0e0a8e35d725 is based on. And
should I assume that patches for other platforms are off by 53% as well?

Can you help me understand how to arrive at this number? (Without
considering everything else stays unchanged, if needed).

Regards,
Bjorn

> [1] https://github.com/kdrag0n/freqbench/tree/master/results/sdm845/main
> 
> Fixes: 0e0a8e35d725 ("arm64: dts: qcom: sdm845: correct dynamic power coefficients")
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 65032b94b46d..869bdb9bce6e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -198,7 +198,7 @@ CPU0: cpu@0 {
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <611>;
> -			dynamic-power-coefficient = <290>;
> +			dynamic-power-coefficient = <154>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			operating-points-v2 = <&cpu0_opp_table>;
>  			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> @@ -222,7 +222,7 @@ CPU1: cpu@100 {
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <611>;
> -			dynamic-power-coefficient = <290>;
> +			dynamic-power-coefficient = <154>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			operating-points-v2 = <&cpu0_opp_table>;
>  			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> @@ -243,7 +243,7 @@ CPU2: cpu@200 {
>  			reg = <0x0 0x200>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <611>;
> -			dynamic-power-coefficient = <290>;
> +			dynamic-power-coefficient = <154>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			operating-points-v2 = <&cpu0_opp_table>;
>  			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> @@ -264,7 +264,7 @@ CPU3: cpu@300 {
>  			reg = <0x0 0x300>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <611>;
> -			dynamic-power-coefficient = <290>;
> +			dynamic-power-coefficient = <154>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			operating-points-v2 = <&cpu0_opp_table>;
>  			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> -- 
> 2.34.1
> 
