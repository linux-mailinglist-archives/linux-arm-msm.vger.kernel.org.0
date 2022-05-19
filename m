Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7737D52D125
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 13:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237257AbiESLHq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 07:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233051AbiESLHp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 07:07:45 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E668A9968E
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 04:07:43 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o22so5792558ljp.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Jl5t/pcladElqX8zO8Ph3rUwlPSiq0jHXhlbIcyf0qA=;
        b=J4uH4g94UNLs8ZXaC926XQBePWwNUri8DusahKIUeMGKdzikok5+qS3t6N1xMwT5ZB
         5SGYZDQumX1MM9+Bvm/3PNfeUVZ6UwGo35FyEracs40vtNzGzKaDeluj4ckmTWESQtCd
         1fczciM5SKyxTJKgDXy5NU0WBOpKVK+RrNcfEpx+vAs0L5vnbFaeQkSTw2FCZ+vVGJj9
         uklV5PznM1jghJspWRKs2nsZUfgUgEpB48BUpxzKmPLtl/Rpfg5q31+XDMryUpUPP807
         qXX//6W+ORQ4klsvwtUIiHwQrXZkvih52T76Tyic2AvYIoZkD3Gc4/cqPEpyYcJO/Cuw
         idxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Jl5t/pcladElqX8zO8Ph3rUwlPSiq0jHXhlbIcyf0qA=;
        b=Q1A8Q8CPTQkgG+8ycQ66lwzU2d0sAEWAw6nVw64F4YgplMWow1wBM4EThFLy6iycpT
         PlHTBs27c19BxwHEtNNd4KGerB8fLkkEkW3LE2DQcbnkoLfN3MVdEJh7j0vRk670gGGF
         j54YFUKKt6QhwnbL5S/vcPjBTaJ5HfBa5TacuOLtTVZ0CH1FkTkgC7KvisUK8qUJ/4iV
         VUUsaPJfvqWW/2cloV6wi3FKn281FGapd9JZxNOGp09xL+0/9yvyacXc0mz7f3SyXfhy
         GoAOHi9LfGhrFc9/ktMmrh3RTfBi59V0Or1fYyZ9czwZn2HEJFOjOcKtvJVVADqjfUy1
         vs9w==
X-Gm-Message-State: AOAM532omxhKc1BCQSQRXOry3Mb59DorRAFM8XMb51Q7LFEGC2IJo6Yx
        YAAjVQYud3WtHg+rP4xy3WFAAQ==
X-Google-Smtp-Source: ABdhPJwGPUmphpHFY19wVaXtaFbG1yjx7j2/GS1lSfcEzJSNwSktEWFRO7bvv6ANjklirJbzWuIj0g==
X-Received: by 2002:a2e:b6ce:0:b0:253:d6f7:b319 with SMTP id m14-20020a2eb6ce000000b00253d6f7b319mr1126999ljo.3.1652958462311;
        Thu, 19 May 2022 04:07:42 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id l22-20020ac24316000000b0047255d2113asm254487lfh.105.2022.05.19.04.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 04:07:41 -0700 (PDT)
Message-ID: <015c60e9-78f6-f0f0-5af0-733a78fbdf65@linaro.org>
Date:   Thu, 19 May 2022 13:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: Add PMP8074 DTSI
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@somainline.org
References: <20220518184825.1034976-1-robimarko@gmail.com>
 <20220518184825.1034976-6-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220518184825.1034976-6-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2022 20:48, Robert Marko wrote:
> PMP8074 is a companion PMIC to the Qualcomm IPQ8074 series that is
> controlled via SPMI.
> 
> Since we now have support for the regulators inside of it add DTSI
> for it.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pmp8074.dtsi | 38 +++++++++++++++++++++++++++

This file is not referenced by anything, thus not possible to compile
nor verify.


Best regards,
Krzysztof
