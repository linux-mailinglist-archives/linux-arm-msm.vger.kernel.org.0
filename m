Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCD255C16D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344006AbiF1Lsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 07:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345295AbiF1Lsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 07:48:30 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BA72FE58
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 04:48:23 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id n185so7155928wmn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 04:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ARDmPpFNeFd3U7QLTpOGaojt5BbAFGKGYsuOK9qTd/Y=;
        b=QC3iqfjnPtGeUUoqjsBCAjO4k82ZGz5gPrW6KmnT8jqVZZFHuLfsTIWX7Ck3NZ7ovW
         D5RN/7dMWONHz9D7GSa97LK0fHN+HrL12HNmKCp+rXZjSS24TKUVGTBHIJlIUhaZzl5I
         z9If9u744CQNOaFLAOj3jhqegHVI9bRc6kiFwpNUy0kislXxzquNBEjd9XYzpjyRqAXx
         QTPZV7Vx0amDskRQR0t6tn4jOa0x2g9SRNQzhHnltOsTEZIFBQbtFHSNfmWvYUOo4Dqw
         J9aPeMlYfSU8QWVV5KnZawc7Mi+4nZJk5IiRJv8BDt2hyju+Sjx5F4bzBYy3J3wz9Kab
         wZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ARDmPpFNeFd3U7QLTpOGaojt5BbAFGKGYsuOK9qTd/Y=;
        b=lrhOwJcDjoYrwwGq5HmqHZeNhgGNmayxITYbwj3gCL3ec9TxOoA4zEH99PFZBf94/p
         IPjUp+sb5+PfFkCRKcpe5+m2wptxjlppMqEPqUy9+IAUdVajxeLlbxugiA8m8XwufMYR
         Mz6XHpHz2861WcVZ/3BSCOcGyPyvPzgBjBd6oSGocse3igoV98z6q93XM8g9wZS+/eqv
         PE0D6hzsB3QijtHVljrX+vid8OTca+/yMEqg6/OXRxV9y7IAGdOPWsgZBGuDN9zMdcpf
         R1fTbC6+uVl4YqF0kdkaGAJhul2dACxgbnwTLqTzjoeFiozXZNuLPQdMFl7w86NI9ebr
         /jXA==
X-Gm-Message-State: AJIora9Q7o5MOKZx+Zg30qHw0q9tldMNsgK2K5lhl3ZIOyycyxHCw2Rx
        F3CBobrAHfiPOC0vQkfPMUdywA==
X-Google-Smtp-Source: AGRyM1vjuaRUvUxcebxJCjSQw/GD3dvJigLw9hhUiaZGLGlGKkF787hpFCshgyALl40zm7XgkZYmfw==
X-Received: by 2002:a05:600c:583:b0:39c:3637:b9f with SMTP id o3-20020a05600c058300b0039c36370b9fmr26740830wmd.79.1656416902293;
        Tue, 28 Jun 2022 04:48:22 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bn24-20020a056000061800b0020fe35aec4bsm13115711wrb.70.2022.06.28.04.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 04:48:21 -0700 (PDT)
Message-ID: <14f6b7eb-cacb-91a5-ce06-9702618513b9@linaro.org>
Date:   Tue, 28 Jun 2022 12:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     lgirdwood@gmail.com, bjorn.andersson@linaro.org, perex@perex.cz,
        tiwai@suse.com, srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
 <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
 <Yrrf5X8wstW+DXHF@sirena.org.uk>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Yrrf5X8wstW+DXHF@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 28/06/2022 12:03, Mark Brown wrote:
> On Tue, Jun 28, 2022 at 01:28:57AM +0100, Bryan O'Donoghue wrote:
>> The documented yaml compat string for the apq8016 is
>> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
>> lpass compat strings the general form is "qcom,socnum-lpass-cpu".
> 
> This doesn't apply against current code, please check and resend.

What's the tree you are applying to here ?

I applied it to linux-next just last night..

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-27-06-22-msm8939-no-cpr-v4

https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=linux-next-27-06-22-msm8939-no-cpr-v4&id=5822d52637eff65b826097634d9a99a9bf1bf2b7

---
bod
