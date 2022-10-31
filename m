Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 681DA613F74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 22:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiJaVEd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 17:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiJaVEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 17:04:31 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AFC71401E
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 14:04:30 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.156.neoplus.adsl.tpnet.pl [95.49.29.156])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D124F3EBB1;
        Mon, 31 Oct 2022 22:04:27 +0100 (CET)
Message-ID: <4cdc7106-326d-45ac-591b-89ea6d4640cf@somainline.org>
Date:   Mon, 31 Oct 2022 22:04:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 11/11] ARM: dts: qcom: msm8974: add clocks and
 clock-names to mmcc device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
 <20221030155520.91629-12-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221030155520.91629-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.10.2022 16:55, Dmitry Baryshkov wrote:
> Add clocks and clock-names nodes to the mmcc device to bind clocks using
> the DT links.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 4e70f51c8750..21abbff2a4df 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1494,6 +1494,30 @@ mmcc: clock-controller@fd8c0000 {
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
>  			reg = <0xfd8c0000 0x6000>;
> +			clocks = <&xo_board>,
> +				 <&gcc GCC_MMSS_GPLL0_CLK_SRC>,
> +				 <&gcc GPLL0_VOTE>,
> +				 <&gcc GPLL1_VOTE>,
> +				 <&rpmcc RPM_SMD_GFX3D_CLK_SRC>,
> +				 <&dsi0_phy 1>,
> +				 <&dsi0_phy 0>,
> +				 <&dsi1_phy 1>,
> +				 <&dsi1_phy 0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +			clock-names = "xo",
> +				      "mmss_gpll0_vote",
> +				      "gpll0_vote",
> +				      "gpll1_vote",
> +				      "gfx3d_clk_src",
> +				      "dsi0pll",
> +				      "dsi0pllbyte",
> +				      "dsi1pll",
> +				      "dsi1pllbyte",
> +				      "hdmipll",
> +				      "edp_link_clk",
> +				      "edp_vco_div";
>  		};
>  
>  		mdss: mdss@fd900000 {
