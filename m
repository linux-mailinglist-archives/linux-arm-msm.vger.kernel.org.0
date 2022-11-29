Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3119263C108
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 14:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbiK2NaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 08:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbiK2NaW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 08:30:22 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228D962E94
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:30:21 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id l8so16925638ljh.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/i/Bzc17DzJULUPArLwbWH3dtwdHj5k6eH+Ns1LxYC8=;
        b=uEG9DdbgSVGkP+7a2JpzUDoOE6jB3Xt6w1atQHc0MhHqkjSdsHRkYJuecsAYEYWUZ9
         Yz1Y2HAzqIZJ7WTZESOOEezQa4PZpvd9/CRcRgfhnPLuoI2AxsV85L3TMO8o2y2l6xF+
         albLwHWeHsAjb0if/b/b1wg6dRsgii7LMYT36gIuqbMS9zXq0jtRoNOUjy949AjsjNkR
         2+Iorx2cs+93b85Hpx6P+mFEf54W/Mnz8RwZxQJG61Kh85I0FDem5cTCQLTb350OF5RR
         zmVvB7JKmpCPil4fofRsO5WHBPDopFRS0hJuJaukYksroESui8nuvSfO8HiSxF/0uFHz
         vOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/i/Bzc17DzJULUPArLwbWH3dtwdHj5k6eH+Ns1LxYC8=;
        b=YNTftL2xuGX8J8L0zMbnr8GITwNRHTZ55zhOsZJYD1BNMxddcosGf9aKKFJIdykq4L
         vN7hHdUrX3W7Qeid6X9RmyExDHVxU/4H7KCQJfS5RwuA4gBWU6pQVmsxlCW2chNXdSzd
         UafIpgk5UTPmofM1J2q4RBQui+9sN3FWV3qnjwefWSkHwqT4ZlKgxt0E8uXLMm5XBcPv
         R5wOc7ZiFD/Uzgi0BqQvXPOOsaqhTeohMEYaBIysDniK2f8keZCsGQGRcMvJmIufiyoY
         tw022P46oHeaAi8qBo/mHXQ5YzVThy4RScTNzLT23pvltC6OEfG4pay8omLWmCLEIawX
         tsDA==
X-Gm-Message-State: ANoB5pnqyd2dTjCSZSaD4oR7/kj5BcM48eHU1U3Fno8vmXb+yvkYbhTH
        dGEocpN2uiM9DiB8sc1LMMWjjK8kDOtNmQ==
X-Google-Smtp-Source: AA0mqf6wScuI0Rf44kujd7IhwFR09ZuCRV2bqZDezbGBkhaMhklTYpRyB7rBjhBwNgXpYLXxgASMwQ==
X-Received: by 2002:a2e:9611:0:b0:276:b134:b04c with SMTP id v17-20020a2e9611000000b00276b134b04cmr12646287ljh.492.1669728619532;
        Tue, 29 Nov 2022 05:30:19 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id u9-20020a2ea169000000b002776ce08326sm1533662ljl.29.2022.11.29.05.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 05:30:19 -0800 (PST)
Message-ID: <65c9cd0a-ef4e-5d38-3b15-0126b1eb7a7f@linaro.org>
Date:   Tue, 29 Nov 2022 14:30:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: Add geni debug uart node for
 qup0
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org, me@iskren.info,
        Bjorn Andersson <andersson@kernel.org>
References: <20221128171215.1768745-1-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221128171215.1768745-1-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28.11.2022 18:12, Bhupesh Sharma wrote:
> qup0 on sm6115 / sm4250 has 6 SEs, with SE4 as debug uart.
> Add the debug uart node in sm6115 dtsi file.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
> - Based on linux-next.
> 
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 0340ed21be05..e4a2440ce544 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -649,6 +649,26 @@ ufs_mem_phy_lanes: phy@4807400 {
>  			};
>  		};
>  
> +		qupv3_id_0: geniqup@4ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x4ac0000 0x2000>;
Please pad address to 8 hex digits, same below.

Konrad
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			uart4: serial@4a90000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x4a90000 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
> +				interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +		};
> +
>  		usb_1: usb@4ef8800 {
>  			compatible = "qcom,sm6115-dwc3", "qcom,dwc3";
>  			reg = <0x04ef8800 0x400>;
