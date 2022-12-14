Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7270664C950
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 13:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238268AbiLNMyr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 07:54:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238263AbiLNMyq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 07:54:46 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCC425DD
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 04:54:45 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id z26so10268000lfu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 04:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KmH88KzkS+gJt9BIgea63AAFIfznRKrEnzAlPNS+MtI=;
        b=Ep+jpPqYQrlI+OxVeOzWQigrl4mCYr7zbbURxbBBhWxccT4nn8nKk6wxkBjq6kFlLw
         6Ns9fQ3f2dDf7Ddexwe7pdUQI7eK9M2Y70YklWk/WKBbTJxQeK2Fs2JPaeuyuOvYfHOK
         uMVamGEANM16lSkoyRsUtIyI3P+/Nem/Bp3USHoxtcporUp9GcVMHIDqIqUScQQFCV2U
         K3oPTWnNwz1/wIwH6+goMCPMTAeO7s6GlGemubENQlCdS5AwQ28OCj9UrtX4G7AaMipU
         uTXUVkS94fR4HP9eKSSB2shgj+XJAco0LChKwmyjKnSukahkLS/xp/0VWHp/Z7r3GFv/
         9njQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmH88KzkS+gJt9BIgea63AAFIfznRKrEnzAlPNS+MtI=;
        b=i7fpugdoGG7raRSmTGYCefHBarU2ewu93MIZydNNiLL+N6kiNqnrK9BnGpbTjz1lZb
         bMszMTFvVAL8lhhOMFeBHvR+yWq96bpuQyMM9Tc1L1WMU9yibK5+2HG+DXOMWmxu83PK
         0Lo5osgTOirx/tc75kvpWxngLNL+aPA9fWtNuAGOUUNe0UadT7XtD+yjzh6KDrihYjm8
         pLIeunUQfmpL/ysU2QUmpraxZy4FgbkH328E+g7nkKSZd7Ng/YWV62mCYX3q9UE6ECnb
         YHd4Ij5Y7YkTjcwh0xSWlJkGtxl1MwRAEY1SaIEWg2yS6RbkBKjM1MpRI9A6D31pOzgH
         8i0w==
X-Gm-Message-State: ANoB5plO45j3KzqO767ckeZRlpkAFV8B6yHPXg0h7vzgtt4URvKvbMyP
        vnViw4B2cSzlCC2ecuTXaVU2uw==
X-Google-Smtp-Source: AA0mqf71h17arQ/96Pdx8ppYwEg5p/9+JVeSMKp2P4WVlM89ImUc6qlSRoBmGXOxtSaPGAv9bahuZg==
X-Received: by 2002:ac2:5e29:0:b0:4b5:b10b:6830 with SMTP id o9-20020ac25e29000000b004b5b10b6830mr5604533lfg.54.1671022483559;
        Wed, 14 Dec 2022 04:54:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f4-20020a19ae04000000b004a478c2f4desm799640lfc.163.2022.12.14.04.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 04:54:43 -0800 (PST)
Message-ID: <95074120-f4db-0d88-531b-f509d0807796@linaro.org>
Date:   Wed, 14 Dec 2022 13:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Introduce a carveout for modem
 metadata
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, amit.pundir@linaro.org,
        regressions@leemhuis.info, sumit.semwal@linaro.org,
        will@kernel.org, catalin.marinas@arm.com, robin.murphy@arm.com
References: <20221213140724.8612-1-quic_sibis@quicinc.com>
 <20221213140724.8612-2-quic_sibis@quicinc.com>
 <f23f3db8-08a7-78a9-a516-de211c53b6f4@linaro.org>
 <72fc8328-6e15-3a83-ad0b-905b2cc7a560@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <72fc8328-6e15-3a83-ad0b-905b2cc7a560@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/12/2022 12:44, Sibi Sankar wrote:
> 
> 
> On 12/14/22 16:57, Krzysztof Kozlowski wrote:
>> On 13/12/2022 15:07, Sibi Sankar wrote:
>>> Introduce a new carveout for modem metadata. This will serve as a
>>> replacement for the memory region used by MSA to authenticate modem
>>> ELF headers.
>>>
>>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 6 ++++++
>>>   arch/arm64/boot/dts/qcom/msm8996.dtsi                  | 9 +++++++++
>>>   arch/arm64/boot/dts/qcom/msm8998.dtsi                  | 9 +++++++++
>>>   arch/arm64/boot/dts/qcom/sc7180-idp.dts                | 7 ++++++-
>>>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi           | 7 ++++++-
>>>   arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi | 7 ++++++-
>>>   arch/arm64/boot/dts/qcom/sdm845.dtsi                   | 9 +++++++++
>>>   7 files changed, 51 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
>>> index 5b47b8de69da..4242f8587c19 100644
>>> --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
>>> @@ -127,6 +127,12 @@
>>>   			reg = <0x0 0xf6f00000 0x0 0x100000>;
>>>   			no-map;
>>>   		};
>>> +
>>> +		/delete-node/ memory@91700000;
>>> +		mdata_mem: memory@f7100000 {
>>> +			reg = <0x0 0xf7100000 0x0 0x4000>;
>>> +			no-map;
>>> +		};
>>>   	};
>>>   
>>>   	vph_pwr: vph-pwr-regulator {
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>> index cc65f52bb80f..3f5fb08e2341 100644
>>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>> @@ -462,6 +462,11 @@
>>>   			reg = <0x0 0x91500000 0x0 0x200000>;
>>>   			no-map;
>>>   		};
>>> +
>>> +		mdata_mem: memory@91700000 {
>>> +			reg = <0x0 0x91700000 0x0 0x4000>;
>>> +			no-map;
>>> +		};
>>>   	};
>>>   
>>>   	rpm-glink {
>>> @@ -2458,6 +2463,10 @@
>>>   				memory-region = <&mpss_mem>;
>>>   			};
>>>   
>>> +			metadata {
>>
>> Does it pass dtbs_check?
> 
> ^^ portion of the bindings aren't in yaml yet please see patch 3.

Ah, you touch here multiple files. Please split per SoC.

Best regards,
Krzysztof

