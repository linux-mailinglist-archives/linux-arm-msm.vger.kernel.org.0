Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56561797A25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 19:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbjIGRcW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 13:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbjIGRcW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 13:32:22 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543BE1BFD
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 10:31:56 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so1162172f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 10:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694107862; x=1694712662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGhxv+wLkUlJTnXgtlH4J46AYd9o45ySTLmRTKlekWI=;
        b=SOyEPQFsjDQREdfJs8Ty1AXTaHgMbhwyoc4ieLojh7NoaioPyyK2KFmMNtQE9lIf1E
         FehW5NTFrQt6rNjrQ0NiflKYcGF9EgqJo9eAJWpvrFWgyGCQgmY8uxJcpy2Tn7jMBzqj
         G8OjU8azI8ZP4wzwFp9usTBYklIGVRE/cEo26lcMflg0sXOBL/mVMTnKwkhS3135fE5u
         I+3cbE7JRa+d/Pq7nWvB3nj4BLFY317OQyTYwaerdifSUsdtf07Vjdc171MldM2XpRtc
         oKmeL67uSvCUOqCm6IygOlYvof2k+x4THQyFZF7A9vnBrKIKHckwHPx0G5812h9V3arV
         cAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694107862; x=1694712662;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGhxv+wLkUlJTnXgtlH4J46AYd9o45ySTLmRTKlekWI=;
        b=uzjoPEcQdBTMjAcZXY7sjlk7tVp3ZYGkdtwwsLhSGlQFw6kwhvnTOrQJqugXTmcy4U
         DTL7zfsUqQfy+LOqfENW7Qj4ANoHMK1xZUv7hEMZKbQZwZD2kBYW6/E+IeF/mQKKmLKw
         a5TdC0PPsgfR9AfhqdUfD0sA64wk2ZNhUkNc+lHrvauNfc34mVq8Z4UvRPAkk89tAMKn
         sodcgPUGsQF0bUEudlnDvlPHdPUAaHiEyhdkTt0ZuNi5IpRqZUCJnn6Ve/8RTFZMRruI
         kBDogAN9l2SmVkmUxVyh3uJYbffYhU8Cx4z6l5297I4IGV+zx2EG7q/RM4EK76p0PerP
         YpAA==
X-Gm-Message-State: AOJu0YwEDhnPn9qdxqPPpvU1ChtYFJgfRl10ip5aojIr3Zh0gWQPGmOt
        PVpbevjX6F3479nXJBvKMd/bLImVZkfBxWz/Nlaa+A==
X-Google-Smtp-Source: AGHT+IHgZdZSiR//XinTA9Y8E8bS2xBu6CE90k9cVQP1rRMZIv9GSOKD+LJS0NcyLh090bkwtAQy+Q==
X-Received: by 2002:a17:906:19:b0:9a1:ec3d:8ffe with SMTP id 25-20020a170906001900b009a1ec3d8ffemr4567309eja.18.1694066647510;
        Wed, 06 Sep 2023 23:04:07 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id qx12-20020a170906fccc00b0099bd86f9248sm9922585ejb.63.2023.09.06.23.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 23:04:07 -0700 (PDT)
Message-ID: <2de8953c-f1c5-3c17-5c95-973ef550bc32@linaro.org>
Date:   Thu, 7 Sep 2023 08:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 08/10] dt-bindings: cpufreq: qcom-cpufreq-nvmem:
 document IPQ9574
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1693996662.git.quic_varada@quicinc.com>
 <e0f54a4b249f24b10d3dc21a0224718e46ebd158.1693996662.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e0f54a4b249f24b10d3dc21a0224718e46ebd158.1693996662.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2023 07:21, Varadarajan Narayanan wrote:
> Document IPQ9574 compatible for Qcom NVMEM CPUFreq driver.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

