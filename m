Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5277839EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 08:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbjHVG3P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 02:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbjHVG3O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 02:29:14 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE09E9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 23:29:12 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a1681fa868so473631366b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 23:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692685751; x=1693290551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TsqZI3V+hJG6jmBIcnLVyJpdYCOErXtyb8TjWPIzRxo=;
        b=EIIlrDD8s0FJ1WsZ/NcV/a7TT809f3usIjCeX4d47skroutZIQ9w4ye8BPxsJsZQB5
         tqJ1RyoPSg287bj2Q1m+tGfRkbrv8rDdN2tBHnIrFHhACptuKieK7ZKD8kJFa3BXe0Ge
         e6sixqf976LIUiVRJO4zHK63X0sMwLJmZRloszYa7HDgh+W/8EXG0SaKkJv5VaGhzaFC
         19u9hm33MJrf8ZLWo04kZHrwNK3IpYGVBgDLKWc6aM76QdvOucAMwwrvUoWPoWY6tO4w
         2L41mfQ5ltlB80DLi6KAAtRCI81EI8uV+aikSi3nvrqIMW8fL1FuU26t5NoXAYK36mmL
         wGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692685751; x=1693290551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TsqZI3V+hJG6jmBIcnLVyJpdYCOErXtyb8TjWPIzRxo=;
        b=jGJ/gMiZmBepv5tJ353AdgUN9cIgnpbRhDDq7LW6oPyU56VpWY9qCKhGYlD8RBwN0V
         lOS8XeknLW+j+n36zLv9t8XONcmy154HFgrFHMLRmPMzDCwBR982J/BcQmwf95qaKHK+
         dTnAemWheYK51gOv9h9qVB82VPwOsOAeILSlq2KazXsaJO/RcnEFn6wZk7oVqBil8P6D
         6ztoDeML3TFb0rHREBpf4iBRZXdZy3a6PxHHoY+a9bkOGBLjdXRUV823zE16uUBzVX15
         uRQSQgKQY0JNp4UEBoUfwlNjlEomo9ak5LInax0oHNot8ULDISNpwRYJKBcmiVTayP5F
         D3wA==
X-Gm-Message-State: AOJu0Yxpd3QurQwNbBGvxcdXzIKuXNIlYXzQrAwVuWhmpGcSwB3yy8Hj
        QLmXeww3UyRRwlj+6acAfMI01w==
X-Google-Smtp-Source: AGHT+IHretTproC+cMb7U71Violf3OZhuhMpunP/gy3W9GS8T+qgvqbXkgAEqOi82ffA2ulEdylGqQ==
X-Received: by 2002:a17:907:7889:b0:99d:e417:d6f9 with SMTP id ku9-20020a170907788900b0099de417d6f9mr7168227ejc.41.1692685751446;
        Mon, 21 Aug 2023 23:29:11 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id p12-20020a1709060dcc00b009944e955e19sm7703833eji.30.2023.08.21.23.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 23:29:11 -0700 (PDT)
Message-ID: <25fce66e-acd0-f6b2-f8dd-25db88b3d841@linaro.org>
Date:   Tue, 22 Aug 2023 08:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 01/32] dt-bindings: input: qcom,pm8921-keypad: convert
 to YAML format
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
 <20230822001349.899298-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822001349.899298-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2023 02:13, Dmitry Baryshkov wrote:
> Convert the bindings for the keypad subdevices of Qualcomm PM8921 and
> PM8058 PMICs from text to YAML format.
> 
> While doing the conversion also drop the linux,keypad-no-autorepeat
> The property was never used by DT files. Both input and DT binding
> maintainers consider that bindings should switch to assertive
> (linux,autorepeat) instead of negating (no-autorepeat) property.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

