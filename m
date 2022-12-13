Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5BE64B56F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 13:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235336AbiLMMtL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 07:49:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235406AbiLMMtK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 07:49:10 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9354D1B9C7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:49:08 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so4675120lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7A4zrO5QxiDGztNDUN0vMSVKFh2K/SajgDXGEDuryg=;
        b=kqB/3XGde7RIFscBsJWiPeARCFwNFNuBGGFDvH/p/EwhvNIzSGEdhyYKpHVc4ROpD+
         sgyEHUsJupWsl0oiZLQvg1R9qaAg2OD+3VHEW+yNHnF+5SzuC57VxfNT8g4jsae09CSq
         G0hEnsVcn6WqVdMMYG4h2LU4Wj0gTFktB2mlTqMj0dgvv7w7GGptq4B5BodHa+03m+s5
         yrSNq8oMgRrNdqgbwsHDXLwIFw/Ghp55CLHcBmOssK4IwHSUuvQzBWpCjxSG5DVwE1XP
         KDBO28RflK8y0qSzAgcMytestCA5NJnN1LKmp+DZDELwa+2HYw9J9o35L0AigNwxPmtb
         IVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7A4zrO5QxiDGztNDUN0vMSVKFh2K/SajgDXGEDuryg=;
        b=D4JFGfm90IlasDB83Lr2uFKgZskGQZBZuGjAzWC50Tf5LCA6zSnCLihxJkwrqxTteE
         tDUIzbbCHrBwWBGndLiURxa+GBNwHjauCy35aqaDPHTIGT1WsVM1m5Mwn8sp6briwg1N
         7k2SwdUhBX2b9+q6YRUSpWKwx0lnYZn9LEWiyBz/5qU0C/iJzUvpB9q/MZK7PYWGrYaz
         +vdCBdBM6NgCY82j0/cHkRIiEwaTzqZNYPW9x1Soxumf/sToo0F+PiDkIee1zlBBI26x
         w40uTei+LGIwuZkN6xxkBTZc61CyXhNL0XA4kg8WNNoHMBdVXA8emHtXcVK/dOlJWrqU
         5CMg==
X-Gm-Message-State: ANoB5pkNbwdCODD2ZG4SMRgRqGDnC3o8I7nH5Zpb/o2kbWNhnSn1eH6E
        1Lx+C1O+izJ41j3QJu3UDCREtQ==
X-Google-Smtp-Source: AA0mqf4JKjFmszB4Il2zZ9HJXHMoWeUuhD/WPwQtJQI8c/GCcSN/xZ7P7O68SsIXayYbavIjaVEjiQ==
X-Received: by 2002:a05:6512:22d2:b0:4b1:97ba:5716 with SMTP id g18-20020a05651222d200b004b197ba5716mr7090643lfu.0.1670935746967;
        Tue, 13 Dec 2022 04:49:06 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25b10000000b004acff58a951sm356352lfn.133.2022.12.13.04.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 04:49:06 -0800 (PST)
Message-ID: <20bd4594-7302-5823-447f-b980c476323e@linaro.org>
Date:   Tue, 13 Dec 2022 13:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6115: Add USB SS qmp phy node
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, andersson@kernel.org
References: <20221213123823.455731-1-bhupesh.sharma@linaro.org>
 <20221213123823.455731-4-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221213123823.455731-4-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.12.2022 13:38, Bhupesh Sharma wrote:
> Add USB superspeed qmp phy node to dtsi.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
Please run make dtbs_check before sending dt patches, this one
introduces new errors.


>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 38 ++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index e4ce135264f3d..9c5c024919f92 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -579,6 +579,40 @@ usb_hsphy: phy@1613000 {
>  			status = "disabled";
>  		};
>  
> +		usb_qmpphy: phy@1615000 {
> +			compatible = "qcom,sm6115-qmp-usb3-phy";
> +			reg = <0x01615000 0x200>;
> +			#clock-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
These -cells and ranges properties could go after status=disabled

Konrad
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +				 <&gcc GCC_AHB2PHY_USB_CLK>;
> +			clock-names = "com_aux",
> +				      "ref",
> +				      "cfg_ahb";
> +			resets = <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>,
> +				 <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>;
> +			reset-names = "phy", "phy_phy";
> +			status = "disabled";
> +
> +			usb_ssphy: phy@1615200 {
> +				reg = <0x01615200 0x200>,
> +				      <0x01615400 0x200>,
> +				      <0x01615c00 0x400>,
> +				      <0x01615600 0x200>,
> +				      <0x01615800 0x200>,
> +				      <0x01615a00 0x100>;
> +				#phy-cells = <0>;
> +				#clock-cells = <1>;
> +				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +				clock-names = "pipe0";
> +				clock-output-names = "usb3_phy_pipe_clk_src";
> +			};
> +		};
> +
> +
>  		qfprom@1b40000 {
>  			compatible = "qcom,sm6115-qfprom", "qcom,qfprom";
>  			reg = <0x01b40000 0x7000>;
> @@ -1023,8 +1057,8 @@ usb_dwc3: usb@4e00000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x04e00000 0xcd00>;
>  				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&usb_hsphy>;
> -				phy-names = "usb2-phy";
> +				phys = <&usb_hsphy>, <&usb_ssphy>;
> +				phy-names = "usb2-phy", "usb3-phy";
>  				iommus = <&apps_smmu 0x120 0x0>;
>  				snps,dis_u2_susphy_quirk;
>  				snps,dis_enblslpm_quirk;
