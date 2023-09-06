Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 469B5793B8F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 13:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234431AbjIFLjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 07:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbjIFLjy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 07:39:54 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91158A9
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 04:39:49 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99c1d03e124so503196566b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694000388; x=1694605188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6139+D6DWYBEQFbYVRHbB1M+9Vyz8rmHNEFxByoPP0=;
        b=DXrpyxS4HGSMeCegmtzGkdl4q6nVFlGI1LTKrueU/a8DLUjT2ElkB7bKAunLydCGGL
         tf3UiaBy3DPaKQg5RNGCf9IjJkiEdASztwWrnAdjHv24Mei6gE4jrwqdEufRWkq1lwOG
         XL38ovyvnxC8Nn6ILYM2PN+smLaWlb+896nG0x5/1Hwy1+w05C+tRY5Qe0dHxfNy7FM2
         3j5qoeS4czLTSG6l0AYyoniquVPDEye9eh/roxIMNC8IylXHFALZpYZkMK3GrZmqoVNE
         ZN5QgeB7/hX2LQ+d+Vii0bwLArJ1JzRYAxBYFfFO3soHOypBOydOlxj9sRsxgg6D98TI
         P+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694000388; x=1694605188;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6139+D6DWYBEQFbYVRHbB1M+9Vyz8rmHNEFxByoPP0=;
        b=JleiCUCyUD6jbpNldTUYAvw3/w7d9Gnu6O89zv3mqwh/MxH9dygY5paA1+/tt0EbhM
         2uqc55vMg6Th7YSpORUTXkgpcu9qicvxtGWp5d33iQr1oJWShDR0N+ze4SvC1B/ZI3Kq
         W2m7hj6KilF89B3Fea89dOS7u05xJyjsWCPDOd2zuUM5pW0cCVw9w1UefRrN9ZcDW/1G
         +2KYf3wgjCZAEj8HYDUrYDVz3GFUCrFFcKIRNMaF4+0PUCeS7ZA106lk+4KsDyptitlO
         415YxwICMaQcXfGkl2cRv85UJEGY9cR14SaaFrQwQV22P2j0btDUhX5ueUx7m4fpZZ9x
         TpfQ==
X-Gm-Message-State: AOJu0YxvPNGpvPzo5yfXK0cpGvUwXPTT4zQV3GwL3GpHNKgAvl6rk2Cu
        SX0aLUMgyysvuUNhMufaYHnOrg==
X-Google-Smtp-Source: AGHT+IGqFj+iPyflVwiAkrWZiS4zdN6+gwVCT2jc689Q3pjrCCMR5l4L0szRSVolWGaS5u8WlpXQZQ==
X-Received: by 2002:a17:906:3149:b0:9a1:be5b:f499 with SMTP id e9-20020a170906314900b009a1be5bf499mr1663852eje.24.1694000388047;
        Wed, 06 Sep 2023 04:39:48 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id qx12-20020a170906fccc00b0099bd86f9248sm8871714ejb.63.2023.09.06.04.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 04:39:47 -0700 (PDT)
Message-ID: <fe346849-cd0f-aee5-9ab9-ea581025329b@linaro.org>
Date:   Wed, 6 Sep 2023 13:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8550-mtp: use correct UFS supply
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230906104744.163479-1-krzysztof.kozlowski@linaro.org>
 <9c7fae56-85a2-4691-8192-24237761d25c@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9c7fae56-85a2-4691-8192-24237761d25c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2023 13:28, Konrad Dybcio wrote:
> On 6.09.2023 12:47, Krzysztof Kozlowski wrote:
>> According to schematics the VCCQ2 supply is not connected and the L3G
>> regulator instead powers up the controller pads (VDD_PX10).  Use correct
>> supply vdd-hba and drop unsupported current limit for the vdd-hba.
> Why is it unsupported?

Maybe I was here not precise. I move the regulator from vccq2 to
vdd-hba. vccq2 has control of current in UFS core driver. Bindings also
allow it.

vdd-hba does not have current control in UFS (ignored) and bindings do
not allow such max-microamp property. Why? I don't know. That's how it
is done.

Best regards,
Krzysztof

