Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 086B2658AB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 09:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbiL2Irf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 03:47:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbiL2Ird (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 03:47:33 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBCF12096
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 00:47:30 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bf43so26673734lfb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 00:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4cemsfu0VaWmJoNllBIK96LxIdmY+A3DSnp/dsjJwnM=;
        b=z8pgJ4Ovtr6LQ4qC0f8Lc1A7iQHUjeNKLE3T4eBQV8smae26lIVpLUuv7TF3lQowMM
         U9cq9VnbnF7aXWP2KnlaACTowHeAT0g8zoxJcLDpVApOAcZc8Mv7gdS99iNGdfAp76Ru
         UlstAQdPmiMFRx5flqNzrdh9mGAHj5olThDKqW33IUpZ6QbQ6ls6ZBpvzj1verqTa3uo
         Wb4NBJDkN5jHGqtCqeU3ib1TszrySYsrn/Q7vvCA3UE5/vZyTFMZ//0WOsEW1QnBCzD0
         mmbP355GfwRK4XrcnHGXyEq3ESqwA/3X8rb00QIMN4UN4zGI3YuO6ITXUq+XZJIRD1nV
         CZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cemsfu0VaWmJoNllBIK96LxIdmY+A3DSnp/dsjJwnM=;
        b=NUV3EgQ/ikopAlaARZWQc16wvFV0ejcaaiJHq3CShoNMcUvEDy5i54XT5FgDoirB7P
         jB9QjA6V9f544KX6QbsmsaDr6+7gVcxP34pfAgwisKloptoNbf7n2iTjDcFrU2X3ZXAs
         Kwa4SLBcbkKgP+lSzNEF8cjfnvSR4LGfbabu9s9LJwgQVnWOBscKMfaV0wKxVEDgb5bc
         FMXd9XE8bYelT1TgxnJlfqFnXryBrjcbVKrfuSg7utuiKpQhFSAu0SrRKLaaihf16Frj
         Sj+Y6k28YB8SmWrIY0/kzys3+5T0k7URc4L6W02rCZsQxFln+5iAbRWA6eJUG4MJ8Ck9
         F5Lg==
X-Gm-Message-State: AFqh2kqOWZURBLvYywGWY4kTbtc+fUQ0nEOSiow29lEskTORINFXhh8S
        ELZx/xysoP7Alvv3u4FxQmLs+4IrEEXLes9X
X-Google-Smtp-Source: AMrXdXvHQpo/g6VjyDZZZBZ4JHZ/0GDqwy0mwFL0s9vQERWlTIACcnMY4tr9YXTVbuTN7Ir8C6PfpA==
X-Received: by 2002:ac2:558f:0:b0:4b6:f51e:b8b6 with SMTP id v15-20020ac2558f000000b004b6f51eb8b6mr7010798lfg.56.1672303648851;
        Thu, 29 Dec 2022 00:47:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x16-20020a056512079000b004bbd09aca40sm2974914lfr.77.2022.12.29.00.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 00:47:28 -0800 (PST)
Message-ID: <98992679-47bb-24d3-d253-48fefb4a45f5@linaro.org>
Date:   Thu, 29 Dec 2022 09:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/4] dt-bindings: iio/adc: qcom,spmi-iadc: document
 PM8226 compatible
Content-Language: en-US
To:     Rayyan Ansari <rayyan@ansari.sh>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221228230421.56250-1-rayyan@ansari.sh>
 <20221228230421.56250-5-rayyan@ansari.sh>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221228230421.56250-5-rayyan@ansari.sh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/12/2022 00:04, Rayyan Ansari wrote:
> Document the compatible for the IADC used on PM8226.
> 
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

