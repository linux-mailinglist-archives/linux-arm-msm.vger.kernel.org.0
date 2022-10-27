Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2450060F7B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 14:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235288AbiJ0Mnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 08:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235379AbiJ0MnZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 08:43:25 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301D5855AA
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:43:24 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id x26so763902qki.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wgI6HG8FQ8TV0CSUErQizBzICht7movStGCeNSKfSsU=;
        b=BCm5z5Oq1brMVlg64USQxbVgmqnBPy3tEgE/tNxGsERJTQ4SusNunpXmUgZffDBJan
         E3vjmQ+hwz8qwct4uJL5laOZc6vUxq0HmBwrWQsWtj1cBrHaXVEFb1m6ruPc+b80wWAM
         TWcBP5mz+lL584fVN9rCPvDXwzt6YSNiLJFdPQ1UiVSKs9ZBVi74o/jUvGmpQMxYRpE6
         riC9kl99qp3oHrZHfBjFhdcAaKdQkqyf38nh/aDeDULTUtuEyFFTmNAWeZafEj6mXSmv
         oM2vMgiUP4VzIh+VcWj4Luj3BloTZtVa5Nn+W7DhxXDlgGmgbOoGgiFvsSuQb2caiWog
         JuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgI6HG8FQ8TV0CSUErQizBzICht7movStGCeNSKfSsU=;
        b=S7DrziIwO90i0aSRS1lzplWGIA2y92+U6BNqzV4OKP8+/OwAUPyWXnt8tbfnBwKFdK
         W6bH7sVcUIVHe6839G1h9DACPV1Dq6traaOhYtGJ5UBjZyULVavQiGlBcaoFAyBP+gIs
         YKo6gZ1VCYQmDsKMHux+FvCz1K48ZW761Y9QDH8s+Vl2GkszicbtjojQfqKqB0AWVNSQ
         9jRY0dVrp2yR6nryL6se1oAx24DTO+Vv/xZJgGXSOik78eEzSOllsNa/FfN3uqvX3fpk
         ZcBndEoys2/f6awpASMU3gOW4Yas3MtxNDp4ai3x/8/Gt8/wQrVV7HR4JeL2IaMVVyjs
         YlWA==
X-Gm-Message-State: ACrzQf16K+yK+tcvr+clHKQjAi7VVSMeCvYPyxCQOFis62/5tnGN31hv
        JdJ9f5qRdubM/G6tVyu+0erNGw==
X-Google-Smtp-Source: AMsMyM7rtq2ZKBo6fZyLQxT3jX6HgF4Wq/x3EeirSE37uYvQzziEhRLXw0DIWaMvgGLwjU0T5TKKpA==
X-Received: by 2002:a05:620a:370c:b0:6ee:cece:c779 with SMTP id de12-20020a05620a370c00b006eececec779mr32768327qkb.727.1666874603351;
        Thu, 27 Oct 2022 05:43:23 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id f18-20020a05620a409200b006cbe3be300esm916562qko.12.2022.10.27.05.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 05:43:22 -0700 (PDT)
Message-ID: <68f6d58e-8b7a-1032-4a3d-c4c74b82d111@linaro.org>
Date:   Thu, 27 Oct 2022 08:43:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 06/11] dt-bindings: input: qcom,pm8921-pwrkey: convert
 to dt-schema
To:     neil.armstrong@linaro.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-6-dac2dfaac703@linaro.org>
 <Y1o5hYAnBuf1akJ9@google.com>
 <e8f53c8a-2842-9e6e-75bd-e099db3fe6f3@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e8f53c8a-2842-9e6e-75bd-e099db3fe6f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/10/2022 08:39, Neil Armstrong wrote:
> Hi,
> 
> On 27/10/2022 09:55, Dmitry Torokhov wrote:
>> On Fri, Oct 21, 2022 at 11:06:42AM +0200, Neil Armstrong wrote:
>>> Convert input/qcom,pm8xxx-pwrkey.txt to YAML, and take in account that
>>> the PM8921 pwrkey compatible is used as fallback for the PM8018 pwrkey.
>>>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Should I merge this through my tree or you want all these changes to go
>> together through some particular tree?
> 
> I have no preference,
> Krzysztof will you take it and prepare a branch to Bjorn ?

No, I did not plan on doing it.

Dmitry,
Please grab it (assuming there are no dependencies).

Best regards,
Krzysztof

