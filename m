Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D81DA68D267
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 10:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjBGJR3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 04:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbjBGJR0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 04:17:26 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83396298CB
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 01:17:23 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id n13so10529416wmr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 01:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cxgNacSbWKAoLPJGvCUOev++so7sWmiz/ADYtyXJHhM=;
        b=q4QX9wvAso2SladkGFfXBFtH+tFjhCCjxuqsenbRr+tqB3FgMdePtUisENN32dhL8t
         j4NAjdsKwm7A0bCfiznDnQH85XvsC4t2+NdNK7k7zulDvb1HUx6YPDfT0whOZ/uV4A4q
         jT+OExMxDpMDl3JIxNIC4nN+WwJLt/qraOcwmCNJzdMXiL7grKe55VRQ2u0tJCZz+RCX
         SwjA7Yy4HpOn6a2SUEPYHujzYYlva/cvpG/45V80tA7oZ+UgCaTmPFa70tObz7Kj9x7l
         cc4+rE1I1U2z7PIW+TVCMh/8VQ+WVX0cEL596epDjB7/MGzWvfiYg1+U3ghHPjhCQEUl
         Sibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxgNacSbWKAoLPJGvCUOev++so7sWmiz/ADYtyXJHhM=;
        b=Aax0LPWTQpn3EmihP7ape2mIfy1ueDgBGfzOQH+DYoz6ICcN1RibnSLp55vJBY26DQ
         JqHRxiN5RfRP7gqp7j/IfLxxroRA116jXi8CggcNyiW8WXa/DKl1z/1VHCt7He0S26ic
         HI7MEWVNBAKYVhzwZwa5wkGVFeLniCQKT29rjhFN3s9AHBH1QSCqJunKPLc6l25Zto37
         vlbk2BD+/qvJ6WM6zGisnGRkbCDaGb4EONJrP9Si70xM4zeeIIRIuPDbLBVVnPSUCssv
         ShONH7TLcyK9RP3AcpRKPpFnnOKKLl6qYAXt8QrOHRHpS0+GeBY9h1LozlRxPO1eYu6b
         CltA==
X-Gm-Message-State: AO0yUKUYBAXLRSoIS4urYB1ZlcicvmZoLC6YlshG2f4r4EzIoGKBTGQU
        jtrVK3IlKXalFDR6OU5MgrQHAQ==
X-Google-Smtp-Source: AK7set/HJGlRQUymSmGMyLm8oSXzb9N2ZeMGj70/h6aS3O4Kp0jDqc2sHmTH4FuaURFaLKgmDKAO6Q==
X-Received: by 2002:a05:600c:490a:b0:3d3:4007:9c88 with SMTP id f10-20020a05600c490a00b003d340079c88mr3092839wmp.18.1675761442076;
        Tue, 07 Feb 2023 01:17:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f1-20020a1cc901000000b003df14531724sm17869217wmb.21.2023.02.07.01.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 01:17:21 -0800 (PST)
Message-ID: <7e600ba9-a99e-5f07-334f-bb872f5ed7db@linaro.org>
Date:   Tue, 7 Feb 2023 10:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/7] dt-bindings: watchdog: qcom-wdt: require fallback
 for IPQ4019
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20230113103346.29381-1-krzysztof.kozlowski@linaro.org>
 <20230113103346.29381-2-krzysztof.kozlowski@linaro.org>
 <20230113140230.GA1606649@roeck-us.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113140230.GA1606649@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2023 15:02, Guenter Roeck wrote:
> On Fri, Jan 13, 2023 at 11:33:40AM +0100, Krzysztof Kozlowski wrote:
>> The device specific compatibles ("qcom,kpss-wdt-ipq4019") should be
>> follwed by fallback "qcom,kpss-wdt", which is actually used by Linux
>> driver for binding.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

The patchset was acked and reviewed, so are there any other comments?
Guenter/Will - are you planning to pick it up?

Best regards,
Krzysztof

