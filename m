Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90E0F694309
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 11:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjBMKl7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 05:41:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjBMKl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 05:41:58 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434B8126C3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 02:41:57 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m20-20020a05600c3b1400b003e1e754657aso2478616wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 02:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgjcS7+KeP4Hkyc+aaJK85YSDYhCssexy5B+rXr3Pyg=;
        b=urZnPrpzZoz6Ic1MunYYoiruDUhQqVZw5En4oGtoHOCitOwD6ocINtqUohxHPZY5AH
         bcCdGQ+4Toei25OE1J8MEKcCDgnw4bGa4sz5cmt6Kp+eYnG7OJyL6I9qrhWPwFyoJtr6
         OW+7Ycn5FzPFsSHpTjONynkTSuO3cYv5ggpm18MkH3ZmA1Qg6W/4y/6qxlUO0ELj9nPu
         eTXTP8Mpn/RICzKb/ArfNnbeSaZDA/tzt6ONeHjnFJ/LAWBwxG+gKb2BBjAw0dh+NxNz
         8gTKj/etLOWWyJCf/6cFFSkUxBWxk2W/19EY+8SbuQuc5s2REtmCmP7AYPQt0wtrOiYu
         k84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OgjcS7+KeP4Hkyc+aaJK85YSDYhCssexy5B+rXr3Pyg=;
        b=kWAUErRAACje7ZSSIEJrWUCQOzTOVz1e+D+TPwgQHzRLRuVONzCSlnEgmjJN3Ahr60
         oFjV9Duc8sUUU9kASjwBCKltFO+WKtV18y9yXcUb3SefqLthYtsEQAVei5Al+ezK+HiP
         eehtUfFFU5x9urYDgFVs+BYMijIRlUxbVaTLsJydwatimGe5Kkd4+CxHqWHrBhFXElp8
         tqCIhhS+Xt2tKK1cFPol5tcaMumjZWeYyozAFkev71r7mO9vM+zIM4GgEadBq7gE796L
         lKDhY+mKkei6FiAafkUQ4JoFEB1tJVIrDSnO7RxU1xS4xuTsryOrHmzMh2aj90vWSdZ4
         PbCg==
X-Gm-Message-State: AO0yUKXOjDdU31uqdkJBLAHok4clkd9YfFdjf1iQ63q8KVwvYQSJx5fg
        Ztz7LVN5pUBeMgjQU5vBOqZW9Q==
X-Google-Smtp-Source: AK7set9rA8mQHgq6wuA2iP/x+pm5F6nO5RKTtN9bnsMKERYPqrD+b7wr3e1UiZlS/Wh3AR99cFOATQ==
X-Received: by 2002:a05:600c:a692:b0:3df:d86d:797a with SMTP id ip18-20020a05600ca69200b003dfd86d797amr21049235wmb.25.1676284915858;
        Mon, 13 Feb 2023 02:41:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8? ([2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8])
        by smtp.gmail.com with ESMTPSA id m23-20020a7bca57000000b003de8a1b06c0sm16565396wml.7.2023.02.13.02.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:41:55 -0800 (PST)
Message-ID: <5bc2221f-61ba-3801-6dbb-83587d986b50@linaro.org>
Date:   Mon, 13 Feb 2023 11:41:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 06/50] drm/msm/dpu: correct sm8550 scaler
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/02/2023 00:12, Dmitry Baryshkov wrote:
> QSEED4 is a newer variant of QSEED3LITE, which should be used on
> sm8550. Fix the DPU caps structure and used feature masks.

I found nowhere SM8550 uses Qseed4, on downstream DT, it's written:
		qcom,sde-qseed-sw-lib-rev = "qseedv3lite";
		qcom,sde-qseed-scalar-version = <0x3002>;

Neil
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 192fff9238f9..c4e45c472685 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -458,7 +458,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
>   static const struct dpu_caps sm8550_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0xb,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
>   	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>   	.ubwc_version = DPU_HW_UBWC_VER_40,
>   	.has_src_split = true,
> @@ -1301,13 +1301,13 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>   };
>   
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
> -				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
> -				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED4);
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
> -				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
> -				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>   

