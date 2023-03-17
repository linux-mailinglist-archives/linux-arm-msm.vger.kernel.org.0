Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 952E06BEFCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 18:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjCQRhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 13:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjCQRhi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 13:37:38 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70983C1BF7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 10:37:21 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id h9so5920902ljq.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 10:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679074639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTPkw06mclz1qDKURG8hZknAWGe9n19Feii2ENMQnOQ=;
        b=LLh7zF+Yta/6S1YIBhazjDn1OxMJYWjTnMEdMZGz96mwtdtpHXh0ws+zfXwdqJOJNM
         ZP797GvnlnAZdxJXWf2zpkWTeSxjm6cXXO+JTExArHFDUQjVQ7ALgJJfhBx98v8anUqr
         PpYuaWApgB8sawqS1Zv4evr+69rvQ/dDwemiyYVAGAVeJQqjaxsGhZ8VV++jiu7XxzT/
         tD4rjLH6FyrJJvcPDf8/fMqbrhiMNB2VeIb/7trg8/gX1QQzzmvRT1jhTXLQ8mMNIz+8
         O4dyza+hEC/HoWUmazA3djbZeGe8GEjT0fBUr+ZiGy10OzCx5SQwoPcZzcafwK4358RU
         7GOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679074639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTPkw06mclz1qDKURG8hZknAWGe9n19Feii2ENMQnOQ=;
        b=bTiTfM+rN2zwyvDirz/X8h3bNDghDKDX85VYTlRk6SeAtGtgBAxLiZ9SGjLrxGGQZM
         1D8h1PbK6ZoKx6BAn+FeQSgfVJcc8faw087XVceSFm3d2qAXolnJLoi2EY6AMF5Aj2Br
         xkkcL8cX+KK3RJa/jlB3JamytSr+1pxg3TO46sfgqUYYlfAab86JZQhuKWMDV29+nGZe
         SAfEFQF6CIMFkETJ+nGmUAD0cuWqMWX9g37PeMdx2JdNzYPG0bInZaoSL1EVlj5YKJPD
         MFvjwr5/qlEw++v/BSIF7gwVduaAom/p+mFT2gHOSITWbGSazoxZALEEYWSZhAHJ2pnc
         Rk+g==
X-Gm-Message-State: AO0yUKW0+qS/TIecFYoI/XzmN5EUq5suyAlGtkXe8/GQsiUKCA1MLKzv
        CcqYLppO+f9U5tM4mQxYKXP8HA==
X-Google-Smtp-Source: AK7set9Yk/gSyIC5R3b34gUS8lBFWmGcYzdoH7jpUXJuvzCEU+jk56wZCu3B/z7xqx9xyRaNMlWwUQ==
X-Received: by 2002:a05:651c:54e:b0:293:5cce:56eb with SMTP id q14-20020a05651c054e00b002935cce56ebmr4575084ljp.43.1679074639630;
        Fri, 17 Mar 2023 10:37:19 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id y1-20020a2eb001000000b002986854f27dsm510277ljk.23.2023.03.17.10.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 10:37:19 -0700 (PDT)
Message-ID: <2fd76707-9cf5-dbac-3514-89395a4225c2@linaro.org>
Date:   Fri, 17 Mar 2023 18:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/6] thermal: qcom: tsens-v0_1: Fix mdm9607 slope
 values
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230315103950.2679317-1-stephan.gerhold@kernkonzept.com>
 <20230315103950.2679317-3-stephan.gerhold@kernkonzept.com>
 <ad64143c-13c0-63e3-561a-620c44f26b9d@linaro.org>
 <ZBSCN0f8yC/nkGll@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZBSCN0f8yC/nkGll@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.03.2023 16:07, Stephan Gerhold wrote:
> On Fri, Mar 17, 2023 at 01:39:25AM +0100, Konrad Dybcio wrote:
>> On 15.03.2023 11:39, Stephan Gerhold wrote:
>>> According to the msm-3.18 vendor kernel from Qualcomm [1], mdm9607 uses
>>> a non-standard slope value of 3000 (instead of 3200) for all sensors.
>>> Fill it properly similar to the 8939 code added recently.
>>>
>>> [1]: https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LE.UM.4.3.2.r1-04200-9x07/arch/arm/boot/dts/qcom/mdm9607.dtsi#L875
>>>
>> FWIW there's a 4.9 release for 9607
>>
>> https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LE.UM.2.3.6.c5-03900-9x07/arch/arm/boot/dts/qcom/mdm9607.dtsi
> 
> You seem to have linked 3.18 too?
> 
> I don't see tsens support for mdm9607 in msm-4.9, although maybe I'm
> looking at the wrong branch. :D
Yeah wrong link

and wrong kernel, it's actually 4.14

https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/637e99f66c270385149d1f0041758c24c4f84aaf/arch/arm64/boot/dts/qcom/mdm9607.dtsi

Konrad
> 
> Thanks,
> Stephan
