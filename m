Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4CB8723CE4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 11:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237087AbjFFJR3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 05:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235933AbjFFJRP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 05:17:15 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C660410F0
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 02:17:04 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-977c72b116fso457334766b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686043023; x=1688635023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WFZO1quiYCb7WK7FGJd2k62/gfvxHreHYp1ujyVcgQE=;
        b=YI0x4LbkmazNjw9SPHR89qxvIBqKi+rZQM2uGk0dQ2QkSg17hxKx9pO3DDbhwse1th
         qLjZSeAtWLki/tTjyWSkemYjyXXNrhfa6xnCifIKWNPMtUn8ni7fmv4owW0b70Ndu9zj
         a6a0A4sInpNznlHuzIYI00Mls+GuEGSVYqcJbnl9Nbys5CktNl49x/GIi4ey+IvbrC8t
         gV8z1YB1TZAFZ/qop2kQolfl8pE2HI7nLIEvpd3Z4O5pJHiZBW+9hUGZD41lJ1d7xy7V
         0iTIgudvlsGTLeFLlGrHWVNBkL0JTOOI2xwPrv6bntw9BEcbB5Z/fj4DokQIFPJMp/35
         oTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043023; x=1688635023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFZO1quiYCb7WK7FGJd2k62/gfvxHreHYp1ujyVcgQE=;
        b=jiemcO/Q4DUJDQrEwXZLhGY2Ad8UdNP61c9H6tTkgZO9WBXe8HbTlYiqrfjaHKJ/Cz
         zX+/J5Ak3qVyA6gO8pnpSUqGpm6IiQRQ4ON6WHBYsMpavX1g2nPiUBS6q6wYd3Y/+lkl
         1CijSmezuUkDtHISe90PjwX5YFYyIn5413kxuu3GCKbLWfh8Ss1ve0xLt5nnw4xQOTWx
         qJc4N++mG6rUVot1/sWs+8Xd7GdBbgM2c9tcPnzddp5nt/tE62vvD7dbUwlAhCqpSRJ6
         2FNmgdtojl2+oy5/ZnmtoqEvZbTVPl05pp2YmxCVo7BFrhAzsDJCPASUjZmYYbxlBNjd
         +AYA==
X-Gm-Message-State: AC+VfDxhwEuzj2n9IT8Me4Vvnkpr3QcEX19qP/Nt5v+EU3N4hWj36Hvc
        XhrvRstYrPgEsQjCn9Sgy0BoMQ==
X-Google-Smtp-Source: ACHHUZ4PAeDI8t67bUJhdaqBmTvjv2z7fbXLke2PqprP5R52QQZ3TpwVeTM5xT7yvCcvZsEeW6ORAg==
X-Received: by 2002:a17:907:3ea9:b0:973:7dfc:f052 with SMTP id hs41-20020a1709073ea900b009737dfcf052mr1649432ejc.30.1686043022772;
        Tue, 06 Jun 2023 02:17:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l12-20020a170906a40c00b00971433ed5fesm5214639ejz.184.2023.06.06.02.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:17:02 -0700 (PDT)
Message-ID: <30c702b2-18c6-ed38-ce7e-6f098a38d3c3@linaro.org>
Date:   Tue, 6 Jun 2023 11:17:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 06/14] dt-bindings: soc: qcom: smd-rpm: Use qcom,rpm-proc
 in example
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v1-0-e0a3b6de1f14@gerhold.net>
 <20230531-rpm-rproc-v1-6-e0a3b6de1f14@gerhold.net>
 <d0fa3b01-edab-fe8e-c309-036cbbcec7ab@linaro.org>
 <ZH73JxLd1i1vUcyw@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZH73JxLd1i1vUcyw@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/06/2023 11:06, Stephan Gerhold wrote:
> On Tue, Jun 06, 2023 at 08:37:04AM +0200, Krzysztof Kozlowski wrote:
>> On 05/06/2023 09:08, Stephan Gerhold wrote:
>>> Use the new top-level rpm-proc node instead of having a dummy top-level
>>> /smd node that only contains the RPM but not other remote processors.
>>>
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>> ---
>>>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
>>> index c6930706bfa9..06e574239bd4 100644
>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
>>> @@ -120,10 +120,10 @@ examples:
>>> [...]
>>> +        compatible = "qcom,msm8916-rpm-proc", "qcom,rpm-proc";
>>>  
>>> -        rpm {
>>> +        smd-edge {
>>
>> What about binding updates?
>>
> 
> The binding for this is in PATCH 05/14. The old binding replaced here is
> deprecated in PATCH 07/14.

So changing example without changing binding is not an atomic change.

Best regards,
Krzysztof

