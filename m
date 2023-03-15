Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA556BA9AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 08:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbjCOHqD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 03:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbjCOHqC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 03:46:02 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5A0168A6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 00:46:00 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w9so1107752edc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 00:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678866358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6z/veVEW3TNh+Ql2omvc3tvxFPzfnmLcyAIWAK0Pnk=;
        b=MYaCcnI8rCoDn4+vah1Rsn0xFRwn76UqeIqnPmyfrwSWKbPzmDbkJN+QeulGmtsn8Y
         TpQwlz77iVBIQajgLRyonUiFm9cWxBNIzC/OC872Qa/L4w641Gozpgp5DmRW9cjq43K4
         kKsH4bWFITM2wevi6f43V0PXWupFR0BYMll0kwaqF5O2SHfEN/ep2mWI4ThE0iomj04L
         K1Bsr5+wsUiWibSN1SAO0lWiZEyggoEMxDYqFAFORwQqvluDHEKYUi5nbXtq/aC/bg8J
         sa0k2ZcAiAHgEdnyFoVm8u8azIp+LQ4mLA/dCBZ7dhx58HYA/RFHt5WpS2+QZXwx2ktV
         rE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678866358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6z/veVEW3TNh+Ql2omvc3tvxFPzfnmLcyAIWAK0Pnk=;
        b=AM+ecc95Zq9zUeo3lxvOajAGtu5AC0zsrMzMQEUVQWEZEmwEE4OblfVohBWjgthOtB
         eUJ4PH4BaPV6NV0cUcGJQL8xAz/HLuvnRsapQZLesWVNcdDYg9rjMKJ8IZNl11u8YATm
         s+NLUZa8NiPR20KHMOAiAY23aUDYmWHTepYmHvbanSjHzcRAG5KDcUsZvE/f9fxXXa99
         L3ZeGbAOHD42RqclizPL8aRJ8mnxYinGq72DYLPVunhkP0KQ3RGNjv2bTFDxJVCnDZog
         yajSs/n49LBTZVdFX1PPDoQQ4tN5uYYnmh2Iqd/SSNb7dTQ8VOzmWAKveTICoazFYwuz
         WcXA==
X-Gm-Message-State: AO0yUKWHFnOUoOZ+/L2bdzpkxd9Q5RfLflN2ABc4vw0Mt/FmY9MQOSYi
        RPJof1uyr0wqLK2SiFr69va/iA==
X-Google-Smtp-Source: AK7set/b9Qlsvj/OvxzhEK6WdGWXH6siZzUDMfMrFWPEwAVqh+TckoeuEhr9uMFDyIkuCt06sfBVRQ==
X-Received: by 2002:a17:906:2286:b0:91e:37ec:3c90 with SMTP id p6-20020a170906228600b0091e37ec3c90mr4949414eja.31.1678866358644;
        Wed, 15 Mar 2023 00:45:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id e23-20020a170906375700b008cff300cf47sm2110347ejc.72.2023.03.15.00.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 00:45:58 -0700 (PDT)
Message-ID: <c4954efb-8048-58c9-b2c5-7cd6b846603e@linaro.org>
Date:   Wed, 15 Mar 2023 08:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: Add compatible for SM6350
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230314-topic-nvmem_compats-v1-0-508100c17603@linaro.org>
 <20230314-topic-nvmem_compats-v1-1-508100c17603@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314-topic-nvmem_compats-v1-1-508100c17603@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 14:35, Konrad Dybcio wrote:
> Docuemnt the QFPROM on SM6350.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

