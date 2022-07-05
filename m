Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B9D567393
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 17:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiGEPzV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 11:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbiGEPzS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 11:55:18 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2689BCED
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 08:55:17 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j21so21354590lfe.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jGJB1YsgZctBf3FrtbK+9SX6QzCOA77MpJH1Oeer0Hk=;
        b=ec37u0hO8yXaGrSBqn1FsCWv5cskb+zfx52OL/Gef1NLfc9cwYqlJbhO8GevcVNhHC
         GEEvn4ZTuRUOCGpEYCXwKWuhvAEg38suZg/kggjV2CNffhIjwbmofjRiyUk3Wa73KrGY
         HXxN/1G0KFsvHXjRS1WGeXtFjYegiOXzYxzPpJlEVBl2vNWZDT/xnW30G3+Vkk6Gk01x
         FVGo1uIw1ZZ45aqWGlW1PdyYDKOVSLl/ojNIy8FMAzLvR5jIFd4UQVKJ0ql5AWXmH6AG
         Oq63372Rsukxx5JdCQvqw6iiAN9jA+xD5lKyaMuo+c4Md79Yn5sufrCHGU8mB1QvSVFp
         WBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jGJB1YsgZctBf3FrtbK+9SX6QzCOA77MpJH1Oeer0Hk=;
        b=o63C6gPVTaU8uA8cZ2HtJiceKgKCkBBNLYZtXyGEGxKELoOKRxFf51iKyVKdgY8W2f
         rJ1+AUaaDylVO4IkROe5xn27AmbbeMypLi+56ejwDr9Kk/WRtmWBx7n4T0CdFiLD3NB0
         4KJhkPzfB+Xc6Y9U3EntMYprv/A9V/tn5Y32HeHEQ1stXX5SBbh+RrH6kWKP93Bu3O0S
         scOtbDAHT7s9HIdafrScgV6eRtCnYi2qTreWS5IrEHZrSgJEaFYTItgknek8rg9dy3Yr
         Icth8NneShTTxWzePX0p40gEnHwVO2XoYfDpCD1Yy4aysExCK8E1lmEyBRmJcyVspgE4
         0nhA==
X-Gm-Message-State: AJIora+V8FA/LvfnHtPLREmMxfg3mhvAfS/wRlOslLcq+hLnZEbDT77D
        z4MdXXyoxaHFfqUGSM7dRQwndbgldceN+Q==
X-Google-Smtp-Source: AGRyM1seRurvdSHhFwj77zvAc1mw9Uk0rAAe6ziAgG5H8mpvklgg3S57vH5SfkUCu2rlPPV3WF4w8A==
X-Received: by 2002:a05:6512:33d4:b0:481:63:69e8 with SMTP id d20-20020a05651233d400b00481006369e8mr22198970lfg.415.1657036515533;
        Tue, 05 Jul 2022 08:55:15 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id c23-20020a056512325700b0047f70a0b8ffsm5757630lfr.20.2022.07.05.08.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 08:55:14 -0700 (PDT)
Message-ID: <5625666e-a777-c4e6-ad91-5c27ebe3f3b5@linaro.org>
Date:   Tue, 5 Jul 2022 17:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/13] Add ipq806x missing bindings
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220705133917.8405-1-ansuelsmth@gmail.com>
 <e84bb14b-a3a5-728d-e3a4-9d2e898a7aca@linaro.org>
 <62c44b32.1c69fb81.c87b7.72ac@mx.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <62c44b32.1c69fb81.c87b7.72ac@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 16:04, Christian Marangi wrote:
> On Tue, Jul 05, 2022 at 04:28:47PM +0200, Krzysztof Kozlowski wrote:
>> On 05/07/2022 15:39, Christian Marangi wrote:
>>> This series try to add some of the missing bindings for ipq806x.
>>>
>>> This still lacks of the cpu bindings and all the bindings required
>>> to scale cpu clk or L2. These will come later as the driver and
>>> documentation require some changes.
>>>
>>> So for now we try to add bindings that can directly applied without
>>> making changes to any drivers.
>>
>> You mention here and in subject bindings, but your patchset does not
>> have any bindings.
>>
> 
> What would be correct word? Node? Compatible?

"device node" or just "node"

Best regards,
Krzysztof
