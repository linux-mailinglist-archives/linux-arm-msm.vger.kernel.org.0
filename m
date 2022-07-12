Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982D5571E91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 17:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234098AbiGLPM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 11:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233455AbiGLPMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 11:12:30 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E855C1FEE
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 08:05:42 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c15so10260419ljr.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 08:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=N95UeN2GEUoq/Y9MZnralNNF96wmUdf5PfFX4kSTL0Y=;
        b=n07ma88Ez+/f2BhSUkw0P0jQFXye2PKrmW17Nqm/1jOPuvJWVZQh478f+yWd+DMO+P
         IGEisyduu+SwOEbyhPlTVUdtNuyQFI8cn+ZfE92XXl3R269ZJ8pjf1uZsPqIRYIHh6oK
         2Ec6K9gADqWCoqnMzZG4tMxcJddPD1figJjC6FLNwJdaMTpZC2E4JzX4rCNdUYxMyvHa
         t1FY02WTUXXWws0Z1RBcgBq5tNpeY+5b8QZ4DNRPYqLeB4MsbreplX0yRn4ps92rvLvd
         /9LU1cNlgvhIPRRLMK9PZHGwpkJ8/e4/IEI6A49tyE9zltvfFngqUkz+n+sUcm2B9cC6
         Hhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N95UeN2GEUoq/Y9MZnralNNF96wmUdf5PfFX4kSTL0Y=;
        b=iscxgfxyhJqB6EqYgLEXWqUWBpAzM8k4TipwtvNAmqYvSHL30qLqtYc2rjnBBFiEj+
         sxTRGCeDQaFlX0URRvkGGaTi43YxN9Wg+7s1ZrRy/e9cDot0fPpOPrSuqzfOEStC/kZg
         1cZveGRu++ylPhcmH+aNSgI3LXqHHfvUxoYt5d3G8XyE6p7jw9NcOeSBUuHUl9zbcynl
         g9kSHfswGhNOxXaQpZBRuGs6jnicSpWATulYX0AkikqMAcIbauxPql6sUPNKv9lXeLlJ
         q8SV2NbZid8QYXJ/ouqSHg01tLSY99eK+S81gsUxTO3OpxQ59xkdSeTEQi+/1U3um1ov
         UHAQ==
X-Gm-Message-State: AJIora+lWkicf+Q/wr0NuutIHzFhXgfUhtCQmUS3KDdSAQtskl//lRKS
        90sHG6vXxcPynPXygnenu4Z84A==
X-Google-Smtp-Source: AGRyM1sBWDmHbBkd9dAeP+xC8COTAEUF3I38MJWleTJir5VKZ2V4ivGoLVPmWVu6FOs5PSxB0VKuHA==
X-Received: by 2002:a2e:2a41:0:b0:25d:832d:2af9 with SMTP id q62-20020a2e2a41000000b0025d832d2af9mr543465ljq.429.1657638340964;
        Tue, 12 Jul 2022 08:05:40 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id f21-20020a2eb5b5000000b0025d4b0707c5sm2495651ljn.125.2022.07.12.08.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 08:05:40 -0700 (PDT)
Message-ID: <ed28a4f5-a6f4-1f87-007a-ef7fe6c1670a@linaro.org>
Date:   Tue, 12 Jul 2022 17:05:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: Add support for Xiaomi Mi Mix2s
Content-Language: en-US
To:     Molly Sophia <mollysophia379@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220712145139.9473-1-mollysophia379@gmail.com>
 <20220712145139.9473-2-mollysophia379@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712145139.9473-2-mollysophia379@gmail.com>
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

On 12/07/2022 16:51, Molly Sophia wrote:
> Add support for Xiaomi Mi Mix2s (polaris) handsets.
> 
> Currently working features:
> - UFS
> - Touchscreen
> - USB 2
> - Bluetooth
> - Wi-Fi
> - GPU
> - Venus
> - Display (need jdi-fhd-nt35596s panel driver, which I have sent a
>   patch but it haven't been into upstream yet)

I have no clue what changed here and to what I should look.

Best regards,
Krzysztof
