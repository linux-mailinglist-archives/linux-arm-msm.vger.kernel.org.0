Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9B466463A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 17:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233327AbjAJQgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 11:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239160AbjAJQfV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 11:35:21 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B32887939
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 08:35:15 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d17so12406215wrs.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 08:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z2NxH3tSGz9WvFhZCl9Fb7nEkJ5kzb/MmPRaT/+ZbG0=;
        b=cFjYWHmWHQL1/h62npQEdLV/ngA8ytUpeQnwiHlSeAYx7qaWtaicnfIi2n5sRIxcth
         euG5JZbE6ktu4XnJJ3fUIQj7dGn328aBV5hKnQ0Tqq6XMj39jNKaQLIDPuZE6JMzNuB5
         IlJJBSaCKUcDNnO4s6PQqcjPd0iSAa2LSleP2fc852ixhCEqkfJ9BLRNLLG3rF54IEaP
         GS4ZPKSbWKXdnHTcMaPQ7JaSljUDdKnrKZxhb8IgRclft0UUccmgCzM8ezrzKttfzEtR
         eiC4Rl6hknTSkDx9W7QeFn54Ue8Oju3wWPHs3ezufSsIoNIilC0rZUBDkskgdcUCJjTT
         3H/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2NxH3tSGz9WvFhZCl9Fb7nEkJ5kzb/MmPRaT/+ZbG0=;
        b=5vNN/EB2iIj0OnPM241eOcXEBEuG7CQSD8MOuKZMfAFG2WBDXWHwaxp2q2gMBqnBX+
         IkIgBAT8C0fO//BuMZxv/WfYJctJiExUhljQ/8SpVN1uEhQSDnIuaB/xCLEhz/CHNUEA
         ETWe1eQXcdBTF3kuHCkPdG8bifsgSKq+TyiGfvhwwi9bQ+8TcWMzpeoiinIEjk/YyrAI
         yYhztKKOJ1lzyftexLIFUJKZIzgI5XTej7cXxJ3uPRpMfcV2AVgRsuPFGcwfLwcD9yXO
         A7b8oaFhXrUTDk+J3hHjQg0i94AihKciQS18sSapKfH2nhTPB3pp6+cL9eap/Aj4gkBn
         6aag==
X-Gm-Message-State: AFqh2kqEi+y4Ht5XiGxBd4xyrssAu3P6OzDz8SeUYM076df9F/iL/qJY
        PUr/aJiXosE9BffVnpFQBm7fCg==
X-Google-Smtp-Source: AMrXdXsv3NpHNRaDEDLBjfUpufgq/yn85beQYYnajrkfAYzc+rvqxoi0MR1o3zZKXzKOANIzLhnhWA==
X-Received: by 2002:adf:fb08:0:b0:29a:375d:4c41 with SMTP id c8-20020adffb08000000b0029a375d4c41mr19992583wrr.14.1673368514084;
        Tue, 10 Jan 2023 08:35:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i5-20020a5d55c5000000b002a6f329203esm11717830wrw.61.2023.01.10.08.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 08:35:13 -0800 (PST)
Message-ID: <8530aeef-8fdb-ede7-700e-856e5cbc6a5b@linaro.org>
Date:   Tue, 10 Jan 2023 17:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-zhihe: Add initial device
 tree for zhihe Wifi/LTE dongle UFI-001C and uf896
Content-Language: en-US
To:     Yang Xiwen <forbidden405@foxmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jaime Breva <jbreva@nayarsystems.com>,
        Nikita Travkin <nikita@trvn.ru>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230110155014.31664-1-forbidden405@foxmail.com>
 <tencent_A7FA00B086BB0EFFDC1C64744FF85DAD2B06@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_A7FA00B086BB0EFFDC1C64744FF85DAD2B06@qq.com>
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

On 10/01/2023 16:50, Yang Xiwen wrote:

Subject: too long. drop redundant information. "initial device tree for"
is kind of obvious.

Drop "zhihe" everywhere. You just said it is non-real company, so how
can you start using it in context of a company name?

> This commit adds support for the ufi-001C and uf896 WiFi/LTE dongle made by
> unknown manufactures based on MSM8916.
> uf896 is another variant for the zhihe usb stick. The board design
> difers by using different gpios for the keys and leds.

Run spellcheck. "differs"


Best regards,
Krzysztof

