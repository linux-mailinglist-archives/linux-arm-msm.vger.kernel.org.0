Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3C9A7B6754
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Oct 2023 13:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239887AbjJCLMi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 07:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239898AbjJCLMh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 07:12:37 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEB6E5
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Oct 2023 04:12:33 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c1c66876aso133266766b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Oct 2023 04:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696331552; x=1696936352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPTTNXhP8n0kRkKvH2dqfTNO64xQ4C814TDzd2IJmuE=;
        b=CjPdvE7VpbKu4Xa608ZD67mbV83vD+BNRbYjmzrkICOjsJSAGHwCkixEhLucNuHyVX
         sxYzqulvIP4FPtDLQs6TksLQGkkku6YpgB5HUYl0bV5INCIoOi86wYM9hrOkvwYxKSoW
         Brq7/NN/cs8EwWG4zAHAWewq1AAiax5RxzrEVrEBCH/XMI7X9OvUhk5gNQY9omB9KR+I
         s5zh9h2+3jqlhzsy+SfqRyzA3WCzOBrpY5kPUwajKdfxol0LOlPQIvKqdn+UUelo4c3o
         qekCHsi16M0s+6NkY0h1oT5Iv6kL3MO9wGx6rZ7GJJlYp+OdX9WADqmHLqF4QWusbMBq
         zkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696331552; x=1696936352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPTTNXhP8n0kRkKvH2dqfTNO64xQ4C814TDzd2IJmuE=;
        b=Tg0AVNZ5NtUu4n/W8JFs/eyUR8583p/8HF3lu5FggTDCGHGZqyJNVhdu2PiucVFDL1
         cG5dISsDeaL/gIvzAvKiPfIlR3XPJXscaAllaQR1TzFmdju+UxhnMXx6qazhdmiZk7C5
         7q3kLDcPutSxhYdpSzNurKmfJ7/atwfQoG2Ok5FgLkDlBr5nMSSV7Mzyw4E8ZxZfpNfO
         vK4hWsk2wl/OMrmMNjZFrnTVGPXbZ3cwWsYR6x3rh2Fg415+XoSNqOylYZIq0MQW8bOh
         X/DDhOYWq1jfI6m2LU+oNk/aWRrCBpsYb+GHyPlAJXOKEU4V63LOchJ7PLscQcvljQHa
         v5tw==
X-Gm-Message-State: AOJu0YxPu0JXqfq+fbhzXNPlkJw8DNmf+Q2tGQsepeG+wQYtUjExlt1i
        CgvI1bl85Mz1ZHNNjljQii2eoA==
X-Google-Smtp-Source: AGHT+IFqHg0kx2RWxf972jQKVm268qDKt60nP19u4DZYSPKFvJE5xraLNylJQKM7/K5V/yONNEkbwA==
X-Received: by 2002:a17:907:78c4:b0:9b2:b768:3cfc with SMTP id kv4-20020a17090778c400b009b2b7683cfcmr13620053ejc.1.1696331551830;
        Tue, 03 Oct 2023 04:12:31 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id gh18-20020a170906e09200b009b27d4153cfsm894576ejb.176.2023.10.03.04.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:12:31 -0700 (PDT)
Message-ID: <387bf3df-ee1a-4d21-8141-c3b00eb23991@linaro.org>
Date:   Tue, 3 Oct 2023 13:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: display: msm: Add SDM670 MDSS
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Richard Acayan <mailingradian@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20231003012119.857198-9-mailingradian@gmail.com>
 <20231003012119.857198-12-mailingradian@gmail.com>
 <fa926d91-f748-4886-ae6d-f55541e40f5c@linaro.org>
 <CAA8EJpqPP=X8-jD_mwSmO8OMaxb_0Yo3j-b9chyChORDyvdWAQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAA8EJpqPP=X8-jD_mwSmO8OMaxb_0Yo3j-b9chyChORDyvdWAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/10/2023 12:31, Dmitry Baryshkov wrote:
>>> +patternProperties:
>>> +  "^display-controller@[0-9a-f]+$":
>>> +    type: object
>>> +    additionalProperties: true
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        const: qcom,sdm670-dpu
>>> +
>>> +  "^displayport-controller@[0-9a-f]+$":
>>> +    type: object
>>> +    additionalProperties: true
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        const: qcom,sdm670-dp
>>> +
>>> +  "^dsi@[0-9a-f]+$":
>>> +    type: object
>>> +    additionalProperties: true
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        contains:
>>> +          const: qcom,sdm670-dsi-ctrl
>>> +
>>> +  "^phy@[0-9a-f]+$":
>>> +    type: object
>>> +    additionalProperties: true
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        const: qcom,dsi-phy-10nm
>>
>> This does not look right. Why the compatible is generic, not SoC-specific?
> 
> Because for 10nm DSI PHY we don't have SoC-specific compatibles other
> than the ugly 8998 compat string.

OK.


Best regards,
Krzysztof

