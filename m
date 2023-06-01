Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54ED7719BF4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 14:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbjFAMWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 08:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232862AbjFAMWl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 08:22:41 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694C5139
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 05:22:38 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f60a27c4a2so452361e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 05:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685622156; x=1688214156;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IE+0EX4jreqRlyvWFwvtw7kJ5ElwsDpu8BjalgiWcXU=;
        b=VbdfY032bBD2Euu6/l61SoonPI2YsFbrMVqB7CAxiR/3dW2j8PWJV1JBpvh62EKD3E
         cek4CPMPfOlWgG6X26tv3K1dKSlfJfynqwC9j+LMDNVd0kICypB6iy7D1N+X4MkHZRKA
         VLuzng3F8AaK7EKTWhNhGgU9sPCv9KsDx+7qyx4hZ43/q2sYOjnYe8yBoCVynpDbUCS8
         seNsAk91002SH7ssJBngI4i3Dj1u5oZ2YLXI1PjNiwGBSlc3NtIRPRGC1JsHqqqHhaWK
         haKd4cj4UODEnszHslFUW5DVEOvHhg4eeAe+pZV/HmVYdSWds99BnkjEg2SzVLfxTkR+
         LdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685622156; x=1688214156;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IE+0EX4jreqRlyvWFwvtw7kJ5ElwsDpu8BjalgiWcXU=;
        b=KCN3hbkG11jzRMtAxIthTertt5owhszMIFsa6dPRDBjS+VuTITIGCH1URTiEpscTp/
         njQs3T8pNsBcsXalqwZ53lqOZWlg0SykRLMFjbHSc44+uRwKa+rMv8S6jw0l8Jq+Z9VM
         izxu5c4UkHl4hMkC91bxOXWtvkqPakHfN4wAWLIpOGqSA+YKkWFuvSkbqr1iWyi/paxo
         zALIWxU0gtI5SrMqdarBwMFmOt2byZcvRLrV1HKM+mu1BeBQsPXnNQi47aS7VqOiBbzB
         QBoCDfNtSTOiQdsKWT5Cl/DX8vHi2NsiZSo9xfv7xuGfSj7eVbu6aWWFlmUKR7Um4WoN
         gUPQ==
X-Gm-Message-State: AC+VfDyiWi9Zl0oeyANH9drvJiH+ReK3w7cxwFPtt4IRtwZKKffGiA7B
        a71/xDa5dBMLLCjzSKY8xoZu0Q==
X-Google-Smtp-Source: ACHHUZ7spUu4Hagh90t4Pz2sHu6HA0S8/g8G6Z3nQe4orPReZPUVweivSfWaVh0G9b8UC713mtMBgA==
X-Received: by 2002:ac2:520a:0:b0:4f3:78c2:2a6d with SMTP id a10-20020ac2520a000000b004f378c22a6dmr1356274lfl.3.1685622156740;
        Thu, 01 Jun 2023 05:22:36 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id q3-20020ac24a63000000b004f27471e0aesm1071127lfp.79.2023.06.01.05.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 05:22:36 -0700 (PDT)
Message-ID: <eb7b8485-6c6c-da4d-cf90-334139b21ce6@linaro.org>
Date:   Thu, 1 Jun 2023 14:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8250: Add missing interconnect
 paths to USB HCs
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230601120029.38859-1-abel.vesa@linaro.org>
 <20230601120029.38859-2-abel.vesa@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230601120029.38859-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.06.2023 14:00, Abel Vesa wrote:
> The USB HCs nodes are missing the interconnect paths, so add them.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index e5c60a6e4074..eefd3dcbb2e1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3750,6 +3750,10 @@ usb_1: usb@a6f8800 {
>  
>  			resets = <&gcc GCC_USB30_PRIM_BCR>;
>  
> +			interconnects = <&aggre1_noc MASTER_USB3 0 &mc_virt SLAVE_EBI_CH0 0>,
> +					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3 0>;
You need to update #interconnect-cells to 2.

Konrad
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
>  			usb_1_dwc3: usb@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xcd00>;
> @@ -3810,6 +3814,10 @@ usb_2: usb@a8f8800 {
>  
>  			resets = <&gcc GCC_USB30_SEC_BCR>;
>  
> +			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI_CH0 0>,
> +					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3_1 0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
>  			usb_2_dwc3: usb@a800000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a800000 0 0xcd00>;
