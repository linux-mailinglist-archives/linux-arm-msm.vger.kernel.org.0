Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81AA213C4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 17:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgGCPD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 11:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgGCPD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 11:03:57 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87ADC08C5DE
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2020 08:03:56 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z24so12461216ljn.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2020 08:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XiN8AHTEZpKcIkUcY5Ag518B1TWxGfBcPRGyhGmTdOg=;
        b=qqQzhKHn5URSX6FPZQiis7MXQSa6PtMenlonovuzdGI4l8WTvYJT95+Y4JGJmYiwzC
         J+o4aO/whzQlX5kHFr3KcroexvVeWzBwE8cRCj1r/U8r/DMGWjNxGkZafQPCqV90wPek
         hnqch4vSSK7bdY9p9euYr0/YUPNV99Pdcg6Xw37mE22B+FWslmYjTXoIqmBuUeO4WY30
         c8d11hyEmRpSictv6U0MoJbN8Vs4VwK8D9gk0jKEoG4J6hY2ts2EjqrOBgYjFMxLaq6O
         QIMb3aGSlGkNp9LAbB2zLUfE2zocA1YxI2sR2eLh24/+Fv7bac2MaR4W3bPWyqrE3bzX
         y/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XiN8AHTEZpKcIkUcY5Ag518B1TWxGfBcPRGyhGmTdOg=;
        b=mEQF4fR2EVYiOvOVXw0+MEAFBKn4QBdJwzLR1mz/WQm2cZmoyF9ShZli7IqLKb5r9M
         COqVmK4uhAEg0MXk7rNbRnSOmfZjWN0xMeQyfNIaqnncRDuxc1eYgPFRlFBekXsxDDGn
         qIKqMvdxJiS4s43ZKhn2KxalQKujc+CDbJeNJ6g+inWHfb36YKmB02y9TAJtHaK/JbpV
         LQcrEpGZViMGvAsyp76QGHHF8wCFTCmCpFCMfnaRr4abSKZ+Vzeou/rtEMuIMliDbpV4
         wyUmPTyBSDYtnjF/6ryWo9Xfz2ZhCQI01lW3G3u6Lc1//G9jlHhWhIPOiOO1m+WE1mwQ
         xAdQ==
X-Gm-Message-State: AOAM5301PRoxbWXPgc6KDAtlFD1Qx73qEK221RM/ZCawn489VB4Nts4U
        8xPRUcPaw+/NXujYl8a2ne+9Sw==
X-Google-Smtp-Source: ABdhPJzCk+UBWfJxrbrsI+ayi1PqnpX1K3N3fB85MVaEeUGq/660GDdjHB3Kv/HObDJ8c7k5t4fI+g==
X-Received: by 2002:a2e:9f13:: with SMTP id u19mr17473543ljk.427.1593788635055;
        Fri, 03 Jul 2020 08:03:55 -0700 (PDT)
Received: from [192.168.1.211] ([94.25.229.165])
        by smtp.gmail.com with ESMTPSA id y13sm4182807ljd.20.2020.07.03.08.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 08:03:54 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 00/13] Enable GPU for SM8150 and SM8250
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <011a1f99-46bb-12f2-ee07-8cd14d891947@linaro.org>
Date:   Fri, 3 Jul 2020 18:03:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629211725.2592-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2020 00:17, Jonathan Marek wrote:
> This series adds the missing clock drivers and dts nodes to enable
> the GPU on both SM8150 and SM8250.
> 
> Note an extra patch [1] is still required for GPU to work on SM8250.
> 
> Changes in V2:
> * Added "clk: qcom: gcc: fix sm8150 GPU and NPU clocks" to fix the newly added
>    SM8150 GPU gcc clocks
> * Added "Fixes:" tag to "clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL"
> * Added yaml schemas to gpucc dt-bindings patches
> * Added "clk: qcom: add common gdsc_gx_do_nothing_enable for gpucc drivers" and changed
>    gpucc patches to use it.
> * Removed CLK_IS_CRITICAL from gpu_cc_ahb_clk
> * Added missing rpmh regulator level for sm8250 GPU clock levels
> * Use sm8150/sm8250 iommu compatibles in dts
> * Add gcc_gpu_gpll0_clk_src/gcc_gpu_gpll0_div_clk_src to gpucc clocks in dts
> 
> [1] https://gist.github.com/flto/784f1aca761ebf2fe6c105719a4a04ca

With your patches applied:

[   56.751977] msm msm: [drm:adreno_request_fw] loaded qcom/a650_sqe.fw 
from new location
[   56.760166] msm msm: [drm:adreno_request_fw] loaded qcom/a650_gmu.bin 
from new location
[   56.768485] arm-smmu 3da0000.iommu: genpd_runtime_resume()
[   56.774196] PM: gpu_cx_gdsc: Power-on latency exceeded, new value 
49531 ns
[   56.781730] arm-smmu 3da0000.iommu: resume latency exceeded, 462604 ns
[   56.799559] platform 3d6a000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU 
firmware initialization timed out
[   56.809260] arm-smmu 3da0000.iommu: genpd_runtime_suspend()
[   56.813062] msm msm: [drm:adreno_load_gpu] *ERROR* Couldn't power up 
the GPU: -110


-- 
With best wishes
Dmitry
