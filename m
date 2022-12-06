Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28329643EF0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 09:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbiLFInh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 03:43:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233008AbiLFIng (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 03:43:36 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D995C26D2
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 00:43:34 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g7so22587555lfv.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 00:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SaSD3geb2bQJh9N/RP9IsEjubJS5gEWgGuf2e7tOAdo=;
        b=sjhzeRgV7jr7bX4Q5DGBZ8RmwyS3taAXKME+uQhG21OQj57Z4Nh4Z9NQaLgXxXLF4Z
         gVyjJNPB7d5uNLBtHw48ksb231/XqWpbnBLZOcCQdtE7YGlQ+O+7Z8q8lGTi5jaZlT8v
         ti26RnFv91Y7u87la9aqRQR4+5kGkkahejIIFL0TUb9ozqRfI4CBNIBcTAKXoU4fTI74
         KWRsYts15p4qHIxVASlI8lBYYNzKBvaUnatWmEKUrGADnsmwpjgDGxzx2g/Gn/DCoPat
         M2GUy3wkiYzmSDDUJRqA/aGvNlr4zl8uL6X5OF5+tbezwRRv0o2+biOu4NWlfvBgjg89
         Z6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SaSD3geb2bQJh9N/RP9IsEjubJS5gEWgGuf2e7tOAdo=;
        b=MjTbq1asctjyYKlpc7bZvrDkZZ6/9ms3BYujvE3zYK8ysVy8q1wKN2PtLEN3uxfCq7
         ImZdBTGir1ChGM2kVmmMnJJkzDfJHtoIUnYUmTq8VSEJV0T7p9u4CgcjY/pAJUYPW0BB
         Q5z7Tx+Gp77HL3wkbO9VTqEd0Zd9OrEBlo/0Ut5xj6vKapyNQ7V6dnHGN1S8s8T8B41O
         Ggjn/kJKc16S+jKCArUxhKiS2Q9u6/FzwhhTZH59BqNMf19R6fc7oTL9Gjbkz2jBmnOU
         d817JOrpbEH7lqAYtBt0ZEBQgqkTuAtZ/Sp4NWc0wuZBe2jBGYRsO5djloI3W3QI6mOY
         32ig==
X-Gm-Message-State: ANoB5plsHJn1POC2qnvJ2m0of97v07LjPnDSzBtAVcFuY/Luu2X2zc/v
        AW2CrYf0sSE3j6dRg3eQoC+Etw==
X-Google-Smtp-Source: AA0mqf7mR/e8/fiC7Foi5gFMjvFoZf6eTrsbwwZJo8KeirTkL3+gHpNzzBuTeDMmx8wswfW32qCzzQ==
X-Received: by 2002:a05:6512:3189:b0:4b4:e3bd:6ca0 with SMTP id i9-20020a056512318900b004b4e3bd6ca0mr22528089lfe.278.1670316213184;
        Tue, 06 Dec 2022 00:43:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j6-20020a056512344600b004a27d2ea029sm2410648lfr.172.2022.12.06.00.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 00:43:32 -0800 (PST)
Message-ID: <b012d945-f3f1-c9d1-09dc-c721346cb922@linaro.org>
Date:   Tue, 6 Dec 2022 09:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] dt-bindings: soc: qcom: aoss: Add compatible for SM8550
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221116113128.2655441-1-abel.vesa@linaro.org>
 <adc327c7-9e99-4f2d-9641-2981b380ee47@linaro.org>
 <20221205211623.extu4b22fsowilyd@builder.lan>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221205211623.extu4b22fsowilyd@builder.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/12/2022 22:16, Bjorn Andersson wrote:
> On Wed, Nov 16, 2022 at 12:43:26PM +0100, Krzysztof Kozlowski wrote:
>> On 16/11/2022 12:31, Abel Vesa wrote:
>>> Document the compatible for SM8550.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>
>> Why this is not part of other SoC patches? I just received many single
>> patches for this SM8550 topic. All these should be set of few series,
>> not 10 or more...
>>
> 
> Because these patches are independent of each other and done in this way
> means the maintainer can merge each piece on its own. I much prefer this
> over having these series with 20+ patches being sent over and over
> because one of the patches is getting feedback.

But this one is patch for you, so should go with other patches targeting
Qualcomm subarch. Before submission, we discussed extensively the
proposed split per patches and it was agreed on. Yet this one here was a
surprise.

Best regards,
Krzysztof

