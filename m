Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A011661A6A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 23:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234280AbjAHWVB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 17:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233920AbjAHWU7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 17:20:59 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2EF165D7
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 14:20:57 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id v25so10280380lfe.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 14:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Au8PIm+4NyW4j2miivRKm9HzANsXUXWrooOUvpFJEq4=;
        b=xJvnO7XVZiOab0uE/yZrxgm/ub+DAz+6aEXXpyyjV3sWzc0k/1Rs2rnflDNrecuCTg
         LbVMManTt4KsRW2z/AIK9H0z9cdYybQtuOSow6c4VO5910cbqfxrB524jdXsgpAyKF/V
         u37sYgYOcIrEQVaTegJ4kETigFG7RNNRHrvwl94F6iakojGqnrXTiqKzPxHF78uHdVbo
         2Kdq+m8g+Q+zBAYcfBJWk+ZIWPos2icJEV8xES5tDrx4hn36cCyzSbB+2vXGIAq0gB2Y
         ZzfoW8gPlQbFTKx5bz42Hmi/qJ4s24HcH9LQGWHqI3FWtWbK5KRkmDgBI7GGjXfBDLfK
         jpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Au8PIm+4NyW4j2miivRKm9HzANsXUXWrooOUvpFJEq4=;
        b=5FVbWUwz96ylV9zXun6+q8oqh7ttq7N2QXAx1k1rAYL7UNWCixRMtZ4GERzhCKEE8y
         OMgNUif2gyVr5C7C6fiade/jbjZc+9E6aUkPwOxkBbeMhKCGQQKXzXb7wGWHrAVPDDK1
         N/XMSKBKnL5QRk0KcwcYGSMeOjrCSbsgYoJrkOl3ORwmYjVU3KsDeEP8W7f59/UL2vbc
         AcvsXfl0UsOnMOjxbCFZpK2Lxy6kK1eosKVAD4A5ZwspkqScooYGvFxwnwKrThVvlsq5
         zJ2zkCcNWXVn5YePUfGWOgqp7JMkSjJzifhtrFGS2wPdk2Ab/xYnHpHvF+JQZeJOo/0l
         wYeQ==
X-Gm-Message-State: AFqh2kp6/nc9EQ1I+nQzz6LsVLUHpThKVg7tvQ+Fyxq9z0i5WmMF+hMj
        VL+XBfiPIH9oI802GbmC7HWC/Q==
X-Google-Smtp-Source: AMrXdXulolSMJEdgGfRuthfwuZXbZcAZCXKUjQ0WbO2OcS3CQBLdYTBRgcdg8N7kimzp8ztv5EiScg==
X-Received: by 2002:a19:6b1a:0:b0:4cb:262c:5422 with SMTP id d26-20020a196b1a000000b004cb262c5422mr8339607lfa.20.1673216456288;
        Sun, 08 Jan 2023 14:20:56 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id dt17-20020a0565122a9100b004cb061887b5sm1257258lfb.126.2023.01.08.14.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 14:20:55 -0800 (PST)
Message-ID: <a86973c7-db5e-ab2c-4b6b-d9c82f76a070@linaro.org>
Date:   Mon, 9 Jan 2023 00:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add a bunch of older SoCs
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230104115348.25046-1-stephan@gerhold.net>
 <20230104115348.25046-4-stephan@gerhold.net>
 <20230108214052.GA313089-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230108214052.GA313089-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 08/01/2023 23:40, Rob Herring wrote:
> On Wed, Jan 04, 2023 at 12:53:47PM +0100, Stephan Gerhold wrote:
>> Sync the SoC IDs in qcom,ids.h with relevant entries from Qualcomm's LK
>> bootloader [1] that is used for almost all older Qualcomm SoCs.
>>
>> Several of these are already supported, e.g.:
>>    - MSM8960 -> APQ8060, MSM8260, ...
>>    - MSM8976 -> APQ8076
>>    - MSM8956 -> APQ8056
>> Others are currently being worked on, e.g.:
>>    - MSM8909(W) -> APQ8009(W), MSM8905, MSM8209, ...
>>    - MSM8939 -> MSM8239, ...
>>
>> And even all remaining ones added are close enough to what is already
>> supported so that future support is realistic (if someone steps up to
>> do the work).
>>
>> Add all of them at once to avoid having to add them one by one in the
>> future. This will also benefit other projects making use of the same
>> dt-bindings, e.g. bootloaders where adding support for all these SoCs
>> is a bit easier than on Linux.
> 
> The promise was in accepting the properties upstream is we'd only be
> adding these for bootloaders with dtbs that we can't otherwise update or
> change. Do all of those meet this criteria? Seems unlikely.


Most of Qualcomm platforms come with the signed bootloader, so it is 
impossible to change it without vendor keys. This might sound bad for 
you, but I fear that this list would include most of the platforms until 
Qualcomm agrees to rework kernel-bootloader-dtb interaction.

-- 
With best wishes
Dmitry

