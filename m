Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A61DC64022F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 09:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbiLBIc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 03:32:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbiLBIcI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 03:32:08 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F45C0552
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 00:30:35 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id s8so6311837lfc.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KRzGhbLWq/EVeiZHGstPvpADlY6Gw7yqGMWIECivDNo=;
        b=xoj8AZ6d1kfLfbrh/1nP+oAlaN/s8oPmYwYT/hB6egk/w+lJdPUxsqJ46XJM3kbu0v
         WNUMr6WXob3ixTtB51PWsOXZzSlyrJcZLyRzbcgZi78Y1oJwINnDLMJM4a2ueJBeKMuK
         CyVOsxw/RuNXwGigC3yJ2I7cBnky9KWiIXQJw3IWO1Z+mXd2PsMZtANOSftFTuhJvKv6
         cE+CMjZzK4Fice7ltOPWuQshHPwSPh6MvI7X3NPzrj2Kv0mh/ji2pFO/HwpUPwvSTNZP
         SBSeEph/wNbB/wspk+QfqCy5GVMHP8NQ4JoQl0gKzql0icb+jMFLtHd+S0MY0fBxkzmh
         LT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KRzGhbLWq/EVeiZHGstPvpADlY6Gw7yqGMWIECivDNo=;
        b=ivF8t54rDqGd2H1NkyCrQU+VSfzQ7O4xKWYLpRZBCR64myDDrfW3X3miZ451rJNU5M
         5dIogKgajrumewczHDJVPeNs0mNphQH4PaetfnsEdvhkw8aQg35DZPDm/t1Fw8ZqgviA
         oi2uCLN9UEz9FbbZ0FgWZFcgACKkCB+uJwYFMRsZ9GuXSDFDnpj7eSW0AcBShRCZLjGj
         FH6rueBvP759lzgzKwWXSRlIGkfp8Z5shL6z8CYBvCny+bDMK8ipEgxjaQGiZetfaGkL
         ivZmojDM0tfd/CkJHthtfxD3wFy7wQBupMYaOpe6abZ5YILBYYhngh/KTFSz3TygDvTZ
         Bc2g==
X-Gm-Message-State: ANoB5pkb4PLEwAvRvQfYHs16RHwM5uRp0sj0g/XS/kJzN0ERjIN4hGPb
        69qt7rbIW49YNciJNC1lhAf5SA==
X-Google-Smtp-Source: AA0mqf5cRBXi+/1IoddLYtVQ1uiytPbiTqxIIwwNl5HC3xS8mRSFxfzJjaxjqWgC+iIbow0ml/Z0Bg==
X-Received: by 2002:ac2:51a2:0:b0:4b5:3d3:224d with SMTP id f2-20020ac251a2000000b004b503d3224dmr11000207lfk.69.1669969833654;
        Fri, 02 Dec 2022 00:30:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k26-20020ac2457a000000b0049462af8614sm941669lfm.145.2022.12.02.00.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 00:30:32 -0800 (PST)
Message-ID: <bdfb93b6-76de-e047-abeb-b36f79ee8f23@linaro.org>
Date:   Fri, 2 Dec 2022 09:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] leds: qcom,pm8058-led: Convert to DT schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221201131505.42292-1-krzysztof.kozlowski@linaro.org>
 <20221202000858.GA1737135-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202000858.GA1737135-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/12/2022 01:08, Rob Herring wrote:
> On Thu, Dec 01, 2022 at 02:15:05PM +0100, Krzysztof Kozlowski wrote:
>> Convert the Qualcomm PM8058 PMIC LED bindings to DT schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/leds/leds-pm8058.txt  | 67 -------------------
>>  .../bindings/leds/qcom,pm8058-led.yaml        | 57 ++++++++++++++++
>>  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml  |  4 ++
>>  3 files changed, 61 insertions(+), 67 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.txt
>>  create mode 100644 Documentation/devicetree/bindings/leds/qcom,pm8058-led.yaml
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Or should I apply it?

There will be conflicts with:
https://lore.kernel.org/all/20221201202144.448694-4-dmitry.baryshkov@linaro.org/

So both patches could go via same tree to avoid it.

Best regards,
Krzysztof

