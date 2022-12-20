Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C69AE651EBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 11:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbiLTKY2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 05:24:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233678AbiLTKY0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 05:24:26 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A46D106
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 02:24:25 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id p36so17853105lfa.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6AyEVG/P5nSoRfbYs4O0LF6hVQK/yIYZW8GprMFhulM=;
        b=DE0eQoJ7ELLT8LEacgTlFtKqS9382+ykke9M7VDtII9e+XqXp4vcG9+XeqPxBo2SH+
         EC6BH1QQ11k5zkXqZWMZ8Ghenhje4M78HjX+FbuVyogCGdVsTapPkN3wkOrpVJvlSIW/
         N68tp8U8/NBl+vo2BkzDipOQRyfZOUgV7VOuZBO3ubwv6VjsFF0r2WUP+a2OhI3PgtyA
         eq90g/i6lOh0qk+84KPVQ/KrxMe1qisUv0rEDCXZ2nPEw+Fmyots2ozIkBMCYS2aKwj6
         lJP32lm/bqvO3/R4dbir5v6EG7Ij++7ENuPuk3wU6dcUrIbkvJO2NTPUL05q6aXusAQL
         eHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6AyEVG/P5nSoRfbYs4O0LF6hVQK/yIYZW8GprMFhulM=;
        b=syBPQxvAQhMlZo3h2+wXrNRGOkWL4zxyrvVni4VU1kax/7bXSUt/kVVC7wf74qGPSE
         eR3wfNhucElFiyBGI8G75ILOBBbMaU7aKxQPFmSHqdrqk6iOP0UZMeW45uLFkLBq/I60
         +LzuzQjOGjjnzo0dU1oiK3JFTKPMQyFgiYdxOlpdEfYkFcqcFErIZKEzKwrpImSvx0/X
         hEkJyH3JX6VQ8UXxxQgEhL/gIhJq93mnRAOuwektIiiFDJkAXmY/xbAIoJJfON7Uu3EI
         wkirc4W6Eo5WVjK8bY/yCw//wF5Lfth9ZyLjYeqgTKETx+2qyMWN/6ZSm+v5PUgZxl8P
         L3Ww==
X-Gm-Message-State: AFqh2kpXNlEumy4YuMMRZI12fCuL5V4tvS0zetNGWjFgOwNJPWoLmL0o
        GcS20MFjSTTuvMkNQCmGRdDbkw==
X-Google-Smtp-Source: AMrXdXslDBTiA36fc5Dis/BQkmDERjTO+2h+WiQGJwpuxHA8cCzVONlNCAEVf5N+zBuqL9xBy81I0w==
X-Received: by 2002:ac2:48a2:0:b0:4b5:a65d:9b7c with SMTP id u2-20020ac248a2000000b004b5a65d9b7cmr508386lfg.21.1671531863586;
        Tue, 20 Dec 2022 02:24:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o22-20020ac25e36000000b004ab52b0bcf9sm1403854lfg.207.2022.12.20.02.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 02:24:23 -0800 (PST)
Message-ID: <6de40fac-3903-665c-2014-07d3c90ba639@linaro.org>
Date:   Tue, 20 Dec 2022 11:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] dt-bindings: PCI: qcom: Update maintainers
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bhelgaas@google.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221219191427.480085-1-manivannan.sadhasivam@linaro.org>
 <20221219191427.480085-2-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221219191427.480085-2-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/12/2022 20:14, Manivannan Sadhasivam wrote:
> Stanimir has left mm-sol and already expressed his wish to not continue
> maintaining the PCIe RC driver. So his entry can be removed.
> 
> Adding myself as the co-maintainer since I took over the PCIe RC driver
> maintainership from Stanimir.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

