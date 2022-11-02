Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 449E6616EE2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 21:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbiKBUk0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 16:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbiKBUkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 16:40:23 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B0364DE
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 13:40:20 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id x15so13319854qvp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 13:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sd70azK8MP8PUzuuvqBJ39esDubQ4+1f6bAqhKArwGE=;
        b=XLuDX8evb09H4tyKKUQux/Sg8fAoxhx6pqOpuUOk8MIB4EqP8XX44e1W5hEWsumYh7
         KZoCErNN8uojbnkBPrjHQLGRarsbM14fU9/V7eAxPRqIJIPkXJwrMlZ3yCh7GMW8JmP4
         hZvXB9rCLUXoUaSp/O+Swr18I8y7iolrPv3aE+1k+0XDNo/mWDFUBRSZPsnmoNxpVRV4
         OL9HOfUcD7x8hZD5WMC5P2c6z8GcV2vWk1feZyVAIyYK2vHLFLKN+r1Mnb1wH4xcbhJw
         vXtnU3FFaWuy70+3u9Dr5THgk4hQV6Y6BWIXV7TCYB3gIjq4sQQu2yzlzH+4XCu5IBpQ
         Bt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sd70azK8MP8PUzuuvqBJ39esDubQ4+1f6bAqhKArwGE=;
        b=zgnq8Nj0bTd8qqp/pTBeCvhVrBoJP5ebxHfmTDIoeORagooIQ9aZ88JTnGEwXMogko
         sitA9mGdR5zB/nbl1X49xJCzlPsOkCvZOooYKOpyNQ6Pj7D3XT9foS9z3qe3swi06rdn
         WjWZqfq8Yuu/dI7hEDKRXz/Judu5klhwVuxBlgyMK7hfkg9Zo4IRKchjLYfiAxwjYfdd
         AAOXDlZ2FfLhUZeY8OqSn07pnKl4AA53dXLpveB9q49oT8WUxEtAnR2bhU07F6Va9bCj
         npA6mel98wcF6vi08oJWQ1D5AGf2/dYspIXqRffF3AxrbfIIy2dehO6X2ZsJyXaCy8fZ
         TOOg==
X-Gm-Message-State: ACrzQf2fl2dQDjR3iXt80XmcHPxlxQ4PxLtkzDkzSld5IQANkSEjX4VO
        7LcnSWj3D+fUhI4Nht3VW698zw==
X-Google-Smtp-Source: AMsMyM7Wt6ZhQtUp3aLlsPQeoyw11iNBvqVn3gNSOp2CLebWe/e9rHD4PyjZGAsT/lHmdjBI/LlIkw==
X-Received: by 2002:a0c:9151:0:b0:4b1:8375:46d3 with SMTP id q75-20020a0c9151000000b004b1837546d3mr23670389qvq.122.1667421619599;
        Wed, 02 Nov 2022 13:40:19 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id x10-20020ae9e64a000000b006e2d087fd63sm9093060qkl.63.2022.11.02.13.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:40:18 -0700 (PDT)
Message-ID: <00a6c40c-da53-e7a4-dbe6-7d68d81128af@linaro.org>
Date:   Wed, 2 Nov 2022 16:40:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 01/11] dt-bindings: clock: split
 qcom,gcc-msm8974,-msm8226 to the separate file
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
 <20221030155520.91629-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221030155520.91629-2-dmitry.baryshkov@linaro.org>
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

On 30/10/2022 11:55, Dmitry Baryshkov wrote:
> Move schema for the GCC on MSM8974 and MSM8226 platforms to a separate
> file to be able to define device-specific clock properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8974.yaml      | 64 +++++++++++++++++++
>  .../bindings/clock/qcom,gcc-other.yaml        |  9 +--
>  2 files changed, 65 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
> new file mode 100644
> index 000000000000..a92a60f8c1af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8974.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MSM8974 (including Pro) and MSM8226 Global Clock & Reset
> +  Controller
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on MSM8974 (all variants) and MSM8226.

Please incorporate the same changes I did here:

https://lore.kernel.org/linux-devicetree/20221102163153.55460-2-krzysztof.kozlowski@linaro.org/

> +

Rest looks good.

Best regards,
Krzysztof

