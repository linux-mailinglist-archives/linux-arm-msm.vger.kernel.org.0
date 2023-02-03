Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1ED6891D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 09:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjBCIRz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 03:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbjBCIRy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 03:17:54 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D5265B9
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 00:17:52 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id o36so3249876wms.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 00:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cYQ5gEvYWb9uVvlGzVaI6sNNl3x9BXfWlogPL2Sf4sM=;
        b=oWG32cXsKJjzJlSdYd1hUHqheYEXPEcLUWCc1PUdDl/MkcYAa+El4+z4sUfzozzYOH
         PVa54Rb25IGVA52kwExscot0/kA6v2hMwB66GtgVM0fbwuULpH5U2wJ1ULQFqLolfd/x
         uhmuZCsoNGeZFrifSahwW1y8AU0jAa/rExGf5wnoih/jSc1QTz7VUHCL36UYcA+Wxfls
         8j8UXIKHDU9waD0/G8Hy7izp3Kf3XfKOvHqvDVkf7+ZWmS921BfamARJs97BBcRi/UQA
         DJmmrCIcDnqcL9Gfjh1yMTssICEwWuTAUCv3v1ZbL+Vg5zYA6dK3nUCK1k0iq04gdR7+
         OJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYQ5gEvYWb9uVvlGzVaI6sNNl3x9BXfWlogPL2Sf4sM=;
        b=2ySFDx02L1xVAoL6jHxeP9MzVBJbn3TCUYMkGhsBed6VRuJCPM0/bjdKAsSY8VYUHS
         1LRfrZyJbY6SWp1yO5kvSFnJhXmOx/PrFya7URan4Lc73+k8YEdGQ3H6sjurY5FT0/7F
         JMiQ/IWEuPguY/83nsb2cYWGihgVqDAtiVZ94J4Oynh2qx0n9sKOMPMydAVnwW4mijnu
         POuiGK4syz7NEOAQXBiHL3FOxvLIRnkwpHcxfN5eAL172dE10FKaF5r12CDKaW++Orbl
         WjjTQ8VVnnWfmznlEqyQ+CETYJgZ0rRlrpl2390Zxt2OGmL6rtQn4peUCufHRDTibBX5
         I6og==
X-Gm-Message-State: AO0yUKW2oW6eI8qB7n+pCxLSNEoGAemTfnaCvuHkHCEw/850eKaciGxt
        R0AdCfCOv0j0/ryg3MUlcyvCnA==
X-Google-Smtp-Source: AK7set/fqUPV5B8xSWWugR98K6OVdp7p5g6/LRGj+G6JUQkXVPIN1FDUGND+SCEiW3Wuj2spHCcsLg==
X-Received: by 2002:a05:600c:b88:b0:3df:9858:c033 with SMTP id fl8-20020a05600c0b8800b003df9858c033mr3779869wmb.8.1675412271395;
        Fri, 03 Feb 2023 00:17:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b003dfe549da4fsm1631398wmo.18.2023.02.03.00.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 00:17:50 -0800 (PST)
Message-ID: <ad8812e6-7dc2-5575-c44d-3f4f62aeb9e9@linaro.org>
Date:   Fri, 3 Feb 2023 09:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 5/9] dt-bindings: qcom-qce: document clocks and
 clock-names as optional
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-6-vladimir.zapolskiy@linaro.org>
 <32c23da1-45f0-82a4-362d-ae5c06660e20@linaro.org>
 <22f191c4-5346-8fe7-690d-9422775bb2d5@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <22f191c4-5346-8fe7-690d-9422775bb2d5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2023 23:27, Vladimir Zapolskiy wrote:
> Hi Krzysztof,
> 
> On 2/2/23 15:53, Krzysztof Kozlowski wrote:
>> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> On certain Snapdragon processors, the crypto engine clocks are enabled by
>>> default by security firmware.
>>
>> Then probably we should not require them only on these variants.
> 
> the rationale is clear, but here comes a minor problem, older platforms
> require clocks, when newer ones do not. When a generic SoC-specific compatible
> is introduced, let say "qcom,ipq4019-qce", it itself requires the clocks,
> but then newer platforms can not be based on this particular compatible,
> otherwise they will require clocks and this comes as invalid.
> 
> How to resolve it properly, shall there be another generic SoC-specific
> compatible without clocks and NOT based on that "qcom,ipq4019-qce" compatible?
> 
> By the way, QCE on SM8150 also shall not need the clocks.

Assuming you have:
1. ipq4019 requiring clocks
2. msm8996 compatible with ipq4019, requiring clocks
3. ipq6018 compatible with ipq4019, not requiring clocks

allOf:
  - if:
      properties:
        compatible:
          enum:
             - ipq4019-qce
    then:
      required:
        - clocks

  - if:
      properties:
        compatible:
          contains:
            enum:
               - msm8996-qce
    then:
      required:
        - clocks

That's not pretty.

Another solution is to make non-clock-requiring variants as their own
family:

1. msm8996-qce, ipq4019-qce
2. sm8550-qce, sm8150-qce

and then in the driver you need two entries - ipq4019 and sm8150.

I like the latter, because for clock-requiring variants your driver
should actually get them and require. For non-clock-requiring variants,
you just skip the clocks (do not fail). Therefore you need different
driver data for these two families.

Best regards,
Krzysztof

