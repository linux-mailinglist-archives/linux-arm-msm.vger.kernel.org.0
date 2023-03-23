Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07B26C5FDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 07:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjCWGn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 02:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjCWGn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 02:43:27 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411192B9FA
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 23:43:26 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id r11so82283184edd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 23:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679553805;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMstDaxIo7QDe7MvS8uu7aa17VLPebxI9kqoNib2A2k=;
        b=uxC1y+LWu9pqT2v/6Ee/Kos/qzF49sg2YK8pHq3JAmy5Mzjwjlx2CkszMz6K39XQca
         01hSaIgvyFeldRs6Lo+zq8sk9QOVwV6vKdwkdzaNmow69fmibnsYB6f5ju8kJFxyAnfx
         SRx3DEkXcbSJ6El92L7BWOSxCifjk2Tb4YgMOzKhIWsjBOK6bWKKR5KMyFOURhEtzQtt
         cTm/cE7Ff870dnrgRMkVldTl9CICXBvFYlk+4IJZS8YdEePOkqMhZl6dk6qHF1nevdth
         fA0YH/2jjhE+Cg3FaLe3tk7z9HVfqPcdpTT/gWf30o77stP0kKvmdsjuamjyHwb9v09X
         vcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679553805;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMstDaxIo7QDe7MvS8uu7aa17VLPebxI9kqoNib2A2k=;
        b=jmXftEYyKy41XYwlUaZll/hdrBmQau6dZBlglOXpOzjmY8UimoahAz3TTsYsnULImS
         P7UDLRH3FOUWbJlJ0WGjkcF5+gqWGwAlimSokLWLLkbyrfo8c2W+HfDod1K5qjin1n6n
         B9wMiepxAVKJBqoOCHQQ13txDPeDeTTIVFVq+YrEAbVe4oZFeWaD8BdI9Tb27EvM8H1k
         +FObS5l+An3i8hLPrDREd/Ns5Z8sEUXvrerOca3KBy2AlUmx8ZInxh4/iyLtbkpqBjO/
         3BL/iKVUfk8mqKiDun+F1+XAIrQ8kvyI5PWk8QWxAmecUlHXbkj431keTFtnmUe0P7i8
         fn0w==
X-Gm-Message-State: AO0yUKXXbhm7D/jidPlgt76HQ/hFsOESOiTj2hKSYW4X/p71lsGkbPin
        xfPnZWVuMMldCwhrg17aDOkRUQ==
X-Google-Smtp-Source: AK7set/gHIJWEZr93ODMdLwd1QBFzT0ySar24Lhp25hvuevBlNyjI4wIDW5Hr1bkgba9o7/fCw0zUw==
X-Received: by 2002:a17:906:3159:b0:884:9217:4536 with SMTP id e25-20020a170906315900b0088492174536mr10099013eje.64.1679553804787;
        Wed, 22 Mar 2023 23:43:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id m27-20020a170906259b00b0093a3a663ebdsm3045523ejb.154.2023.03.22.23.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 23:43:24 -0700 (PDT)
Message-ID: <22ad032d-a1b0-cfe5-11d6-94f6fc76e2c7@linaro.org>
Date:   Thu, 23 Mar 2023 07:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] arm: qcom: document MI01.6 board based on IPQ5332
 family
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230323044929.8694-1-quic_kathirav@quicinc.com>
 <20230323044929.8694-2-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323044929.8694-2-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2023 05:49, Kathiravan T wrote:
> Document the MI01.6 (Reference Design Platform 468) board based on IPQ5332
> family of SoCs.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)



Best regards,
Krzysztof

