Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC586FB51D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 18:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbjEHQaM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 12:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234298AbjEHQaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 12:30:03 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F346E9B
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 09:29:55 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9659e9bbff5so858353366b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683563393; x=1686155393;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KN/fI3MHU35BDhM7fLqcSHt0lv3mYqfp99iOutfV1Xo=;
        b=u0lDWAl8/F6nXY3wu8Fd4xOU1W1SykcGYs+M0ZIt/wijW5oHhMB+oOHLiO1ylvsBWn
         PJajn9X8Nr+ypQvNVnLJvrw2N8QVeF+xJ0Khl66DExwDT+uBRmIAzQ5SGifpIegXbsgb
         9dHFpnsJ8yJ/j6FZ60+sHfuEcFqauREJdEcqtJflLOLv990ta3iv8W4YhVS+Z5VuSXxQ
         gWdEKYT2eS3ydRD7At9QuYJr6li/tpGPmbWuSEG5LK9+5Q/Yu6QXzHFXZ5DMhCFnl7fX
         3pnammB8RGcCgORKr2nZCNCqPaxFomM50iSyHGKDL//0G4kKjBm1mYmpPR8yXfHb/ONw
         odWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683563393; x=1686155393;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KN/fI3MHU35BDhM7fLqcSHt0lv3mYqfp99iOutfV1Xo=;
        b=AKFzERSaDDOUm8r0KSMLSnjv8mf9Sr0XGYgSLVOOqn7iAUq3oeza7Jgx1wdCie3fyE
         f1fqZN8Krof14wYxDNh60HM1sd0m7yL1pxUKuifnrCpStCMMSA4nNpx054FQqiDiRngM
         5Z3NeuHH/TkGEXHP5KG71p9sgEed2zuCcFXSA3xs730TWY2HRu8XDm/dT1vp0J5ouH/M
         N0cVV3In4/r4mOmki59Md5yLgQLqk2pzPDSHltS/fvFoy/VTdJWaAhGFY8XxfbCCw6CP
         HCKTwdlsyKB63i5r1zuXdP6rdOL8FMIHWuEoONreQrUzNjzHE8EIVYgD/WWQnJd0/md0
         8SoQ==
X-Gm-Message-State: AC+VfDwe0frbh8WcKhbJMlIwJ9ZybWc26BB1bLe7p5lkCUwWWKBGVSdy
        K8JPFc+EV7ZvdMLxxJSxbNrrZFAFNE1W7Zxesog=
X-Google-Smtp-Source: ACHHUZ5c8xFauiVnsoUoSFumkW13SZCA6WZSmFl4CejEmOXp81tKUIJ2rapvgoELsD37wctRo43KMQ==
X-Received: by 2002:a17:906:da86:b0:960:ddba:e5c3 with SMTP id xh6-20020a170906da8600b00960ddbae5c3mr8246231ejb.32.1683563393647;
        Mon, 08 May 2023 09:29:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id hs32-20020a1709073ea000b009534211cc97sm155341ejc.159.2023.05.08.09.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 09:29:53 -0700 (PDT)
Message-ID: <5c8ee22e-babc-2209-3ca3-d24a63a1ee74@linaro.org>
Date:   Mon, 8 May 2023 18:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add Soc ID for IPQ5312 and
 IPQ5302
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230508152543.14969-1-quic_kathirav@quicinc.com>
 <20230508152543.14969-3-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508152543.14969-3-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/05/2023 17:25, Kathiravan T wrote:
> Add the SoC ID for IPQ5312 and IPQ5302, which are belongs to the family
> of IPQ5332 SoC.
> 

s/are belongs/belong/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

