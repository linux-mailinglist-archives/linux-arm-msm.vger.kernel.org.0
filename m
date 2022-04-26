Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82EEC510A52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 22:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354619AbiDZUYP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 16:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355107AbiDZUX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 16:23:59 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E026FE0E9
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 13:20:49 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x17so33922700lfa.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 13:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VeBTftEEBF4n+zC0W35RUFpsE8vBxIydsA294RvLU5U=;
        b=dlhxKFfKur1lHnoc+nbcJrk/Ps0SWozlkk+0HPMTatI/NQMMwJL97BQUiNcOD1Oeal
         QJFuApixc8IRyxFPLyP+BkDzQ93RcLLBvE+fLc5XlngnHHm7zZj9ZVsF/Ux911ZFApTs
         JkOSiOYqFhFTtgTn9U409Kg+DUTgRLSPwlo7Ec2bYU+Ud25CayZOhieuTzzfuO4HRZ50
         7NqNtvaJkgMIHRkHtHFZ4WGpOoo8PoPz2HgO8KGfORMmLHNp0ml0W4D/vBKCsWAbBXJz
         Hvuy2gj4XX0W6SPDVMkAXjJUtb4YYIrBSxtyrDWyNEk8A3IkLu9CJ823W5eMLVLCTbQj
         ky5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VeBTftEEBF4n+zC0W35RUFpsE8vBxIydsA294RvLU5U=;
        b=6DW8aq1eyd9YPmxleVnoPfti7fbiGqKqtN/xwRXXc99wJ7NYeVHYjPh+LD2Bb1T22Z
         rgxtL3u6/uDXtuxmgVItSokRD789iL8P0UZYeYT63xsdjIfMlO0V1EuZlo+JynRZccCf
         0ibvFLiNoUaMUV0qvNO3n0n4cFb/f5C7o3WZ/76KOvywRFvmqVQ/rKeM9ik4+Y36AcsG
         E8UnMLxqu1OzMimhigb51eDi004rOGEGuwJARvGao7GziE+NDZdggPyt2tDPzDnJDnEq
         PRTQQ60hTZV9q8tcsBXSd28TPs9D86S3hEhCay/a04IuarhMhZ89hvdlTUGT0Cf13i87
         OH2A==
X-Gm-Message-State: AOAM533UYfjShbpeswxOI0VikcsIbUG9OXk3yF4kpSh5lyvCIe+HJbYr
        VCIyZAs6hfVEBXY+GPPgHS2cJQ==
X-Google-Smtp-Source: ABdhPJzwQe3J31B9Au3qGIefBxGSsd11mJQrRCRg4tWK2TaU2RtYfE+qhsPAOoHHBkhMiyRJxa92GA==
X-Received: by 2002:a19:ac42:0:b0:448:1f15:4b18 with SMTP id r2-20020a19ac42000000b004481f154b18mr17762502lfc.32.1651004448075;
        Tue, 26 Apr 2022 13:20:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m1-20020a2e7101000000b0024f081cb0absm1169380ljc.83.2022.04.26.13.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 13:20:47 -0700 (PDT)
Message-ID: <9df0eb75-0b2c-446e-ef66-1eb3ce442d0d@linaro.org>
Date:   Tue, 26 Apr 2022 23:20:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 3/3] dt-bindings: clock: qcom,gcc-apq8064: split tsens
 to the child node
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, quic_tdas@quicinc.com
References: <20220426094144.2958416-1-dmitry.baryshkov@linaro.org>
 <20220426094144.2958416-4-dmitry.baryshkov@linaro.org>
 <Ymg4zFsQB2MAQ/T5@robh.at.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Ymg4zFsQB2MAQ/T5@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2022 21:24, Rob Herring wrote:
> On Tue, Apr 26, 2022 at 12:41:44PM +0300, Dmitry Baryshkov wrote:
>> Split tsens properties to the child node of the gcc. This follows the
>> lead of ipq8064 (which also uses a separate node for tsens) and makes
>> device tree closer to other platforms, where tsens is a completely
>> separate device.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/clock/qcom,gcc-apq8064.yaml      | 45 +++++++------------
>>   1 file changed, 17 insertions(+), 28 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
>> index b867da12761e..f2762599f679 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
>> @@ -23,47 +23,36 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,gcc-apq8064
>> -      - qcom,gcc-msm8060
>> -
>> -  nvmem-cells:
>> -    minItems: 1
>> -    maxItems: 2
>> -    description:
>> -      Qualcomm TSENS (thermal sensor device) on some devices can
>> -      be part of GCC and hence the TSENS properties can also be part
>> -      of the GCC/clock-controller node.
>> -      For more details on the TSENS properties please refer
>> -      Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
>> -
>> -  nvmem-cell-names:
>> -    minItems: 1
>>       items:
>> -      - const: calib
>> -      - const: calib_backup
>> -
>> -  '#thermal-sensor-cells':
>> -    const: 1
>> +      - enum:
>> +          - qcom,gcc-apq8064
>> +          - qcom,gcc-msm8060
>> +      - const: syscon
>>   
>>   required:
>>     - compatible
>> -  - nvmem-cells
>> -  - nvmem-cell-names
>> -  - '#thermal-sensor-cells'
>>   
>>   unevaluatedProperties: false
>>   
>>   examples:
>>     - |
>>       clock-controller@900000 {
>> -      compatible = "qcom,gcc-apq8064";
>> +      compatible = "qcom,gcc-apq8064", "syscon";
>>         reg = <0x00900000 0x4000>;
>> -      nvmem-cells = <&tsens_calib>, <&tsens_backup>;
>> -      nvmem-cell-names = "calib", "calib_backup";
>>         #clock-cells = <1>;
>>         #reset-cells = <1>;
>>         #power-domain-cells = <1>;
>> -      #thermal-sensor-cells = <1>;
>> +
>> +      thermal-sensor {
> 
> This should throw a warning I think as 'thermal-sensor' needs to be
> defined. The patch didn't apply for me though.

This series depends on 
https://lore.kernel.org/linux-arm-msm/20220426093608.2957210-1-dmitry.baryshkov@linaro.org/T/#u

Regarding the warnings, I think this is related to the issue Krzyshtof 
has reported few days ago. I was not able to trigger warnings for 
unknown properties if unevaluatedProperties:false is used.

> 
>> +        compatible = "qcom,msm8960-tsens";
>> +
>> +        nvmem-cells = <&tsens_calib>, <&tsens_backup>;
>> +        nvmem-cell-names = "calib", "calib_backup";
>> +        interrupts = <0 178 4>;
>> +        interrupt-names = "uplow";
>> +
>> +        #qcom,sensors = <11>;
>> +        #thermal-sensor-cells = <1>;
>> +        };
>>       };
>>   ...
>> -- 
>> 2.35.1
>>
>>


-- 
With best wishes
Dmitry
