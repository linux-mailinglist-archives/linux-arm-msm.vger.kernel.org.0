Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07AC71FAA6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 09:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbjFBHFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 03:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234190AbjFBHFP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 03:05:15 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C48FE63
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jun 2023 00:04:53 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-974265a1a40so642194366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jun 2023 00:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685689492; x=1688281492;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PU+oXEHcz6dFOjlXNdF/A2UNfFdx0A+puxh2VURqYKM=;
        b=qtkHoHVP/eHHXPxK3mYmFelzOm+RBshghechwcaDxI4E5LwTY0kcWDeNRfWeYG/WQ0
         eF4Bi+qpamlibhDCwBON5hd0P/5Turj0mAQKxMt85/3TVMi2fyW36R5gryef2krw0d8T
         Z5rh01acSwjFxymvIWPZjwY1DJ1EIzj093Vci2v7srfJt45OCQBa4ztf7e5nCHfMctMi
         QEh1UH7f5/1pnFj7IdJA4Zt28InChWV0AG5jlDEy6wSPfqMc20vPDe3w0kXrhX2f+lPN
         EfORJrKY7QowZ+iSk1N7XIMow+TluvEIgQVEef0uHUZ+qfmAPAyvbamhGVQ9oOaBxrmO
         LaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685689492; x=1688281492;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PU+oXEHcz6dFOjlXNdF/A2UNfFdx0A+puxh2VURqYKM=;
        b=RPIuPjv6UDlfxqBhROr4jycwWGAB9YFn5Yx/JNhht9oUHI+LiK96dQX5g1xAgeV7Ae
         FUs7jWPtwhhr4HNWWJeSD/w9wYze+7g5C4jg7Z9rQT5r4BJ/My/9JXWQ3+nKaQqaM6c9
         H0ZBpF3LKWvUyFWsP+0TsyqhKsif4AiqdWDDgHC41DCMDWvVJ1caBek0Gz3YMb/HUfjl
         rDNiZzCcuWuYWlks9pWr78S/qc5to9nlQ4PX/KzpWqZ1IUz1O5u/a8okFskmaLElSmWG
         1YGRXCbY+96mo7PU4WL2elRwGi7RCUnVB1TztB5+AZJ9ND6B0Qkqd8gNlVdjR9LOIrRm
         JVog==
X-Gm-Message-State: AC+VfDyyTiDdlHqRBl9H2L8fTYCqbCnMsJ+ICsvmVKhuCS6sbGByBUs5
        Wm7Q/Qc1Nxz/JnMYwiAUBwgx1w==
X-Google-Smtp-Source: ACHHUZ4CS7X85PDEWEj3+iWW2crSKytt9wvn3B4q2VrfVjEfgiB+KhySMw1xS2a9BLEIeKjKIqcG3A==
X-Received: by 2002:a17:907:9407:b0:973:e888:2225 with SMTP id dk7-20020a170907940700b00973e8882225mr3235001ejc.35.1685689492126;
        Fri, 02 Jun 2023 00:04:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id l12-20020a170906a40c00b00971433ed5fesm376702ejz.184.2023.06.02.00.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 00:04:51 -0700 (PDT)
Message-ID: <f174ac83-96e6-235a-692a-ee1dd3186b23@linaro.org>
Date:   Fri, 2 Jun 2023 09:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RESEND 2/4] soc: qcom: socinfo: Add Soc ID for IPQ5300
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230601042054.29075-1-quic_kathirav@quicinc.com>
 <20230601042054.29075-3-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601042054.29075-3-quic_kathirav@quicinc.com>
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

On 01/06/2023 06:20, Kathiravan T wrote:
> Add the SoC ID for IPQ5300, which belong to the family of IPQ5332 SoC.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

