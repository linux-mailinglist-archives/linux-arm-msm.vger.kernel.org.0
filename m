Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F35C5665FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbiGEJXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbiGEJXO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:23:14 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A792465D8
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:23:13 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id e12so19524806lfr.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=azfm5IkOFbR/Ne2mZUDNcaxYCwj/Vq0LQkRHTreQXb4=;
        b=mNldFiLMMGfjxisxs8Cl/hQAEuKcZmzhvX2/xD5tWUGZYC2EHa1W5kdkl7SsxL/7dI
         7W89GKjaZTVu+k46O3HkHIgmV2akMEW5E87hS0fyg7jvs4nHHp1kmWwlP+5Zgc7T3+zG
         LS+07jtuFCt0fAEpmvSvJsqRCU6UWr+ejWdZ9kPVVmqwmACJySGTt8TEkLK/ZXL8RJeQ
         mYewAEVD0RAgXpsdIjyxAY9J3dHMCTSmdMlhr0NAhquCPY0jQNW6UOE8TmyWBdXBYrDP
         4TttBsWFEErwCR3FHQdQIYr1mX80QdVZw0aI/nNJHiIfbVMb7iIyxGNFL0umMhMa74/N
         Le1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=azfm5IkOFbR/Ne2mZUDNcaxYCwj/Vq0LQkRHTreQXb4=;
        b=hzLMbTFbZBg7rtFHKj6KRt1nJ9xT3tFdIh3wWRImdhWmIqYCHQsCay3N4sZ+lWjOIg
         WaxFcH6N4zPcofMPRcXuPTRvQBJlXIGpuWiXLhTzSV1uCuqSDuNFsqR9I2ov+spVffiS
         c/99Z+POUNi8tEG88XOT7v8ToNyo17BYg6bkyBy10c/KsIWBYP+r6CzApQqJscZcDhd6
         W7FhSSLvWt+m5zDLRPB6C5s7wgPasSTizTNKQq00VkD7m6eF5+0fe8oRX8lcmkEzjOia
         wEuCNi5DC1YRDwDq4GJu4+KmQgWByL4OmnmVmqwI5XDfirp+pPWTjqOqOCNJH49OgUo1
         0+GQ==
X-Gm-Message-State: AJIora8GKSsUZAijV+nTp1Ddq3L1CgG9Uau1QX3YEZQuyEO0N1jhVkGR
        LqrUQDbRrkh5RShd839S6rl2EQ==
X-Google-Smtp-Source: AGRyM1tZmoSAtoAUoG2iVV6RJV8G+vjL+wLv3WVd22vxSOgB1LjIy1pqq6+eSqfYqalrW9Aut7or0Q==
X-Received: by 2002:a05:6512:3d1a:b0:47f:79df:2ea8 with SMTP id d26-20020a0565123d1a00b0047f79df2ea8mr23969340lfv.610.1657012992047;
        Tue, 05 Jul 2022 02:23:12 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id o15-20020ac2434f000000b00478a8b7ab1csm5595746lfl.150.2022.07.05.02.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 02:23:11 -0700 (PDT)
Message-ID: <1e16394d-42e7-2163-377f-a42fc531cd6e@linaro.org>
Date:   Tue, 5 Jul 2022 11:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] dt-bindings: qcom: document preferred compatible
 naming
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220704101823.82122-1-krzysztof.kozlowski@linaro.org>
 <1656982255.085936.640432.nullmailer@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1656982255.085936.640432.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 02:50, Rob Herring wrote:
> On Mon, 04 Jul 2022 12:18:23 +0200, Krzysztof Kozlowski wrote:
>> Compatibles can come in two formats.  Either "vendor,ip-soc" or
>> "vendor,soc-ip".  Qualcomm bindings were mixing both of usages, so add a
>> DT schema file documenting preferred policy and enforcing it for all new
>> compatibles, except few existing patterns.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes since v1:
>> 1. Add schema instead of readme (Rob).
>>
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Cc: Alex Elder <elder@linaro.org>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> ---
>>  .../devicetree/bindings/arm/qcom-soc.yaml     | 55 +++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/qcom-wdt.example.dtb: watchdog@208a038: compatible: 'oneOf' conditional failed, one must be fixed:
> 	'qcom,kpss-wdt-ipq8064' does not match '^qcom,(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
> 	'qcom,kpss-wdt-ipq8064' does not match '^qcom,gcc-(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
> 	'qcom,kpss-wdt-ipq8064' does not match '^qcom,mmcc-(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
> 	'qcom,kpss-wdt-ipq8064' does not match '^qcom,pcie-(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
> 	'qcom,kpss-wdt-ipq8064' does not match '^qcom,rpm-(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
> 	'qcom,kpss-wdt-ipq8064' does not match '^qcom,scm-(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
> 	'qcom,kpss-wdt-ipq8064' is not one of ['qcom,gpucc-sdm630', 'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064', 'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016', 'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy', 'qcom,vqmmc-ipq4019-regulator']
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/qcom-soc.yaml


I'll fix it.


Best regards,
Krzysztof
