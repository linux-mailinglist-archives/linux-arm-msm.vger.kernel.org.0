Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48A626B0090
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 09:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjCHILh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 03:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbjCHILc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 03:11:32 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79892A0F1D
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 00:11:24 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h14so14497254wru.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 00:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678263083;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VlnN+uyyBGjXgcSX1OwQEmyLh/aARTh0nLRX8h0H9DI=;
        b=iCVP29MH52Ij9ST6I2cO1/ctOGzzb5Q3roiXpD77vTdJ+s/u+VquFut2hphoBaQ/KT
         SwatY9nQjCpsh6gKyM68nlkhUQqbQQtGK2vxtSC0U2F0PMQV4s4EMrEtAF2pkBKvzUBy
         m958H1uvXJDlMa0pDHEi09QRolX2E64A8pBMUoXYhbFsMKPT7GX+mkn33OFOTo7L47F2
         budqKyHCLXlV36u/gAK4X7sCr6ENekPMzULCcOVD33eojiVuCAIFxvKS0JRvc7+UQoHH
         XdgbxISMD70ygrXm16Q4RXTEmh4UZKGcbXhUaevhTf46000ITxDnIC4s5ZPk44Kd+fZJ
         331Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678263083;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlnN+uyyBGjXgcSX1OwQEmyLh/aARTh0nLRX8h0H9DI=;
        b=AiQoVAfxPYMVjWubjYxH0j+TX8yJKiA8dODY9ROfTS/gkYzc+FAbdJa1qvAf/7v+r/
         5LfJhmwxZLizcl97wfrwcJjt5j4ZQtjWHwYwXjzAGoE+6wegX+2CuTbXry68JPnymDAT
         nRFsMhZacaEV2povLc2fQm2y5Iqxd380zAK822F5jCQ9pSS6XvGvKKfJkd5Y00LLY3+t
         i91NRRBlRn+zouRH8cWPpulwWb8o9+hlZlu157I3frtXyQYOu0evIGu67s1cikdioWoz
         ko3rFIYNlEzIPeZr7wlbfYGNPpjC8oUoUJR/a3alps9uovOmRRiC032RHLlXajUrJIX4
         esXQ==
X-Gm-Message-State: AO0yUKUsCSunoxqSdS68aLy8PzbiHVve9n1tmeIDDsdjP3dHIWEsYvMo
        yJLQhiZNlxEt1Sbs4Ur0vvq4ew==
X-Google-Smtp-Source: AK7set8iz9fCMHPB6joGH9m2YGCEknigSWvSYtDKL+G4p8rV3lbq+sTyYRKPrbxU+asg4Y/yx0IbMQ==
X-Received: by 2002:a5d:4006:0:b0:2c7:1c36:3c67 with SMTP id n6-20020a5d4006000000b002c71c363c67mr10639996wrp.23.1678263082985;
        Wed, 08 Mar 2023 00:11:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34? ([2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34])
        by smtp.gmail.com with ESMTPSA id x5-20020a5d4445000000b002c70a0e2cd0sm14403687wrr.101.2023.03.08.00.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:11:21 -0800 (PST)
Message-ID: <1529493a-67f6-4a0b-5ba2-595371cb690a@linaro.org>
Date:   Wed, 8 Mar 2023 09:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8350: Mark UFS controller as
 cache coherent
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230307153201.180626-1-manivannan.sadhasivam@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230307153201.180626-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/03/2023 16:32, Manivannan Sadhasivam wrote:
> The UFS controller on SM8350 supports cache coherency, hence add the
> "dma-coherent" property to mark it as such.
> 
> Fixes: 59c7cf814783 ("arm64: dts: qcom: sm8350: Add UFS nodes")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 1c97e28da6ad..1a5a612d4234 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1664,6 +1664,7 @@ ufs_mem_hc: ufshc@1d84000 {
>   			power-domains = <&gcc UFS_PHY_GDSC>;
>   
>   			iommus = <&apps_smmu 0xe0 0x0>;
> +			dma-coherent;
>   
>   			clock-names =
>   				"core_clk",

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
