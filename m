Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B47A8691D93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 12:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbjBJLG3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 06:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbjBJLG2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 06:06:28 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6981E126E6
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:06:27 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id qb15so12794015ejc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tH6uHPrahlXBtLrMhQxPy8ErppcAnDGeUuUs4pDFeFw=;
        b=fvQqTnHY3ncLjfr1NMtxHpJj36h0R8NeRDyocRtixV+DDcESeScPWnMNp2CtcUzjHP
         CY029SxeNQwRnqv58F3PS/Mgb8V02XTgrpfKIObIeS1Jjese7qmodLNQzD+3e2YUtI9G
         iydCC5yjrqQMuAEBdSBERF/iXX6scbTQqhsbHHBqXXwMVQoKaImVBPMRuMVF8J+rxNpv
         cTmg9MSMxl9j/wCpAsxh9apvrlfXfF/5ejpDLA5Qm9SwkzyHEXvz1F3yvYq7hWLj2Xp5
         5r0XqXN9bZMLCyTPQfv5Hpw+216f9gHKvxgtDudf8zahf+ILdDwSJOLohUZm6v9F+Qyu
         fV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tH6uHPrahlXBtLrMhQxPy8ErppcAnDGeUuUs4pDFeFw=;
        b=pA0usWBbCXHtqYe9ctLcAz6N2Mb/16S6nxPWcIGNCidimXhJEhw7jdAnEhraFpJRHV
         nfO9T3hLwK+hjj7T/v2z9Aq9+pnBwL2I6UR87EeyW4hJxx9PfRSUgYChGekCQ0QGrF7u
         HTwGuQzCy1OniJPGstovAT4f37YwlPXjcrXsu8FZz8Tg07DFd4UszpY1zxxbt5ex/Q7X
         kjw6BK34Pbn2jx9wcnP3ArlLQGRIOBtusPW65Ri95xdOtulISmAndXwJ9APmTuMhqzG8
         UZBRe5WGad4x4fcBCrLz1WcD7vcHAldWtlcbrLUhFmMHYwm4dpq4eUhcixhwbNngsZM8
         W84A==
X-Gm-Message-State: AO0yUKUTjQcYYTlIdVHjdlWpe3t0VQVaha+EAUt1s6Q5THXbMHHNp8S/
        rWZxeiTmj5wnbkceihQ0pNvMwQ==
X-Google-Smtp-Source: AK7set8fDQ6xW20fEQRKoaxBZ3mvVV7Prw/07OHfucce/6tJfp8Z6DzzQ6QdnubiXQG6R8do6hnMXg==
X-Received: by 2002:a17:906:3582:b0:888:1f21:4429 with SMTP id o2-20020a170906358200b008881f214429mr12351428ejb.19.1676027185961;
        Fri, 10 Feb 2023 03:06:25 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a9-20020a17090640c900b008720c458bd4sm2236948ejk.3.2023.02.10.03.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:06:25 -0800 (PST)
Message-ID: <2b6b5983-355e-0fde-d6c8-989e06f567e4@linaro.org>
Date:   Fri, 10 Feb 2023 13:06:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sm8350: switch to combo usb3/dp
 phy
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v2-2-529da2203659@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v2-2-529da2203659@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 12:34, Neil Armstrong wrote:
> The first QMP PHY is an USB3/DP combo phy, switch to the newly
> documented bindings and register the clocks to the GCC
> and DISPCC controllers.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

With the following few nits fixed:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 40 ++++++++++++------------------------
>   1 file changed, 13 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 04bb838189a6..d490ce84a022 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -652,7 +652,7 @@ gcc: clock-controller@100000 {
>   				 <&ufs_mem_phy_lanes 0>,
>   				 <&ufs_mem_phy_lanes 1>,
>   				 <&ufs_mem_phy_lanes 2>,
> -				 <0>,
> +				 <&usb_1_qmpphy 0>,


<&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK> ?


>   				 <0>;
>   		};
>   
> @@ -2601,37 +2601,24 @@ usb_2_hsphy: phy@88e4000 {
>   			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
>   		};
>   
> -		usb_1_qmpphy: phy-wrapper@88e9000 {
> -			compatible = "qcom,sm8350-qmp-usb3-phy";
> -			reg = <0 0x088e9000 0 0x200>,
> -			      <0 0x088e8000 0 0x20>;
> -			status = "disabled";
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +		usb_1_qmpphy: phy@88e9000 {
> +			compatible = "qcom,sm8350-qmp-usb3-dp-phy";
> +			reg = <0 0x088e8000 0 0x3000>;
>   
>   			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>   				 <&rpmhcc RPMH_CXO_CLK>,
> -				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> -			clock-names = "aux", "ref_clk_src", "com_aux";
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
>   
>   			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>   				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>   			reset-names = "phy", "common";
>   
> -			usb_1_ssphy: phy@88e9200 {
> -				reg = <0 0x088e9200 0 0x200>,
> -				      <0 0x088e9400 0 0x200>,
> -				      <0 0x088e9c00 0 0x400>,
> -				      <0 0x088e9600 0 0x200>,
> -				      <0 0x088e9800 0 0x200>,
> -				      <0 0x088e9a00 0 0x100>;
> -				#phy-cells = <0>;
> -				#clock-cells = <0>;
> -				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> -				clock-names = "pipe0";
> -				clock-output-names = "usb3_phy_pipe_clk_src";
> -			};
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			status = "disabled";
>   		};
>   
>   		usb_2_qmpphy: phy-wrapper@88eb000 {
> @@ -2727,7 +2714,7 @@ usb_1_dwc3: usb@a600000 {
>   				iommus = <&apps_smmu 0x0 0x0>;
>   				snps,dis_u2_susphy_quirk;
>   				snps,dis_enblslpm_quirk;
> -				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +				phys = <&usb_1_hsphy>, <&usb_1_qmpphy 0>;


<&usb_1_qmpphy QMP_USB43DP_USB3_PHY> ?


>   				phy-names = "usb2-phy", "usb3-phy";
>   			};
>   		};
> @@ -3092,8 +3079,7 @@ dispcc: clock-controller@af00000 {
>   			clocks = <&rpmhcc RPMH_CXO_CLK>,
>   				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
>   				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
> -				 <0>,
> -				 <0>;
> +				 <&usb_1_qmpphy 1>, <&usb_1_qmpphy 2>;

<&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>, <&usb_1_qmpphy 
QMP_USB43DP_DP_VCO_DIV_CLK>

>   			clock-names = "bi_tcxo",
>   				      "dsi0_phy_pll_out_byteclk",
>   				      "dsi0_phy_pll_out_dsiclk",
> 

-- 
With best wishes
Dmitry

