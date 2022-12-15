Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94A564DE32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 17:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiLOQJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 11:09:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiLOQJO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 11:09:14 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4996431EE5
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 08:09:10 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bp15so16343014lfb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 08:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GnTFBnK4npo42eEj6gsyJuS1LLfxLqA5vIDwwEoXWe0=;
        b=Jcu0i7E54dlaEbBVuY8k5vj062yXBPq49hzETiqBN1k11s1h55NWLLtRJi9lsrb0xc
         XbeVLnyABMJM1S9mKLxWzoIV2bBLrn/voemTFvIhiTZVXPG+JX6aI7mKBIrb/zxberSu
         JKHCpE33Lh1LnaEWylkmj2rzqXqUF2mc0TTdH94qkRzfJm6OZTKj2twcxQdq5VI12/1E
         OklvkASRJrpMxMiSdroey8JBE8IQa9NTl6CLh/o+86I108dFowO40FWdIUHaBWyW4EFa
         hEurVgAdi7S3cTnaEhNuqy6XhKUsXe0g1mege+H5fZ5jiBQ3jCm/vLS5/SvPkWRvdpC/
         msLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnTFBnK4npo42eEj6gsyJuS1LLfxLqA5vIDwwEoXWe0=;
        b=qAZso1EI2MesNChmzzXFU58JI2NuCKxAX1blwQgkgYNVxmI7OtwMF7L3G46a4X679w
         dn5hRJ561zFOhZgppojkiPuoOU4c+3cbNL2CyyWU5VAw/lJWdCOROS5fZXp3wmM2uLEW
         1N80/Lf8OanlAC0iYHwOD0wDJ0XVjMKwVp5B4O6RYxesnxrmwhYMeq5K45nWk00eiidT
         WO+Oom912l+W1o6W6peXcJMfEHhN6myxzm4f3ei3vOK7X1OqJobuUU4R1YDXvDTSqccL
         7vHXjcXvTdgivAXaKKFL+vevJkcXxNC+JNs8/+/wEv+91Z9Nr7Dpp884fmpLXV/2HSPn
         5mdw==
X-Gm-Message-State: ANoB5pmLBzayoQQ3lFOS6cq12XPWdmheTdEx4zX/YDiaY8XsVAhwr22M
        icEIZyN7sPctzxE3HyQ6+iJycQ==
X-Google-Smtp-Source: AA0mqf4CTwfvn3YPFDkmwO7NHDrgnZz7NyqHWLw1axnZ1C46CcMrB9B7tR2Q8TRCKxfNlfWgfqe/cA==
X-Received: by 2002:a19:ae19:0:b0:4b5:947e:68f3 with SMTP id f25-20020a19ae19000000b004b5947e68f3mr7418497lfc.1.1671120547205;
        Thu, 15 Dec 2022 08:09:07 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id h19-20020ac24d33000000b004b4ea0f4e25sm1195621lfk.301.2022.12.15.08.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 08:09:06 -0800 (PST)
Message-ID: <6a906362-f9ae-024f-e788-580256b2564d@linaro.org>
Date:   Thu, 15 Dec 2022 17:09:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: use symbol names for PCIe
 resets
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221215154824.84198-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221215154824.84198-1-dmitry.baryshkov@linaro.org>
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



On 15.12.2022 16:48, Dmitry Baryshkov wrote:
> The commit e5bbbff5b7d7 ("clk: gcc-qcs404: Add PCIe resets") added names
> for PCIe resets, but it did not change the existing qcs404.dtsi to use
> these names. Do it now and use symbol names to make it easier to check
> and modify the dtsi in future.
> 
> Fixes: e5bbbff5b7d7 ("clk: gcc-qcs404: Add PCIe resets")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index a5324eecb50a..502dd6db491e 100644
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
> @@ -1336,12 +1336,12 @@ pcie: pci@10000000 {
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
