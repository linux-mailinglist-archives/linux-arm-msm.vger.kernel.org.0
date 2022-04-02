Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4CC4EFFFB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 11:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352788AbiDBJLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 05:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239643AbiDBJLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 05:11:31 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF3B532E1
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 02:09:40 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id qh7so403692ejb.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 02:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=kd0NXB1Zpr99nwzhwykwjlZXPnel4cWxpQfKUpkCMHk=;
        b=IPrXv9vJtuIqqczOLMSmbtbpxKLQMRqoHRQqRTjVRFt4XO+cn+jGv3A0ddYp/tq7gY
         Zg7teYhVeEfjJ8csVKtGys1Y6/lrBvrxsdVaGEio7GpsGA26NvKIok57F6Ww8nbIHQye
         rXmxl63yx1oW+DKpT22urlehfD/nbAMpo9LvOn1G6icNPf2NIzuPi1KPPEaHk5bXYQ2L
         yfj9ZgvUPumDQ7S7kDptsISup59+tDCEC99Hw/VHbN6fEhZp+NoZ6CIxy1fjYa9XekPR
         serYvl4TidGxyJu9quyVUhjNX3aQyNJjetX9Z2KkDWVzjwvoeVb0n+VdPnbOPkm+mK4A
         0aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kd0NXB1Zpr99nwzhwykwjlZXPnel4cWxpQfKUpkCMHk=;
        b=KBS5NFBjs2jAgQQgaAFUvXhWzYDrthW7JusgeKOdikE+0CZJQ6fzi+F/+h9QK1kowQ
         tELA+2+z/OW1p+m1Wicdb6cECSyLMmj//NSjmIZJcn3Ih/wwfkLpEbVwMjO2R2ZPrTVn
         qsP2ff7FxI330pLPa7TF0yi/iF/PAo/FAAx9+H1qZtMBskst1C6HfGOSHgFhNnTrJdq+
         +zGxrYdpMrHT09QZMg6buI0JWh+KfHYXzWbOuqdZhfckXT//yNu2IfjDBW6yHCN30D9E
         Hu79iu1vdcCQRM13+sjaJOQlr82DlYnZm6vYJJrXboo47dxTeeMXSa0fASm7qMaancRJ
         CKKg==
X-Gm-Message-State: AOAM530PWJ6fom6euTIndMPporgXovX4e3mP29Pr93K848MHaxUJf/X6
        nSTI4YuM1k0PZgv6cMBFBWPMqQ==
X-Google-Smtp-Source: ABdhPJwqleeVWzZcqz6QlP7/awNnzIZNAP/RE/+/3JTo9Oc/kx/lPCi9SIvYHyQ5AoA0h5pDpTMV4w==
X-Received: by 2002:a17:907:3e16:b0:6df:b4f0:5cc2 with SMTP id hp22-20020a1709073e1600b006dfb4f05cc2mr3180696ejc.285.1648890579004;
        Sat, 02 Apr 2022 02:09:39 -0700 (PDT)
Received: from [192.168.0.170] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id o12-20020a50c90c000000b0041907e62024sm2192677edh.85.2022.04.02.02.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 02:09:38 -0700 (PDT)
Message-ID: <c93bdf12-bf53-9277-0394-5eaeea081183@linaro.org>
Date:   Sat, 2 Apr 2022 11:09:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 1/4] dt-bindings: clock: qcom,gcc-sdm845: add parent
 power domain
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bean Huo <beanhuo@micron.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20220401145820.1003826-1-krzysztof.kozlowski@linaro.org>
 <20220401145820.1003826-2-krzysztof.kozlowski@linaro.org>
 <20220401232451.1B7A9C340F3@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220401232451.1B7A9C340F3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/04/2022 01:24, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2022-04-01 07:58:17)
>> Allow Qualcomm GCC to register its parent power domain (e.g. RPMHPD) to
>> properly pass performance state from children.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
>> index d902f137ab17..5fe1b2c42d5a 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
>> @@ -43,6 +43,9 @@ properties:
>>    '#reset-cells':
>>      const: 1
>>  
>> +  powert-domains:
> 
> s/powert/power/

Thanks. This actually points to the fact I did not test this bindings
change :(

Best regards,
Krzysztof
