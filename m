Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7E88550796
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 01:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiFRXxi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jun 2022 19:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiFRXxi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jun 2022 19:53:38 -0400
X-Greylist: delayed 672 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 18 Jun 2022 16:53:37 PDT
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9061FBC17;
        Sat, 18 Jun 2022 16:53:37 -0700 (PDT)
Received: from [192.168.1.101] (abxh227.neoplus.adsl.tpnet.pl [83.9.1.227])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B0ECC1FF02;
        Sun, 19 Jun 2022 01:53:35 +0200 (CEST)
Message-ID: <155e3867-c37e-4cc4-782c-3903b134c427@somainline.org>
Date:   Sun, 19 Jun 2022 01:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] arm64: dts: qcom: msm8996: add clocks to the MMCC
 device node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
 <20220617122922.769562-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220617122922.769562-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.06.2022 14:29, Dmitry Baryshkov wrote:
> As we are converting this platform to use DT clock bindings, add clocks
> and clock-names properties to the MMCC device tree node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Sidenote: would RPM XO work here, or is it broken on 8996?

Konrad
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index dffb87a5ee74..0c7b7cd9f23e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -751,6 +751,22 @@ mmcc: clock-controller@8c0000 {
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
>  			reg = <0x008c0000 0x40000>;
> +			clocks = <&xo_board>,
> +				 <&gcc GCC_MMSS_NOC_CFG_AHB_CLK>,
> +				 <&gcc GPLL0>,
> +				 <&dsi0_phy 1>,
> +				 <&dsi0_phy 0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +			clock-names = "xo",
> +				      "gcc_mmss_noc_cfg_ahb_clk",
> +				      "gpll0",
> +				      "dsi0pll",
> +				      "dsi0pllbyte",
> +				      "dsi1pll",
> +				      "dsi1pllbyte",
> +				      "hdmipll";
>  			assigned-clocks = <&mmcc MMPLL9_PLL>,
>  					  <&mmcc MMPLL1_PLL>,
>  					  <&mmcc MMPLL3_PLL>,
> 
