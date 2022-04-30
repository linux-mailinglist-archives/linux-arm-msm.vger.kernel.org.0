Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F36515C6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 13:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbiD3Llj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 07:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiD3Llh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 07:41:37 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B192C10B
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 04:38:16 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id a21so11760540edb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 04:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KRYhM2rH5zK3jCSlpwvDvduhHoJfrdE1g2Q5vdC1OLc=;
        b=FGvLGshcelcrOnf7weKDl4hcCuJuvNb9XV88W55aKWtWMIqB/ZaWemQoOuNbHnjmSZ
         8wC0bvp2wOU4/bbtBV7QifUsZHEMgjDJZ3bZ9dalR0DFR7+ALq57vM+YR0EFdVACl8vp
         9eQ4nzSMVw2hMDOwCsNCppyCnrNICuAIvIWX5PmYh0uQrfxPy4fJvS/19Rlv2gumzpVx
         mQehrWGe5ZMEZXU68/pxGYMpg/n77RAv2laX2UZsDpWfmewJYT7iEX11nPzYQ9rtEmCG
         iZPxBPQq+cYIpm+40yy8aA5cgv4iJxdyxbpyWGnFUQzKn3nl/Yxui0WGqi5S1V0xD5qK
         WprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KRYhM2rH5zK3jCSlpwvDvduhHoJfrdE1g2Q5vdC1OLc=;
        b=J3HUcT+R0r8ZvoBxTrKe+elNq1kCyPuRrY+WNVhmX3F0dxSgUA8KA6jGrqkXU8IvCG
         4cbwV0Jy+D4N48bd236sOLun/1KcOEAX9kzPWk+KQ3cb//+kXlyh7pjExHW8oiJ8Yu1N
         3g5VNW4//3Z2jiLLjNCHdABhcGaFs2pWJD6Lz7gPBGHubEAYHLDETxEAhHbccOlguAsZ
         JMZhhOz5vIDQIliukC0SdWMrI8cMMvAGpqDdkonenFfGlOsxSMS4mvZJHrrPUETzWKFI
         de2ts6/l7kb5I/OLz3EI1Z/8fTAZ8zC1FRB0/cwybZVdCTjHAZtjjLVK7FKbgtqLxWXX
         4DzA==
X-Gm-Message-State: AOAM532b3TZS5hYJhzYcdhYVwWtU/xQj6WBr18fjbkoFLQFhi8G8dXFX
        sb4lZ9Nnsns+TbI2oNfbDjTuIA==
X-Google-Smtp-Source: ABdhPJyclT1vcvVX+IL3ABxlppUHvHUohv4aQd3hoyNcOyeQmiYcJEx/AHtRLM0vx5DamGHZWhAmWA==
X-Received: by 2002:a05:6402:3695:b0:427:b16e:e1b4 with SMTP id ej21-20020a056402369500b00427b16ee1b4mr754032edb.117.1651318694674;
        Sat, 30 Apr 2022 04:38:14 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zp1-20020a17090684e100b006f3ef214defsm1527602ejb.85.2022.04.30.04.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Apr 2022 04:38:14 -0700 (PDT)
Message-ID: <bc8c9453-d82f-c3be-184a-355579d3c64b@linaro.org>
Date:   Sat, 30 Apr 2022 13:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/6] clk: qcom: Add DT bindings for IPQ8074 APSS clock
 controller
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220429114330.59026-1-robimarko@gmail.com>
 <20220429114330.59026-2-robimarko@gmail.com>
 <1b545fbb-eaca-fb98-f77a-15326a7a2e4e@linaro.org>
 <CAOX2RU4KiKxCSMGDu+=FZqkdRia0MSBcz-eMn0kGpJ5ABxdkSg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAOX2RU4KiKxCSMGDu+=FZqkdRia0MSBcz-eMn0kGpJ5ABxdkSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/04/2022 23:56, Robert Marko wrote:
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>
>> This should be licensed the same as bindings, so GPL|BSD, unless it's a
>> derivative of some other work?
> 
> It's derivated from IPQ6018 PLL bindings which are marked GPL-2.0 so I
> decided to keep that.

OK

Best regards,
Krzysztof
