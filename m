Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E75C6C9D06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 09:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbjC0H7q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 03:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232647AbjC0H7m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 03:59:42 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D1F55B1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 00:59:37 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id i9so7677929wrp.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 00:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679903975;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nGK8p1zYpMEnDgAhAQhaaKqDmAb8VBKLy3WtqQM93QI=;
        b=K4Dhxzad6cJEa4k9l8Ntcz7WHBDlu/BCSBeV+WgkEt4H6c35TJkqm6imBHpHkXy/bi
         4ehLcDjpluan61Souxuyc5H1oPPla9qZhYIp3hhFTQ1Bs/ZiGk8J6l/iHaKnaBUr6k6B
         gkk91eqfPWYu7yiADeZvsYaBWkuPUBjk8cfroGSnxJyZETcdhqFEMISYTNdz9f0tIggF
         WGTX9A3Z57UTa2jo+87I17rSnFLtvg75QpQYxpRXej+itQBiB2xdXHap/kAOPf4bsz/x
         TMfr9sDUmx364OrYUImhpYJH5Vu40gX5fgZCqhOEkvtvuXraNR3vGhbof55HLIysdKCh
         3M7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679903975;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGK8p1zYpMEnDgAhAQhaaKqDmAb8VBKLy3WtqQM93QI=;
        b=VHG6UIF0dyFV4tbpY8vtM1aR8YqWyAK2DW4ny8a9M4XVeYNkwepX7keEsucDWegqIP
         CY7rrgdOzJbMieMFueKi+rG7f/ih40j/xjWbSn8UwoJDg7aw22jbC3+cBoNwOtWxiFCX
         kprQGcdeOTP0/3lfjpsKWjPnJKOCN95+T2WphLRmDzCc02SxmqAFsSOKJx6kwJM5msM1
         yHBvmAC5GoIhIJHnqzByhvtrfZGnZSxDkp+mqGBC4fROpWES3c2N3887w37CuqPBluSZ
         8IfmZpES8SDWJWGLOJyc7cluFCy7Owk76BlywPsiHH7cWfNJzsgUVEtKXZ6Qj2jT3NU3
         sCdQ==
X-Gm-Message-State: AAQBX9dp1HkqsmlOYBQ6tIBh4c90mYHyf0pVDtToosQkuw0y8h1Caa4d
        IsR9M2e/0ZgUXy0J2Mk1gsyWYA==
X-Google-Smtp-Source: AKy350areUaUsdNsORmSK5Jsp4OH20hA1FlvzL7Gep+VNpA/gtMevWqZ81Cc9bDfFebQNIDUk450bA==
X-Received: by 2002:adf:df0d:0:b0:2cf:ef5d:4ee7 with SMTP id y13-20020adfdf0d000000b002cfef5d4ee7mr7907145wrl.69.1679903975579;
        Mon, 27 Mar 2023 00:59:35 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id m6-20020a056000008600b002cde25fba30sm24477285wrx.1.2023.03.27.00.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:59:35 -0700 (PDT)
Message-ID: <70957e67-e570-3800-e679-d7c291295999@linaro.org>
Date:   Mon, 27 Mar 2023 09:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8150: turn first USB PHY into
 USB+DP PHY
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
References: <20230324215550.1966809-1-dmitry.baryshkov@linaro.org>
 <20230324215550.1966809-4-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230324215550.1966809-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/03/2023 22:55, Dmitry Baryshkov wrote:
> The first USB PHY on the sm8150 platform is really the USB+DP combo
> PHY. Add the DP part of the PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 9491be4a6bf0..a618218f7b68 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3392,20 +3392,19 @@ usb_2_hsphy: phy@88e3000 {
>   		};
>   
>   		usb_1_qmpphy: phy@88e9000 {
> -			compatible = "qcom,sm8150-qmp-usb3-phy";
> +			compatible = "qcom,sm8150-qmp-usb3-dp-phy";
>   			reg = <0 0x088e9000 0 0x18c>,
> -			      <0 0x088e8000 0 0x10>;
> +			      <0 0x088e8000 0 0x38>,
> +			      <0 0x088ea000 0 0x40>;
>   			status = "disabled";
>   			#address-cells = <2>;
>   			#size-cells = <2>;
>   			ranges;
> -
>   			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>   				 <&rpmhcc RPMH_CXO_CLK>,
>   				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>   				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>   			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
> -
>   			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>   				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>   			reset-names = "phy", "common";
> @@ -3423,6 +3422,16 @@ usb_1_ssphy: phy@88e9200 {
>   				clock-names = "pipe0";
>   				clock-output-names = "usb3_phy_pipe_clk_src";
>   			};
> +
> +			usb_1_dpphy: phy@88ea200 {
> +				reg = <0 0x088ea200 0 0x200>,
> +				      <0 0x088ea400 0 0x200>,
> +				      <0 0x088eaa00 0 0x200>,
> +				      <0 0x088ea600 0 0x200>,
> +				      <0 0x088ea800 0 0x200>;
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +			};

Is there a reason why the new flat bindings from qcom,sc8280xp-qmp-usb43dp-phy.yaml are not used instead ?

Neil

>   		};
>   
>   		usb_2_qmpphy: phy@88eb000 {

