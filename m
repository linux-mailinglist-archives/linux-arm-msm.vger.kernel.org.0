Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEA8789DD1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 14:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjH0MRs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 08:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjH0MRh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 08:17:37 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931CF18E
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 05:17:34 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so3575494e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693138653; x=1693743453;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ms53FQzfvHrdmAehuimq9ADoAdRcM9q5qE08X0YTEfc=;
        b=CAJ6tyJFXeSmBm4uLwKQOgBsCiuHsItHGfNhEJSRQLMA/+7E7JszZcJ76ClpEAWTWQ
         QNXIzDMjLGvLAmEwuIJFKLrgiBNneGmmCVMHYbOndrcPgVSfthX/53/IGM+jSJTiWr3d
         PUaSe4EcMQA/mt40yJWLJycrJqdqYq+RHymwkcrfCRsGpsY4YhJRSPciZN8fiFioEsLd
         p96X3S464e5IVUOKsynZYgkzYeVrCobC7tDBIBIeJaDCgRJlrE8UWOYi4txMKaRbwjTE
         jMRzog+y6753Qq+Ufev+JlqfKzFFIm+jvOn2uJpOYfUuK509Hqd4nhPGstBTB7T1ySlW
         Aewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693138653; x=1693743453;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ms53FQzfvHrdmAehuimq9ADoAdRcM9q5qE08X0YTEfc=;
        b=WJ2pfMrQxhJIF/TpAZumEpH9sr6yyy7qkTFZqHL9j97QFPLa9Ved87sxvIJoCuZ5cU
         A37SeSMTDJNCNaMefcWZc4o8VmD4rh6UKiyBWY6WaCGhVuqb33uxQR/ypnb142BXn9pb
         ZjWbT92O5Cdqnpi+XTfkZaqzRmuum3ZaEyQXbUg1PvrLJq/TYSA6nv4Ym00TucUlXyHJ
         0HMzSC+8mY1YfLGQ5rbk42gKlBk7PfUqUD1Psd8z59zLgsLbmEkWWfCxFCu/pKYC3M/i
         BaijAGRtquTDu5HVAd2duOS92UkIs3IfLpiHvXT58ycjQDqCi2JvLYFHUobe4W+scRNc
         o9gg==
X-Gm-Message-State: AOJu0YxaLaJrzvGYtLP/NtC73od+QaL7TLi4LnxUOBbcvb/1hvvd2nZZ
        6BXfpqu6YUV4XN+Rmx2RkZSeeQ==
X-Google-Smtp-Source: AGHT+IHb9V6xyS2UAZrxM+3U5NYR6e8ovIvZ4PhPZ6aqKHCtHYaaz/PMUjzxKEghq7oFjerqpuGC2g==
X-Received: by 2002:a05:6512:4003:b0:500:848a:80df with SMTP id br3-20020a056512400300b00500848a80dfmr16483588lfb.66.1693138652874;
        Sun, 27 Aug 2023 05:17:32 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id x11-20020aa7d6cb000000b0052284228e3bsm3263682edr.8.2023.08.27.05.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 05:17:32 -0700 (PDT)
Message-ID: <63b2f0a1-548f-4a5c-3b11-df324e4edad5@linaro.org>
Date:   Sun, 27 Aug 2023 14:17:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 00/11] mailbox/arm64/ qcom: rework compatibles for
 fallback
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
 <6c0a7f12-10d2-4a07-a07f-67ec0d39b279@linaro.org>
 <38fbb9d1-f263-2ec1-a3d8-4b09a26eaf2d@linaro.org>
In-Reply-To: <38fbb9d1-f263-2ec1-a3d8-4b09a26eaf2d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/08/2023 20:46, Krzysztof Kozlowski wrote:
> On 05/08/2023 14:21, Konrad Dybcio wrote:
>> On 22.03.2023 18:41, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> Changes since v2
>>> ================
>>> 1. Split fixes to separate patchset which is now dependency:
>>>    https://lore.kernel.org/linux-arm-msm/20230322173559.809805-1-krzysztof.kozlowski@linaro.org/T/#t
>>> 2. Add Ack
>>> 3. No other changes, as discussion with Dmitry did not reach conclusion on incompatibility.
>>>
>>> Changes since v1
>>> ================
>>> 1. Rebase
>>> 2. Make msm8994 fallback for several variants, not msm8953, because the latter
>>>    actually might take some clocks.
>>> 3. Two new patches for SDX55.
>>> 4. Minor corrections in bindings style.
>>> v1: https://lore.kernel.org/all/20230202161856.385825-1-krzysztof.kozlowski@linaro.org/
>>>
>>> Description
>>> ===========
>>>
>>> If entire approach is accepted (and correct), there are no dependencies and
>>> patches can be picked independently.  Although the best in the same cycle, so
>>> there will be no new `dtbs_check` warnings.
>>>
>>> Best regards,
>>> Krzysztof
>> Looks like this was only partially merged, resulting in schema warnings
> 
> There was discussion/disagreement about the bindings. DTS was applied,
> thus it's partially limbo state...

Anyone has any ideas what to do with this stuff? DTS was applied, even
though bindings were discussed. Since some time we have tons of warnings
because of this.

Maybe let's just go with my original patchset?

Best regards,
Krzysztof

