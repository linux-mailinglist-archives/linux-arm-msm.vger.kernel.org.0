Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4AB870C3E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 19:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjEVRCH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 13:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjEVRCG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 13:02:06 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D7DF1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 10:02:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so7404570e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 10:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684774921; x=1687366921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjF21XFkX4tecG71XyzArS3homg2K5jds2rmtDGL+jY=;
        b=qbX7I8vdATrZajUyLDCa+F03EsA8WQAR8BA1uAU4S0C/u/hIvXaC1Z96tlHEvgycEU
         mimF7K3w7LNKqGcMKDFOb1uaRmdXp6BkHHwkOXwOcakPWf5fAVInPDSlS9IZkPav6b4Y
         94SRNscAW8m9MQHrRTBgqBXw4PLylR6anIE7sAOxptW6UpObE78NLPmsfRQMCddrIwjY
         aphrY3m7FE0lu4bZDOd5IwJaDMFIl0PDTzHAPm4vRM4wKyQs1+xo10E7k2ltrb6kZ5kb
         YL08epLzzkqPczPHtRgbZiR0fwO66dYMqlZOPChx3kuH8weRznsgpcsuNzT/lgQTEhgJ
         3pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684774921; x=1687366921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TjF21XFkX4tecG71XyzArS3homg2K5jds2rmtDGL+jY=;
        b=efc62jcBMVIJBqkfW0zQ5CBnEfjZy+P/l7ESiOxISmSZnwSeF26M+o6lsM/yhE0XdK
         Ul9nmy+5Fr1W+s79b5mzz/i+AbeO86IOw6BdjP72+vcrA+ODhOCETxLMMSdDbKbsBtt4
         rG7ci/JvgRhxZsZlef6C++7YFLiRWyd8IWCIgtxAcBVMD+ab3P8VEir0USJB3uFDiA9s
         8YMSEAdtaEpxr/q9x23wIxBBCsUTbj077UkkQbinHuH8kp1RiM/CHU8RGfmnoz/NlKMI
         FasqvCiuiyCaF44JWALTTrrbQqwxeVa2uL1v9laUWNeNSQAwaeUNsFwh1n+jgWbp/acD
         /Xvw==
X-Gm-Message-State: AC+VfDyFuElUKn6L/o+f4dcJid6s6PQAjag6RlD6NmfxWcHD2T41YZWs
        DlzKfFt1n9cgBLOynwYRrFuNdw==
X-Google-Smtp-Source: ACHHUZ6WtJqnwD7Ap4TH54jGz15B6zaga4+g/pph1EF0jcJF8t6MfvB+Wl8+vo13Jv/ukTp31DylsQ==
X-Received: by 2002:a05:6512:972:b0:4eb:3b4c:50ac with SMTP id v18-20020a056512097200b004eb3b4c50acmr2929429lft.65.1684774921383;
        Mon, 22 May 2023 10:02:01 -0700 (PDT)
Received: from [192.168.1.101] (abyk97.neoplus.adsl.tpnet.pl. [83.9.30.97])
        by smtp.gmail.com with ESMTPSA id w7-20020ac254a7000000b004edc6067affsm1044046lfk.8.2023.05.22.10.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 10:02:01 -0700 (PDT)
Message-ID: <8d968904-d4a2-0dbd-52a2-55c6d123f7ac@linaro.org>
Date:   Mon, 22 May 2023 19:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 11/11] arm64: dts: qcom: sm8450: switch UFS QMP PHY to
 new style of bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
 <20230521203834.22566-12-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230521203834.22566-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.05.2023 22:38, Dmitry Baryshkov wrote:
> Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
> resource region, no per-PHY subnodes).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 595533aeafc4..44a67c9274bd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -741,9 +741,9 @@ gcc: clock-controller@100000 {
>  				 <&pcie0_lane>,
>  				 <&pcie1_lane>,
>  				 <0>,
> -				 <&ufs_mem_phy_lanes 0>,
> -				 <&ufs_mem_phy_lanes 1>,
> -				 <&ufs_mem_phy_lanes 2>,
> +				 <&ufs_mem_phy 0>,
> +				 <&ufs_mem_phy 1>,
> +				 <&ufs_mem_phy 2>,
>  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>  			clock-names = "bi_tcxo",
>  				      "sleep_clk",
> @@ -4064,7 +4064,7 @@ ufs_mem_hc: ufshc@1d84000 {
>  			      <0 0x01d88000 0 0x8000>;
>  			reg-names = "std", "ice";
>  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&ufs_mem_phy_lanes>;
> +			phys = <&ufs_mem_phy>;
>  			phy-names = "ufsphy";
>  			lanes-per-direction = <2>;
>  			#reset-cells = <1>;
> @@ -4114,10 +4114,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  
>  		ufs_mem_phy: phy@1d87000 {
>  			compatible = "qcom,sm8450-qmp-ufs-phy";
> -			reg = <0 0x01d87000 0 0x1c4>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +			reg = <0 0x01d87000 0 0x1000>;
> +
>  			clock-names = "ref", "ref_aux", "qref";
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
>  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> @@ -4125,17 +4123,11 @@ ufs_mem_phy: phy@1d87000 {
>  
>  			resets = <&ufs_mem_hc 0>;
>  			reset-names = "ufsphy";
> -			status = "disabled";
>  
> -			ufs_mem_phy_lanes: phy@1d87400 {
> -				reg = <0 0x01d87400 0 0x188>,
> -				      <0 0x01d87600 0 0x200>,
> -				      <0 0x01d87c00 0 0x200>,
> -				      <0 0x01d87800 0 0x188>,
> -				      <0 0x01d87a00 0 0x200>;
> -				#clock-cells = <1>;
> -				#phy-cells = <0>;
> -			};
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
>  		};
>  
>  		sdhc_2: mmc@8804000 {
