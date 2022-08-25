Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB4C5A0FA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 13:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240197AbiHYLzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 07:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235857AbiHYLzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 07:55:43 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7CEA2872
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 04:55:42 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id x24so1109946lji.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 04:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=6XKZfRQTbqgRZcANt6xELc2SVlUljiEWEfQE8Qx9J+8=;
        b=Qqf/eZldqtrSxY+Imp6UQb0gxT52HRHcfkvEHvpCVlEEUx0bABCkhI5Hvn07yHr970
         9O1i9/E74Y7k/gH4VzdlpLrv+Ux1Uq2HRIZKdWGlNX8tx/FSUy4N7jQ2gnh0FtBa0+9M
         Mr98uzkTkMjZWF9QwkwxNgCu/omlrI90+2tBpOgf3zutgux+DG3HoUNAAEk2z04tfckB
         oGNxAxuxM0m88qTgHjFll5yF32EOvSXwbRop+3MRbNazeGMyskV/tvIZlyqUf1klOdQj
         LkYesc9VmoU0fgEzD1pF/ezlRP7TFOBi/5gIHUoA8ofCsX/5YZ5EEHuBAfJog1gVnvgL
         GLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=6XKZfRQTbqgRZcANt6xELc2SVlUljiEWEfQE8Qx9J+8=;
        b=lOSMwJCZJUHCkH4Kelm7nDImz1nuoqH2mYQhuns0Lge3d1UkWQwOzB00WHmDP2PK9b
         SROPzKh00kWYQu3NEhMKS6TUCyXe1PwSSBlawAFS1FiDBlXa2QdMiNGQ0B+C3Wk3Vnno
         w8mY079EEzXLEY6NtYoJOu8VPV60B9xRtgLOG4SEQyNBTS5z+VFP7CL0qdgpoaVVUGJU
         Y2Xwf5kQVwck+IVRXoU0DWdX/68HsVwjf5j6iuVDRf3md8vVRDWrp62MQjEqEWruSMRe
         RVpuRMRWM+DDnjkmzKHqnO4sq4Cp43B7YYXRaHWVRNvtcUGb9GAB4xYVjR1xyCkQB4Tj
         kwRg==
X-Gm-Message-State: ACgBeo3pICzkpKTEnaikokezEPiV8Bp8CK1Ce5nvwI1DF/ubNV59B1Sv
        obySdANYn791fmrP3kX3jEl9Bg==
X-Google-Smtp-Source: AA6agR6iJRh4adLmym6DhicDyzYTJIpz7bsuJ8SQG/bWGZqpju0gBB68YyMlqiclDMC2VDp5to2LeQ==
X-Received: by 2002:a05:651c:1025:b0:261:c071:c473 with SMTP id w5-20020a05651c102500b00261c071c473mr1002073ljm.71.1661428541105;
        Thu, 25 Aug 2022 04:55:41 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id r15-20020a056512102f00b0048b0176bac6sm464706lfr.93.2022.08.25.04.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 04:55:40 -0700 (PDT)
Message-ID: <a0eb1fd7-4bc4-f62e-b61a-f02e388afda4@linaro.org>
Date:   Thu, 25 Aug 2022 14:55:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 01/10] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825095103.624891-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825095103.624891-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2022 12:50, Dmitry Baryshkov wrote:

(...)

> +    minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    true
> +
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
> +oneOf:
> +  - properties:
> +      clocks:
> +        minItems: 3
> +        maxItems: 4
> +
> +      clock-names:
> +        minItems: 3
> +        items:
> +          - const: iface
> +          - const: bus
> +          - const: vsync
> +          - const: core
> +  - properties:
> +      clocks:
> +        minItems: 1
> +        maxItems: 2
> +
> +      clock-names:
> +        minItems: 1
> +        items:
> +          - const: iface
> +          - const: core
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +patternProperties:

This goes after properties, not after required.

Best regards,
Krzysztof
