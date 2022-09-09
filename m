Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2845B30E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 09:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbiIIHyc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 03:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiIIHyK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 03:54:10 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878C4129C46
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 00:51:46 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z25so1354482lfr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 00:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ygzgjfyjBg7Clr0C0/hvEem9VU5MhWDZEtuQgO95Dqc=;
        b=JJOyZppM2dF9iD2mrjF0mK2AeXPh4IMzalwQP3saFldlVO0bHw+xTzPhpo2TTwe3Dv
         Zr8hf4ucu0A2l+VKWxpCIBDP+AEQdWdmx0MmdGWDcm9SAsIMsrwdfr1yJ1pI5O+Zg0+c
         hX7La09cORywi0VAzAinGex5d3Mo93rYVpmkrTpmXdvSPpX4wpP/rqnR5uSBtRnXFogR
         Ytnv2xfn0KTnpFjRmefWpwwHOUzK50uVsHejiKWG/9JC5hgz3GjV3NIOr4C5HoIpx71u
         fbeTClvddNceBArKP4/rG+8nc31Ig1YhYw0ulZ0vFwrx/ChhNHRhe/3E+9VtCtjxS5yR
         6Wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ygzgjfyjBg7Clr0C0/hvEem9VU5MhWDZEtuQgO95Dqc=;
        b=gInZvMdofbF5XXnFWvGiVEVz7Aex1VQPz3bckDgNcsjOxhbIJywsrLtJMbpyxoXASl
         cdZ2zU2j/9wty1/h+mIvtfL+h61K3hWWWiLP5jujkCAeVLUGM7p6ZMTo9FZnlhZevfLg
         gkbGfVJZHYaaHewakacjrI0Kzdigky3gUYsXc501/O0b0l7M+phIMqrybh00SoQOcaXW
         DxFDoWMY6rqmNDw18oIdotxVUH4x/9DhfQWQ1w9VmE9No4u2tJFb04XjaaYYHfWmVaX4
         /N40OMrJNkWl3u2Qn8w8lEOS206/LOgkBPNN3SWRtwuA2OFe1JcKa1k9UKRwYsifdo4/
         x8Aw==
X-Gm-Message-State: ACgBeo1xtiDjeNLqsk+T0m4NeGTPb1ZBIcuBACy+hbEk7y3RkMB3mCYr
        /Z8ilS97c0xjKmyapUXzSp6pyA==
X-Google-Smtp-Source: AA6agR5hbacADbxwVDJCWoFcJTqmA/zt/dH6rfE6jrL04ZeNbuSaNE0c/tLl+nkU3UJedss9Sma4Ig==
X-Received: by 2002:a05:6512:3409:b0:48a:ef04:4ec2 with SMTP id i9-20020a056512340900b0048aef044ec2mr4311008lfr.230.1662709904599;
        Fri, 09 Sep 2022 00:51:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v8-20020a056512348800b0049707888a61sm157964lfr.293.2022.09.09.00.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:51:44 -0700 (PDT)
Message-ID: <df2f3529-cb9b-1b45-14f0-61d8a60943c3@linaro.org>
Date:   Fri, 9 Sep 2022 09:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: add bindings for dispcc
 on SM8450
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
References: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
 <20220908222850.3552050-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908222850.3552050-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 00:28, Dmitry Baryshkov wrote:
> Add device tree bindings for the display clock controller on Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I think I reviewed it...

> ---
>  .../bindings/clock/qcom,sm8450-dispcc.yaml    |  98 +++++++++++++++++
>  .../dt-bindings/clock/qcom,sm8450-dispcc.h    | 103 ++++++++++++++++++
>  2 files changed, 201 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8450-dispcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
> new file mode 100644
> index 000000000000..467544eea1ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8450-dispcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Clock & Reset Controller Binding for SM8450

Drop "Binding"

> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +description: |
> +  Qualcomm display clock control module which supports the clocks, resets and
> +  power domains on SM8450.
> +
> +  See also:
> +    dt-bindings/clock/qcom,sm8450-dispcc.h

This is not fixed (Bjorn's comment - full path).

> +
> +properties:

With both above fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
