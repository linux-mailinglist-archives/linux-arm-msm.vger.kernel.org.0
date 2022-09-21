Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67A7F5BF7BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 09:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiIUHbu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 03:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiIUHbt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 03:31:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA24E564EE
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:31:47 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a3so7740535lfk.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=EbNzAZe8gFXbw49lbHOJxB9IrCROBBd4j9VarpK3XkM=;
        b=ueNRpW+TwE9/BMegPy5nQaPWEinFbA6WLQj7JgJNy1R1xKOL//VHuEAFyjCtMQcnhB
         rF7zylIVABKBIHB/nb2KMM8TT/XPVjpQEWyc8J0a3MtH+dV1nT1m6Aok/pejRV0sL5Vg
         3S2q7O/aN58og21gS3hFOI9eMtjOU1fqBB11wWZZiCl/47DPmkkFs+OiFo1HUWlqRwhD
         03p/Izu3tyt4kahkzJXq8kmB8UmxGRfhA+pIMjwpi2Kc3HraAO44Le6aRPHFQ3OKJDOG
         M5VpEwOPGSj2Dbi+m9j7eIFOo5Dz5puRbgCiaZ1mdHWMyCYlCPQziPHwM509eUKgTuz3
         thew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=EbNzAZe8gFXbw49lbHOJxB9IrCROBBd4j9VarpK3XkM=;
        b=HDymAPmKMf7dpynKC2OgeqUeFJHxA1O111QVfyeHPEErZmgVg6XaGX3GwNNlUFzfKF
         mWV215aB8dcidf1k1O0xYH22tjTy3Mcr1+LrOROW67nAzn4dozDftlZuCLaYU9LeRSs1
         Cgo9Ob99s9NnZmxli/k4eRJJ1Bkj5x7PNed1G95AzvrQERJpQVMRb3F5D6oZtSb5R3hW
         MxDG1Xe19ubzE4JYs80ZI66eVReiOZXy+ZbpY7zmuacPvTQPFSqQLq8f2+FXRqTZ2I5N
         umnpAztwxStSE7C4kRubd8V0MSPGfrTOYdmRzqH7kjcA63ydlqPaKkdPaQ6Q0+yPj8zK
         hbyQ==
X-Gm-Message-State: ACrzQf2tqe1rlekyRAlbA+F9/UkVK9ijYuxFhJpGsnBzpd3vvJ2aXowg
        H18HpwOmzYbtV5oQ+11U3Txhsg==
X-Google-Smtp-Source: AMsMyM64KAvr9LNcx8HACnrnx0hEnaSlxW2C+W06q3xVvX2eIKTly12hAQVrRmTqs/0PCaBrLDfCEg==
X-Received: by 2002:a05:6512:3116:b0:49f:4eca:fe07 with SMTP id n22-20020a056512311600b0049f4ecafe07mr8656610lfb.442.1663745506273;
        Wed, 21 Sep 2022 00:31:46 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b3-20020a056512070300b00498f51af149sm306443lfs.308.2022.09.21.00.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:31:45 -0700 (PDT)
Message-ID: <77b7d58f-ba85-86de-8635-6efbb1354a08@linaro.org>
Date:   Wed, 21 Sep 2022 09:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] iommu: arm-smmu-qcom: add sdm670 compatible
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20220920223955.151507-1-mailingradian@gmail.com>
 <20220920223955.151507-3-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920223955.151507-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 00:39, Richard Acayan wrote:
> The Snapdragon 670 needs the IOMMU for GENI I2C. Add a compatible string to
> support it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index b2708de25ea3..bf9653b9eb89 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -431,6 +431,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>  	{ .compatible = "qcom,sc8180x-smmu-500" },
>  	{ .compatible = "qcom,sc8280xp-smmu-500" },
>  	{ .compatible = "qcom,sdm630-smmu-v2" },
> +	{ .compatible = "qcom,sdm670-smmu-500" },

Why do we keep adding compatibles to the driver for apparently
compatible devices?


Best regards,
Krzysztof
