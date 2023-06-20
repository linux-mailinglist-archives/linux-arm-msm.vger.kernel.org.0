Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A379C736966
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 12:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbjFTKgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 06:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjFTKf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 06:35:59 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6375AE3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 03:35:57 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b479d53d48so28253051fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687257353; x=1689849353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/HIA2CPxgECjXLspDDsjBe6Xv7WQ50oq1xrRdt7Bp5U=;
        b=sVPvMzd8ZXN6fxiD2g18okClyC51hJfp0d54xnvst+U3AgVzvn0TK1b6PuQdEtFrTw
         Iv/vqOjmm6F4LhfhFF+BYgXbKQo0jIoR/LTmZ6WGl1994yjMbNJ+FfX1rviiepbOUZvU
         yJnIvN33VaiaP/zbYArV6ndtl9cax7PA+GMlxdF4c8WP7QNkO2XZpMqCYpVm+D+EmTlH
         5C0Mv6679SGVx2Z+gnNLt4ycjaEStf9uB0hEyuJ14jJrpmRd8zlaiZxxgcIdLUJOWP2L
         lv6Uuw4AD6mOhLftfE8Ha3PLlfbbLkL66+HCS+zv7SchnCIV27RjQKJt1MzNr/+MfZuW
         OCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687257353; x=1689849353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HIA2CPxgECjXLspDDsjBe6Xv7WQ50oq1xrRdt7Bp5U=;
        b=KLqbkfdDBKdRE+1aZjN546E/ZOQ2udWAKSVfdoW3kD0LQ5Pc59Obr5g2mJsDzD6m2l
         gwu+GqHb5X2mdALgCVOb76XSVVHX3GBEsJJkRSTY9/y2UdXh7yX4b9kA+EEae42cd+/B
         /suHvV0yZG7X9J09Dyz8AAg3D9uY1yN0INM69uGrsD/no1rwNUvvE1DltQdvZ6fvDPdW
         hHAEAib3sW92wI6KEkel44YSmO7Orn6cTEXqTxcFCY6yiQVHIzuiKxqXLRa4wEpvYTpf
         G0LThaPs1eqfhuTozqaLUqiUsevbT1YOfOy5sogzQj1Lqm0aEstm/HUVnDMkEsUKoOgz
         4lAw==
X-Gm-Message-State: AC+VfDyR619yYfDBzsZjgVTXlExE4obQgkWHi7wwXryHI2IqP9LiSIbN
        dFTRK9acd3zryCZcR2ekDqCteQ==
X-Google-Smtp-Source: ACHHUZ7Vk8cUEKNVc/DdXw9Q7qrbYezVTFnd3aciTZZxAlPCmlNI4FE1L+wYmVuHxswAOAO6vrO1sQ==
X-Received: by 2002:a2e:a175:0:b0:2b3:47b3:3c39 with SMTP id u21-20020a2ea175000000b002b347b33c39mr7252516ljl.23.1687257352911;
        Tue, 20 Jun 2023 03:35:52 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id b22-20020a2e8496000000b002b1f8c10926sm347259ljh.138.2023.06.20.03.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 03:35:52 -0700 (PDT)
Message-ID: <06087f90-ba34-f044-707c-7f3557ec6198@linaro.org>
Date:   Tue, 20 Jun 2023 12:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/8] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620000846.946925-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20.06.2023 02:08, Dmitry Baryshkov wrote:
> Drop the leftover of bus-client -> interconnect conversion, the enum
> dpu_core_perf_data_bus_id.
> 
> Fixes: cb88482e2570 ("drm/msm/dpu: clean up references of DPU custom bus scaling")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index e3795995e145..29bb8ee2bc26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -14,19 +14,6 @@
>  
>  #define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
>  
> -/**
> - * enum dpu_core_perf_data_bus_id - data bus identifier
> - * @DPU_CORE_PERF_DATA_BUS_ID_MNOC: DPU/MNOC data bus
> - * @DPU_CORE_PERF_DATA_BUS_ID_LLCC: MNOC/LLCC data bus
> - * @DPU_CORE_PERF_DATA_BUS_ID_EBI: LLCC/EBI data bus
> - */
> -enum dpu_core_perf_data_bus_id {
> -	DPU_CORE_PERF_DATA_BUS_ID_MNOC,
> -	DPU_CORE_PERF_DATA_BUS_ID_LLCC,
> -	DPU_CORE_PERF_DATA_BUS_ID_EBI,
> -	DPU_CORE_PERF_DATA_BUS_ID_MAX,
> -};
> -
>  /**
>   * struct dpu_core_perf_params - definition of performance parameters
>   * @max_per_pipe_ib: maximum instantaneous bandwidth request
