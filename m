Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89D85355EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 May 2022 00:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349781AbiEZWDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 May 2022 18:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349775AbiEZWDy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 May 2022 18:03:54 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1DFE730B
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 15:03:53 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id p4so4303094lfg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 15:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qJs/grwr2pvDEsLIUfHDR0aBRbSDu/q3H641iXHa5hA=;
        b=tlN1v8qBCAVlEin1MRqNmJ5XwrkS6y01KGkIJhirqgfMWxZzHeZ2OzJwZB97THKsN4
         XuLeQXtDZJHI/ngBaBWkuwYbgf8cMHfxqZpnGkkXm34SolSdCwGbw5HbZbh4vP3Mf392
         ytkW3ieorODoG0tNQjAwV7ojlJru1cOaF2/8sDtQQEdk5i9AfggsENU8oyLq0wM31HK6
         FoIgImuOOm4I6x3GgsPLvjIrjvzuQvoqMLW/obqW8j3u54PJX08Ezo7yZFdn5lQHcerB
         Oes7z8l4xy86Yj8ga+j3oL+KOfReaGjhLrIWoebJgjTore2Mck9Ee4b7DZHFuOmLRoeB
         ILzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qJs/grwr2pvDEsLIUfHDR0aBRbSDu/q3H641iXHa5hA=;
        b=Lod92tYJetsvwM2H/kCqugS2214JREGB+cBZ98AUiR7MREskHyCF3nB+D6hMsaTtX2
         c1uIvPBeJ4WqSlWkpcuwJQoUYz5jLwTh3T1UdfW5ba1emhTBTD8vtKD3+JGJ9K9KGJep
         Zj4OU3vArXrLrrqydLopf7kiVUfViQtoW9SiCCywB30/htVCbIeaRRYYNBn4eKS9qJoS
         CmZUiU1uFhlkEdKgPFkN3uAQbNht2yZ12iQar8sz96nHRBK6oISJ+WTzTBaTXzoNlTat
         Z5QbGo9CI9GAW6amd+qSe3c54LvTqOh9eICohdNVKjnyDKubdNuebIJOOTli+xUsndBN
         vQSw==
X-Gm-Message-State: AOAM533XyhcunyDlPXbUL4ii+pG8y/jeSh0QLMSVFXmaFSKf9aBz0xIb
        wW0IP3eCC18TNeqRR+VhP75KKg==
X-Google-Smtp-Source: ABdhPJy56yCKhdD3asKqWkOmtI0zEJvEAhWrPSGzs3OERYaX6QCLk71VovWV5iXtoQkRUPw125yWpg==
X-Received: by 2002:a05:6512:3189:b0:478:5d83:5eda with SMTP id i9-20020a056512318900b004785d835edamr20847151lfe.519.1653602631826;
        Thu, 26 May 2022 15:03:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x23-20020ac25dd7000000b00478628920e1sm553702lfq.103.2022.05.26.15.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 15:03:51 -0700 (PDT)
Message-ID: <ad7106bb-ed7d-8d6f-0b3a-3e2dfeee0168@linaro.org>
Date:   Fri, 27 May 2022 01:03:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 4/4] arm64: dts: Add msm8939 Sony Xperia M4 Aqua
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, shawn.guo@linaro.org,
        jun.nie@linaro.org, benl@squareup.com, jwillcox@squareup.com,
        jgates@squareup.com, mchen@squareup.com, zac@squareup.com
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-5-bryan.odonoghue@linaro.org>
 <Yl8NLldCWaecisH5@gerhold.net>
 <552547c1-36c3-8d7e-0fd5-1b22fd184b4b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <552547c1-36c3-8d7e-0fd5-1b22fd184b4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/04/2022 01:03, Bryan O'Donoghue wrote:
> On 19/04/2022 20:27, Stephan Gerhold wrote:
>> tulip seems to have qcom,usbid-gpio = <&msm_gpio 110 0>; downstream.
>> Have you tried setting it up using linux,extcon-usb-gpio?
>> See e.g. msm8916-longcheer-l8910, it has a similar setup (it also uses
>> smb1360 for charging actually).
>>
>> The advantage is that you don't need the manual role switching using
>> "usb-role-switch", USB OTG adapters should be detected automatically.
> 
> My understanding is "no new extcon" - certainly as driver 
> implementations I assume that also extends to dts..

I think, if the driver supports only extcon interface, you have to use 
it (leaving aside a good nice option of rewriting qcom,ci-hdrc/ulpi to 
also support USB role switching mechanisms).


-- 
With best wishes
Dmitry
