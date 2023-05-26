Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32C871238D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 11:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243022AbjEZJ1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 05:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243117AbjEZJ1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 05:27:21 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5EF1BB
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 02:27:16 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2af1822b710so5237021fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685093235; x=1687685235;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWY6DpPavWVM1/OV1R8NKim5vOgtapaTjgty3qjQSRk=;
        b=sKPpbV3i/F+WXcUkFLlNIXGaLW0Ro8KTEkTLW5HjsV1Aymj3soXrG2/LScpefhNikD
         9EuJsDyLIcGhsaya5NvrKKYfIurUbGVxYLjni1DqmFumcps31LRNQYRg4PnXiD5OiMA/
         0m7+7+4tK831HUt68QNgjLQLEWLevnJigZnlBPLttxttRDdd2TeEOpTwh/mgYW5yqstC
         Jo0cuXc0EEIGXcODbgR4o3s+HL7BCc+hkRPRsrEvJqCYxSD5RHQOYYgS8Az4+bZ2tftR
         10dCppKsa0a6g6SHd2FnImg3ds/snfIFKGjR7NxlFiUkQzGt9Hn/T+H29bQ7gDFUGB96
         D6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685093235; x=1687685235;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LWY6DpPavWVM1/OV1R8NKim5vOgtapaTjgty3qjQSRk=;
        b=MDZ8z0eVxZ5wD1/eEU2OQv9lyan2sYLqyLop7Vu4UbdFDsecvBj9InSpHNSpebLyGG
         6gPXSFB9/5oiChwaZJ69uh36zkZ9M0oeVT0LQb8pIZcom4yr7Dq1q+f5SOzS1lZ+awk+
         WsyCKDvAev85PdnaCZuXFPovl2erEpF26fH8YlRXVqCBB8CAHH3M7KAhZb070j7sMSl2
         P5lEkALEA2FEwjKjEELvmgWn6mKl9tnvku3Gos/ij2Mh1bI9dIKFmr1Gjb31XbnK2wzl
         80XybbgSCkEt2A6J5OnUn4DJZiouLg8mQ/FiC+omfFonL1eaWzYSBW2KZ2P3JA8H4357
         mHrg==
X-Gm-Message-State: AC+VfDy809GVUGq6dJ5HMXwEA4ruapV9QKf/r6ilpDwtjXce3HN1uD2P
        yXco34hmH1P6ycSSk/9ji0YzCQ==
X-Google-Smtp-Source: ACHHUZ6ltL32f+pELojB+JCGwt/0k+SKroDtrl5xjXEHrWHnBK2DNAtZmefxNCZAqo5wLN7qGyUxWg==
X-Received: by 2002:a19:f816:0:b0:4f3:a812:5ae with SMTP id a22-20020a19f816000000b004f3a81205aemr375578lff.37.1685093234954;
        Fri, 26 May 2023 02:27:14 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id v26-20020a19741a000000b004f138ecab11sm543964lfe.24.2023.05.26.02.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 02:27:14 -0700 (PDT)
Message-ID: <a1d60d67-49cc-4936-4b89-394c8fbdddf3@linaro.org>
Date:   Fri, 26 May 2023 11:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] mfd: pm8008: fix module autoloading
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20230526091646.17318-1-johan+linaro@kernel.org>
 <20230526091646.17318-2-johan+linaro@kernel.org>
 <a5891478-bf4a-8389-e1c9-00244c5b406e@linaro.org>
 <ZHB7Gy7RMGa41KI9@hovoldconsulting.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZHB7Gy7RMGa41KI9@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26.05.2023 11:25, Johan Hovold wrote:
> On Fri, May 26, 2023 at 11:22:27AM +0200, Konrad Dybcio wrote:
>> On 26.05.2023 11:16, Johan Hovold wrote:
>>> Add the missing module device table alias to that the driver can be
>>> autoloaded when built as a module.
>>>
>>> Fixes: 6b149f3310a4 ("mfd: pm8008: Add driver for QCOM PM8008 PMIC")
>>> Cc: stable@vger.kernel.org      # 5.14
> 
>> Looks like the commit referenced in Fixes is from 5.13-rc1, perhaps
>> 5.13 would be more fitting here?
> 
> No, I just double checked. This driver was not present 5.13.
Odd, I see the same thing.

Anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Johan
