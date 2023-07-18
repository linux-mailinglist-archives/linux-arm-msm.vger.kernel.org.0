Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB55275781B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 11:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbjGRJdE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 05:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232347AbjGRJc4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 05:32:56 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F6E1B9
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 02:32:55 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-992b66e5affso757591166b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689672774; x=1692264774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pd3yVm0mrfKcfVl5M0ryz3v5rdf1EEHWpSBcZtymdlU=;
        b=AW5DrcxtcrGGsHRQnTVQ8hX5fm0zVqO5DxuuSbzImI7RXL/vFginrgq2VlWLoPk1wL
         4RhuvOEGMWxi9JzSmngtc378xIpK3FEtWIFnb19Ts/joDsqmVakKpdOgUyPEakkzEF0h
         ly904FDl3r82RbcFyKIrMxAfde5y+HHh2yJ7dl1O8deQReT/RlmkEFiTaRFh5ze+4KD8
         GnJEl4ny6ZyR69H4Sgy60nUlvVFS7Y55OSlA641H3OE+ovVfrDn33voMG6b+cwhQXNIm
         A+3Uz1drvecJ3ylfwgqhLZv+BAyFWSADiQlsw+qRW04OLNpeE8c38diAQAfUtjxnVpw0
         sSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689672774; x=1692264774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd3yVm0mrfKcfVl5M0ryz3v5rdf1EEHWpSBcZtymdlU=;
        b=PoCoc/dX3etN9qXU9m1C+hyeF0m032tSoLdRazIuKOI3RkFyj8pn4VmV3X8jdYFwAv
         Vp9vqALmft7rqwoNh1UwnFgN/4N4y3YodjIjyUj36O0TukcjlxH0PmU53PuReqaG/Wgj
         y39bLabIbGSC9dqjYlNKDN1t7Wrdj0t5R0uZ4wHI5cMlVYg9nAmQDTVcP3MX1tL19nVN
         6V/ZVm+bAZmyg0/a/ofgadDZUOCuAW7efTrU/o1C0D+I6Gurd9Xgy59Qt0NLz1VgwxLC
         4Nx9P+84aGruEO4fkgIWuAmxZv4Xyr46gBGzfOdpOQWirNOpVAAnaXADs64lu5LZ3TRk
         7qyA==
X-Gm-Message-State: ABy/qLa5hy95KJzQQ1PiFKJwANHd1mWffF2opouMjrYXxMHnkwpB/15J
        Hu5vouYPOe4ViXcndyqHR61CCQ==
X-Google-Smtp-Source: APBJJlEABRDq9Db2/fxCOqE/nE3zSjxPwvBI9OkjSAHrygRFjCnMt9tZLOcDggl6TYbuPB4VQWrG+g==
X-Received: by 2002:a17:906:10ca:b0:994:3395:942f with SMTP id v10-20020a17090610ca00b009943395942fmr12348530ejv.17.1689672773934;
        Tue, 18 Jul 2023 02:32:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id ko1-20020a170907986100b00992e14af9c3sm772954ejc.143.2023.07.18.02.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 02:32:53 -0700 (PDT)
Message-ID: <d246292b-c0df-fa70-7561-9523e4db6138@linaro.org>
Date:   Tue, 18 Jul 2023 11:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] led: flash: various minor fixes for leds-qcom-flash
 driver
Content-Language: en-US
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lee@kernel.org, pavel@ucw.cz, ChiaEn Wu <chiaen_wu@richtek.com>,
        Alice Chen <alice_chen@richtek.com>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Dylan Van Assche <me@dylanvanassche.be>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Tom Rix <trix@redhat.com>, linux-leds@vger.kernel.org
Cc:     quic_collinsd@quicinc.com, quic_subbaram@quicinc.com
References: <20230718092439.2482320-1-quic_fenglinw@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718092439.2482320-1-quic_fenglinw@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/07/2023 11:24, Fenglin Wu wrote:
> Update the driver to address following minor issues:
>  - Add a sentence in Kconfig to explain the driver can be compiled
>    as a module
>  - strobe off the LED channel before setting flash current to prevent
>    the flash LED being lit with an incorrect brightness if it was
>    already active in torch mode
>  - put the child node if register any flash LED device failed.

Don't mix different fixes and changes in one commit.

Also, please use scripts/get_maintainers.pl to get a list of necessary
people and lists to CC (and consider --no-git-fallback argument). I
really do not see a point why I am cc-ed here.

Best regards,
Krzysztof

