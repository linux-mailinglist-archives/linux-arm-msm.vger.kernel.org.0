Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCDE79E49B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 12:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233917AbjIMKKU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 06:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236742AbjIMKKS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 06:10:18 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AEC19B2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 03:10:13 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso65099266b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 03:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694599812; x=1695204612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vh6ZIi6nMsLrRRxqOjWfkaipQvBtSLo+A79xgjZA3OM=;
        b=WOpeB5ZicVvGs2u6S4aL1NalU2Amq9IK1aOS+foQ6osC1V3hzDceo/Jr2N2i8msBNV
         qhc3nMgYKnMgCdTHXyxm4EG7Uq34LYqwOmiGL0Bbte7yhp9Wjb2W3JjyNMaEeoWRmrn3
         d8RZScSSQETdrNkswR266B3CAD/4sqWTOADvizvxenFI2EGZig82an7eVJND6X9c02PI
         HM6mq5aRefHi+7hMDH4jYIijZYvUlcWWOG/X3K39APrWlgV2JhdyqDglCJRE5qpAI0m7
         2ZUEPAF2qgAo7od6Q350ayy/BLMIwWN9F8T/fj8jh0eCm3YGomWeMo2S+cfvSNJbBcrM
         +HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694599812; x=1695204612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vh6ZIi6nMsLrRRxqOjWfkaipQvBtSLo+A79xgjZA3OM=;
        b=VAlNZoeEeFPqrE4/2HoA+33eTFA6DtwbTT3ZU1W2Oe9zYKqWMnKgmfMJVbE5lsMBgA
         8C+nmzvkf1z/rDhiajxnWk3sp7Nuwl5ixZYPo4S7l4pcctTApcO+RiF8XlM8Et4e9FPt
         w6YYBBBojhCG7o+oRuBSyHKemmDpl1Wvex8Fpo/9AI13mFtdureP0X6JcyGfbuYklExq
         HkxZEZUL+61sIbTenKKLvB2Qo0LFeCE+N2dxVy0F6Hw0w6S9gDEQO7RNSZ4e1PqyJ4+b
         03TzDCBXkYJXkALvisAcCS38KgcJyYFQ7aYz0vDTOQi6P2gt6KmqCB6EpI71+9poqBaS
         RGtA==
X-Gm-Message-State: AOJu0YzxUzyBAcKI//jXvV1HB8JZhDG3U9ag19jYYFicwLsPWbXWbLDF
        ch/Ad2ZLzzNKTjuDpg3/OqsJoA==
X-Google-Smtp-Source: AGHT+IGnIgolQtaeVsRX2qx9h4HngHi87gK1T5gzmwaa+KvkvPiGjf4cA1lz+N0x5u5d5rcYZQYnIQ==
X-Received: by 2002:a17:907:7638:b0:9a9:ec12:4825 with SMTP id jy24-20020a170907763800b009a9ec124825mr1423380ejc.56.1694599812415;
        Wed, 13 Sep 2023 03:10:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id we21-20020a170907235500b009ad8084e08asm2458203ejb.0.2023.09.13.03.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 03:10:11 -0700 (PDT)
Message-ID: <a38fc815-0926-06e7-4751-6f5d1a58757e@linaro.org>
Date:   Wed, 13 Sep 2023 12:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: pmic: rectify phandle for
 gpio-ranges used by pmm8654au_1_gpios
Content-Language: en-US
To:     Shazad Hussain <quic_shazhuss@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     bartosz.golaszewski@linaro.org, kernel@quicinc.com,
        quic_anantg@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230913094111.14744-1-quic_shazhuss@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230913094111.14744-1-quic_shazhuss@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/09/2023 11:41, Shazad Hussain wrote:
> Use correct phandle pmm8654au_1_gpios referred by gpio-ranges for
> pmic pmm8654au_1.
> 
> Fixes: e5a893a7cec5 ("arm64: dts: qcom: sa8775p: add PMIC GPIO controller nodes")
> Reported-by: Anant Goel <quic_anantg@quicinc.com>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>

This was already reported and fixed.

Best regards,
Krzysztof

