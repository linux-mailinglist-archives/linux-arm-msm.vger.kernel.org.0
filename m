Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B234D6B0093
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 09:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjCHILx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 03:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjCHILg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 03:11:36 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77003A2C2A
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 00:11:30 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id bw19so14465709wrb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 00:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678263089;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A/GnPDgS88xNTx2XNIhiP45O7mjmL1plMVX41sUe2+8=;
        b=MalOJjNVMtNPYOeLbH/dwcS/HBxF6IipOuqs9Y2h48HtACORCb0EXD1aV/S/vDLjSr
         XynJgLAjTVpw2qdJVbhi5ex59lvkpOAbIe/NbeOjLF9Ffner30JqIS5Hnv7/3XvFT9uY
         TtnpCTgyWXs/2MHKMIn3yNnTfvQNczEepDPE7d6DL4eFRZXEdXHHdqux/2ISe4nakMDZ
         g4yu/G6sLLZ1IM4nG0SGvMl6maT6ZehhR580JizG3v9VVsdfBDQ6iNxY29S6ANGc9fNL
         qTSnYqW99OPrCZH3d9fcJvQlswiujJg5iWFcNK1UYpS/EEikx9X7OEF2X7o156+dlGS/
         xzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678263089;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/GnPDgS88xNTx2XNIhiP45O7mjmL1plMVX41sUe2+8=;
        b=msh3WKyBeoYMMOetSl23DV0F/Q38luEY+6+wueDvYZztCB1x+EYpPab6o8PtSaqYmN
         PqMFLIAfeFO2pz5dUzQ6ShDS5E3qTsZqgl6udeyoZij34fztQYJkuf93kcxBJgfGvizX
         vBZe0QkFDf3YkFZsixIQFUq7P6oSDjx/VcF95AlxJ7KAXA+SIBs/dVKsH+zsWTcKFkc2
         I8o35btDKR1anckzW9CThSfzOWeMUHrVjF4Bn8fLXHpOKwupFk3MxScazuL1nXsvzl3w
         X7nNd6hFAd3YQLXaTv7xIaVyqlpHVQkk78YRlIpWN2gUSUAj+d/6Pqmgb2loAC/mfw8c
         HMpQ==
X-Gm-Message-State: AO0yUKX/zDzLDVilKJ8myn/aNBZujBO7QdvNq0tVIwJWQNbWbi2232a8
        5zrXG628rlm035VbQnpDfh3cCg==
X-Google-Smtp-Source: AK7set+e7flPaKlH3cg4u7NLx8NHyCMBeTiS2fqGvGrkYw3YFUr/ZyGizxHyQIupOhmU1WlGo87ZPw==
X-Received: by 2002:adf:ee4c:0:b0:2cd:8237:345b with SMTP id w12-20020adfee4c000000b002cd8237345bmr12745021wro.9.1678263088907;
        Wed, 08 Mar 2023 00:11:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34? ([2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34])
        by smtp.gmail.com with ESMTPSA id g15-20020a5d554f000000b002c5526234d2sm14730053wrw.8.2023.03.08.00.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:11:27 -0800 (PST)
Message-ID: <b2a8a0ca-02b1-f792-a6ee-51f98ea615b0@linaro.org>
Date:   Wed, 8 Mar 2023 09:11:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8450: Mark UFS controller as
 cache coherent
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230307153201.180626-1-manivannan.sadhasivam@linaro.org>
 <20230307153201.180626-2-manivannan.sadhasivam@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230307153201.180626-2-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/03/2023 16:32, Manivannan Sadhasivam wrote:
> The UFS controller on SM8450 supports cache coherency, hence add the
> "dma-coherent" property to mark it as such.
> 
> Fixes: 07fa917a335e ("arm64: dts: qcom: sm8450: add ufs nodes")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 1a744a33bcf4..3ef47b4e9af7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -4003,6 +4003,7 @@ ufs_mem_hc: ufshc@1d84000 {
>   			power-domains = <&gcc UFS_PHY_GDSC>;
>   
>   			iommus = <&apps_smmu 0xe0 0x0>;
> +			dma-coherent;
>   
>   			interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
>   					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_UFS_MEM_CFG 0>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
