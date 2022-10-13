Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C25A5FE41E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 23:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiJMVTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 17:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbiJMVTF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 17:19:05 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BB84E637
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 14:19:03 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id y10so2099087qvo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 14:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqR2KCYKmVm9s7WE15umjNdzmWYBIaWjIp2AMtzbdxg=;
        b=Pa8C26IhKJL4eZX7SM8BD/J/PGGAA0YkUMDsCsgw5EfR5Bt5DsaT7jPqapCXkCQ02i
         RcPg1+isjTCHpn7WLghwBg3UCh2tLbQ+1e5PJN9zuvPQNCQhrqkLRA7BRCzLMt5tVrr7
         H1vuuyz0UAIzoQXnSBupth9e6Ii3YhHvOzS7ieUT2NI0yf1ZhhYyNECwro8Ss5rfrf81
         iaeoW7exp4ThxR5YcFhtYPKyIU3gsXriXzwr2iP5hbsUKcTrWzY4wF7BHfPnTcN1Tt+V
         knAYLmOZ4BKbKnWZmXNM/iSXlCcwNvecLU9kD7PrCmP971Mj9/a56PE/+5M7dI9tv8fA
         WGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqR2KCYKmVm9s7WE15umjNdzmWYBIaWjIp2AMtzbdxg=;
        b=Q+Pl6WVEmo4cRnRKfpRbsGmFu0HLYLTjtgGbyN8l+itwNYH3Rjo78rtoAGZFKfWzK3
         gLbjbm166oZiAKTpIVmfaSkw2qpnqUqMw6QdmUJAqTXLXO0KxGicZhByQF6fLw1LG/dh
         owZgaTaUjIJAaBW26c5Qr9HmuK4UifWNuMOicRx2phvSVUACK4qmy/Jp0tkUKKZpkYR5
         w1Rojj+p9s3qI8XdiYxf0JagVXqBTIj6hpG+E5eF8ltW8M7oImtSs1tnVtu8+s/OOdYj
         ED+wDhsAVCVYECdlS5E54Ar1FnlcVhsWWXogmZayK2jr1OS+Zbd/MT5VazjnLevd4eIL
         rdqw==
X-Gm-Message-State: ACrzQf01knVciABg1jOmWPfhgjgPTB2UKPsbpVtjFWssh3sZa4m8agx6
        8IMPt2bPNQo5hZLzhiiJgZRqUQ==
X-Google-Smtp-Source: AMsMyM7lnbf0nIPv9rq8SIxhIiHobUpjXLxcKtaCEwKFZcUGTo+wZFoUDg2Co/zScjFI02QAngcwAg==
X-Received: by 2002:a05:6214:d8a:b0:4b1:9f67:450b with SMTP id e10-20020a0562140d8a00b004b19f67450bmr1509945qve.119.1665695942528;
        Thu, 13 Oct 2022 14:19:02 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id bj33-20020a05620a192100b006ecfb2c86d3sm606364qkb.130.2022.10.13.14.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 14:19:02 -0700 (PDT)
Message-ID: <6f804ef0-bfc6-95ac-3a79-cf7b0dbcc5f7@linaro.org>
Date:   Thu, 13 Oct 2022 17:16:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 1/3] ARM: dts: qcom: ipq8064-rb3011: fix nand node
 validation
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221013190657.48499-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013190657.48499-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/10/2022 15:06, Luca Weiss wrote:
> The devicetree documentation for the nand node requires the subnode be
> called nand@ and no compatible is needed.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 3 +--


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

