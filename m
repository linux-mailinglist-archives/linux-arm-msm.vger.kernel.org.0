Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF967042FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 03:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjEPBjH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 21:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjEPBjG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 21:39:06 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52ACA49F5
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 18:39:05 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f13ef4ad91so16128834e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 18:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684201143; x=1686793143;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EEd2VNamh1i6jf7PkiHXJC0cUQGs4JXzfDvZf2SFrsY=;
        b=fzN2hqaAGe1KyV8sUYflKtQl3IPGSaX0LiupKOi8VqGUk53LwWoZw2uOFBv1iBHiiY
         ygaxcokdSmP2NFtMaiiUN3/nlrpfgJi36uNoagsv8tFNb8zDo2lBhhV1RtvftwOPV9Xz
         p8drDmaNxSbx5xoVvNzds54Unq8mGx+Mm+G6gD/t/hbfW/Ws8HIMZuTJ2YLd/AxMjSW+
         KuE3mR/PJvUlC+1svaDlCJilolhc+nk38qlgTKEfZRASOp4R+hELK366WGREHqHwwN7h
         xoxURRgYiR882yxLt+3lYoIrB04GgQmZaNd/G1OteyrbMv3Yk+2i685LjP7WYRGPMc8G
         64DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684201143; x=1686793143;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEd2VNamh1i6jf7PkiHXJC0cUQGs4JXzfDvZf2SFrsY=;
        b=cV8Y53vlHI8nsrwm7ohiPVM/SfcvK1AMPBOyHd/8asCbFy5cFDFPi020ytFI/oKi6B
         7ETfUiPtBl9ob7SDDMi7g0Nc59xT1DmQNFDtYeJye2yvpeV4mpp3ii0ywavIlig+10fy
         pLZJgFyxhG2la1Qazi0k7bFlhuGp0T2XDwIJYdRUUHr6TitYG2ZFVmZQS6G75kkLb7dq
         lJxiWwRBfRXZwRkaTcdHSDa3s3bPWon9MKLxB61kRve5FNvH4LIsg/3ePXfr0EsUwkpG
         8uvs7bV+5yNJn0hRQAzP6CSrvI8w5UkB9B8q8ywOt6zt9v1xXO42tIs9CsCVpPRVgDGB
         +vOg==
X-Gm-Message-State: AC+VfDy8IRcb6WWBuDEHc4smLttyI17FMjIBNHfnfx7HExQYY3FmqM5X
        LGRoRaT/64DWAGZF3kBhkYbmig==
X-Google-Smtp-Source: ACHHUZ6fpj4cg0RPG98p6BQpabeODsCHDUgNJuiOzcslPL8r/crEfJmYtontwB5v0f+wE7768UWM0Q==
X-Received: by 2002:a19:750b:0:b0:4f2:5007:bd7f with SMTP id y11-20020a19750b000000b004f25007bd7fmr6730952lfe.36.1684201143600;
        Mon, 15 May 2023 18:39:03 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id i22-20020a056512007600b004ece331c830sm2797419lfo.206.2023.05.15.18.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 18:39:03 -0700 (PDT)
Message-ID: <2f24af7e-058a-5a70-f3ad-99ff4f0ed0a5@linaro.org>
Date:   Tue, 16 May 2023 03:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
 with coherent SMMU
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.04.2023 20:52, Dmitry Baryshkov wrote:
> If the Adreno SMMU is dma-coherent, allocation will fail unless we
> disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
> coherent SMMUs (like we have on sm8350 platform).
> 
> Fixes: 54af0ceb7595 ("arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes")
> Reported-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: David Heidelberg <david@ixit.cz>
> ---
Also required for SM8450 (and others)

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org> # SM8450 HDK

Cc: <stable@vger.kernel.org>

Konrad
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2942d2548ce6..f74495dcbd96 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1793,7 +1793,8 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>  	 * This allows GPU to set the bus attributes required to use system
>  	 * cache on behalf of the iommu page table walker.
>  	 */
> -	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> +	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice) &&
> +	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_CACHE_COHERENCY))
>  		quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
>  
>  	return adreno_iommu_create_address_space(gpu, pdev, quirks);
