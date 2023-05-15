Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0157027CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 11:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjEOJFI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 05:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238839AbjEOJE7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 05:04:59 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5BDC9
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 02:04:57 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96adcb66f37so413925866b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 02:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684141495; x=1686733495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1e7xyhKbSUAtL/71OLze3JqXZR39ywi21V8nEPRiV68=;
        b=MgrbJuPSda7/FkfizR4/3Rn0sQfPc3PH2digK9QUZv2bZ042i8f4m24og7HQejhAiZ
         TcWng0vCnqHgKU3qfEwkq/uySuYn7dLwXbPeeGr8I4gEzyaIiOBRodAcvdNrTg5qBTM/
         7GA8aiRO/orCzS2aVyrOus/FXdrWZ0K5wOmVkZmu3lpJt3lyY9KApDW5uqt/O7J76Uy5
         db7C3o8bgPfVefXXLIUht9qMnt5lBOA/Jj9+RzMOlvDsXrZvcRDcKmQ5ISEPu03TeYkt
         /bstflZYkyJdPf/VqkorhrdaFpiq+X1NoDFj90Q6fwiLgw5Adml0LBvakLNwuxBTlmnH
         +Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684141495; x=1686733495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1e7xyhKbSUAtL/71OLze3JqXZR39ywi21V8nEPRiV68=;
        b=kqmaJDmCgNz2XY4loghryHHXuEfVGW47CcXqXY6XiD9NZrvMRFnCURG0F8+be44sd/
         dZUKqzjb9B3cidjm7cCfmSTe8xnHyNAecBKkQnWHQN3cqshrS5ZflpiryVGlWbPl/qjn
         GG+MnblFSabEsiwh24GOG8/wW4O3NUAsW+MBTwujLtZ2HSnaZ5g73CXf4mzCzwlT6IkI
         tXwfnSVrH9UdKhCK04FmUdvDMBTl8zCjvGkOd8bjl5IpVNkc9U8xjOrew+fev71oXTDv
         a0ujzkoCFjbn0ZTIRMfVUBrRlbd6A/mWBJCVbasLw+aaGQ7Wq1CjM6CNdn0hoICVR6uh
         5W0w==
X-Gm-Message-State: AC+VfDzh4GLKsaWMBHet6fZeZwJHxE579MYgUZ5jzQ9JJobPqv8VL6Sx
        E1QXJI3eutakGuw3wJmtWYrDMNT2NKX/SVsvygN9+Q==
X-Google-Smtp-Source: ACHHUZ6/arwWykTMjW8t+mn8sE98dIyHPxmoftrOdRUms9psWi0+scmOgQUrHXIQ4Gm7LEJOfzX26w==
X-Received: by 2002:a17:907:842:b0:94e:c8c:42ec with SMTP id ww2-20020a170907084200b0094e0c8c42ecmr27657027ejb.20.1684141495477;
        Mon, 15 May 2023 02:04:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id ml17-20020a170906cc1100b009661484e84esm9245894ejb.191.2023.05.15.02.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 02:04:54 -0700 (PDT)
Message-ID: <ec7dcbbb-7e9e-04bb-930a-0b96acbd4aed@linaro.org>
Date:   Mon, 15 May 2023 11:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 02/10] dt-bindings: nvmem: qfprom: Add compatible for
 QDU1000/QRU1000
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230512122134.24339-1-quic_kbajaj@quicinc.com>
 <20230512122134.24339-3-quic_kbajaj@quicinc.com>
 <4766aabc-9b03-3241-82e3-8c4799ea7978@linaro.org>
 <ec2f0259-9d57-7125-7df8-c773b60e8c72@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ec2f0259-9d57-7125-7df8-c773b60e8c72@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/2023 09:08, Komal Bajaj wrote:
> 
> 
> On 5/12/2023 10:26 PM, Krzysztof Kozlowski wrote:
>> On 12/05/2023 14:21, Komal Bajaj wrote:
>>> Document the QFPROM on QDU1000/QRU1000 SOCs.
>>>
>>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
>>> ---
>>>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> index 8d8503dd934b..59082f6e8c9f 100644
>>> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> @@ -26,6 +26,7 @@ properties:
>>>             - qcom,msm8996-qfprom
>>>             - qcom,msm8998-qfprom
>>>             - qcom,qcs404-qfprom
>>> +          - qcom,qdu1000-qfprom
>> Above qcs, to keep alphabetical order.
> qdu alphatecially comes after qcs, right? Did I misinterpret your comment?

Ups...

Best regards,
Krzysztof

