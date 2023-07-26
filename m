Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C791763D75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 19:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjGZRSG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 13:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbjGZRRv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 13:17:51 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDFB1BF6
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 10:17:49 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99bd1d0cf2fso33531766b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690391867; x=1690996667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZVHVyLP2Fs6Ujz4VOoAQDXsJk8IXJKbAzZaD2vyiz4=;
        b=Xa3ia7jMz2vBzoVjm55myhdNUSq0Gax/YsQAFDrs6O8WdtBV/BuDEwW/G4F8DNLf1s
         7RsVG4OTIQhhkTBCMgZeVLyw58Sm8aO89Sl/rGLegxJ/f6iqrtkownpXn0Zp6olWdO0F
         XUJI36JoI+WPsuw6j88csZBr+vpvwnGthOgg/r5z2yYHXXH6l1A5NHJqvqKxo6t+HYsJ
         hX1L6ivgUl1wueQvpLaM4OCGwdHCTuAa8ymjaY6MBhmkQn6vrkdI3spZdYZupKam+XFM
         tnFVfxjUIBObe+mq7brkaEzUfHllLe6gaePF+/tXu2/tSFXWA/QvR+rauLG6KanErSxU
         X59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391867; x=1690996667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZVHVyLP2Fs6Ujz4VOoAQDXsJk8IXJKbAzZaD2vyiz4=;
        b=WT7wWXb19B+ieV4QCgIBjRWmx1cwbpJbxhiSebzl/XVWv0BkQrJ8SsH/yQHDfiRnQY
         TRBN1pim39veXijPZr9f4SqhLy4zIWyD6RMah2dWURpDPH6ffzNRjWivhDxss/R95YW3
         ulwUkKIr11EgWawHSr9Jwz9EOhtcxJb6mV+usXNLLecxo+3X8/xNT7wmTWOlwY2eBw3N
         Vd/CE+nJgvy9gCqEjGgOD1Xe7c+phTB7814v5fbPoVuul9dyeTJ2G1RG8WyyIfZc5Mh7
         4dxMXtyy+C8GW/1MT2znH3Dj3yYuTfBtkHuSA3/pmeEWH7Og+Xe/MC/LhlRr+qcHjUam
         0glQ==
X-Gm-Message-State: ABy/qLaSVNVIrrX8qm19Dr+CqDSob/cDo3IjeRE+xJGNTK35Gm/YxIob
        lqmg6xHlouDTOAHHZl56vap0aKOVjCwCeS4l9Uw=
X-Google-Smtp-Source: APBJJlFCI6lWymFjvnB6DNDMKkaJaE6aU8ogI4gYDwt5Mx4/qCVyfiQKuc5qTv+OCpMfqYVcpj6aPw==
X-Received: by 2002:a17:906:8a65:b0:974:1ef7:1e88 with SMTP id hy5-20020a1709068a6500b009741ef71e88mr2247972ejc.13.1690391867523;
        Wed, 26 Jul 2023 10:17:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u18-20020a1709060b1200b00991faf3810esm9963958ejg.146.2023.07.26.10.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 10:17:47 -0700 (PDT)
Message-ID: <398f85d8-a0c4-1430-3d92-ed475d2fe220@linaro.org>
Date:   Wed, 26 Jul 2023 19:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/3] dt-bindings: remoteproc: qcom,sm6375-pas: Document
 remoteprocs
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20230725-topic-6375_rproc-v4-0-d55e8a6d0f5f@linaro.org>
 <20230725-topic-6375_rproc-v4-1-d55e8a6d0f5f@linaro.org>
 <169027725059.2472994.10579462158675554822.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <169027725059.2472994.10579462158675554822.robh@kernel.org>
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

On 25/07/2023 11:27, Rob Herring wrote:
> 
> On Tue, 25 Jul 2023 11:00:28 +0200, Konrad Dybcio wrote:
>> SM6375 hosts an ADSP, CDSP and modem as remote processors. Create
>> related bindings.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/remoteproc/qcom,sm6375-pas.yaml       | 137 +++++++++++++++++++++
>>  1 file changed, 137 insertions(+)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.example.dtb: remoteproc@a400000: Unevaluated properties are not allowed ('memory-region' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm6375-pas.yaml#
> 

This needs fixing.

Best regards,
Krzysztof

