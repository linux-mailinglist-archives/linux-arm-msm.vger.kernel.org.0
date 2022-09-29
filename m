Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7215EF195
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233206AbiI2JNH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235867AbiI2JMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:12:42 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E6A143561
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:12:28 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b24so845295ljk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fn6aAyOFSjJqLQMDfUAvbicJg1NvuDMq2C6asryaSFo=;
        b=pOO5e3pewQt/deLNDXyGdnUSOSDsrMOf2TcP+injiwm/IW+JxjU1A3TuOoL+gezmDc
         ILHN9PHvn/tU0pzwXrRZ5884Jm5aAzrC2yWkg2Jo0KpIU+TrGTO9Myo2Xw2n2KcHq7Jj
         OfV3rTWxclVwH2OJiBy0kcvQBPE7pncXDmTpWI+YacZZoI+W5JgSnnkH3kzWhHUx135t
         KJPttLjtRoGeQcohVUEGF/i1jNefJfUaa7Q4v0KZSkyWrMnygW2vPlQd7Va0GEh/fVTA
         6U1PFTsuBNsFTKkS9iWfIzCQ2RTQw3fQ+mvyPhM8yAGGdaCmg9eU64skW3tJAD9r48Wr
         2cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fn6aAyOFSjJqLQMDfUAvbicJg1NvuDMq2C6asryaSFo=;
        b=Iv4K775zOKP3PEoKtCXqox+ou0Hmo6Y8O/47Bmk8r2ozaKUzn9VtrUCumjlX9czb2g
         sE0gH4OBFOofVuyZuFOOpeWwaVrbitQGtSJg3xY3279A358kQ8vdvXtof3BqzFhwgz2q
         g5Y1rgfdw0UhVKE3wBqy0nWmDwOgfDV4ukYToQLnQWjv1vhyODY8YTQGi3JmaIAvhSfo
         e1miqDO5smU3LyYXwIEHdrVbi7jy/INCNWBIxgB8EsYJvXcMo1tGdDTK0U3S6zGH6DVF
         xb6fGVZ6DxLeRAWA6UeIMKfpgVDRJDK2N59tSV6DJaoqK5TeL4DFGX5f51C/97tDsrqs
         36Ww==
X-Gm-Message-State: ACrzQf0VnaFeEKRuOjMiaH4/8MQOghFkqldoFjWeIDiA7U3RDwRvJsJb
        dBVgriUSVTbE/fv93lm+ix+DhQ==
X-Google-Smtp-Source: AMsMyM5s6g4sulwufXRhT+Ug/QBUz9Y7qn+TSCqYCPR2ZgZOiel4lm73cphufi5uOpuoH62fa10ezQ==
X-Received: by 2002:a2e:a7ca:0:b0:26c:51d6:55ed with SMTP id x10-20020a2ea7ca000000b0026c51d655edmr737468ljp.426.1664442746238;
        Thu, 29 Sep 2022 02:12:26 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u4-20020a056512128400b0048a982ad0a8sm729228lfs.23.2022.09.29.02.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 02:12:25 -0700 (PDT)
Message-ID: <1a3c6766-9be5-1e55-95eb-bc9656e5c9a3@linaro.org>
Date:   Thu, 29 Sep 2022 11:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 5/7] arm: dts: qcom: mdm9615: remove invalid pmic
 subnodes compatibles
Content-Language: en-US
To:     neil.armstrong@linaro.org, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v1-5-b6e63a7df1e8@linaro.org>
 <0636d53f-508f-8a86-0973-2641c9020622@linaro.org>
 <6ed642ea-424d-49ed-eb30-e09588720373@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6ed642ea-424d-49ed-eb30-e09588720373@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2022 10:29, Neil Armstrong wrote:
> Hi,
> 
> On 28/09/2022 20:03, Krzysztof Kozlowski wrote:
>> On 28/09/2022 11:14, Neil Armstrong wrote:
>>> The PMIC is an PM8018, but was compatible with the PM8921. Both compatibles
>>> was left but it makes no sense anymore the leave both.
>>
>> Why? It makes sense for backwards compatibility. If you think it does
>> not make sense, please say why.
> 
> We had the same debate at submission 7y ago, some of the pm8018 new compatible
> were rejected in bindings & drivers so I left both...
> 
> As of today only the pwrkey bindings is missing, so should I resubmit the pm8018-pwrkey bidings and
> drop the pm8921-pwrkey compatible ?

~7 years ago here:
https://lore.kernel.org/all/20160624220748.GB11719@dtor-ws/
you proposed to add something entirely different than we have here now
and than we talk about.

In that thread you correctly wrote:
"My point of view is that the devicetree describes the hardware and need
to have SoC specific compatible string since it describes the actual
silicon, and drivers must make sure to handle all the SoC or family
variants using the compatible string and the match data."

but implemented it entirely different. Maybe you refer to different mail
thread, I don't know, but that one is indeed wrong.

The DTS looks correct unless you have some real argument that it is not.

How this should be fixed? First, drop bogus entries from drivers, then
document proper compatibles.

Best regards,
Krzysztof

