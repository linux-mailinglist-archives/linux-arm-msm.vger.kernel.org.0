Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB966A083F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 13:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbjBWMKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 07:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBWMKi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 07:10:38 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C215504F
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 04:10:09 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id r27so11396570lfe.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 04:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VQn70AP+A3I2sqmjhfgfqL1Y9XTnRaJMCZdiO2SRAdA=;
        b=sRsF5eRVhlmOFCywnN66o4x7hIsjnlo+cWOI++wvBg3w7DbFNASgEvl3i4emeNfmUH
         kKzoEjujEgFiAaYYD7THOVWUlp8iKd6Zpr6CKzVYEsifp9nhIe8JbDP7ohG1qANgSx3H
         gEUo+g45pmRdlJPGeREwrWiYametw2jcpSB/6KviTPtGU8sM0CYf7AM/M9PfggKMBnu4
         VW5XcA+egquL2zQdIc/+fCb0sYxw3dQpDaULAWsK/NePCEh9p6jCJlN/WKr8MBiwN4yt
         wewBTQS7JB1n0lVHjUN1N8Jdpd96QrSTS1ONhNv9K/PcWdTkbleJHCCMjYxnznEv7Pv5
         YBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQn70AP+A3I2sqmjhfgfqL1Y9XTnRaJMCZdiO2SRAdA=;
        b=rkxvBOq5piHrHc1EJUDBR9ZA/DyTpVLnzdLGR1/QaMkAcJOGhe8qT7ik8z7wFWQ940
         Pt9kyRFvj6X5ThaPd6GAi9XgUY9SSaI5ytduUj2EKz5T/S9UigczDPZ3RV9pWOW0Lb9q
         tw9lqyFdETboidue0CjfgSMYlKte8FFN8pDiy4LWheusAMtK2stAXR9BfvGN9JarKGxY
         J0h17a67x2RCKXbuvstuRR3nrz0yuQiXp7K/RzTBxitGUC7cJoG8fKsj3G6JlPQsrhAN
         e4tGHfsLJWPgU+ih3mTVhDqoSGk2QWAXJ/w7KqfI0Sxe6+KPA4UQhLI7Pj4/1HX2pXA7
         FY6Q==
X-Gm-Message-State: AO0yUKVDG4KQ+IEGaz/pzF0Hm8Dy5LC2EE88IXocaCoHLZYTwLE4aRJW
        OGCfVLWCDKG98K374Sns5FugSQ==
X-Google-Smtp-Source: AK7set+O7HU38OM6BC/kSjZpEGP7oZyfke11r+upQCHouYa68PvTYy0DG/uzr00PZxqYJE6A8ov2tg==
X-Received: by 2002:ac2:560f:0:b0:4d5:c96f:f7c7 with SMTP id v15-20020ac2560f000000b004d5c96ff7c7mr3460171lfd.23.1677154122485;
        Thu, 23 Feb 2023 04:08:42 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id v26-20020ac2593a000000b004dc4d984911sm638214lfi.271.2023.02.23.04.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 04:08:42 -0800 (PST)
Message-ID: <1c4f3f2c-d435-3721-df03-152c6468e0e3@linaro.org>
Date:   Thu, 23 Feb 2023 13:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 01/15] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>,
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
 <20230223-topic-gmuwrapper-v3-1-5be55a336819@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-1-5be55a336819@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.02.2023 13:06, Konrad Dybcio wrote:
> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
> specified under the GPU node, just like their older cousins.
> Account for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
[...]
> -    then: # Since Adreno 6xx series clocks should be defined in GMU
> +            enum:
> +              - qcom,adreno-610.0
> +              - qcom,adreno-619.1
Immediate comment: this could be improved by checking
the compatible of the node referenced in qcom,gmu, but
frankly - I have no idea how to do this / whether it's
possible with schema.

Konrad
> +    then:
>        properties:
> -        clocks: false
> -        clock-names: false
> +        clock-names:
> +          items:
> +            - const: core
> +              description: GPU Core clock
> +            - const: iface
> +              description: GPU Interface clock
> +            - const: mem_iface
> +              description: GPU Memory Interface clock
> +            - const: alt_mem_iface
> +              description: GPU Alternative Memory Interface clock
> +            - const: gmu
> +              description: CX GMU clock
> +            - const: xo
> +              description: GPUCC clocksource clock
> +
> +        reg-names:
> +          minItems: 1
> +          items:
> +            - const: kgsl_3d0_reg_memory
> +            - const: cx_dbgc
> +
> +      required:
> +        - clocks
> +        - clock-names
> +    else:
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
> +
> +      then: # Starting with A6xx, the clocks are usually defined in the GMU node
> +        properties:
> +          clocks: false
> +          clock-names: false
> +
> +          reg-names:
> +            minItems: 1
> +            items:
> +              - const: kgsl_3d0_reg_memory
> +              - const: cx_mem
> +              - const: cx_dbgc
>  
>  examples:
>    - |
> 
