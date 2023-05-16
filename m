Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3FA97045B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 09:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjEPHB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 03:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbjEPHBk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 03:01:40 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630111738
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 00:01:39 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so4064298a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 00:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684220498; x=1686812498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oWSC2UwX8liE4S0vKrYK9T6F4NTqOvibNevIJEGFGVU=;
        b=lqNpLr0pH5cDHUeoT8t79b8L6CLXiJrEOAI9bgIpLS4JEARMKp5NtFpTMhIYiwpfWh
         r0Hmh6f4DlxiDSSgEd/6Q2+RO0VeBdom52lLHbgsLZvwFzrra5UsnZ+ob3eMlUKj0aYQ
         T+wFlTrflz3h69KCdoTO8Jbj2RE009FlC2LSj0ygiXcIsdSm8jlpwjtHWJ1/dZLHNI4q
         U1zP0wdTlr0tFS4xHBdYB5UQD6qiHTVzxyIkJ2ink2snFlGh4y4u4Xt1054hEoxVK6M1
         3rmrHiR+847fSr4zRRUKudwCmOGdQNZyIRI0315oS428+90iW+dk9Y2cdPV3wrwWJXYf
         +COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684220498; x=1686812498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWSC2UwX8liE4S0vKrYK9T6F4NTqOvibNevIJEGFGVU=;
        b=ZgtsNHbQ8sefMSErb7mDATKqWHUlm9sjeLL2Mb+OP+OYAHu6RE7BXubgs8IQtdHKRt
         r/Y3dV4NerRe+4sKvIW9QluJvy7yKijDf4Ni3FcMV9G3SbuP1EFzQC2JCHqUAHi29mRA
         8qd6JGy81wMlinMkTTHRQRPmVgqkcaiaX9Y0XJd7jKYMXW7SwH3DYexQWO6U0Emio6Is
         d2MYiSF4Kz16nNz/o7T1qy2XwhVoDYEjb+C8UmdRm48BW2tNRxwE7cxHl+u1Hd0hTwq0
         i60h5jt/5drFSO//i8B716mniGxbLQOFYHAfHKRuY6frBcnMxApxAZ6pNB4EvpZyOjEH
         y9pg==
X-Gm-Message-State: AC+VfDyGII/ztglA/J0x8asLEYVYxRuz/0g5sGEFqyXeBy2K46Fb/WMy
        eh3lgufFghx6Xk3d0xUW9zSXaA==
X-Google-Smtp-Source: ACHHUZ5btIh6jnjGuaCYsGe/P9uwJa4VbSEI+T7Gyu/HTJbppRbPpkW7lefcQvgEl4DUufq+qRoWvw==
X-Received: by 2002:a17:907:318a:b0:965:ddb1:99d3 with SMTP id xe10-20020a170907318a00b00965ddb199d3mr27954776ejb.14.1684220497865;
        Tue, 16 May 2023 00:01:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4d4a:9b97:62e:1439? ([2a02:810d:15c0:828:4d4a:9b97:62e:1439])
        by smtp.gmail.com with ESMTPSA id hb38-20020a170907162600b009661cf921b4sm10315338ejc.202.2023.05.16.00.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 00:01:37 -0700 (PDT)
Message-ID: <912d7db5-3bb2-cbc6-ed98-eb1dd40f9fbd@linaro.org>
Date:   Tue, 16 May 2023 09:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND,PATCH 1/3] arm64: dts: qcom: sm8250-xiaomi-elish-boe: fix
 panel compatible
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230516062657.28616-1-lujianhua000@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516062657.28616-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2023 08:26, Jianhua Lu wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> The bindings expect "novatek,nt36523" fallback in the panel compatible:
> 
>   sm8250-xiaomi-elish-boe.dtb: panel@0: compatible: ['xiaomi,elish-boe-nt36523'] is too shor
> 
> Fixes: 51c4c2bd6f31 ("arm64: dts: qcom: sm8250-xiaomi-elish-boe: Add mdss and dsi panel")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>

I think there is no need to resend my patches. They are marked in
patchwork. Unless I am not responsive to something, please rather avoid
doing that.

Best regards,
Krzysztof

