Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A405D6A3C10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 09:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjB0INP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 03:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjB0INO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 03:13:14 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7642883F4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 00:13:12 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id h14so5219301wru.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 00:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0s3QlMH99J9txGN6IDDba9E7YuAuLZPQ1XK9+3yrepI=;
        b=Lwri2+SAGcjuAQG337kAuh7T/1Xy5lNNdYXVC9+tcUxGnIExP8iqrdONHBEdIBeupu
         Ci3Peomsl8WtHpiVOVOcN9pnFZ9yyD0zrsFq/GtKClsvzzar/2rs8EJxveaak+NQ+87w
         u4jg7L8wZUqdkZ9oNQrXu3UT6YoOzBM+dB9utsj51cegG65wUMrVVwIziJA7MaIsIrbm
         mX163nFAvv9J3EA0yXsyeobn7XW1ZRJp2FXgeH6biX0nFjM2NB2H4kFPKzFVfHMCbshC
         /y6bAF73ZXuNkXVBMwQlNbdVXecKT7olWMHBFDL4oZN3zxus0KRVQ/AWTWZOFiKoZ1lk
         C3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0s3QlMH99J9txGN6IDDba9E7YuAuLZPQ1XK9+3yrepI=;
        b=vTmclKDSMMKxWAyPmlHUFlMm3kkkOl8o6tJVOHIRQk2PXyeF9F/TjJUFprKKwpu1VO
         YSXqaDr0XGaU7xqEtZTyz/tI7j9NlAFaM6lUzqXKmEJ3JiUXNfi20e6lqGCrokdFe1BM
         lObPx8zYx8WETZCzR27ogguEM8zKqiFu/7mfB6YJhOniQ1+cj8AVyROX32FO8puv5Mnj
         MkirCrWkEyKoEDn4X4KTnNGxaX/izh8G5EYhHNa/GOBZcl3//5NbmdV3J97ypWbO+rUX
         Hld8+wP3fadEbzWCsm+yDA8qx6vZGmmCa0mhANirEHPqjo5DTCQEWR1jz04E43qRPQJN
         5nSg==
X-Gm-Message-State: AO0yUKVxCGRKfJXpTHUl2HuSZIRNVkHJrLIhYhFVGuGoSm5PKzeY7/h1
        wtCEPIoeU2OxPIxVvnxDWTy3zQ==
X-Google-Smtp-Source: AK7set8zBqwByG8fmTxhMr+Ahl7JF9nL1tWM7uLVLQ+mkwTwXNLSS9DlEmBnIYzHkI02+nuuh9q1Pg==
X-Received: by 2002:adf:f484:0:b0:2c7:fc61:12d4 with SMTP id l4-20020adff484000000b002c7fc6112d4mr7595144wro.47.1677485590923;
        Mon, 27 Feb 2023 00:13:10 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a4-20020a5d5704000000b002c559843748sm6395106wrv.10.2023.02.27.00.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:13:10 -0800 (PST)
Message-ID: <75b4da68-232c-7376-7806-8d475876dc59@linaro.org>
Date:   Mon, 27 Feb 2023 09:13:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/6] dt-bindings: arm-smmu: Use qcom,smmu compatible
 for MMU500 adreno SMMUs
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230217111613.306978-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217111613.306978-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/02/2023 12:16, Konrad Dybcio wrote:
> qcom,smmu-500 was introduced to prevent people from adding new
> compatibles for what seems to roughly be the same hardware. Use it for
> qcom,adreno-smmu-compatible targets as well.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> v1 -> v2:
> - Add this patch, omitted previously (big oops)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

