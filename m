Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2655AC62D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Sep 2022 21:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbiIDTc6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Sep 2022 15:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234971AbiIDTc5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Sep 2022 15:32:57 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9371F2F015
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Sep 2022 12:32:55 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id p18so7288306ljc.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Sep 2022 12:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=v94704O0TujNsYv17nMnBtu+OH84/eWQsf7ETYu5jHU=;
        b=raPVkER/pA/imnNF3kT8eAcWerRaKCjrqBh/wET6ENZryx2c7P8UT3SIFG8eB/Qlq0
         tE/YDV+OC6gtDr5gXzoGgkMLmAbYi6Qh4HclWcsAZ06fe1mpQwlQLrlOEiI1qQ9Dyy0H
         3GYilxmuI4B4dkhfvCffFepqRjpB0jvtGAq9qnbKgpeV/M21yrwAqADL7HO9zkmnnxnm
         xNfpjh/E0ooeAQJWMS0K7sZbigbdYL0hWMkZoRqOTqjU+bUXWIMUCtNocmCRcW+VXF+y
         gNCsQ381EOG6ADOir1Pwr7PkgAKuK7G1iKTHWeyOT1qTcgNJaMHVMNyC+WQkqPWIi2O7
         XQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=v94704O0TujNsYv17nMnBtu+OH84/eWQsf7ETYu5jHU=;
        b=J6GSVvz/52j1TTF7znkl/ex+fJuGbOTWdRwcPprKJbWpbZG5Cwe1uW/045LS+X/RTq
         93lyCR17tOaMPCMJ52WksI6EWs2JbgshKRLwvyVI5Xh3WY/HEPVZlWlFoneAoIzMY5Nj
         WmbfQHiHkvoR4W0foupLWowkenIgbsVxWnJjWFhWqMQQksXylj5CrrD4iuWuK1mZmNJf
         Ji7CjoyoDBuosH/usfnzQjx2K2n7ELc/JFNAa/3gXJdxVNCJJf8MTFZMYtv6c8lVdpO0
         swut+oVzzLvXtI0unr7iu72fAxj6+1DnHtdftGIsmPeuGrzFR7HlIZR+a0awdnNEbaQZ
         aWpw==
X-Gm-Message-State: ACgBeo265waoFJyRblFaTXycHZ0OeC5EqmAGHEoQ8NhQCui9SeayKQsE
        2kK/dbRz5nDdZvg0jZQ9Rcx0zg==
X-Google-Smtp-Source: AA6agR5REWTNOc8xN6hgbVoCILU5d1wRngjWNHHWSEPfiwS7FtzGVXNiGV9cwF3kbGOmN7JE7NzJSg==
X-Received: by 2002:a2e:7207:0:b0:269:1f9:6365 with SMTP id n7-20020a2e7207000000b0026901f96365mr2851875ljc.201.1662319974001;
        Sun, 04 Sep 2022 12:32:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x12-20020ac259cc000000b0049497a2b288sm996454lfn.58.2022.09.04.12.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Sep 2022 12:32:53 -0700 (PDT)
Message-ID: <3ff2773d-92e0-d52d-4350-d63a40a70f07@linaro.org>
Date:   Sun, 4 Sep 2022 22:32:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RESEND PATCH] arm64: defconfig: enable newer Qualcomm SoC sound
 drivers
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm@kernel.org, soc@kernel.org, Olof Johansson <olof@lixom.net>
References: <20220831141218.516100-1-krzysztof.kozlowski@linaro.org>
 <81ed8e35-fa70-4b0e-9601-131c9d0c46d4@www.fastmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <81ed8e35-fa70-4b0e-9601-131c9d0c46d4@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/09/2022 12:34, Arnd Bergmann wrote:
> On Wed, Aug 31, 2022, at 4:12 PM, Krzysztof Kozlowski wrote:
>> Enable sound support (machine drivers) for Qualcomm SC7180 and SC7280
>> SoCs.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>
>> Resending because I missed ARM SoC maintainers and Bjorn.
> 
> No objections to the patch, but I'm unsure what I'm supposed to
> do with it. Is this for Bjorn or me to pick up? 

It seems usually Bjorn picks his parts of defconfig changes, so I guess
this can go indeed via Bjorn.

> Do we need it
> as a 6.0 fix or should this wait for 6.1?

Can wait for v6.1.


Best regards,
Krzysztof
