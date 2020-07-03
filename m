Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA52213E8E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 19:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgGCR3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 13:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgGCR3u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 13:29:50 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8D1C08C5DE
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2020 10:29:50 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id n23so37901938ljh.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2020 10:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vIJGp/tIIh/3pZbY4z+teITpUzCocjwTtTmhDigz2Xo=;
        b=odtV6rIsOicdI5jmmLu7JR3zxYqknWsxCRx1jPNBaAb061U6Z1SLfwSC5lT3O9ybde
         E1BqiOucagC9v1LIXtGBk85M22l1Y3OkVWepS8teCb1BnUkS4miXKRETK1RC4BmVfWyE
         /IE1/S7f19wZOy2OKjjb4p86k9HTNDxjApP99K7WZItebKJKs/ZFj03bhyyng5auj94h
         HVGWJmQwW0QkVdoz0okbcDsB+tFvzv4rIy8Ew2RqpY8A4KdProzBm8CUz0Qutrh5ryGd
         m0HsCXhYJkCcuvlMWbjS0xGvULJbKtM/IuVWYkk2i72HlkUWDQs5LuMG76Wy5JiRjgCk
         g9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vIJGp/tIIh/3pZbY4z+teITpUzCocjwTtTmhDigz2Xo=;
        b=shdhz9/E9b7vC8HsP/EfFtMHKQ/KwJf8g+8AfNHwYUsDgN/7Tg1Rldb55u26gKRyG2
         OUTwXfibQsi3d50QnYNwjsNQwynTAdEmQ8F69XhcGjOfC0kUSnquwbHJwT/VHkz7T8MH
         ncTmlyH/dJoBNgk/ZT+kteoRvtUNBty86u5CZ14AkZh6JqwuzJPgJ8DtJT449N/kmWv/
         0chF15Wxn3HT9kIVKjJhta0GgbH/jA8nK/R8Can8pjFVc2D78Jy3EKwNJfvxgt4vGYc9
         e4wErhT/SpWs+KeHnt6JFWvnRR4kkhXKJJ8OjUgSpybXnfe/o15i9BoBG/Gpdnha8TXJ
         UpEA==
X-Gm-Message-State: AOAM5306YMcuQT8aevHs3f+dpoto1jOn1CDnT7eiWv/O92QiV8rEB6hG
        BM8kEpUdv0HL04RhR5c1zYdRtQ==
X-Google-Smtp-Source: ABdhPJyMcApj6j4n87dYIaHMrIb8EjopS5CoMdoSTXvqMJzKRN4SlnEh//uvf3OdoXR99pvaH6JheA==
X-Received: by 2002:a2e:9744:: with SMTP id f4mr18485634ljj.367.1593797388454;
        Fri, 03 Jul 2020 10:29:48 -0700 (PDT)
Received: from [192.168.1.211] ([94.25.229.165])
        by smtp.gmail.com with ESMTPSA id a5sm4889105lfh.15.2020.07.03.10.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 10:29:47 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 00/13] Enable GPU for SM8150 and SM8250
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
References: <20200629211725.2592-1-jonathan@marek.ca>
 <011a1f99-46bb-12f2-ee07-8cd14d891947@linaro.org>
 <1887f23d-57ef-c83a-4eaf-a8f8d5024ebf@marek.ca>
 <a82bd8ed-fc8f-ea94-7687-cdc17190900a@linaro.org>
Message-ID: <04900059-6af8-1b48-33f9-7b8426a55fd0@linaro.org>
Date:   Fri, 3 Jul 2020 20:29:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <a82bd8ed-fc8f-ea94-7687-cdc17190900a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/07/2020 18:14, Dmitry Baryshkov wrote:
> On 03/07/2020 18:08, Jonathan Marek wrote:
>> On 7/3/20 11:03 AM, Dmitry Baryshkov wrote:
>>> On 30/06/2020 00:17, Jonathan Marek wrote:
>>>> This series adds the missing clock drivers and dts nodes to enable
>>>> the GPU on both SM8150 and SM8250.
>>>>
>>>> Note an extra patch [1] is still required for GPU to work on SM8250.
>>>>
>>>> Changes in V2:
>>>> * Added "clk: qcom: gcc: fix sm8150 GPU and NPU clocks" to fix the 
>>>> newly added
>>>>    SM8150 GPU gcc clocks
>>>> * Added "Fixes:" tag to "clk: qcom: clk-alpha-pll: remove 
>>>> unused/incorrect PLL_CAL_VAL"
>>>> * Added yaml schemas to gpucc dt-bindings patches
>>>> * Added "clk: qcom: add common gdsc_gx_do_nothing_enable for gpucc 
>>>> drivers" and changed
>>>>    gpucc patches to use it.
>>>> * Removed CLK_IS_CRITICAL from gpu_cc_ahb_clk
>>>> * Added missing rpmh regulator level for sm8250 GPU clock levels
>>>> * Use sm8150/sm8250 iommu compatibles in dts
>>>> * Add gcc_gpu_gpll0_clk_src/gcc_gpu_gpll0_div_clk_src to gpucc 
>>>> clocks in dts
>>>>
>>>> [1] https://gist.github.com/flto/784f1aca761ebf2fe6c105719a4a04ca
>>>
>>> With your patches applied:
>>>
>>> [   56.751977] msm msm: [drm:adreno_request_fw] loaded 
>>> qcom/a650_sqe.fw from new location
>>> [   56.760166] msm msm: [drm:adreno_request_fw] loaded 
>>> qcom/a650_gmu.bin from new location
>>> [   56.768485] arm-smmu 3da0000.iommu: genpd_runtime_resume()
>>> [   56.774196] PM: gpu_cx_gdsc: Power-on latency exceeded, new value 
>>> 49531 ns
>>> [   56.781730] arm-smmu 3da0000.iommu: resume latency exceeded, 
>>> 462604 ns
>>> [   56.799559] platform 3d6a000.gmu: [drm:a6xx_gmu_resume] *ERROR* 
>>> GMU firmware initialization timed out
>>> [   56.809260] arm-smmu 3da0000.iommu: genpd_runtime_suspend()
>>> [   56.813062] msm msm: [drm:adreno_load_gpu] *ERROR* Couldn't power 
>>> up the GPU: -110
>>>
>>>
>>
>> Do you have your branch published somewhere so I can see what could've 
>> went wrong?
> 
> I've applied your patches (this series + the extra one for gpu/drm/msm) 
> on top of 
> https://git.linaro.org/landing-teams/working/qualcomm/kernel.git branch 
> integration-linux-qcomlt .

A trimmed down version: 
git.linaro.org/people/dmitry.baryshkov/kernel.git branch sm8250-gpu-test


-- 
With best wishes
Dmitry
