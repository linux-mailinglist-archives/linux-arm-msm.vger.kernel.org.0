Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52FD97254EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 08:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238513AbjFGG6E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 02:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235332AbjFGG6D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 02:58:03 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C4241984
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 23:58:02 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso704287a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 23:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686121081; x=1688713081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4r5ckWADvIeunNEBSYEKM/Q/81CyZ43oAc3SDHOV06A=;
        b=D5LHu0NTTbEdUyGlMZ43xZPsl509RpHKHHhl33Qtv5+IetJFJX9U92zpFIdk/i1RLf
         4eNXmSRqrbIQVFYTRHxZm1aKIPebzkD1fBQDFjzGsVeHKS2wzjUKeBzPqQfsxtsXV14a
         5NrG7kd/PvckTQmCTpUHGy+IUFgT+HmqoImaC/5bCXZcKq0I27285PXg1InggQEUE8HZ
         W+is7a9B9fsx+ZIlSXs3rw8bVSnUtGiyhU6jIMCulcaio0t94so88ivQS4eHRsl3S5fF
         7fiV2DEYsxx0/dsmbicQoa1YwBR23HsQGwaZ5DGaQJKKxbG7evIzlV4sP6W7HKXtVJSl
         Yojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686121081; x=1688713081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4r5ckWADvIeunNEBSYEKM/Q/81CyZ43oAc3SDHOV06A=;
        b=Hq+H0zwleSK3l1XqWP5PadbCgBs4NgcC7xs4muGZ7WTGBP9+UNfGkGuh9PDOvJyuIi
         ZtMVckjYuIS+1qlwQp8/o1OWNvxsEeHGWWOO3i4r8gTwQiuBPxkC2C6fv64MyiyZ7h0m
         AH/Dw9Rw4fNb4h6TgcoVipjob8jDs7J/9RdoacbdOxRrCpdn3JKBYSsRBARFX6bOkDXc
         /ppX1kbJYGGtJeD9F+xzoFhjp+gPM6R87GKXON7+69n6jXkq3+gL57KfQc3Od6KHwwvR
         mlpTQMxn9BO2z3OBPc3I3CiLn3sxpzqOzwv37mc9R0AVGz2DvJJk2cE6ye3amhAVTY2Z
         bx6A==
X-Gm-Message-State: AC+VfDwx1R3oO3A/T53cMrRIA3qntrU7q98bShbTU9Z7NldphRouAcYM
        C4HKY4EVsii+7XJe+UuEuPM87g==
X-Google-Smtp-Source: ACHHUZ7fu0rabSgiRWnoDuVUvfCn6LZF2OhmoDNeDBuj4KR7YKeD2MulnLNleOKJe6o6wIMQqNdSFQ==
X-Received: by 2002:a17:907:2d93:b0:973:cc48:f19c with SMTP id gt19-20020a1709072d9300b00973cc48f19cmr4610485ejc.56.1686121080808;
        Tue, 06 Jun 2023 23:58:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u26-20020a1709060b1a00b00977d7bd9069sm3826614ejg.179.2023.06.06.23.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 23:58:00 -0700 (PDT)
Message-ID: <2edc5ad1-0000-572d-317c-387dd9c25450@linaro.org>
Date:   Wed, 7 Jun 2023 08:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
Content-Language: en-US
To:     Rudraksha Gupta <guptarud@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20230607050025.86636-1-guptarud@gmail.com>
 <20230607050025.86636-3-guptarud@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607050025.86636-3-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/06/2023 07:00, Rudraksha Gupta wrote:
> Adds qcom,usb-hs-phy-msm8960 compatible
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

