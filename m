Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C24516550D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 14:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236283AbiLWNUx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 08:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235480AbiLWNUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 08:20:50 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33E4116F
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 05:20:45 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id y25so7068765lfa.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 05:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KgXa7/ukKMDocBnSe76XCFCBNMSd8+VIWyqtqQC5em4=;
        b=ny+RJdlJjYX4oriRqkBq5wTqCbuZUgAFx0hsZrYWJaHlP8hrJKv9pFyAA8Cwb3lRTR
         NgVZdfRm3Y1OPp6uofb4Zhi4QXoZmzwcI5pd29DYiHGEV7QRm089RMQBYwmS+xGbhMe/
         eWKloaNTsFNb3BsZcjhNQVinnpnQBW89XjICfXYJYJqdkSvEagu5hsFNQ8WWVSEj2cie
         61pGJF66HZC88lZaIE9tcw1RwtXedBru1NW2+rj6yrAiAHiDB0JjQ+vwrCuQdIkvkLgO
         u+fAdgQmPSgAq9cYKkltJ8NciyxSMlT3qv7a3vdSyw1kNiuxWyN/GWGvnqJdpuZ8K52E
         816g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgXa7/ukKMDocBnSe76XCFCBNMSd8+VIWyqtqQC5em4=;
        b=BJZIdl7BhzbdXbcLxTy8vr+NX8ler1s1uhCNIwVWb3hUYbJqxW6rNRlbFA83B/KRN2
         4K4JG3K9J9G1LQk7lXtxF6EzjRJvUl0NCz5isaYDrSYkk1YlRkevYb+8Cmgy6ddPeXJ7
         GZCe7KsW8b4fj9TBZxaFvocupnnY00lkRd/+6Q4Bpx/jGXY1R8kdxqpkCitCl1W28gO5
         xDn2C42Q0OljkiFeq60x4WGr4HjZJ/ERSMueNDBKvDjrxU3v1FWR9O3+zxrzjt/dSTYL
         YSlx/zJqsLNFZuy4v6bX6uCidZlRBhbilnzP8fBgnZnxGDz4+XJszkSLGp/S1izcMe4h
         WSwg==
X-Gm-Message-State: AFqh2kpPH1W1QN3fKw5WAh0hBS62jfxphuRCJF6hsTAEHYO8uWTlYZvH
        8odIqr8n2s2u/n1eJqVgiNMX5Q==
X-Google-Smtp-Source: AMrXdXu99h0V8bKpeI66+rDGMCQJOZIp9zbdyJJu4Sggxux8Uel0/kwII85uWGyqk4iAICAyAKAyMw==
X-Received: by 2002:ac2:5088:0:b0:4b9:a91c:b0cb with SMTP id f8-20020ac25088000000b004b9a91cb0cbmr2846591lfm.57.1671801643924;
        Fri, 23 Dec 2022 05:20:43 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id d13-20020a056512368d00b0049478cc4eb9sm516424lfs.230.2022.12.23.05.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 05:20:43 -0800 (PST)
Message-ID: <40ce6134-e3e8-c3c7-8ba0-539b1ce3fc7c@linaro.org>
Date:   Fri, 23 Dec 2022 14:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm6125-seine: Provide regulators to
 SDHCI 1
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221222203636.250190-1-marijn.suijten@somainline.org>
 <20221222203636.250190-4-marijn.suijten@somainline.org>
 <abd83b0c-ae33-98f7-a1e7-49f227246ebd@linaro.org>
 <20221223130813.qk7thawdueugb5z4@SoMainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221223130813.qk7thawdueugb5z4@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.12.2022 14:08, Marijn Suijten wrote:
> On 2022-12-23 13:00:18, Konrad Dybcio wrote:
>>
>>
>> On 22.12.2022 21:36, Marijn Suijten wrote:
>>> While SDHCI 1 appears to work out of the box, we cannot rely on the
>>> bootloader-enabled regulators nor expect them to remain enabled (e.g.
>>> when finally dropping pd_ignore_unused).
>>
>> Unrelated, unused-yet-enabled (as far as Linux is concerned, anyway,
>> it doesn't know the state of smd rpm regulators unless you add
>> regulator-boot-on) regulators get swept by "regulator cleanup".
> 
> That's exactly the point made here: at least this way Linux knows that
> these regulators should remain enabled.  Even if it doesn't know about
> many others and would fall flat on its face regardless when disabling
> others as part of regulator cleanup.
> 
> Unless you meant something different?
I meant that regulators are not handled by pd_ignore_unused, but rather
by a similar mechanism.

Konrad
> 
> - Marijn
