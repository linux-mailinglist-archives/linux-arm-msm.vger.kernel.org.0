Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAAA34D375A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 18:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236280AbiCIRBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 12:01:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236926AbiCIRAu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 12:00:50 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EE91045B2
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 08:47:50 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8CE7B3F7DF
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646844456;
        bh=t5qKAKCgLHNfxioPnEDa1ge5OiEhv8KjWelueqMtl/A=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=G7udQNwdlDinVLi4lSkcaXkUxmniovasE/ECkS5s8BfpVoHxOIbT57dx69hRPYPwL
         eMgXM4coGsl5N5MnQX2Hrfct+epBo4F1GVKlpnw3fZdW/OkbE2j7Ca2q/whBpX9ckp
         I6FkxHn/2LTjHcg9pkjliN2BCoxjVb3KFLKAdfEFHdn2SAIiLvkxfFR7jUvAC2vEWM
         34kGfDSUYOzHngURxXmp7F/u7S9hMPa4FNwcG+FdAjz2BJyRDalTN7ee3sCv4CKWk2
         JTsDhnXvp1GY2AEeRqLWaPTAVZIBh1qANPfAROeWmOSGDXpqL4hNXnso/gA0yxgtu9
         rddIdiDrb1+sQ==
Received: by mail-ej1-f69.google.com with SMTP id hx13-20020a170906846d00b006db02e1a307so1618351ejc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Mar 2022 08:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=t5qKAKCgLHNfxioPnEDa1ge5OiEhv8KjWelueqMtl/A=;
        b=pOQ4JMnfEcS9RnLCvUFp063ZSD66p0TF9zURdAR8EP/RQew0xrwNEEOyp9KCd4IKu+
         gdhaQYdUwwOCyQy47tVvR6ceByW03I0p+e9ukQ0uHWH/2NQPgtyKJSo4+aIKSKJ8nhZ3
         WMAijQKzzj9vZvp1o+QJRnq87I7W6XCtEw829JXkakCaFAvmNPRz/nzVXZEA5tUO/6Nm
         tHhFVcP+/POyPopkM+W+rYUsOdzygEBEe3yxwG7tbDfAVdKjFUKDSs20nAGEGUXXSsa3
         LK+aHHv1xsgnPatMcxRaE28D4rtHAcSlFfJ1gPd7Rq6YvEFGvMvozwsUSi0O1nDbV2GA
         qVzQ==
X-Gm-Message-State: AOAM532UsW4LnynhDDO+N9pEZmFnWfoeks2pob3OxqMwbwohM6Cj2Wel
        OM144CAKeCJd47Kpw+ybZGs/Bof3xm6H56HDHYLeO8OaoouIjY7HobU4f72dDlChzro8gXeHoOl
        rzeKpFMDS8jHmH/DsQZLT2XYCmWX0vAzAfm9Mr7ClniY=
X-Received: by 2002:a05:6402:486:b0:413:bd00:4f3f with SMTP id k6-20020a056402048600b00413bd004f3fmr326532edv.103.1646844456277;
        Wed, 09 Mar 2022 08:47:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsZlug/Jtbf8IyQ3h7CW4SbOa236xZgNhxscDPorwlpm36emowHe5wTeYyk+ubVgN2NAc0dw==
X-Received: by 2002:a05:6402:486:b0:413:bd00:4f3f with SMTP id k6-20020a056402048600b00413bd004f3fmr326496edv.103.1646844456025;
        Wed, 09 Mar 2022 08:47:36 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id o2-20020a50d802000000b00410d7f0c52csm1062084edj.8.2022.03.09.08.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 08:47:35 -0800 (PST)
Message-ID: <ba4c44bd-81d7-afd4-3a4a-6a1c6fec6692@canonical.com>
Date:   Wed, 9 Mar 2022 17:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] dt-bindings: cpufreq: cpufreq-qcom-hw: Convert to
 YAML bindings
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        Rob Herring <robh@kernel.org>
References: <20220309151541.139511-1-manivannan.sadhasivam@linaro.org>
 <20220309151541.139511-3-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220309151541.139511-3-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/03/2022 16:15, Manivannan Sadhasivam wrote:
> Convert Qualcomm cpufreq devicetree binding to YAML.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/cpufreq/cpufreq-qcom-hw.txt      | 172 ---------------
>  .../bindings/cpufreq/cpufreq-qcom-hw.yaml     | 201 ++++++++++++++++++
>  2 files changed, 201 insertions(+), 172 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
