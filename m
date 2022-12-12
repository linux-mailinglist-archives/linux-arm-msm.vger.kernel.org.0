Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD0F649AEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 10:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbiLLJRU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 04:17:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbiLLJQP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 04:16:15 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADED1F03A
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:16:07 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id x11so11828411ljh.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AIifoEFiC72psMbY45WalcO7jXfalLI3RSBsB5quiY=;
        b=VU0qvLfKj6onkE+LjiSwLgyffzxKO3/+UKSQ6Svkoefd1GeQ2Khrmv9ExbgGWewakJ
         9tpB0HxI4OfR6vo3Hujb6iTbmPcPjo8EZovoutNXQ92PSKvvobUryZdqlAd9WPriqBCF
         yEjUEoLHQq4mKxz9+3U5xTg/sowdq2XIxu2KfuX4ulzjwa8YsolMAK1LwlqT4UmVYakR
         AJDfz0L/xwJ7sB/kr0ywJSz+kS1kNAOBFnXpQmxOgKJ0E2pLPSsYwT1GwMvQYBrHZ+CQ
         Q11F6qrZZv71DMM5QaRE+GYp6gjik9pTvJ4nfMkK6jXR4lbmM/im8h51RbiSg4K0kObt
         glyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0AIifoEFiC72psMbY45WalcO7jXfalLI3RSBsB5quiY=;
        b=CS9O1DVMKYXF2yoAWLB6v2eDaWAkLH9UQeOvXOphMrMw/L6BuAgBB8cKrCIebUYIf2
         dzgtbueGUtqibreZAsM9pc6wIb3ek7a4hEiyHIm7sX2sTlQko33vR/lZTvVYamsMoKlQ
         VlEQxfC+mh9geI22WjjvCqYiWQtEMqK/RQC9aWLGmiQ+owwBm8X6KOZmfutjli/x0TK7
         fGKnFbZkooeBUsuQbSQjX19Rnuewxd/ePC6CvZ2DhkPBeDQEHL3MvQpWAlLNHiqK3Zvd
         BBUyUtGqZPsP6s2hl2MogQNrqMbs/+tJqLFABAn/tu6451bhVZ2PG9B8Orl1u2HIAYLz
         cp+A==
X-Gm-Message-State: ANoB5plWKe2Vl5wY1ifONqWNoEJM43PbxW7NPwRPH3yx586FKvVGU3UB
        MHKWCexVr372N9axtO7b9ueBZA==
X-Google-Smtp-Source: AA0mqf6YsR1jFMYRTC/iblW+rjoiOstEAbwhIih7h9N7e29IB0kHS1dSoQK+u78um0vwEFjSgAudHg==
X-Received: by 2002:a2e:a58d:0:b0:26f:db35:6046 with SMTP id m13-20020a2ea58d000000b0026fdb356046mr5118214ljp.17.1670836566099;
        Mon, 12 Dec 2022 01:16:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y12-20020a05651c106c00b00267232d0652sm1161080ljm.46.2022.12.12.01.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 01:16:05 -0800 (PST)
Message-ID: <f7cb79d2-cfcf-dd12-5127-373ed192120e@linaro.org>
Date:   Mon, 12 Dec 2022 10:16:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,adsp: Add SM6375 ADSP
 and CDSP
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221109170822.58281-1-konrad.dybcio@linaro.org>
 <be450f51-6e1c-a3c1-904f-1f915f0dba5e@linaro.org>
In-Reply-To: <be450f51-6e1c-a3c1-904f-1f915f0dba5e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/11/2022 10:32, Krzysztof Kozlowski wrote:
> On 09/11/2022 18:08, Konrad Dybcio wrote:
>> Add entries for SM6375 ADSP and CDSP. They are effectively the same
>> as SM6350 ADSP and SM8150 CDSP respectively.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml         | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Although change looks ok, but I missed that it will conflict with my
series here:
https://lore.kernel.org/all/20221124184333.133911-1-krzysztof.kozlowski@linaro.org/

This should be moved to a new tile or merged with one of device-specific
bindings I added.

Best regards,
Krzysztof

