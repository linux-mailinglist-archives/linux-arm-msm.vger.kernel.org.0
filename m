Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1762473B253
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 10:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbjFWIIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 04:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbjFWIIf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 04:08:35 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93EE1FEF
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 01:08:30 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-988f066f665so34907566b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 01:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687507709; x=1690099709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mp20BGhs0XvV3lIs6JOjcLuOy8WK9QGNJZoe3Xf5rIg=;
        b=ZuX9fp5CkoOW74bUtib5WMACzLBOIBzsjYDxwjXU9I9gGQqNRjKE38M5lnhJntWefh
         iHTW1LRaKgQ2du1Jbi66pq4vcvKnBuNcsXRBMvdcBXCTOSZjIbsJNrtaBPuhZfN8ZDz3
         LvklX67c+DTQe3DcZI8w+f6dM+bLJhR1bD+wBG7iFTYrtAkdYPKEIRnuLOYDnOBU7+tB
         S/on9kE6OXNvIPDFffB5vFdiUtFs09S7bgv8obp4eCrdXakQ3CcPNXY19FK38f3LvBI0
         b1nocMlVWGiU0I+dsTwIwrRd2TSy9YYhIEQNadlqrfOpu22Zm6Y84j9xnvABM1814kPb
         3oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687507709; x=1690099709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mp20BGhs0XvV3lIs6JOjcLuOy8WK9QGNJZoe3Xf5rIg=;
        b=dnv5VKwbVR09TF5icXsT4pW3WrFnUq+N4Okfjx1eVtvtkM360IIxL0RPYQChTe+tzF
         P9vjxof7qdt9wLjEosO2hTOxJZuur7oS5Rsw6+FDR8y2ws8ZVbvoqmPVUt+qZV7KM2OJ
         GPsU/sv+OrTkbNzKPxEbLACl96va09dhe5zk8xGUORA/aPs6bzQgtf2TxeZX+xctaDuK
         hXVyJtFYcSMDGRmAAPAI5ss14Ew/NhirzHNgDTlZ1py+jptXlGZ4c8YClJnLFzmwtxLj
         e7ht9cSf4pe2a0JMrN0t2fC14m6Js907G6MOVYi+V19Mrrg4VmjSaAvBObhJqzrv2XWy
         aqSw==
X-Gm-Message-State: AC+VfDy7HipGN+9wrPQY9/sLHlakaw9LXYe9QBrZTqRtwFjJqmy/tFhZ
        gH0ipNBFm809wvEJAtYw5vwleg==
X-Google-Smtp-Source: ACHHUZ4bdgTVBJHUBS8Eb40jSpl9xmaCaFpPY+WUFySk47we5BeGwuNXlRZGzFalcblrjeyGrqaorA==
X-Received: by 2002:a17:907:8a08:b0:987:ae30:4b8c with SMTP id sc8-20020a1709078a0800b00987ae304b8cmr16007348ejc.70.1687507709385;
        Fri, 23 Jun 2023 01:08:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r16-20020a1709062cd000b00982c5bc1e8asm5644025ejr.114.2023.06.23.01.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 01:08:28 -0700 (PDT)
Message-ID: <fffa4486-1f76-f7e3-2bc9-21dbe40a606e@linaro.org>
Date:   Fri, 23 Jun 2023 10:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/6] dt-bindings: phy: qcom,m31: Document qcom,m31 USB
 phy
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, p.zabel@pengutronix.de, arnd@arndb.de,
        geert+renesas@glider.be, neil.armstrong@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org, rafal@milecki.pl,
        quic_srichara@quicinc.com, quic_varada@quicinc.org,
        quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1687414716.git.quic_varada@quicinc.com>
 <4f4136a91b24d3ad35fa12bd19fe14b83da9affe.1687414716.git.quic_varada@quicinc.com>
 <20230622144627.GA1672260-robh@kernel.org>
 <20230623054508.GA13261@varda-linux.qualcomm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623054508.GA13261@varda-linux.qualcomm.com>
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

On 23/06/2023 07:45, Varadarajan Narayanan wrote:
> 
>>> +
>>> +description:
>>> +  USB M31 PHY found in Qualcomm IPQ5018, IPQ5332 SoCs.
>>
>> Where's the IPQ5018 compatible?
> 
> In the previous version had a default and IPQ5332 specific
> compatible. IPQ5018 would have used the default compatible.
> However, in the review was asked to drop the default compatible.
> Hence planned to include ipq5018 compatible and post it in
> separate patchset while enabling IPQ5018 USB. IPQ5018 init is
> also diffferent from the init used here.

Your previous patch did not have ipq5018 compatible. There was nothing
indicating that some default means ipq5018...

Best regards,
Krzysztof

