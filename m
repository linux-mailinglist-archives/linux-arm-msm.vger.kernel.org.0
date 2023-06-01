Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815AE71F0BD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbjFAR2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbjFAR2r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:28:47 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D480E197
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 10:28:43 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so5111178a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 10:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685640522; x=1688232522;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNcpo7DvvWCUPpWb3V4OhYrufDUTi4oQgGZt++4gkTs=;
        b=OpHkyJLXBIe+XHu4Y+Jmb/33ItIXMjpR5qAqmB9+MRyLTBS1fDIKeWTTs21ZD4kBMa
         Az6LRUB2yzgmW1vyW95oT4Ul6y0OfhAF7Fy/9FuXi+OYTv/s3ezI81hpXthHtaiFgtnc
         52+tJHBTZNTqiFdJ014JEZKVHQVLRxbo4dOjhbMibPcEI+wkbeCV7A/3IfDgvct6+BVk
         /Apf0DLzvcHasLDirX5/RCeEu0yaYJny2FOu+FvcgdkfCQz5mnKBpPYolcbdDNSielHH
         BKAdvu1Cp0WqFh81W+7pFBv2wtA3kYoN/POsGVk1CxmOl8MHrGsSK/hSHiXy0Ufb66UQ
         vTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685640522; x=1688232522;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNcpo7DvvWCUPpWb3V4OhYrufDUTi4oQgGZt++4gkTs=;
        b=kBxssyy2jVg+z9E0ZMGzYob+mh3GtyDo+0bpxDgmsCOGpyI2GjX8tf1g2j7U30vL2h
         Tba0+Czj3FrxYRLmLL1fixrG96lENxRCb5PEWxmRSKplkWiEUwiwTGvdCJJAzWaQSB1F
         Fa4ULn4ggT9Ze4vXRzqJxA5+VSrHbD+fwwtFGVVoHY5kYgkSur9jG1yW8yU3rClrDjTC
         aIZuKvkVHLvJlhQxWAfv7yNk9V5lCLctq8e2BNRZ30Q9vdswiRSMM8sJ9d/uqEqvt+Yp
         eWrP44JZXb43Lt2eR//rQ/KrSPnQSRJMyG0BjoIH2cTpulguPYp7hW/8v/Ukchnmcoit
         JYjw==
X-Gm-Message-State: AC+VfDz5Eod/jxCfaheXY9lvQB5nJ1YrA7seMVTXaKQxs19WM7FhKgDz
        H/EYObeUFA5dJjgy8GywFKPVag==
X-Google-Smtp-Source: ACHHUZ5T7raqG0mDktp/XEWkU9Am4uhHvL7/QmayQPLK7P9JCCfWnlPjoxGJeS3HIn5H8EhDFE650g==
X-Received: by 2002:a17:907:7b95:b0:96f:8afc:b310 with SMTP id ne21-20020a1709077b9500b0096f8afcb310mr2923111ejc.3.1685640522229;
        Thu, 01 Jun 2023 10:28:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709061e8a00b0094ebc041e20sm10645343ejj.46.2023.06.01.10.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 10:28:41 -0700 (PDT)
Message-ID: <0a08127e-43d4-3ee9-5b96-8ea895031948@linaro.org>
Date:   Thu, 1 Jun 2023 19:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RESEND 3/4] dt-bindings: arm: qcom: document MI01.9 board
 based on IPQ5332 family
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
 <20230601042054.29075-4-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601042054.29075-4-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/06/2023 06:20, Kathiravan T wrote:
> Document the MI01.9 (Reference Design Platform 474) board based on IPQ5332
> family of SoCs.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

