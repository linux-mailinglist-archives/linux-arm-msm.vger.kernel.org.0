Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4826C63C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 10:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjCWJe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 05:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjCWJe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 05:34:26 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25EBA5D7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 02:32:49 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id eg48so83572679edb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679563968;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ZogtvrXaNwTidOIkPJ/8jmVqxsQ9HglDhZmrmgyFRQ=;
        b=PWNd90e7fJXEslhfhM6mECNRZo41fCJNrFwRrrUyvsJg3NGm2xFU5kHjMmkSmpzp7v
         z0nH2hjt040zmtbivxOacWL3+CHPYp2zP/61z1BjavCk7YW/2jSNVlLRP3Hb5aGVWA+w
         5yZx9GWSJKG9i8kpLelTxSR7/k5Bk4VhQjLYsFJJG9FJdti8bdACDB8j0ah5c2BuYXr/
         Krf87t9yd77IMQ5nXpyTn7OYEi/tCcJwqYMKWY0ejga2uRyq9jhRZA0fQKhzxyth+fK9
         q1EasQ/v78ARrL5n5keBid2vdt2ItjaZpHqw/4w01fAZrwvB74GHpDhn8u0oIaRePeK4
         3+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679563968;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZogtvrXaNwTidOIkPJ/8jmVqxsQ9HglDhZmrmgyFRQ=;
        b=RmFA+r561GvZfahkId0YZRtQQbQbpCcZUuespfi4gQdoWwU2D/KrDq3523OuCxdsxj
         p0CgwBJH/E6tQ7wu6DN1HClpqPUD4XqtcoQkJGgDxNbRC3e0v+xxfvNhMBbjviS4iAnW
         KACVYCDARceXffL8wCnsMSAklx+LgrRtmpCIBgqJ8PRv7FI7j78v3vAcur0BS6ODc6vO
         eYKQoszhag9V3Cnx6k2N/0QNafNKgwJmQJiDgRWX2MR3f9mA2AByW4VDmIYztTtdQvE2
         0xbQDYuHe1aUUFNoLtDKDsF4fUdobhFMM7t16kDPVV6j3+H4s7lD78E8ciQfAFTZ71k5
         LlTg==
X-Gm-Message-State: AO0yUKVQDHc7AF9dFE0PQnk3YNy16ouevaWhxYQj6C9cH9ESosgB+1SZ
        9ZH7dfqwTlpL0ykDrhKqy7dbug==
X-Google-Smtp-Source: AK7set+P1YDtfuKP4vfpQpVfliLYu2bTMGsTOCFGe9rXsTcXD/+XuZH3yoUef7cS4E5ZCG5bLUE4LQ==
X-Received: by 2002:a17:906:28c9:b0:934:8043:ebf8 with SMTP id p9-20020a17090628c900b009348043ebf8mr9791732ejd.26.1679563968160;
        Thu, 23 Mar 2023 02:32:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906310c00b00926d614b890sm8293679ejx.204.2023.03.23.02.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 02:32:47 -0700 (PDT)
Message-ID: <5fc6d563-9870-f615-5216-94b911162cd1@linaro.org>
Date:   Thu, 23 Mar 2023 10:32:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V2 1/2] dt-bindings: arm: qcom: document MI01.6 board
 based on IPQ5332 family
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230323093120.20558-1-quic_kathirav@quicinc.com>
 <20230323093120.20558-2-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323093120.20558-2-quic_kathirav@quicinc.com>
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

On 23/03/2023 10:31, Kathiravan T wrote:
> Document the MI01.6 (Reference Design Platform 468) board based on IPQ5332
> family of SoCs.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

