Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F500213C68
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 17:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgGCPOX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 11:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgGCPOX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 11:14:23 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C3CC08C5DF
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2020 08:14:22 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f5so21532030ljj.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2020 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JY/HxR/lzMyO9Wjlc8f/yOCn5j+ZOolLev0KN/zmiSw=;
        b=Spxc942GydXokLEKbdsV45nNrRpyII0YD3U6yuW20ePwhBt9xJH86Q7DrZ+NINojiy
         CY5H0W4kpekk6qTXLXWYgt5CR2fcGycdo4OE6MW0f5DL5BhZKj4wYZQi4Gkd1RsAa6CH
         pZYLzEnTp65PWJJFtTI8RSKmVlywpeJN/b5ZG+GlRQtcMDTGTh1yjvpCmNkaWRHgHKmB
         AH30tdrLa8PYaJ9hnQKNIF789/xrwnGp3ZIWVa3cTW4skrVF2pdiGeO2MoXejPge4Pat
         nxS3/EmrC8YuSGlAH5asyQJg4aQEooFoc7XsZqQyd58QM1hF8Kxo3Rvl1DcrBPiASZJS
         KkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JY/HxR/lzMyO9Wjlc8f/yOCn5j+ZOolLev0KN/zmiSw=;
        b=et7ZBkCAfBMnBgjSJT4j6iCJd8A1Twr6Mr0VNikzDjs5NhWCfDc8Qoj5fqOwsNUIKy
         jySzSIyh9fauG57LDRXPH/h0pEFMIBZO698YklDTeqFiQg+cxe1ZxUb1X2B6Gp0A/Q5r
         QtcpR+1WbUlKCEq/A/qk4JGLIffwOC7v0MaU+xy0xP1oGCXN2a2XSThmDWP0qctaSJhU
         mv7swwy71Q4cPpHd9WoOeTqkjcvqFEb2tHceFu1ITy0OpovpE5Sw14gZ3zUgFWMWmxUr
         yRy4nD+oHU9G3a/0jMn6zZ4e40nHQdvWiJkwmO88imF4FTo8xW2mPZIxy1Eq6fSiAIhn
         kLAQ==
X-Gm-Message-State: AOAM532a1SZZ4dV9oNB2FQ/nuomLYxUU8xm+um4T0v81Qc9/ReKphCKR
        gmVE1AonyVpwiKOICCZo3cNvhQ==
X-Google-Smtp-Source: ABdhPJyaVnogxmsT+T7//bOE1AeRzHfMq9P4/Z/lXVvreWW1uRmrFoOMQjfiI4kp6DHWX5BznXIpgQ==
X-Received: by 2002:a2e:b607:: with SMTP id r7mr13854086ljn.5.1593789261361;
        Fri, 03 Jul 2020 08:14:21 -0700 (PDT)
Received: from [192.168.1.211] ([94.25.229.165])
        by smtp.gmail.com with ESMTPSA id x30sm4727523lfn.3.2020.07.03.08.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 08:14:20 -0700 (PDT)
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
 <011a1f99-46bb-12f2-ee07-8cd14d891947@linaro.org>
 <1887f23d-57ef-c83a-4eaf-a8f8d5024ebf@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <a82bd8ed-fc8f-ea94-7687-cdc17190900a@linaro.org>
Date:   Fri, 3 Jul 2020 18:14:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1887f23d-57ef-c83a-4eaf-a8f8d5024ebf@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/07/2020 18:08, Jonathan Marek wrote:
> On 7/3/20 11:03 AM, Dmitry Baryshkov wrote:
>> On 30/06/2020 00:17, Jonathan Marek wrote:
>>> This series adds the missing clock drivers and dts nodes to enable
>>> the GPU on both SM8150 and SM8250.
>>>
>>> Note an extra patch [1] is still required for GPU to work on SM8250.
>>>
>>> Changes in V2:
>>> * Added "clk: qcom: gcc: fix sm8150 GPU and NPU clocks" to fix the 
>>> newly added
>>>    SM8150 GPU gcc clocks
>>> * Added "Fixes:" tag to "clk: qcom: clk-alpha-pll: remove 
>>> unused/incorrect PLL_CAL_VAL"
>>> * Added yaml schemas to gpucc dt-bindings patches
>>> * Added "clk: qcom: add common gdsc_gx_do_nothing_enable for gpucc 
>>> drivers" and changed
>>>    gpucc patches to use it.
>>> * Removed CLK_IS_CRITICAL from gpu_cc_ahb_clk
>>> * Added missing rpmh regulator level for sm8250 GPU clock levels
>>> * Use sm8150/sm8250 iommu compatibles in dts
>>> * Add gcc_gpu_gpll0_clk_src/gcc_gpu_gpll0_div_clk_src to gpucc clocks 
>>> in dts
>>>
>>> [1] https://gist.github.com/flto/784f1aca761ebf2fe6c105719a4a04ca
>>
>> With your patches applied:
>>
>> [   56.751977] msm msm: [drm:adreno_request_fw] loaded 
>> qcom/a650_sqe.fw from new location
>> [   56.760166] msm msm: [drm:adreno_request_fw] loaded 
>> qcom/a650_gmu.bin from new location
>> [   56.768485] arm-smmu 3da0000.iommu: genpd_runtime_resume()
>> [   56.774196] PM: gpu_cx_gdsc: Power-on latency exceeded, new value 
>> 49531 ns
>> [   56.781730] arm-smmu 3da0000.iommu: resume latency exceeded, 462604 ns
>> [   56.799559] platform 3d6a000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU 
>> firmware initialization timed out
>> [   56.809260] arm-smmu 3da0000.iommu: genpd_runtime_suspend()
>> [   56.813062] msm msm: [drm:adreno_load_gpu] *ERROR* Couldn't power 
>> up the GPU: -110
>>
>>
> 
> Do you have your branch published somewhere so I can see what could've 
> went wrong?

I've applied your patches (this series + the extra one for gpu/drm/msm) 
on top of 
https://git.linaro.org/landing-teams/working/qualcomm/kernel.git branch 
integration-linux-qcomlt .


-- 
With best wishes
Dmitry
