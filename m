Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7598212E2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 22:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgGBUvA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 16:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgGBUvA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 16:51:00 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0239CC08C5DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 13:50:59 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id e11so27034955qkm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/Xy1whvuko1GTsGsLTQjwBeZFEtLbfclioQ2pv5Xu6I=;
        b=MV54ND7H7Bc/oHzR94MnTdFW9fv2FGROmlNBcDZrWXgvoT/VmKwgxlTWT3hktSplFw
         iP3MfIk5Y2XICm7EUWaYBtACPCQWB5EUNXe1AGRfVDg5ad6VV4QG7NEEMFRoar9rFPJW
         wHwTHWrFEUJOW0t0OLUyzQL4EmDv6JjiMkIEN5cFC9veqIGf2C8OpeeajSNDRXfXXVL1
         Bo7A7STqI3qD6RpE9tdBuxBc8lCi/jDEOE/ZNN65LV3VROIWPH8HjPq79QteqXSkdNZC
         bN41FVA5tRvdrrBIKU4V4TJX9T9cBXkAk9zz8Vwf8TkaCUqXq95l6i+zxtziUmc8UVfy
         HccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/Xy1whvuko1GTsGsLTQjwBeZFEtLbfclioQ2pv5Xu6I=;
        b=tiHFIDYBamow5Zau1JelnzB/Z+haC5Qmv430qMS7DQBdMPORarRZgTvqza7zwerOhX
         vYVOWbqOo+Q9+XZ+uJi7JJ79LxZRLMamPhOfooMVfcXj2LdUudj6ZaMsqNWvqRECJFdk
         RvqVhYzGPDAFYbKrmrBQ6Bzfr3UvPHc1zq9ahnL7l/yudZ7BTUjEjjChtGvnY3ZNKbxb
         zOM00JkfNK0A4YwKJ5hJZPvb3PQV/2FuxHpnI1wByqGK5l2GZirAh672MMvtGqvOViZU
         u0Cf8sjOUJ+aSKrjEOpEHD7lr6wdlRSwhKRsoGbrper+D2bKxKyGqqenzgOZN5j294oW
         zE4g==
X-Gm-Message-State: AOAM530vXhhFmRtYMLTGK+WPO5aepXdZcHq1eKe7kgee0jzGRUF36vNP
        oiYQ61pMTptuxvtWbhgmWib3sQ==
X-Google-Smtp-Source: ABdhPJyEOUFyVKlZLOsHKYeSe6ToCPD5eqg11IHVIqUFrAjlkKiBPSPt3z0mdIyyfRpDRR6bNbmyuw==
X-Received: by 2002:a05:620a:1369:: with SMTP id d9mr31646444qkl.419.1593723059117;
        Thu, 02 Jul 2020 13:50:59 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id u58sm9918787qth.77.2020.07.02.13.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2020 13:50:58 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 07/13] dt-bindings: clock: Introduce SM8250 QCOM
 Graphics clock bindings
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200629211725.2592-1-jonathan@marek.ca>
 <20200629211725.2592-8-jonathan@marek.ca> <20200702204624.GA1661017@bogus>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <50620a20-0721-b5b7-8bc9-217536d51c29@marek.ca>
Date:   Thu, 2 Jul 2020 16:49:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200702204624.GA1661017@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/2/20 4:46 PM, Rob Herring wrote:
> On Mon, Jun 29, 2020 at 05:17:13PM -0400, Jonathan Marek wrote:
>> Add device tree bindings for graphics clock controller for
>> Qualcomm Technology Inc's SM8250 SoCs.
>>
> 
> Looks like these 2 schemas could be a single one.
> 

I agree, but there are already separate schemas for sdm845 and sc7180 
gpucc (which these are a copy paste of), so should those be removed and 
use the single one too?

>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   .../bindings/clock/qcom,sm8250-gpucc.yaml     | 74 +++++++++++++++++++
>>   include/dt-bindings/clock/qcom,gpucc-sm8250.h | 40 ++++++++++
>>   2 files changed, 114 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8250.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
>> new file mode 100644
>> index 000000000000..2b9c8f97b76d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
>> @@ -0,0 +1,74 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sm8250-gpucc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Graphics Clock & Reset Controller Binding for SM8250
>> +
>> +maintainers:
>> +  -
>> +
>> +description: |
>> +  Qualcomm graphics clock control module which supports the clocks, resets and
>> +  power domains on SM8250.
>> +
>> +  See also dt-bindings/clock/qcom,gpucc-sm8250.h.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8250-gpucc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: GPLL0 main branch source
>> +      - description: GPLL0 div branch source
>> +
>> +  clock-names:
>> +    items:
>> +      - const: bi_tcxo
>> +      - const: gcc_gpu_gpll0_clk_src
>> +      - const: gcc_gpu_gpll0_div_clk_src
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +  - '#power-domain-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    clock-controller@3d90000 {
>> +      compatible = "qcom,sm8250-gpucc";
>> +      reg = <0x3d90000 0x9000>;
>> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +               <&gcc GCC_GPU_GPLL0_CLK_SRC>,
>> +               <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
>> +      clock-names = "bi_tcxo",
>> +                    "gcc_gpu_gpll0_clk_src",
>> +                    "gcc_gpu_gpll0_div_clk_src";
>> +      #clock-cells = <1>;
>> +      #reset-cells = <1>;
>> +      #power-domain-cells = <1>;
>> +    };
>> +...
>> diff --git a/include/dt-bindings/clock/qcom,gpucc-sm8250.h b/include/dt-bindings/clock/qcom,gpucc-sm8250.h
>> new file mode 100644
>> index 000000000000..c8fe64e399fd
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,gpucc-sm8250.h
>> @@ -0,0 +1,40 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8250_H
>> +#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8250_H
>> +
>> +/* GPU_CC clock registers */
>> +#define GPU_CC_AHB_CLK				0
>> +#define GPU_CC_CRC_AHB_CLK			1
>> +#define GPU_CC_CX_APB_CLK			2
>> +#define GPU_CC_CX_GMU_CLK			3
>> +#define GPU_CC_CX_QDSS_AT_CLK			4
>> +#define GPU_CC_CX_QDSS_TRIG_CLK			5
>> +#define GPU_CC_CX_QDSS_TSCTR_CLK		6
>> +#define GPU_CC_CX_SNOC_DVM_CLK			7
>> +#define GPU_CC_CXO_AON_CLK			8
>> +#define GPU_CC_CXO_CLK				9
>> +#define GPU_CC_GMU_CLK_SRC			10
>> +#define GPU_CC_GX_GMU_CLK			11
>> +#define GPU_CC_GX_QDSS_TSCTR_CLK		12
>> +#define GPU_CC_GX_VSENSE_CLK			13
>> +#define GPU_CC_PLL1				14
>> +#define GPU_CC_SLEEP_CLK			15
>> +#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK		16
>> +
>> +/* GPU_CC Resets */
>> +#define GPUCC_GPU_CC_ACD_BCR			0
>> +#define GPUCC_GPU_CC_CX_BCR			1
>> +#define GPUCC_GPU_CC_GFX3D_AON_BCR		2
>> +#define GPUCC_GPU_CC_GMU_BCR			3
>> +#define GPUCC_GPU_CC_GX_BCR			4
>> +#define GPUCC_GPU_CC_XO_BCR			5
>> +
>> +/* GPU_CC GDSCRs */
>> +#define GPU_CX_GDSC				0
>> +#define GPU_GX_GDSC				1
>> +
>> +#endif
>> -- 
>> 2.26.1
>>
