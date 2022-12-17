Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A36CE64F9BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiLQPQi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:16:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiLQPQh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:16:37 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB810E086
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:16:35 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 1so7757262lfz.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMLGVxZ64UkSglaZXpqSmanlt/Uv4tavfG7auJ15EOU=;
        b=Slp4X2b3qzMtktePd+6DS6HxrCBJzOyYp+1/fOWTRZeyuQBF94Nb4NEkNn+vZG2YxI
         fHtt9fV7H15MDbhNFVzfiaR3HZQZrWst1DsTpbJw4IWgx89YIsOiIwPTzNo78eR27cCw
         2Q6vO7GIUboQdZ7ACrJ396QwLvFl5sA23Bv9eEOXNuIO9x6W1Ub+7DL23bIMOXwFLg2T
         z2FEN8Q1WN3qu8PKsgBg7S/EZBIfbnHgYt7mruBb3kD9xX7r2CmbMT/kjRgyveojBwPq
         rObPVmOfkuhwmZrdou/ic3lygiX8XhqGsZSII8E7PVCtQr/lo6ZAMw2RGri9tUCBvI9B
         YvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMLGVxZ64UkSglaZXpqSmanlt/Uv4tavfG7auJ15EOU=;
        b=XP59R5FC8pD9qnkv+flOktAsyHmNC+imaKxnyt05Oc8L0wAXSAui4mK3r8FK9qQJUy
         Z85Eb8EPlXDLxSHbGIY0LPy1T5Zep4GslMeXmAuoIFIjFmCFawKj3CxS5UW+K+/JotxP
         z4Eflq2pLeAV02MWxdIeMM7pYCXFM/vExOuUM5ZeMYGRlds6Iv3Bqbftf5goSrQhF+I1
         c5Qz/0jnRLbHgDUyASUfF73m0PVeERginGae6iSCSoIMbdNdDMh/nOfIN+S0v15gcSwS
         bEQv/h5FKLUFTcadKDSZn4H/LMMj8BNb2ahzniAjt7Xbxe9M8Krb1gAceFXLSgYIYaIX
         4CFg==
X-Gm-Message-State: ANoB5pmNoZOxbs0rM8xVO+NdTj/K7+PIWwY9RM3NLnzEI5tVHkbJOg4P
        NpSmnmmDBIMRDQjhzldEcskefw==
X-Google-Smtp-Source: AA0mqf6NFOSAUbAkKFQiXCfhIMf/Oa2TwGR9qbXMonwC56ON0r/prvTaPMDYh5HZXyL9EPdaCtEs3A==
X-Received: by 2002:a05:6512:2187:b0:4a4:68b9:1a05 with SMTP id b7-20020a056512218700b004a468b91a05mr5159101lft.45.1671290194385;
        Sat, 17 Dec 2022 07:16:34 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id s7-20020a056512314700b0048a9e899693sm545429lfi.16.2022.12.17.07.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:16:33 -0800 (PST)
Message-ID: <e1f62ee3-eeac-cf69-a990-566b8d0eeae1@linaro.org>
Date:   Sat, 17 Dec 2022 16:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 13/15] arm64: dts: qcom: qcs404: use symbol names for PCIe
 resets
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
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-14-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-14-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.12.2022 01:17, Dmitry Baryshkov wrote:
> The commit e5bbbff5b7d7 ("clk: gcc-qcs404: Add PCIe resets") added names
> for PCIe resets, but it did not change the existing qcs404.dtsi to use
> these names. Do it now and use symbol names to make it easier to check
> and modify the dtsi in future.
> 
> Fixes: e5bbbff5b7d7 ("clk: gcc-qcs404: Add PCIe resets")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
I feel like I reviewed this already this week..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index ffffaa7507cf..ffc4b081bb62 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -806,7 +806,7 @@ pcie_phy: phy@7786000 {
>  
>  			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
>  			resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
> -				 <&gcc 21>;
> +				 <&gcc GCC_PCIE_0_PIPE_ARES>;
>  			reset-names = "phy", "pipe";
>  
>  			clock-output-names = "pcie_0_pipe_clk";
> @@ -1337,12 +1337,12 @@ pcie: pci@10000000 {
>  				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>;
>  			clock-names = "iface", "aux", "master_bus", "slave_bus";
>  
> -			resets = <&gcc 18>,
> -				 <&gcc 17>,
> -				 <&gcc 15>,
> -				 <&gcc 19>,
> +			resets = <&gcc GCC_PCIE_0_AXI_MASTER_ARES>,
> +				 <&gcc GCC_PCIE_0_AXI_SLAVE_ARES>,
> +				 <&gcc GCC_PCIE_0_AXI_MASTER_STICKY_ARES>,
> +				 <&gcc GCC_PCIE_0_CORE_STICKY_ARES>,
>  				 <&gcc GCC_PCIE_0_BCR>,
> -				 <&gcc 16>;
> +				 <&gcc GCC_PCIE_0_AHB_ARES>;
>  			reset-names = "axi_m",
>  				      "axi_s",
>  				      "axi_m_sticky",
