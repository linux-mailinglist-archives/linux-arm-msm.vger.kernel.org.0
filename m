Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4005EADFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 19:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiIZRTc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 13:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiIZRTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 13:19:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D420E9CFA;
        Mon, 26 Sep 2022 09:33:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CCEB4B80AD5;
        Mon, 26 Sep 2022 16:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A27C433D6;
        Mon, 26 Sep 2022 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664209987;
        bh=WnLp8J6r6LeOnJJHDeha7j7fMDZ2Zrq6R0JmIyMn0XI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DUVS67cIq/2KTnJpnrqyLAJzggQwpuOe2AV1Wss+eGNX7rcomvct4vXBgAmFUPMc0
         7DzaUMyv958DTZnZ3ONShbnyzhRdhe1Q0561vUqLnTLv2WslZoQZ+ASwG9qvokbTwH
         HJ6me3Qdm9zSvrmwvAvQfRVyuS/yR0oOAkbobb/M9IA/40ShJ+Nt+2uh5nOoAaGNtx
         vn5WKztEmms1NRsWcnvws7D8JhRlMw87IN1BYQjXXqvkIkP7Ku86yLpqthK1p/WoCv
         ps6Hn4/b5rlYWmS96HFgQD7tnGnzauz9pVC8AU9iNGubbsF8NODPAORMkkJUdwk44v
         9BdOXryY2umcA==
Date:   Mon, 26 Sep 2022 11:33:04 -0500
From:   Bjorn Andersson <andersson@kernel.org>
To:     Jun Nie <jun.nie@linaro.org>
Cc:     abel.vesa@linaro.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: add power domain for clk controller
Message-ID: <20220926163304.no3pxexjwahmf4yv@builder.lan>
References: <20220805074935.1158098-1-jun.nie@linaro.org>
 <20220805074935.1158098-4-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805074935.1158098-4-jun.nie@linaro.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 05, 2022 at 03:49:34PM +0800, Jun Nie wrote:
> Add RPM power domain for clk controller so that clock controller can
> use it for dynamic voltage frequency scaling.
> 
> Also replace the RPM power domain value with defninition.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 05472510e29d..fdb32b3a23e8 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -312,22 +312,22 @@ rpmpd_opp_table: opp-table {
>  						compatible = "operating-points-v2";
>  
>  						rpmpd_opp_ret: opp1 {
> -							opp-level = <1>;
> +							opp-level = <RPM_SMD_CORNER_RETENTION>;
>  						};
>  						rpmpd_opp_svs_krait: opp2 {
> -							opp-level = <2>;
> +							opp-level = <RPM_SMD_CORNER_SVS_KRAIT>;
>  						};
>  						rpmpd_opp_svs_soc: opp3 {
> -							opp-level = <3>;
> +							opp-level = <RPM_SMD_CORNER_SVS_SOC>;
>  						};
>  						rpmpd_opp_nom: opp4 {
> -							opp-level = <4>;
> +							opp-level = <RPM_SMD_CORNER_NORMAL>;
>  						};
>  						rpmpd_opp_turbo: opp5 {
> -							opp-level = <5>;
> +							opp-level = <RPM_SMD_CORNER_TURBO>;
>  						};
>  						rpmpd_opp_super_turbo: opp6 {
> -							opp-level = <6>;
> +							opp-level = <RPM_SMD_CORNER_SUPER_TURBO>;

See comment on previous patch, I think it's fine to stick with the
numerical values here, as the label gives them meaning to the clients.

>  						};
>  					};
>  				};
> @@ -933,6 +933,8 @@ gcc: clock-controller@1800000 {
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> +			power-domains = <&rpmpd MSM8916_VDDCX>;
> +			power-domain-names = "vdd";

This makes sense even without your patches, as it creates a relationship
between gdscs of the clock-controller and VDDCX - such that enable and
performance state of the gdscs propagates up to VDDCX.

Could you please check that this seems to work properly?


PS. We don't need power-domain-names.

Regards,
Bjorn

>  			reg = <0x01800000 0x80000>;
>  		};
>  
> -- 
> 2.25.1
> 
