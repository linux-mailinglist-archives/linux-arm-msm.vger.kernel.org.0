Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38BE37A3286
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Sep 2023 22:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbjIPUkI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Sep 2023 16:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239523AbjIPUkE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Sep 2023 16:40:04 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA2BCF1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Sep 2023 13:39:57 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9ad8a822508so396476266b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Sep 2023 13:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694896796; x=1695501596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lR5T6ibwSrvheSebyD3OBI+eNynqOjBxcgSy01mbWmU=;
        b=RANesbT4XnnLodCcUhyl9ouw15NrfbkPBrqtdTe0bBXcYXGlN4SdWvuxDmYb/2ac6p
         s+hxa2G/IXyCzsrGnfnIMFvsl9aslJQi5nDyAGODhSi+25BZHmZ3v3uqnyOFgE+Je+PY
         sU1Yv5W9zoIC1zoqd4JTC0DiWt8U7odsjwDHzrK4AT6OAc6CfEdBZrcPT5K/vQfk1Qq0
         0nw7bxq/Yy+ffIKu5BBVXNJM+wSOClPzmvL2uVGlKawzwM+BjpH9ZFzmbtavA1qivjoy
         Kl/3AP3uKk3nQti0ICAmuUjscz4Sws7ILQEX6le9Km4Yk++mV1jWGdWNzYVUWa0JjNHv
         CsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694896796; x=1695501596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lR5T6ibwSrvheSebyD3OBI+eNynqOjBxcgSy01mbWmU=;
        b=KCTlADGRIoRcJu+S92LeTIRXBYf4wwV1a7gMtRmybJo2YhoBO+ffUFq9VcA7sD7i9M
         exgbBwj4GKWWZ/rMN3879ZZCw+uTzw7gK9cqrIKU+KQjgtai5l2e7yxi79Z/evoGoXHL
         CdpzvbnxPJo26HgLXwUGBwpjMc36vtxMtcuW55OAHHw/Jk9s7LUWvO32ONUfW33fpiYg
         QAj48M30a+txe+PtSI+qWEK+ZYv0Iio1uyIs6mxWSzO5v8lOnIsaU6+Gn5dgRkGWrqv5
         71wX8GEHTi1XRwksoqce4S3SwMvSXrS7kKa4cC0gTHaMHmdu1fGFOQZkQRwvxlRlDEKy
         hKOw==
X-Gm-Message-State: AOJu0YwAJBrXuDuNg8hnsE1naxxJrg7wZahwXop+w0JZUuZfNPpccMN7
        mTgoxGQRmPoG7kd3fmDGMn4OWg==
X-Google-Smtp-Source: AGHT+IG0agA43aj2FABBUW8LcSlXyrYgJOmlotEOtAspWlPfaHsL2EVQAPzuRlrdQpY6P2iyOjGKUQ==
X-Received: by 2002:a17:906:73cb:b0:9a9:f3df:80cd with SMTP id n11-20020a17090673cb00b009a9f3df80cdmr4420148ejl.72.1694896795733;
        Sat, 16 Sep 2023 13:39:55 -0700 (PDT)
Received: from [192.168.1.77] (150-140-187-31.ftth.glasoperator.nl. [31.187.140.150])
        by smtp.gmail.com with ESMTPSA id bj26-20020a170906b05a00b00997e99a662bsm4058272ejb.20.2023.09.16.13.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 13:39:55 -0700 (PDT)
Message-ID: <bd833cee-2349-368d-93a4-9465ebc8a0e9@linaro.org>
Date:   Sat, 16 Sep 2023 22:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-huawei-kiwi: Add initial
 device tree
Content-Language: en-US
To:     Lukas Walter <lukas.walter@aceart.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Raymond Hackley <raymondhackley@protonmail.com>
References: <20230916134147.163764-1-lukas.walter@aceart.de>
 <20230916134147.163764-2-lukas.walter@aceart.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230916134147.163764-2-lukas.walter@aceart.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/09/2023 15:41, Lukas Walter wrote:
> This dts adds support for Huawei Honor 5X / GR5 (2016) smartphone
> released in 2015.
> 
> Add device tree with initial support for:
> 
> - GPIO keys
> - Hall sensor
> - SDHCI (internal and external storage)
> - WCNSS (BT/WIFI)
> - Sensors (accelerometer, proximity and gyroscope)
> - Vibrator
> - Touchscreen
> 
> Signed-off-by: Lukas Walter <lukas.walter@aceart.de>
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>

Order of SoB is unusual. Who did what here?

Best regards,
Krzysztof

