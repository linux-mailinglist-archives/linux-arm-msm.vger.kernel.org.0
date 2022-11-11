Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C34A6254B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 08:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbiKKH4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 02:56:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbiKKH4i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 02:56:38 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E285C63CFF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 23:56:36 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id c1so7206543lfi.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 23:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WvPhcAqcbyfFn2kvkMngEVsRIEmbMyFX/b7V+85Aacs=;
        b=DGu9HLw0FnasPlRYFvYz5KjUHaixwv8RUXdMR7wnNdt03V8Oy7B/skPBYKLHdKMhXT
         4LzQ8BoEBCV6F1dYjzGObS4ggX7lg5zkbi+8PHWd5VOxOq0Xq6g0OM/hGcX6KRv8c9kp
         Se/JzKOARZ5Zpql1uOUBceNI50CXhqOExs7cXct2UshvxVUozcEsdcpWKGH6oY9iYpOl
         111WSd0OkAaR7Xb+055qQTZ1JZGgtjw8hkit/0b+9JHczhPRnKQrxYiC/5Zwjg1PgLmn
         9FEnyV2igWnPcXN0Jq1coH2WZoqjRPNMRE3JShB7QA3dSPt5CS9jafuNMX0Z6fYzEqun
         1e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WvPhcAqcbyfFn2kvkMngEVsRIEmbMyFX/b7V+85Aacs=;
        b=rpAFFymA7k2lphLUqJmuSpPeZeUiC2ovRqToYN8HOLls9IDG7oV+sUI4q0riQ99FZH
         +rvz7VdvBu8CZ5WGe6Gdw/7zMaJCMtFyj+6qzkp6AIzmogGD4/Nm7K7bi1laPCUHbFH+
         bKFLaCncwWfzSBBqn4Gd8Q8Os3bRDiTCLeUxSEI7AdQquoAS/L7cDzUkBlohTfZTjBVH
         0hS2lcrLdyanFDGqe/jyDBFQ833bnKPsE/nXSWaGMjlFtXsL0JU32uMyXhd6Yf4ES4at
         a4EIc1hqjsurF7eWD0hHGYm0gVW6ULxaDf24ZGw8fwSg3jIKz9kfEy8qy0KjGc61NXTz
         nWtw==
X-Gm-Message-State: ANoB5pleeGlrRy+HWni+sL0KPj32TlGfrIhcET1UY/2dW12t2jI5fBsh
        JruNSe1g+f5OhWX1X1BP0/OOew==
X-Google-Smtp-Source: AA0mqf4amzRhnZfeOZ1gXLHNr6d3DtBV/BPWHz2rUpSPxEe0KDoDNV6NKXGh0fyRowQqUAJYsJw5Vg==
X-Received: by 2002:a05:6512:3baa:b0:4b1:2aab:7cc4 with SMTP id g42-20020a0565123baa00b004b12aab7cc4mr350872lfv.241.1668153395329;
        Thu, 10 Nov 2022 23:56:35 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id o15-20020ac2494f000000b00499aefcf68esm197237lfi.292.2022.11.10.23.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 23:56:34 -0800 (PST)
Message-ID: <e6a87653-0623-1452-ae56-ab5837dd6746@linaro.org>
Date:   Fri, 11 Nov 2022 08:56:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add Xperia 5 IV (PDX224)
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221110223929.134655-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221110223929.134655-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/11/2022 23:39, Konrad Dybcio wrote:
> Add a compatible for Sony Xperia 5 IV.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

