Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50A73722905
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 16:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234363AbjFEOkA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 10:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjFEOkA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 10:40:00 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB12F9
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 07:39:57 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f505aace48so6260598e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 07:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685975996; x=1688567996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZ/Wx/zgJSwTp0t38WigvjTJRaMO4qIiJIqQKGcMOHk=;
        b=nTxpFfcBbzT/AvpjfHhD0vjOL/nnhWeDIgReAfU/7mTBRdEo7UTeyRb+celMb6ool6
         YvHkgSKDWEgEWiohHMQ6gCaYspB4RcZSE3w1+XosRPylxtbtGcpjPxAB1EpYNGH1s3om
         5DLnkvUz9+VBulBxLJj5S66zZSr2OcO2st0sEiSq0RCYB/qFwV1UmDly+WiaaGmRW8hy
         1o750eifhSEE4t2APzqhbV2o+OPJCB6F5G8XNNn3GULCL/WP9es3atal4Yno1/jWm+9u
         DU6FPYbnA+yoqk7nex7sOVAldrEFfu9pZr9fYh6DIyg0NX9ej8Hcow9XlwjPZfhVgBqZ
         qstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685975996; x=1688567996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZ/Wx/zgJSwTp0t38WigvjTJRaMO4qIiJIqQKGcMOHk=;
        b=KuFCdQPw5Nk21aNeOeGbkL4CXVRlpPmuy/9iz7RvUNpOxyFcSwD6S5PS3IQ95ROJ+y
         iKGNcOR//dTMuxuF8sL/WIx0GzEy+L6A3p5AD/gngBfmsd+2Bvz4KjUjKK/It54oB/07
         CnHZ5G8LRYqKKJ75PrDNHg88kYmWcv2CzguBaaLSURVIJTm1V3LNZfYYeRTFtE9n4wu5
         hb4IW5SKjJzSVcr5ARyVsT/FSKGL17Sx0n+sQHNeAav5KSOOwnp8HWtKepiNujcjpqsO
         0b5BYXTQaV6042+TtL7WTEXCCPGgGRBVz3CAwq4smfOYxP6HwqgpqQhuk7sOVoT6GgUZ
         IEHw==
X-Gm-Message-State: AC+VfDy+3IlXvjJQ92TLw4/rJHBc/Kg+adWsk1mfQLzE17qkQvF0nNxO
        bDMbgWpJApCv76ND9M3r16nxdg==
X-Google-Smtp-Source: ACHHUZ7WDoAhYXeQfKqx3mhLebnwXX+a5Kx8rUIlNfmQYvJmv/Cuj8dkaJfOMD2HqLlQTsBU2ee3cw==
X-Received: by 2002:a19:740f:0:b0:4f6:217a:5620 with SMTP id v15-20020a19740f000000b004f6217a5620mr2681255lfe.39.1685975995851;
        Mon, 05 Jun 2023 07:39:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:2385:9257:ace1:1efc? ([2a05:6e02:1041:c10:2385:9257:ace1:1efc])
        by smtp.googlemail.com with ESMTPSA id g26-20020a7bc4da000000b003f50e88ffc1sm14725899wmk.0.2023.06.05.07.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:39:55 -0700 (PDT)
Message-ID: <751ed2d6-3008-bd47-1921-2f2ca7cc92e1@linaro.org>
Date:   Mon, 5 Jun 2023 16:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/6] dt-bindings: thermal: tsens: Add compatible for
 MSM8226
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230507201225.89694-1-matti.lehtimaki@gmail.com>
 <20230507201225.89694-3-matti.lehtimaki@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230507201225.89694-3-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/05/2023 22:12, Matti Lehtimäki wrote:
> Qualcomm MSM8226 has tsens v0.1 block.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

