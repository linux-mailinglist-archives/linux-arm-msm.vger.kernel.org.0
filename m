Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E240F676D4F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jan 2023 14:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjAVN5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Jan 2023 08:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjAVN5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Jan 2023 08:57:13 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 556341A96A
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jan 2023 05:57:11 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso3307986wmb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jan 2023 05:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HcNqURibx7/uGtof5arV6PdZbLFKVee8MlZgSB8fyuE=;
        b=hdzcqiejns9tW0ymh3KbzqNwbyuucFS5GXyPzyRTgOqAM1v4uuFQjzUGV5IQVLcguT
         hFuRxpj7nDxr7CB/E+WkEPouzUHOdFyZDs9hFTS9jNxN6x/rQH/P/qtggR0knmvb3VJ9
         Cycz6MV5ep28ThVuxQjMlxDf3WNqmWDvfGO6JEzJWRM5euHHnk0oV/OgDS4RH/NUCDnq
         4A+2zuP7SrlTqcA3J02aoh3fEN/ZKbdcSFmDax2/SlA2qK7cimb9MKtoF12LcQg5Ymmv
         9KLAMZxfsr75FiT5b6kGd9GjN8Z0ZBC4jEwYi3ew5ZRykuOJykTr9kfeF2RyqGFtju5n
         iVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcNqURibx7/uGtof5arV6PdZbLFKVee8MlZgSB8fyuE=;
        b=PdWOoCnO/EoWgXpF2dAYAi+AK7HB9fljDn7htBu+xdEkXOp/PJgTXiIFTCwM8teSaI
         leqv66szCEp/g/1ybkuGZkYeHs/wr7B4JvktyL4+MVT6pp7/9NyUPlV5dSI8OB2Dtu83
         FQ0jIIJpMxPRBo59EbwnVCNOylJ/wgCHq75ZzB/vGn/qluImEvETcM+WMMpEF8BuhUag
         pqBW5BM/snjFGFyOw0W2GxAIugcFX8XvohS6MB/07/X+2pkX66L3GhW8LLtStDt6uvYT
         eBi2R9W4BOP/14UCoPHdGJjXWpRjTv3Q8d60dJyLoKVRih+wtGWieWXnI5LhvjMXz7eO
         oUiw==
X-Gm-Message-State: AFqh2kqIWsmxXUXDT+/13PzTHLmZQ/XrJsueJTG6Eg7VM4ZD9ZrFg5ph
        sNWuC05uctT2C3Ek/n1PRREIQw==
X-Google-Smtp-Source: AMrXdXsVfmRB9xeqaSH5G+yfD3vg56uWFXJv/bHobtVxtPYbEISul1kqSSmKN7H73DkG1vbecf27gA==
X-Received: by 2002:a05:600c:2e8a:b0:3da:2a78:d7b4 with SMTP id p10-20020a05600c2e8a00b003da2a78d7b4mr21698992wmn.3.1674395829884;
        Sun, 22 Jan 2023 05:57:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b003db315d4d02sm8146491wmq.33.2023.01.22.05.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 05:57:09 -0800 (PST)
Message-ID: <43ff6113-03ee-a40a-b454-53cadec8728a@linaro.org>
Date:   Sun, 22 Jan 2023 14:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/3] dt-bindings: cpufreq: qcom-cpufreq-nvmem: make cpr
 bindings optional
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230121000146.7809-1-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230121000146.7809-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/01/2023 01:01, Christian Marangi wrote:
> The qcom-cpufreq-nvmem driver also supports legacy devices pre-cpr that
> doesn't have power-domains. When the schema was introduced, it was
> wrongly set to always require these binding but this is not the case for
> legacy device that base everything on nvmem cells and multiple microvolt

What is a "legacy device"? Why do you adjust bindings to legacy device?
Can't you just fix the DTS on these devices?

> binding providing values based on speedbin, psv and version.
> 
> Make the power-domain optional and set them required only for qcs404
> based devices.
> 
> Fixes: ec24d1d55469 ("dt-bindings: opp: Convert qcom-nvmem-cpufreq to DT schema")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/cpufreq/qcom-cpufreq-nvmem.yaml  | 78 +++++++++++++------
>  1 file changed, 54 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> index 9c086eac6ca7..04aac634d7fc 100644
> --- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> @@ -17,6 +17,9 @@ description: |
>    on the CPU OPP in use. The CPUFreq driver sets the CPR power domain level
>    according to the required OPPs defined in the CPU OPP tables.
>  
> +  For old implementation efuses are parsed to select the correct opp table and
> +  voltage and CPR is not supported/used.
> +
>  select:
>    properties:
>      compatible:
> @@ -33,37 +36,64 @@ select:
>    required:
>      - compatible
>  
> -properties:
> -  cpus:
> -    type: object
> +if:

Missing allOf. Fix also the placement - this block goes before
additionalPropertes:false.

> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,qcs404
>  
> -    patternProperties:
> -      '^cpu@[0-9a-f]+$':
> -        type: object
> +then:
> +  properties:
> +    cpus:
> +      type: object
>  
> -        properties:
> -          power-domains:

Best regards,
Krzysztof

