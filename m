Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1615B6AE0E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjCGNkv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjCGNkm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:40:42 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C5A39290
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:40:06 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id k10so28459937edk.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678196401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XC4sVtRhs3Zf6p7vrRaYLHSxDBdL4Db27wMBtNXLbys=;
        b=rUV2Kjw3Vymhi+3LKUBky0XBHG5Bn1YsrJOxxxgNTd/dIPrFQa0FRIoo4OJVabJWKC
         ektMNMm9qE+yli/81Yj1BBSBM+L8jcraUhWPIgjWV1GGnFSZJltoowdn8WgQGDg4/3Jf
         chAOi0h/L4I6TwCh9AfTdguU0Cqpeo048SkVAynoadLVkiOr/zyDz5Ey5N0tpU7Ekmc8
         KMtQb0dfhpnKwcLFWLhvXDvBTJ+RQvHTuiEUt82hV/ZJrBqyJ0d8MxtXEih5R+b+ujbA
         TCekESNVB6kCqT2dJbKl5bQtdZ0kPVHQS7d689xPq3c90SV1hNsccw34xMkGNzXGEyk6
         HZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XC4sVtRhs3Zf6p7vrRaYLHSxDBdL4Db27wMBtNXLbys=;
        b=o7jVYxuxYn+14XhOPan4rJag31DG6/EXVliIAdJVwG1murtA4RgxQJ2SoKhkghpC7k
         0PZ+wUNTEuNNbhEOMFnjC5O0Xy6DiHq/JCF4MWYMThe1AUhWz1mcpPwjIvprVt0Q6rC8
         kGcaNdGnqOM78IDIHah4J+/f0sdG6LFNmtX/G901Dkw6jv7bT1OfpzyH9ypzWfIX31GK
         DmYDTw+HEsgUDBeJemd+4IerksI8yG/5twUOFZ8ofN98Z8ozffTLqaskI+kcS6KP3p+2
         tXMfzqkLeSATefsWCrPn+iNSM7eK2j9U65SRBKG8W2bCxYDSfNdutfk6WOUAIVtaL3ca
         TMvQ==
X-Gm-Message-State: AO0yUKX0ER21KPseIVmJMOPw9HV80XSeyCxCoP72BQiC7g+/Ria4K2nr
        vHlIdcviBcL7zIMz4kiP9YAUAQ==
X-Google-Smtp-Source: AK7set+FpSCgfpPHYilbHlEYTxWZBSw+CdQ3OZVBTpRaGlOWlMx6OlovVFAPZa2UCli9MyVzxG6i3g==
X-Received: by 2002:a17:907:6e1f:b0:8af:2a97:91d4 with SMTP id sd31-20020a1709076e1f00b008af2a9791d4mr16691610ejc.14.1678196401027;
        Tue, 07 Mar 2023 05:40:01 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:a60f:e604:c252:1f3d? ([2a02:810d:15c0:828:a60f:e604:c252:1f3d])
        by smtp.gmail.com with ESMTPSA id ga1-20020a170906b84100b008b17879ec95sm6090160ejb.22.2023.03.07.05.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 05:40:00 -0800 (PST)
Message-ID: <08aa9325-ed36-250c-d4d6-de6af1e82de5@linaro.org>
Date:   Tue, 7 Mar 2023 14:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: lpass-lpi: correct
 description of second reg
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230302155255.857065-1-krzysztof.kozlowski@linaro.org>
 <CACRpkdbe=sHG9KVaGrbEaFoVbMY-2=r2X4WkcbNhCfZ9KOw1sQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdbe=sHG9KVaGrbEaFoVbMY-2=r2X4WkcbNhCfZ9KOw1sQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/03/2023 14:32, Linus Walleij wrote:
> On Thu, Mar 2, 2023 at 4:52 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> The description of second IO address is a bit confusing.  It is supposed
>> to be the MCC range which contains the slew rate registers, not the slew
>> rate register base.  The Linux driver then accesses slew rate register
>> with hard-coded offset (0xa000).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> LGTM, is this something I should just apply or will you collect a larger
> series of Qcom DT patches this time around as well?

Please grab it. I think I cleaned up Qualcomm pinctrl bindings from
technical debt, thus no more work for me!

Best regards,
Krzysztof

