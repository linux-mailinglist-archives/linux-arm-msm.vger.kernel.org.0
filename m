Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCA4250E91F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 21:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244844AbiDYTHu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 15:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241907AbiDYTHr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 15:07:47 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4F112C6B0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 12:04:42 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id be20so11262221edb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dkJK/bIXn+MjYWm2XRzMDddvE/wybEFyuqEkS+yBujQ=;
        b=w2hlctq3j0qr6JmyRLhuyLCwiyKXnEGlMGtrwDINRO5qUUg7AP3r/DE+QY8iz+289K
         9UnbpwX6BVc3ryyYMIK9dlsTjGrfHX0OnuJfe3w2Dwxk+MZLH3YlomnC76yxuiHIT82n
         7cNw7m1Jc0osEfCPcsjUYmsqv9OZ5dtkoA3Fk8aUyJHf2sw30WeBRVJR/ADQ+wSu65py
         TqR0/yydhPPvNuoxOYJSOXwD1irZR4r7s8SrysTYxthYTxi9zs9N4eh4SUszu2aGGSgm
         AW7mneB8qxrK92xEO4RpB/svfdOF7ag8G/dsMF9Qh8z4+0YVfv7WgquuTplHgCM/Hyq1
         kJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dkJK/bIXn+MjYWm2XRzMDddvE/wybEFyuqEkS+yBujQ=;
        b=2MXpH6Ybe8hlCHUhHmGMYFcGktyN3/kaKNo+/KliSoq5iDJOsTQ2IXjlRDsiJCGHog
         3vDyScCJr03AhN4SEiG0LTtrPZHVy8PJfs2Wu9kQySbS+LGmZaoMATQPOPjnBbq40/Fu
         Kpe1j7z7Emn0lbismsnwu2kiEu3zy8ZFPV8hqlqlQigPsJAiYjGwAh1yJU/o2Ms3tRGv
         /XOm95j7TsZ3+lyBMtmXW5wctDBXckIL7RiOvHxKwwfPV/KaLoD6DDJ9s21B9QQIvA4U
         wkb0FbZnn5kmFTLu8ZPt9BeyB59I0nIqmkFvd5I/ZvnwBBpR8FD0uHBrM2RgLtUeUhyr
         OIgQ==
X-Gm-Message-State: AOAM530GrJ977YIbTr6hvgzffWpx8AUR1GohMVJ1kdKjEHKT9bksoCeN
        D/w/oIvuh2SEDe1e3RohyqQhog==
X-Google-Smtp-Source: ABdhPJx9ZZG4M6AYqL/6gLcP9gmx1DMtXiCtvOZldKX8Fm4IY4JLn4h8Lxwf+bdbC7O3xNQVDZZitA==
X-Received: by 2002:a50:9f06:0:b0:425:c1ba:5037 with SMTP id b6-20020a509f06000000b00425c1ba5037mr17765566edf.285.1650913478943;
        Mon, 25 Apr 2022 12:04:38 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z14-20020a170906944e00b006f38c33b6e3sm1894061ejx.68.2022.04.25.12.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 12:04:37 -0700 (PDT)
Message-ID: <377a84e8-504f-7716-937a-4c97d8a04a2a@linaro.org>
Date:   Mon, 25 Apr 2022 21:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] clk: qcom: gcc-msm8976: Set floor ops for SDCC
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220425185140.15154-1-a39.skl@gmail.com>
 <20220425185140.15154-2-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425185140.15154-2-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thank you for your patch. There is something to discuss/improve.

On 25/04/2022 20:51, Adam Skladowski wrote:
> Just like in case of other SoCs change SDCC1/SDCC2 ops to floor to avoid overclocking controller.
> This commit only sets SDCC1/SDCC2 which are used for EMMC/SDCARD.
> It leaves SDCC3 because on this platform it's mostly used for WIFI/BT chips like on Sony Loire family devices.

You need to wrap your commit msg.

https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586


Best regards,
Krzysztof
