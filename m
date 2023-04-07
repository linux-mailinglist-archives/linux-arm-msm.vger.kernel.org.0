Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5C36DB3D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 21:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjDGTBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 15:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbjDGTAs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 15:00:48 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A22CC22
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 11:59:22 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id by26so10290832ejb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 11:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680893959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4gXxWAEpg5Rm1Rq7UASr1bTHF5oTI5KWV+ZISdckLc=;
        b=oRK9lLC6UbmvHYcXRo+sAjYUYUuyKkcnbOrbut/Q0Snt5P5eCzm7ach3k+or2N8DMt
         wqYYqGmbYYuZHciMqTw9VehAG2Rme8jw0EGReCe+bJLeNn4mRGRfFU6EWYP5nlUJkk53
         NJtyiNa/13SsE97ykYwiT5Xh9VwLGpTfqEV98ktoaz4aCJIRSapZgZ4gGsLuEvLRLEWu
         WiIx8/BA6i1f2IdPYGLVwhIisvU1Vzez/kqWE1IaGEnB3/zqxUq37vLYQPtZzb5JPem2
         kgaFozT42Bzn0JHFEzvHKU9PEoEGTNFiiJ/u+Xox2dvBnhl3G6tA5RxLEF8lZs6y5Ba6
         geJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680893959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4gXxWAEpg5Rm1Rq7UASr1bTHF5oTI5KWV+ZISdckLc=;
        b=8J/6XkfzZW+MHKHXsxk/e4lTwvDeXXzcuEGhu+6PbkL5Q1dH2EowoAtPmm0YO0K+3P
         FDLwMcI9Buhueu06d5ayGEIcNuVgMOrL65K0SBNHVqc2S+kw/kLmueHvFIUV0LbqjWIY
         JA0GevLwuHdrmF5U8yC1rnbH/Np4CUmqXSmG7OGLVrfQMgbREg6Q4CeEgJpgg2Usndnf
         i/ba7Fd2B6YOS1D3ENjrEv6ise87RXyyYxqvm/0STLzheXmVQ/FiVDmC/T7NdE4RXjHV
         HN+JxuhegxIIU9n8QuWWSylVmBCDRJ4f7UHOHqfvrher8qjWePFnil/rVkPxmXDdm514
         fP2A==
X-Gm-Message-State: AAQBX9ejsC/Ivzh6g8Q9iUAq5nB20gQ1rJXGxS2e8Waf6L1TAVuE7kgJ
        zeuZ36Wbp8KWQ591OO37Ih0jjcDHSHK6LO8vETI=
X-Google-Smtp-Source: AKy350bn9QHX7GytRyUeXRQIA9pOfMk4oATxEKgAnxVxIoAdHvM+67FAlVkn//GHTP+qA57YsQAKqA==
X-Received: by 2002:a17:906:2658:b0:878:61d8:d7c2 with SMTP id i24-20020a170906265800b0087861d8d7c2mr404580ejc.39.1680893959662;
        Fri, 07 Apr 2023 11:59:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b20f:8824:c926:8299? ([2a02:810d:15c0:828:b20f:8824:c926:8299])
        by smtp.gmail.com with ESMTPSA id v1-20020a1709060b4100b00932ebffdf4esm2313044ejg.214.2023.04.07.11.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 11:59:19 -0700 (PDT)
Message-ID: <94e4ed7e-501d-11fd-ff69-69c81902deb4@linaro.org>
Date:   Fri, 7 Apr 2023 20:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: qcom: Add QRB2210/QCM2290 and
 RB1 board
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230403-topic-rb1_qcm-v2-0-dae06f8830dc@linaro.org>
 <20230403-topic-rb1_qcm-v2-2-dae06f8830dc@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403-topic-rb1_qcm-v2-2-dae06f8830dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/04/2023 17:50, Konrad Dybcio wrote:
> Document QRB210, a QRB version of QCM2290.
> 
> Document QTI Robotics RB1 as a QRB2210 device.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 05badce5fedc..236ea55aee96 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -47,6 +47,8 @@ description: |
>          msm8996
>          msm8998
>          qcs404
> +        qcm2290
> +        qrb2210
>          qdu1000
>          qru1000
>          sa8155p
> @@ -353,6 +355,13 @@ properties:
>            - const: swir,wp8548
>            - const: qcom,mdm9615
>  
> +      - description: Qualcomm Technologies, Inc. Robotics RB1

The title should be now different, e.g.
	Qualcomm Technologies, Inc. QRB2210-based boards
or even dropped entirely.

Anyway, this can be fixed when a new entry appears here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

