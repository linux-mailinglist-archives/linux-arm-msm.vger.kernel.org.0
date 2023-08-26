Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D91978968A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 14:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbjHZMJq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 08:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232831AbjHZMJo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 08:09:44 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A992108
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 05:09:41 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b974031aeaso26752181fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 05:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693051780; x=1693656580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUle7HwdN7QMhCOnuFTRQWCdkxNfmQQVHGtr/Mhk/FE=;
        b=QwsRgU3vhB9Peewr9EtnSdptlNGkHomrYI9FXtjf4HICaNj5sOYWyPs8p1Iean7lWt
         vltm0zkwnY1dXN+L6oOLgRw2w3rFN02pxacunGHNoOziRmsNjuBFOGvb8AHjCkj521J0
         z6kBT/WpRMzEgG0TEQ994hQiN8CoYvvaoRfjBdOctfsnbj0+Qc2Et6VHFVBB4k4Ne0QK
         MF9HUu86BSJClH36pRFJL8RptgnVbhsxwcBteKXkf37O35NhqJZlmruvEeQG6wOr3O+E
         aBv40fS1mWhfBsjHQxnVelpGfQs5b/5qwtdRItcSG2gTf83ImO0h8jQTpumJK5yHnEE+
         XFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693051780; x=1693656580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUle7HwdN7QMhCOnuFTRQWCdkxNfmQQVHGtr/Mhk/FE=;
        b=BmWuj6JZn0D4gtduRitWLkSWEWTvUReugBQuH61OqZ2koTmqVVXf5y7py/bNVFuvyo
         GJ2egdrCkrfbueLfixT/kvFxNaaksX1YZTa7jM5sagDdsKi8KhfJe4gBuB23MZhpyrjF
         txtgxDLTtEeJV2jWRnkt44hBDcQhFaDZi0JgihLViJ8XeXgJqieSCL36R2YpuPiz8frO
         mPXsnpqXODBaVYgI9IX3VWC04U0fSOp8V2fLyHgG1xgrjaRrunAJnFYcpgzNXsZtkafT
         TN4hZ0qvbs4bRJSYTA4XIO/lC5IpZZ4o3rS0Ac6pJRJ2uGTEXjMeps6dqh0il8yGIbCT
         2LZQ==
X-Gm-Message-State: AOJu0YxbiZD/xMK86wS+/nIOLJeSFOqBBWBNd59Js8fZ7T+WTMszswvV
        jUwXtl9/1NexmnniEpYs35k0ug==
X-Google-Smtp-Source: AGHT+IHNV+bDhV+fi/XpXaxmI9nsDqGzhh/Y0LGJA+Q03Q7Hc0Lt9jE38iwQC0mYLvY6aHPLi2AYtQ==
X-Received: by 2002:a2e:9c99:0:b0:2bc:dd6b:9220 with SMTP id x25-20020a2e9c99000000b002bcdd6b9220mr7938003lji.24.1693051779778;
        Sat, 26 Aug 2023 05:09:39 -0700 (PDT)
Received: from [192.168.1.101] (abyl74.neoplus.adsl.tpnet.pl. [83.9.31.74])
        by smtp.gmail.com with ESMTPSA id a8-20020a2e88c8000000b002b9f0b25ff6sm776135ljk.4.2023.08.26.05.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 05:09:39 -0700 (PDT)
Message-ID: <fb452457-6687-4f68-9498-92a3077c9a44@linaro.org>
Date:   Sat, 26 Aug 2023 14:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916/39-samsung-a2015: Add flash LED
Content-Language: en-US
To:     Raymond Hackley <raymondhackley@protonmail.com>
Cc:     agross@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        nikita@trvn.ru, robh+dt@kernel.org, stephan@gerhold.net,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230822140407.3316-1-raymondhackley@protonmail.com>
 <c016d9ac-da33-4a0b-8684-ab7b4b50ebe3@linaro.org>
 <20230822150035.3803-1-raymondhackley@protonmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230822150035.3803-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22.08.2023 17:01, Raymond Hackley wrote:
> Hi Konrad,
> 
>> What about the other subdevices registered with the RT5033 MFD?
> 
> Currently the MFD is not able to control the flash LED, due to missing
> driver for it.
> Alternatively we control it with GPIO pins. With driver leds-sgm3140, the
> binding is not under the RT5033 MFD.
Hm.. I have mixed feelings..

Does the led controlled onboard this chip have some super complex
functionality that is going to be exposed through a specific driver
and that is not exposed through the sgm3140 driver?

Konrad
