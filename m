Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35F1C709FEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 21:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjESTdJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 15:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjESTdJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 15:33:09 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C08F7
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 12:33:07 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2af0eb50b4aso36065721fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 12:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684524785; x=1687116785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OZVN230CAcFfgTcYjqdCoOVW4NdmvfAyK8FKV16f3b4=;
        b=yuHxMex0Qnq0mzpvOztFdRUqyK/Qcdb2BhUJuxbMavQVoJlrKEQtWo7SEvQDIxdSfB
         Kl/vyGauxm6M3D3mcSIVKmm/zBAyx2FAUZjfFzVz0SAjs/xKGI234up74OHJ4tCAhV2m
         a/+jj/KpDdwoUorTeUoUM7cWyO3mCnUsafbRERn91cHYgW8eraqwn8nAxE1MWtk5eV3U
         XTsQ5nV34MA3Fx1/TSYT9IxywgK+kNPSTRDRFXjrVZuI5aLpxmdy8e6zYoktgIRCZL5M
         wVVm/AGe5kkhJEkP+71UkWUSuomLkHqV/iRTOFJUVn5QqK9p24VZbVDuUrCJzlo6cxqQ
         8SJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684524785; x=1687116785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZVN230CAcFfgTcYjqdCoOVW4NdmvfAyK8FKV16f3b4=;
        b=OjexYLj37lUVJXtQVV0szNZqCzO8u7xu01NlU7HfG/+5vS2f023w+3NJF0JhSWf9G4
         RPYJsx3dXyex7jHwfXYGRO0Z4LCJNq3WPMT1r28XixyC9dtDRKlkXQgx4L/GGspKsSLC
         h2lUp5oES+dxFf0cxusvOE8y/sAYOCEkuudUc82YIO/w8yIRrGGOSzE/8jebpqp9MgME
         tRG80gJ4nNZmEg10KYLmBDq5oKCMilBSvQo5DswsnGKnZ2rZse5nAhWgx5v6U6HYFXD2
         RHq9qhmVE3YhZe8R/BonIlOOsge0Y3O3A6q4TK3aPy3cWa0UP0IBZ6+MuQ+BtvV8G/Zy
         /bIA==
X-Gm-Message-State: AC+VfDw6DJ9aT13REaYPyFF1WuCDRJ2i7qJO1qcLMXCN+mYYLa5ET0xa
        /XhI5SCYmc8plXtAk4gKD8Z8nQ==
X-Google-Smtp-Source: ACHHUZ5tV8zCU+DIBj7Os87JHpRfdKbxz0jbM3+pO51R5PoKzgSpedEI/vpJDaZEvLV1FRCJbsM0Hg==
X-Received: by 2002:a2e:2e0f:0:b0:2ad:95dd:8802 with SMTP id u15-20020a2e2e0f000000b002ad95dd8802mr1143231lju.38.1684524785455;
        Fri, 19 May 2023 12:33:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w5-20020ac24425000000b004f266537ad7sm8010lfl.34.2023.05.19.12.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 12:33:05 -0700 (PDT)
Message-ID: <a9669c51-3171-3751-f249-be4a7f4312c2@linaro.org>
Date:   Fri, 19 May 2023 22:33:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: simplify pixel clk rate handling
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230118130031.2345941-1-dmitry.baryshkov@linaro.org>
 <8ebd01e3-00be-b0da-e91a-ab1a4e074074@quicinc.com>
 <85d0a8c6-f6b4-4cd4-7cc6-b13f37523bd4@linaro.org>
 <637c1848-0e3f-9f3d-dc56-8f2d5b8de696@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <637c1848-0e3f-9f3d-dc56-8f2d5b8de696@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2023 21:54, Jessica Zhang wrote:
> 
> 
> On 3/28/2023 6:04 AM, Dmitry Baryshkov wrote:
>> On 26/01/2023 02:07, Abhinav Kumar wrote:
>>>
>>>
>>> On 1/18/2023 5:00 AM, Dmitry Baryshkov wrote:
>>>> Move a call to dsi_calc_pclk() out of calc_clk_rate directly towards
>>>> msm_dsi_host_get_phy_clk_req(). It is called for both 6g and v2 hosts.
>>>>
>>>> Also, while we are at it, replace another dsi_get_pclk_rate() 
>>>> invocation
>>>> with using the stored value at msm_host->pixel_clk_rate.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/dsi/dsi.h      |  4 ++--
>>>>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  2 +-
>>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++++++------------
>>>>   3 files changed, 15 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>>>> b/drivers/gpu/drm/msm/dsi/dsi.h
>>>> index bd3763a5d723..93ec54478eb6 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>>>> @@ -129,8 +129,8 @@ int dsi_dma_base_get_6g(struct msm_dsi_host 
>>>> *msm_host, uint64_t *iova);
>>>>   int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t 
>>>> *iova);
>>>>   int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>>>>   int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
>>>> -int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool 
>>>> is_bonded_dsi);
>>>> -int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
>>>> is_bonded_dsi);
>>>> +int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host);
>>>> +int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host);
>>>>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, 
>>>> struct mipi_dsi_host *host);
>>>>   void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
>>>>   struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct 
>>>> mipi_dsi_host *host);
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h 
>>>> b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>>>> index 44be4a88aa83..5106e66846c3 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>>>> @@ -51,7 +51,7 @@ struct msm_dsi_host_cfg_ops {
>>>>       void* (*tx_buf_get)(struct msm_dsi_host *msm_host);
>>>>       void (*tx_buf_put)(struct msm_dsi_host *msm_host);
>>>>       int (*dma_base_get)(struct msm_dsi_host *msm_host, uint64_t 
>>>> *iova);
>>>> -    int (*calc_clk_rate)(struct msm_dsi_host *msm_host, bool 
>>>> is_bonded_dsi);
>>>> +    int (*calc_clk_rate)(struct msm_dsi_host *msm_host);
>>>>   };
>>>>   struct msm_dsi_cfg_handler {
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> index 18fa30e1e858..7d99a108bff6 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> @@ -616,28 +616,21 @@ static void dsi_calc_pclk(struct msm_dsi_host 
>>>> *msm_host, bool is_bonded_dsi)
>>>>   }
>>>> -int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
>>>> is_bonded_dsi)
>>>> +int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host)
>>>>   {
>>>> -    if (!msm_host->mode) {
>>>> -        pr_err("%s: mode not set\n", __func__);
>>>> -        return -EINVAL;
>>>> -    }
>>>> -
>>>> -    dsi_calc_pclk(msm_host, is_bonded_dsi);
>>>>       msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
>>>> +
>>>>       return 0;
>>>>   }
>>>> -int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool 
>>>> is_bonded_dsi)
>>>> +int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host)
>>>>   {
>>>>       u32 bpp = dsi_get_bpp(msm_host->format);
>>>>       u64 pclk_bpp;
>>>>       unsigned int esc_mhz, esc_div;
>>>>       unsigned long byte_mhz;
>>>> -    dsi_calc_pclk(msm_host, is_bonded_dsi);
>>>> -
>>>> -    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, 
>>>> is_bonded_dsi) * bpp;
>>>> +    pclk_bpp = msm_host->pixel_clk_rate * bpp;
>>>>       do_div(pclk_bpp, 8);
>>>>       msm_host->src_clk_rate = pclk_bpp;
>>>> @@ -2292,7 +2285,14 @@ void msm_dsi_host_get_phy_clk_req(struct 
>>>> mipi_dsi_host *host,
>>>>       const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>>>>       int ret;
>>>> -    ret = cfg_hnd->ops->calc_clk_rate(msm_host, is_bonded_dsi);
>>>> +    if (!msm_host->mode) {
>>>> +        pr_err("%s: mode not set\n", __func__);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    dsi_calc_pclk(msm_host, is_bonded_dsi);
>>>> +
>>>> +    ret = cfg_hnd->ops->calc_clk_rate(msm_host);
>>>
>>> I am not too sure what we are gaining by this.
>>>
>>> Its not that we are replacing dsi_get_pclk_rate().
>>>
>>> We are moving the dsi_get_pclk_rate() from the calc_clk_rate() to the 
>>> msm_dsi_host_get_phy_clk_req().
>>>
>>> Also, with this change, dsi_calc_clk_rate_6g() looks kind of empty to 
>>> stand on its own.
>>>
>>> The original intention of the calc_clk_rate() op seems to be 
>>> calculate and store all the clocks (byte, pixel and esc).
>>>
>>> Why change that behavior by breaking it up?
>>
>> Unification between platforms. Both v2 and 6g platforms call 
>> dsi_calc_pclk(). Let's just move it to a common code path.
> 
> Hi Dmitry,
> 
> I think what Abhinav means here is that the meaning and functionality of 
> calc_clk_rate() changes with this patch.
> 
> Before, calc_clk_rate() does *all* the clk_rate calculations and 
> assignments. But after this change, it will only calculate and assign 
> the escape clk rate.
> 
> I agree with Abhinav that this change renders the calc_clk_rate() op 
> misleading as it will not calculate all of the clock rates anymore.

Would it make sense if I rename it to calc_other_clock_rates()?

Moving pclk calculation to the core code emphasises that pclk 
calculation is common between v2 and 6g hosts.

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>>
>>>>       if (ret) {
>>>>           pr_err("%s: unable to calc clk rate, %d\n", __func__, ret);
>>>>           return;
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

