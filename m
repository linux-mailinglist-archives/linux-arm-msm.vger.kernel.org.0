Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCD9E5A573D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 00:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiH2Wp2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 18:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiH2WpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 18:45:25 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CF85A2CC
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 15:45:23 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m7so4241273lfq.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 15:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=w8vHlMWoeAuOeDevoCzckAlsluuYN2+2EOqFRzUR6LQ=;
        b=EgdVUtIaBz3PJrSEdW3ShS71l1g0wEde/cZ4LmI6/dqmBRlVRcKbt4hH6JPuKw3jOo
         C5xR/TvroaRBUyygmn3XmMoFlE7/Co1prmfSsyjmq1qH73or1H6tTxB4rT38KyojLv/D
         BDRD1aiHK3IMFNvZvMnRs42KFsvgUC91Mw9kFfSk/6jashPcqbX1Aowc/EHf/oX94FgU
         MyOIOdFutFHoq/BBuppqcsdAD79JX/wNTpi+wedaS959KCevMPyoZChTxbpTuMzWhshz
         N8sCQxLwRJ/B5TVsbOcfL/9JOVD7kbJysLpJBAXMpz3PgWhxD9WLDBqBEV6x8b+OQ533
         hWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=w8vHlMWoeAuOeDevoCzckAlsluuYN2+2EOqFRzUR6LQ=;
        b=oIAijL3cfUK+tvUfWIPHp4+SrxyUsXXKDzgCCP/YTFQQCPH6dGTA/TW94FtoV1R/F+
         wL39SHgyly1E2S9GUhc1HbpYAADzYx+Uf0C0k7EwJzqrhmriogjnE0yenhLS1rHatvBN
         2JDeblHZRaf+GRS2Q7hel4HEjDpr2VJgCKCe2tmclucQm8ViJm0LWPyTqsr9pI5+n/7q
         G8Glh6rP5+D1++JPyWkK+iHqAZcXXnuUnYlDUJBidpz9cQVYYr4FSmRjyTJtNhebuE8g
         TJNphl3+UNpzi5p9o8WMM43ks9NcSExxl//s+rOowU4XxtiNUNTxYzXX3T6/H1KZwozP
         I8EQ==
X-Gm-Message-State: ACgBeo1jDKJFIb/TudNQQw5LB9+CFWLj1m5nkYxN/9MwXQllXOk8g/gw
        KYP7YD3Aj/JJJEZAIZev7DYgzw==
X-Google-Smtp-Source: AA6agR5lq3sYw8fJb8G908q8Sgl3+o1MpEj872+aoJcrZp2ill7/GcE0NAkRjIOiiR1wPSaoSkyB0g==
X-Received: by 2002:a05:6512:3a87:b0:48b:16fb:79b8 with SMTP id q7-20020a0565123a8700b0048b16fb79b8mr7057682lfu.438.1661813122074;
        Mon, 29 Aug 2022 15:45:22 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a2e9d89000000b002655fb689a6sm534238ljj.139.2022.08.29.15.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 15:45:21 -0700 (PDT)
Message-ID: <0ac86ecb-bff4-6f13-1109-0410c8050cab@linaro.org>
Date:   Tue, 30 Aug 2022 01:45:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3 2/2] spmi: pmic-arb: Add support for PMIC v7
Content-Language: en-GB
To:     Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Collins <quic_collinsd@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Dai <daidavid1@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220201134108.2677578-1-vkoul@kernel.org>
 <20220201134108.2677578-3-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220201134108.2677578-3-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2022 16:41, Vinod Koul wrote:
> From: David Collins <collinsd@codeaurora.org>
> 
> PMIC v7 has different offset values and seqeunces, so add support for
> this new version of PMIC
> 
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/spmi/spmi-pmic-arb.c | 233 ++++++++++++++++++++++++++++++++---
>   1 file changed, 214 insertions(+), 19 deletions(-)


As I was asking Stephen about the fate of this patch series I could not 
stop my self from noticing that one of his comments ([1]) from v1 was 
ignored.
Let me quote it here:

 > The driver is already pretty hard to read because it combines so many
 > generations of spmi arbiter hardware from qcom into one file. It would
 > probably be better to start over and simplify the new version of the
 > driver, possibly sharing code between the two files if possible, but
 > otherwise dropping lots of cruft along the way and simplifying review
 > burden.

After taking a glance, I thought maybe we should really follow this 
approach. And it also allows us to start with the new bindings:

spmi@c400000 {
    compatible = "qcom,spmi-pmic-arb-v7";

    reg = <..... both arb registers as following....>;
    reg-names = "core", "chnls", "observer", "cnfg0", "intr0", "cnfg1", 
"intr1";

    interrupts = <&pdc 1 HIGH>, <&pdc 3 HIGH>;
    interrupt-names = "arb0", "arb1"; /* are the names necessary at all? */

    #address-cells = <1>;
    #size-cells = <0>;

    spmi_bus: bus@0 {
       reg = <0>;
       #address-cells = <2>;
       #size-cells = <0>;
       #interrupt-cells = <4>;
       interrupt-controller;

       pmic@.... {
           // etc.
       };

    };

    spmi1_bus: bus@1 {
       reg = <1>;
       #address-cells = <2>;
       #size-cells = <0>;
       #interrupt-cells = <4>;
       interrupt-controller;
    };
};

Note, this drops the qcom,ee (which is always 0 for all devices I see in 
mainline)) and qcom,channel (which if I understood correctly is used 
only for pmic-arb-v1, ugh). It uses common reg = <N> property instead of
cooked qcom,bus-id. And last, but not least, it save us from huuge 
comments in the source code telling why devm_platform_ioremap_resource 
can not be used.

[1] 
https://lore.kernel.org/linux-arm-msm/20211210020148.B2EA6C004DD@smtp.kernel.org/


-- 
With best wishes
Dmitry

