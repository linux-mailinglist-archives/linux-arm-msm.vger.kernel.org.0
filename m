Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF9AD691DEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 12:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbjBJLO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 06:14:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbjBJLO4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 06:14:56 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1ECA5FA
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:14:26 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id ud5so14940018ejc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0grgAqJN0xknu8n5/Ukj+HgzecxXCJVi84wvQRhRSfg=;
        b=NwkxdlwfyIztSAyEmYXf0vfZvRy8Zn4bdBpmk5cNxPABOS8N6Bmq+cbLvtCUWCpX/D
         6yp9AWUZTFmwzF8xYcM5hdr2k+64gDXT2SmP41Z8TuiDK1bUUseTx0nu5fZtgMkcZMiV
         ua1xyyGz6ENhbZyh7gyy+pIvnpf1ubnKI09sSV03GchZ4xu0cVvtuVIde7lYPd0yXmBh
         5Y1WxASnOtvemPUy0aPSJmIRUXG0ztLl18I3uXKXPXjGnGEpJSxteHRkcBfArhahiSNA
         LgtP3sE4FwqvVyWTm86AlyyCR6j6fFUNeekIaS49YC7TWjV75nuKKW4IYsN+UUd/Ijlf
         8oxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0grgAqJN0xknu8n5/Ukj+HgzecxXCJVi84wvQRhRSfg=;
        b=AX7ZZcvyyooM4tRUuevUotzD1ZsuD+eTcYRWemWfT5M27RGGF/2c2ItXQejsDsTXjC
         7VYtQu/0hl+zmS6pq6HHkgkdOuuUilFq44JiocaNvQsqr410b0UYjphEoxpKNBrJVcRX
         qelUp9So661mnt9IJ8tkpZpOu9aW4/76xS1kJBsMCeMHBGC/jvwqWma/uoV+fNdfilkc
         flexOCyoAbSXfPNZXSTULbay+0xlGmx4MYajZzEIcYrpmdFQfZSEg/kvkf/SKyMReFdx
         ku/PYQq6PQ3jGWTSQVWMAkDckdEUauoB7rnPTjShgSGcf3oFLtENkzdmPf1L49kEpxKl
         rPAg==
X-Gm-Message-State: AO0yUKWIaN9pUiyatw/42Wvetq449VU7PZR00KnSxAKW170HFoQVhSYF
        wVFf0+gyD1MBpgP9mlj/S2RCEA==
X-Google-Smtp-Source: AK7set+EFw6M44T/jPCghkzoioHk8fyVg38/DBVJOZ8VNKdfcrqjP8DKS8+nXoObOX/6LM/EvWU+MA==
X-Received: by 2002:a17:906:f56:b0:88c:5a80:a7bb with SMTP id h22-20020a1709060f5600b0088c5a80a7bbmr12891031ejj.6.1676027663230;
        Fri, 10 Feb 2023 03:14:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906101700b008aedc51fc02sm2254343ejm.210.2023.02.10.03.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:14:22 -0800 (PST)
Message-ID: <0a18c5ef-541a-3c7e-1729-e1429edf909f@linaro.org>
Date:   Fri, 10 Feb 2023 13:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and
 SMMU nodes
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
 <20230209133839.762631-6-dmitry.baryshkov@linaro.org>
 <0ae75004-1cbb-4b72-0492-942becc401d6@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0ae75004-1cbb-4b72-0492-942becc401d6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 13:10, Konrad Dybcio wrote:
> 
> 
> On 9.02.2023 14:38, Dmitry Baryshkov wrote:
>> Add device nodes required to enable GPU on the SM8350 platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 178 +++++++++++++++++++++++++++
>>   1 file changed, 178 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> index 742e9dd17084..4c1a2f814b5c 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> @@ -7,6 +7,7 @@
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
>>   #include <dt-bindings/clock/qcom,gcc-sm8350.h>
>> +#include <dt-bindings/clock/qcom,gpucc-sm8350.h>
>>   #include <dt-bindings/clock/qcom,rpmh.h>
>>   #include <dt-bindings/dma/qcom-gpi.h>
>>   #include <dt-bindings/gpio/gpio.h>
>> @@ -1765,6 +1766,183 @@ tcsr_mutex: hwlock@1f40000 {
>>   			#hwlock-cells = <1>;
>>   		};
>>   
>> +		gpu: gpu@3d00000 {
>> +			compatible = "qcom,adreno-660.1", "qcom,adreno";
>> +
> The newlines between compatible and reg trigger my OCD..
> 
> But the patch looks good!
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
> 
> P.S I can add binning after the big GMUless series lands..
> And maybe I should also rework the binning code a bit to
> be cleaner..

Good! I didn't see (or maybe I didn't notice binning for v2.1), so I 
skipped it.

-- 
With best wishes
Dmitry

