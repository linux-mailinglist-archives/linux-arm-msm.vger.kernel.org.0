Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53659749A10
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 12:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbjGFK60 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 06:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232696AbjGFK6D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 06:58:03 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A732D40
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 03:57:08 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9936b3d0286so71115866b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 03:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688641027; x=1691233027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=092L2NFJ+qxRZMwDDHah31TebKjJ3Qz4BGKrTA614qo=;
        b=R3ok/LuHATPw7QzcSacAzN6Dedlw7csZlV77VLYrWd091NXov/sOQz1Wij4VxPwE01
         XhVv+F+ccfALmC+rQXbggsxkFu0K4TTSgy7pu8CJkvB6WR6cHcHUNCpDtPxmz+7MRIeO
         GszD07zUvXqDwEFJVHPH5oPObKSvEC9lhNJv9DhOvEzD4KpYPaTiPplKTmbNr4YcVo0H
         Wyiqx467fBCYXPXiJQVMY8RUlQkjPCw48B23eXVhBUlonks+a3o6u90EB3fGUkurv3ti
         0n7rutumD41NSxOb+Y8c7zbNna6V9jwbH2EOyV++X1zb2AOXb4UMyjX1smb9ZedDX82C
         iaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641027; x=1691233027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=092L2NFJ+qxRZMwDDHah31TebKjJ3Qz4BGKrTA614qo=;
        b=dZ2Sg9DZlOm2RcwFpC9cRyCwkBZMaTikpDsDUIrg2oAq4t0TvGkQLU2SIvYYjaJwES
         R0JAbGxLnfDeQnGr2e+Ls3cQOVsjATf/OhKlZqsngTquQ+FmjNCJZr6jsDzGplFREluP
         bIkvgLRn1Zf4adT+0W2NXoGpf7MWeo7cYkN5AT4grMCmEHV6FpIHjyNJGbBsDnIH8ATO
         4jHOipfOP3yS+3P7pkZ818Gq0xvw4cJimK/HDVUEX7BRsJs8C/ot7fXs22GiKiZITrXz
         g5EwK8if4vFarirz7HU8adWEpovGgUgUKzOuQyQjxpOOdiafanVJDonRVSijUyLgfCvh
         VLVg==
X-Gm-Message-State: ABy/qLY/sHOt6bRvHgZ3ap0NeSrolhhvj2jtwZxAMuNN+jwnMz5nADBF
        JLLjfwSRr9l6d+VFDCSHI1VYJw==
X-Google-Smtp-Source: APBJJlH8PRjhwyFUtcv0tpmau9uPFUcjpzmdGl4Chf6J3QkYTVhAUsi+4hAwKnBb/D8IMqz7Ftc2SA==
X-Received: by 2002:a17:906:1114:b0:978:a186:464f with SMTP id h20-20020a170906111400b00978a186464fmr1109405eja.39.1688641026853;
        Thu, 06 Jul 2023 03:57:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gt4-20020a170906f20400b009935aba3a9dsm653682ejb.48.2023.07.06.03.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 03:57:06 -0700 (PDT)
Message-ID: <529beea3-3f36-3837-35c4-1efa25d8f1f2@linaro.org>
Date:   Thu, 6 Jul 2023 12:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] dt-bindings: power: rpmpd: Remove the SoC specific
 entries
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1688635218-23779-1-git-send-email-quic_rohiagar@quicinc.com>
 <1688635218-23779-2-git-send-email-quic_rohiagar@quicinc.com>
 <318ab229-f29f-e6aa-16b8-79fa09013794@linaro.org>
 <b994f92c-331b-ca64-01ec-ec285fb2a76e@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b994f92c-331b-ca64-01ec-ec285fb2a76e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2023 12:53, Rohit Agarwal wrote:
> 
> On 7/6/2023 4:15 PM, Krzysztof Kozlowski wrote:
>> On 06/07/2023 11:20, Rohit Agarwal wrote:
>>> Remove the SoC specific entries and add a generic set of defines
>>> that can be used by all the SoCs. This will remove the duplicate
>>> entries among SoCs.
>>> The arrangement of the defines is done according to the frequency
>>> used in SoC specific entries in the driver to avoid wastage of
>>> memory.
>>>
>>> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
>>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Please compile kernel with this commit and tell us what is wrong... Even
>> if bindings were not an ABI, but they are, this would not work.
> Do you mean that individually this commit would fail compilation?
> Yes, we would need all the patches together for compilation to be 
> successful.

Yeah, it is not bisectable.

Another problem is ABI impact, but I think Konrad covered it.

Best regards,
Krzysztof

