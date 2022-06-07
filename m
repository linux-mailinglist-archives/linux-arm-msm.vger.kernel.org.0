Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA99F53F68F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 08:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbiFGGuy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 02:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbiFGGux (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 02:50:53 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCEDDEEB1
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jun 2022 23:50:52 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id kq6so20157349ejb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jun 2022 23:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gcjA/D1N6F29apXrVNtiB7cxyQefIwUG0Piy77ZFa00=;
        b=e2qVNFqbMue2rV7KpSz8oiizqGhv0jaDz+S7v3abMGbZ5xqQPVkya+z5RUS3itUo6A
         1j6PkbqlIQuh/gY/koXNA12KXKqn5ULLSpkUSrxg4UuZ7LzSqtZgcgQIFF4CFMqc8s2z
         GE+4BgBFrSrqjJWANmEjSMXbibBF7EKTb7VwCj0Q2NIOG73uw6IsAYvCGSBBVLHGzo8A
         ArW+08xmfFtfzTns54FcKHsrtzPOadCFxTQUHTq9tjH90xSVvG5f65DozGw9VA/xMyAC
         wrePdthLVd1R17UCRUme4Qbxl34TmlRvUHzfD67qsktqJTfmZ2gaLX7rfAz9RE//gBnM
         WsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gcjA/D1N6F29apXrVNtiB7cxyQefIwUG0Piy77ZFa00=;
        b=VaTwfC/5TE3sIqnwo28tzGxinKkSB/5tJBEb69gXuiukgZzOXsRkfb6h5tUqBpl3RH
         1XCHCRsgcgQH5kdq3njksQ7FPRHFnZGePocizXQ/W/FaB9x7p372nVr6imARbjBs2Rxf
         GxgnilzR+yeAFKiRS+P0f8KCnQSOaulDWFRSzHw8OPk9Ohfd/B57r2u0ANy4Xmr2HHJ+
         /OzDhkApdK6eEAKckcT439bhs3Vo5EzLak/u6OsvsPy5M+xUnBUcqOpP4dyAA0dw/ZkO
         e2VajzXy1qd19Sn7xMjGpFAidGLED6RTuityz+TfvfYvJ/MSWZB0FDdNNXXta2aWw1uz
         ERcg==
X-Gm-Message-State: AOAM530J9w5HLFVi2lpOUB6MbI3V3wGzfZm8iQuN4RqfQ1bHRwNPPYEt
        qLp9cyCG13zFtSFjnWNc4E1YTw==
X-Google-Smtp-Source: ABdhPJyR5JlmxsGr7LTLbWT6s2wCa6c297ttH1DNwdGUznsJNrDOcsQpF6v/UhkoFMjJt2jTJ0qQhA==
X-Received: by 2002:a17:907:c29:b0:704:fbb:1943 with SMTP id ga41-20020a1709070c2900b007040fbb1943mr25005900ejc.486.1654584650908;
        Mon, 06 Jun 2022 23:50:50 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7c698000000b0042bb229e81esm9694505edq.15.2022.06.06.23.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 23:50:50 -0700 (PDT)
Message-ID: <3e4e504c-5a38-43cd-ea8d-afbbb72eacad@linaro.org>
Date:   Tue, 7 Jun 2022 08:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/4] dt-bindings: interconnect: qcom,sdm845-cpu-bwmon:
 add BWMON device
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>
References: <20220601101140.170504-1-krzysztof.kozlowski@linaro.org>
 <20220601101140.170504-2-krzysztof.kozlowski@linaro.org>
 <Yp5tjUICIEUptKSx@ripper>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yp5tjUICIEUptKSx@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/06/2022 23:11, Bjorn Andersson wrote:
> On Wed 01 Jun 03:11 PDT 2022, Krzysztof Kozlowski wrote:
> 
>> Add bindings for the Qualcomm Bandwidth Monitor device providing
>> performance data on interconnects.  The bindings describe only BWMON
>> version 4, e.g. the instance on SDM845 between CPU and Last Level Cache
>> Controller.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Acked-by: Georgi Djakov <djakov@kernel.org>
>> ---
>>  .../interconnect/qcom,sdm845-cpu-bwmon.yaml   | 97 +++++++++++++++++++
>>  1 file changed, 97 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sdm845-cpu-bwmon.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sdm845-cpu-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sdm845-cpu-bwmon.yaml
>> new file mode 100644
>> index 000000000000..8c82e06ee432
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sdm845-cpu-bwmon.yaml
>> @@ -0,0 +1,97 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interconnect/qcom,sdm845-cpu-bwmon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Interconnect Bandwidth Monitor
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> +
>> +description:
>> +  Bandwidth Monitor measures current throughput on buses between various NoC
>> +  fabrics and provides information when it crosses configured thresholds.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sdm845-cpu-bwmon       # BWMON v4
> 
> It seems the thing that's called bwmon v4 is compatible with a number of
> different platforms, should we add a generic compatible to the binding
> as well, to avoid having to update the implementation for each SoC?
> 
> (I.e. "qcom,sdm845-cpu-bwmon", "qcom,bwmon-v4")

I am hesitant. I could not find BWMON IP block versioning in the
Qualcomm docs. Only the downstream sources had it. Therefore I think it
is more applicable to use this one as fallback for other boards, e.g.:

"qcom,sdm660-cpu-bwmon", "qcom,sdm845-cpu-bwmon"
(even if the number is a bit odd - newer comes as last compatible).

What's your preference?

Best regards,
Krzysztof
