Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF06B6A1B4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 12:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjBXLUE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 06:20:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjBXLUD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 06:20:03 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CA21353E
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 03:20:02 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id h16so53644497edz.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 03:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Njm30AQBCiZsl1r/A2bbjJBxbIy+rhISCg90BWo/8k=;
        b=mIiZeEsUWzPmwXGwXcmoWAfjzZYvzoqU/vkxax57FwmpV3E5k28nSbg82tY2DhJ3QZ
         xtulBn3jmkKp5RridDbhwmQELXZQ48vcYSp6Nj6q8TagLOxlPH0eBy5EVVvOzfeKRWmW
         C+ERb6aIlJU1QWWVWfEU0HKhyWKqDM5B0HkVx2D80p7Qk1haolAv8j3yqLNOUKim9p+c
         ZOG9iWs+KpRAWE6U/jfRpobjSlek692ZsXJUP0LLI0dmak+QJIfiASNRWYcsJjKpF/Lv
         C+D5kJWzOJbWqaF6UEJuXr1+6qoCZqreQnnfaRPRcHwT+xKwx5e882GvbnuRcUrTDH+3
         9XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Njm30AQBCiZsl1r/A2bbjJBxbIy+rhISCg90BWo/8k=;
        b=m7gbROz6tDSfi5P++ncUbffTKo6273xOSOWa3ZzUKpw/HriWxht7ZO1WDvrpMHW5Of
         WCVLsi6fwkytwcWaXj1i+z07opCr51zcBJ8auQA6Pe6EapvqRIDhksKyuyA+0/YfeHht
         1aRICjdFNND4RAptCNxAaHy1LWRBMCsQJtdMRDBKDcniDbPz2tdKVgOUKBrLUfJp0+Wo
         zfA04pG+y/sd4wawctmCM+9T+4PBvOAZgAUdwRbpU9uKfVFEoiMaB4vTHoz0luGAvkJt
         zrqFabcJDX76OtjFralMUpAGIjEjzZjFHTiGkeChX4OH/4zSiw7oY+18Ek8eXOuxAFSV
         m9jg==
X-Gm-Message-State: AO0yUKWraCjhdqPwpL7PjL1dM8F+V9xEGwhC0caRbU3O2d8uWLbg0fNh
        y8JTriDTsfVkTTtt3ZdUFMFYmQ==
X-Google-Smtp-Source: AK7set8K/SNOhJHO32tZQmCDVnK5BSQ+/EUE74ldpMSsptNS/Vnl5kTCOFqgSob/GlzmFjZqj83ZwA==
X-Received: by 2002:a17:906:f0d3:b0:8af:54d2:36af with SMTP id dk19-20020a170906f0d300b008af54d236afmr25060935ejb.76.1677237600869;
        Fri, 24 Feb 2023 03:20:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id my22-20020a1709065a5600b008bc2c2134c5sm8165118ejc.216.2023.02.24.03.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 03:20:00 -0800 (PST)
Message-ID: <2fb0ba58-c011-7896-9792-005d0ed9ad55@linaro.org>
Date:   Fri, 24 Feb 2023 12:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 02/15] dt-bindings: display/msm/gmu: Add GMU wrapper
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-2-5be55a336819@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-2-5be55a336819@linaro.org>
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

On 23/02/2023 13:06, Konrad Dybcio wrote:
> GMU wrapper is essentially a register space within the GPU, which
> Linux sees as a dumbed-down regular GMU: there's no clocks,
> interrupts, multiple regs, iommus and OPP. Document it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 49 ++++++++++++++++------
>  1 file changed, 37 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index ab14e81cb050..021373e686e1 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -19,16 +19,18 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
> -      - const: qcom,adreno-gmu
> +    oneOf:
> +      - items:
> +          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
> +          - const: qcom,adreno-gmu
> +      - const: qcom,adreno-gmu-wrapper

Why wrapper is part of this binding then? Usually wrapper means there is
wrapper node with a GMU child (at least this is what we call for all
wrappers of custom IP blocks like USB DWC). Where is the child?


Best regards,
Krzysztof

