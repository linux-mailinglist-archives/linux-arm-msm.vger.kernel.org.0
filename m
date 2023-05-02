Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37B56F3E84
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 09:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233670AbjEBHra (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 03:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233630AbjEBHr3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 03:47:29 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4E735A8
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 00:47:27 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc070c557so4809658a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 00:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683013646; x=1685605646;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zp3GUACI6gZnc6hq2YXqqK8rip6hMVeCHJ8zCs7UA9Y=;
        b=p9myWsRTWJHFmlbKC8/mfyK/gNGNwdH5XNqLDTNg3qhVc9+61HxNOMyePDQg+krFfI
         4kaHOpd8+DG1p/ros/TRm+SYxgSjYbTUmyeF532NDW7ydubr/pa2/mYDfaF0cLfpC5AM
         ooN0SXvl/ZFUoXLiXEG727d8chpUze8tfCOKWK1m5PJffaYwtvbDxzRB/qKdxhbHsYoW
         KOl/mkQZxJKnuin8NCn+Rs0uRTfl1BWSxMmmqUMwj6K4Od3v9MVmU0kFxbxRNKVqI7Oj
         N9WDGG0/0V0Bc8o+ZDybF6IGHHC29ULIBMqdoh4ajniFf/FCq7JnxyycEUsAq1ktVJSI
         1pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683013646; x=1685605646;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zp3GUACI6gZnc6hq2YXqqK8rip6hMVeCHJ8zCs7UA9Y=;
        b=KzIaf8X4iHDzuas46Hx6OFrAhEtOrijlZhfOJvqmQIlFFbtTTRLZT6n1xKCRdg8U9/
         KuexXu9socFl56v87mtTF5XHSVQUic280dpQjTF96FcGaBYOn1Hl3l5JnaFCATCj10+p
         6pfjtjBHhIhi/6tkTRmgHJYRNSzckwu+KBT5Y7oU13HkBkiGB15R0Kdo0n+ygonDSd1Q
         J2uYq98k34AU3tPsIJR4Nl+gnXVIJ21GnjT/q59d7ZsQeIE8KyPVJHAnSECtDHZ8/r89
         +Uit4FgqIes2/TTgF7q3Fp00CFEr8aGrNfiOeYY/mVbi35RphE7BrMfXXFvd0abWLh7V
         6jaw==
X-Gm-Message-State: AC+VfDyUZLdIX+ma15w+YZFBZ0c2J3EL/bDrfwc42f0UzmI97UmsBqpx
        7001xDf8Et6WX+PrS4Wv+VKM8w==
X-Google-Smtp-Source: ACHHUZ7uSHKaeGUlnLUaOcTHvWUxqioqNqTsDF8JizJz9zyZhMz1sRyVNzmvWC4V3uVPp4kimv5F/g==
X-Received: by 2002:aa7:cb07:0:b0:508:3ff8:afe7 with SMTP id s7-20020aa7cb07000000b005083ff8afe7mr6620002edt.6.1683013645896;
        Tue, 02 May 2023 00:47:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id k2-20020a056402048200b00501c96564b5sm12457061edv.93.2023.05.02.00.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 00:47:25 -0700 (PDT)
Message-ID: <57d2405f-7bd2-0ca3-a119-55b7bf0f36f9@linaro.org>
Date:   Tue, 2 May 2023 09:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 7/9] arm64: dts: qcom: sc8280xp: Add multiport
 controller node for SC8280
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, quic_harshq@quicinc.com,
        ahalaney@redhat.com, quic_shazhuss@quicinc.com
References: <20230501143445.3851-1-quic_kriskura@quicinc.com>
 <20230501143445.3851-8-quic_kriskura@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501143445.3851-8-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 16:34, Krishna Kurapati wrote:
> Add USB and DWC3 node for tertiary port of SC8280 along with multiport
> IRQ's and phy's. This will be used as a base for SA8295P and SA8295-Ride
> platforms.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 64 ++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 8fa9fbfe5d00..0e4fb286956b 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3133,6 +3133,70 @@ usb_1_role_switch: endpoint {
>  			};
>  		};
>  
> +		usb_2: usb@a4f8800 {

Nodes are ordered by unit address, more or less.

> +			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,dwc3";
> +			reg = <0 0x0a4f8800 0 0x400>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
> +				 <&gcc GCC_USB30_MP_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
> +				 <&gcc GCC_USB30_MP_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_USB_NOC_NORTH_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_USB_NOC_SOUTH_AXI_CLK>,
> +				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
> +			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi",
> +				      "noc_aggr", "noc_aggr_north", "noc_aggr_south", "noc_sys";
> +
> +			assigned-clocks = <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_MP_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			interrupts-extended = <&pdc 127 IRQ_TYPE_EDGE_RISING>,
> +						<&pdc 126 IRQ_TYPE_EDGE_RISING>,
> +						<&pdc 16 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>;

Does not look aligned.

> +
> +			interrupt-names = "dp_hs_phy_irq", "dm_hs_phy_irq",
> +						"ss_phy_irq", "pwr_event_1",

Does not look aligned.

> +						"pwr_event_2", "pwr_event_3",
> +						"pwr_event_4";
> +
> +			power-domains = <&gcc USB30_MP_GDSC>;
> +
> +			resets = <&gcc GCC_USB30_MP_BCR>;
> +
> +			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
> +			required-opps = <&rpmhpd_opp_nom>;
> +

Please open the DTSI and look how this is organized there. I don't think
doing this differently - with different order - helps to review.
required-opps is next to power-domains.

> +			status = "disabled";
> +
> +			usb_2_dwc3: usb@a400000 {
> +				compatible = "snps,dwc3";
> +				reg = <0 0x0a400000 0 0xcd00>;
> +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +				iommus = <&apps_smmu 0x800 0x0>;
> +				phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>,
> +					<&usb_2_hsphy1>, <&usb_2_qmpphy1>,
> +					<&usb_2_hsphy2>,
> +					<&usb_2_hsphy3>;
> +				phy-names = "usb2-port0", "usb3-port0",
> +						"usb2-port1", "usb3-port1",
> +						"usb2-port2",
> +						"usb2-port3";
> +			};
> +		};
> +
>  		mdss0: display-subsystem@ae00000 {
>  			compatible = "qcom,sc8280xp-mdss";
>  			reg = <0 0x0ae00000 0 0x1000>;

Best regards,
Krzysztof

