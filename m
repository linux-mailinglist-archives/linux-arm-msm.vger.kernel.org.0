Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E25247312BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 10:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245160AbjFOIwU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 04:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245381AbjFOIvy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 04:51:54 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87B530C5
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:51:33 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so10149260e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686819092; x=1689411092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jVja41/1k/ct/J3rnto5ByFGnWpi0ILkB3E5zOeFBKU=;
        b=iAWk4RQm/nxvDzdZ6BD1eYHh5RQ8zwCHUi68UWG/naj28Crt/P7s58xDdOASbWXTPZ
         cVP5W/iUktOPovnVxR5ddwuvimo5hIu4AMBjNwCRCF374U1Iu+EOysMuBYLE7woajviv
         VN9j1TPCrKFrU5i9AXczIZodH0FlvNiIAPPgU4pIRFHOXSPwsa11zx7s8NHo6Sfzc1wo
         hQccz3XUBitZEbvnTVVlyOQsTlH6EFLIMRswpg8/EKm2HonYQm2F9P2fhsZR+6vI8aPF
         a1Eihgi7WFzDxZq9nzR7b4raJ3m6hFTCdDhc4xsrVhpSKp6DY3d0W68x4VsRWiab+yhp
         fy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686819092; x=1689411092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVja41/1k/ct/J3rnto5ByFGnWpi0ILkB3E5zOeFBKU=;
        b=hBubixcfWqLTjY/T4CUNg/X2jtT3TN/rXNs1XCRvSDc54uUG5fWFhVdGRFjQzRGyc/
         LH+iLyXf2CPMQPJ0omvqEyffbuBXBDt6rb1/az79YfPRJSIXXHRQTNa9phqxmMXKr0Ku
         VICMvVgd4pYF3//4HSWKR0y1dQRYGFm+2uzslpgdWc0BfDtXkwVMlQ3tnZEEA+T+Ucae
         Cr3yTdRU5NStwv8boS+741mOgY3jjiB8NYax9e73sRvJEiFBjx17Onn3pPjQLwbt+qMy
         wVrphGCycB7KeJ9N995pz9eLzTBa2/EPfKDil96t40mPI1KvJIXVpNDk5BubMPtOVpLf
         Qfag==
X-Gm-Message-State: AC+VfDycryrxWyL8njAqnTv5x2oohrQglxTVyoU1bAuOA+hxiNunq0Tl
        mMf/97kgkNcN6j3AeQIx/GJv9g==
X-Google-Smtp-Source: ACHHUZ7VHe2WrV++iaUJtNovs1B4ZmW49QMq+JKj0mOzn5qWPGwqx0f19GlyA24CPao4Vcyy3UWVhA==
X-Received: by 2002:a05:6512:619:b0:4f7:6b5f:e43b with SMTP id b25-20020a056512061900b004f76b5fe43bmr1890198lfe.18.1686819092039;
        Thu, 15 Jun 2023 01:51:32 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id m14-20020a19520e000000b004eb12329053sm2480580lfb.256.2023.06.15.01.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 01:51:31 -0700 (PDT)
Message-ID: <1ab63d4b-6358-ce08-818a-b5751f88cdde@linaro.org>
Date:   Thu, 15 Jun 2023 10:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Use assigned-clock-rates for
 QUP I2C core clks
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com
References: <20230615084841.12375-1-quic_devipriy@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230615084841.12375-1-quic_devipriy@quicinc.com>
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

On 15.06.2023 10:48, Devi Priya wrote:
> Use assigned-clock-rates property for configuring the QUP I2C core clocks
> to operate at nominal frequency.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
There's probably some logic behind this, and it almost sounds like
it'd be fitting to introduce an OPP table for I2C hosts, especially
given the voltage requirements.

Konrad
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 0baeb10bbdae..78bf7f9c455a 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -361,6 +361,8 @@
>  			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			assigned-clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
> +			assigned-clock-rates = <50000000>;
>  			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
>  			dma-names = "tx", "rx";
>  			status = "disabled";
> @@ -389,6 +391,8 @@
>  			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			assigned-clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
> +			assigned-clock-rates = <50000000>;
>  			dmas = <&blsp_dma 16>, <&blsp_dma 17>;
>  			dma-names = "tx", "rx";
>  			status = "disabled";
> @@ -417,6 +421,8 @@
>  			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			assigned-clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
> +			assigned-clock-rates = <50000000>;
>  			dmas = <&blsp_dma 18>, <&blsp_dma 19>;
>  			dma-names = "tx", "rx";
>  			status = "disabled";
> @@ -446,6 +452,8 @@
>  			clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			assigned-clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
> +			assigned-clock-rates = <50000000>;
>  			dmas = <&blsp_dma 20>, <&blsp_dma 21>;
>  			dma-names = "tx", "rx";
>  			status = "disabled";
