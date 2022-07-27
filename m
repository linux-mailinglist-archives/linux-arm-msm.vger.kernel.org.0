Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3104358207E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 08:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiG0GwN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 02:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiG0GwF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 02:52:05 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41D010CC
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 23:52:02 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t1so25741916lft.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 23:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GT9LN0318tRK8V+lMJWQAJaAZNlEVObvqSXexfzllV4=;
        b=UmlTDtfeW3VDKjFHvkuOpaDYmOnM6rh+nohyv8VnauNAQNgBb68dKFZxIr6xcEDAmw
         8J57ifslgRYhVaJqQf7b6XURFC4sHbEg8HHfrhThzEx3l5aDZb+Dvp0EHfNP9IDvII4j
         4JSY7zqhjtJkNf1r+7Hu17Nk4RseiaijdrCPEL5BWrYQ8qxxTPO6NPgkSieS2HA678Cs
         n9D/57IUgTJ+gVR2R5HSr6I3ENWWq/Cwo85J65F1UDaSLOzDinpAgmn0GAPOExQZP0mL
         U9T2T61YB1hIty63Q1J9pG9a0V+72WzcZ0uUYijRg8fDIVFH6cRX1SC1eZYw3t/vLqwN
         91Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GT9LN0318tRK8V+lMJWQAJaAZNlEVObvqSXexfzllV4=;
        b=m07A11rBs7pBSR0JUddQ2L06BZAwCtIyaBxGaA7WVeeCX5h2dAhC9ABB+d91wifoNw
         1tBGTNg8wnlcSDITda1FTugSfNquV+8CNdW2/DIVYnF0sbfWYOaHCJrDJjLBjyu8BRyT
         yizE4/Y51gFB927isSJD8eua9acvyAHXkUCz2RJxV75iQGhpqg4RhgogBNUos0mDLgel
         DmkYsFLwWgojGfnHz+6LIhJgj2VuH2PivIkYmyQuvuRxkIIsdGciyiJz5/byxzsdH49T
         Hd7QXskOKWY3vOEpW7LIlR3TACciyACIdWQy0kXb49Q52iKraczjzZYrCEWSNEnkMqxa
         Oomw==
X-Gm-Message-State: AJIora8H8vMTV5oSopW3JR5RO1BA+vhzjCRbnRVIUy9FIvbj9XxlQc9Q
        Zq8kesITlZh6I+T71Xtqd1MSUg==
X-Google-Smtp-Source: AGRyM1so+qJ9ymSEdwmy108s1d9Dlc2EdM1pFqfwnXQFtfBLFU6LlktU0CWd6/D4IknxjViqpJMYtw==
X-Received: by 2002:a05:6512:13a4:b0:477:a28a:2280 with SMTP id p36-20020a05651213a400b00477a28a2280mr7256491lfa.689.1658904721193;
        Tue, 26 Jul 2022 23:52:01 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id q24-20020a2eb4b8000000b0025e053564f3sm1783059ljm.18.2022.07.26.23.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 23:52:00 -0700 (PDT)
Message-ID: <1fbc0f83-4fe6-031a-73cf-7bbe68e4d08c@linaro.org>
Date:   Wed, 27 Jul 2022 08:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/5] ARM: qcom_defconfig: enable more Qualcomm drivers
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20220726150609.140472-1-krzysztof.kozlowski@linaro.org>
 <20220726150609.140472-2-krzysztof.kozlowski@linaro.org>
 <CAA8EJppMNUV0eEF7BV6=7RgQK_XUEsqcLpmf_zu0XjSRLTLQ6w@mail.gmail.com>
 <a9356472-0fef-d500-837c-ad6d9ed27b94@linaro.org>
 <76bf4b19-54e8-c8cc-be71-356233b1cd57@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <76bf4b19-54e8-c8cc-be71-356233b1cd57@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/07/2022 19:43, Dmitry Baryshkov wrote:

>> I was considering it, but it seems none of ARMv7 DTS use it.
> 
> Argh. The driver has support for 8974 and 8084, but nobody has wired 
> that up. I'd still suggest marking it as =y/=m. I'll send dtsi patches 
> in parallel.
> 

OK, that makes sense. I'll add it to defconfigs.

Best regards,
Krzysztof
