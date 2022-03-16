Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B41E4DB643
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 17:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350273AbiCPQhM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 12:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234162AbiCPQhM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 12:37:12 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A425BE7C
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 09:35:57 -0700 (PDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 89A643F312
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 16:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647448556;
        bh=FN6zG2dC0IqxltRJmG+dxaBsreyz6dzWc1lR1WuSTgg=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=EXydiQQbRtbmfMfMQaI24mFiiKVIecDk25GD8YISiz/sjs4ejGWYTOB645EeJqNb0
         JDDl991h5VwVeaI7V9xr0x/Uw94pMtVtWuIZfA9q06ylbKypRCuRbqUw2N6/3/sAVm
         6wMNo4kjudyw7B99mMndPmYbMeHcTb50giJ4Pz78lLNvOVigAQ48QAc9jVolRMEiUO
         y+FsSWIbPlKa1t1xDqHoCj4WPfDxguGvsLKBbRaeh9mmp4I2STAsJQ6dybgBqGH5rg
         dUWnwwRmadX7JuQA6JwQDMqrmLlRVRG/HBwltz4dnTF+2oGu8c53DnZ05Nd/hhWlNr
         ke5GxqbZp5M6Q==
Received: by mail-wm1-f71.google.com with SMTP id o21-20020a05600c511500b003818c4b98b5so907225wms.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 09:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FN6zG2dC0IqxltRJmG+dxaBsreyz6dzWc1lR1WuSTgg=;
        b=G9bMeGU6zNtEj4em5B7dWpbbHyYIZ/z7tb6sTfgvyiLHOP/XbwUh65cvatIxCH8xMx
         o4XeP8OP/R1Jbi2uy7eHn/p75qWnJHsWJudnbzwPNCbWUA8xOsjY52BNTdzaMAMHHgv1
         IR0M2k4sU6PHchxbkau0sHjhvE0mtDRvnCGLMaEinGtxRu4OYqKdF9LxLPUFcArrrcaG
         uQjkFTJ119I7+7Bj/xJmKRyMgM4yJeZf96N3JZ0NaUGmk11xTNIGYUqLTorgIr5QUWXf
         J8PgnQSOf9naM5WcvWzJsvVFsXNOcUa8H1xSb9KklKAYU1awdyfhln29tVpeJRct8esZ
         B3Hw==
X-Gm-Message-State: AOAM532QLXpRWT29MFbo60a1/NdM+HFTpfrMfU/qZDwso9GEtuu3LsP1
        EffEsC+JIl0tPx1YcoJGBUYbd80mt+YNA1+5B0J+kHgkCKPuOgLxifYat86fyT72ZnqvX8EidrQ
        rbxY4wW8VpdIs+k4SGnlrbdJYkp3LFrC/3HPvjkU3JM0=
X-Received: by 2002:adf:e2cb:0:b0:203:7564:1076 with SMTP id d11-20020adfe2cb000000b0020375641076mr600099wrj.199.1647448556135;
        Wed, 16 Mar 2022 09:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVzUE71PYe2vyYegyHpKm8lEtDhuWhcP+csFOqL5Hf16cQSLcM9FjV7jTjqEvHk2m5Hgibhw==
X-Received: by 2002:adf:e2cb:0:b0:203:7564:1076 with SMTP id d11-20020adfe2cb000000b0020375641076mr600080wrj.199.1647448555945;
        Wed, 16 Mar 2022 09:35:55 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id bg20-20020a05600c3c9400b0037fa5c422c8sm6156246wmb.48.2022.03.16.09.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 09:35:55 -0700 (PDT)
Message-ID: <2f48ac79-23fa-85ea-c4e2-d03cc2a2b5ac@canonical.com>
Date:   Wed, 16 Mar 2022 17:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v12 4/9] dt-bindings: iio: adc: document qcom-spmi-rradc
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org, Rob Herring <robh@kernel.org>
References: <20220316142313.92371-1-caleb.connolly@linaro.org>
 <20220316142313.92371-5-caleb.connolly@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220316142313.92371-5-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/03/2022 15:23, Caleb Connolly wrote:
> Add dt-binding docs for the Qualcomm SPMI RRADC found in PMICs like
> PMI8998 and PMI8994
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/iio/adc/qcom,spmi-rradc.yaml     | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
> new file mode 100644
> index 000000000000..11d47c46a48d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/qcom,spmi-rradc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm's SPMI PMIC Round Robin ADC
> +
> +maintainers:
> +  - Caleb Connolly <caleb.connolly@linaro.org>
> +
> +description: |
> +  The Qualcomm SPMI Round Robin ADC (RRADC) provides interface to clients to read the
> +  voltage, current and temperature for supported peripherals such as the battery thermistor
> +  die temperature, charger temperature, USB and DC input voltage / current and battery ID
> +  resistor.

Please wrap at 80. It's still in the coding style and there is no
readability increase by using 100. Same goes to other descriptions here.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pmi8998-rradc
> +      - qcom,pm660-rradc
> +
> +  reg:
> +    description: rradc base address and length in the SPMI PMIC register map

Obvious description, remove it.

Best regards,
Krzysztof
