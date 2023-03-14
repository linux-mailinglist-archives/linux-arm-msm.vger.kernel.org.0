Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C451D6B8CE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjCNIRY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjCNIQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:16:38 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1DF23100
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:14:54 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id eh3so2598249edb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781689;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wboTlz+tvE23niIuCWa5AP83n6xHxsyLfDerF7pTjSM=;
        b=OMP2Pg2VucXTq3RaZgj0lXYSRxiP1CU+5fgZV/OifjHXkNe3jrAe7fhzW3Lzeix2IF
         n9OMJc3GsHvLkDu4JiZ2Iwq14i52HSIKWYpPlEL+cio7KhsG79+XiTxSfWPBJzH8NZV6
         ZavvTnSluRMmpsBDKxSO+Bf5hV35cM0z/UDUpURuk/1UdJlbBARpwFKqnw8WHMX/9qXV
         lu4GBms2S3lNWQRnb0NGH7EVPH++QGB7epyUfUBPtyc/Gg8AMV4u6TczbtWnq0cnQa3B
         i5CC2zq0BeZDt64qawKjD4G5ZMtSeuEHU+hv5/V6t4WA+GfQv3NyaSOZGcf2/AxULVuo
         NnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781689;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wboTlz+tvE23niIuCWa5AP83n6xHxsyLfDerF7pTjSM=;
        b=4JeuuXJxwEyKOtrXs4muHcS63cYgunObVsMFjehblIzxsr4wYoKb/1P/BN0YpniKyh
         6wdZVlIp4FNDh8WyUj1jRFdKgSCxGQnRkQX5U1DJY0IBnVvuoD4UoC/YB/YXO4Avo90M
         ZXUWXfS7Ets3LjFBzRQ+T9FGMCh7VaBNUXLXzvFIHvCldBQykH2vbnQXm9SxRpBBY3cz
         2qnIbKwhkg0TMHeNnC5BZDES5N0JU3Pk5pEVHunJi/sltpvYCK1kpqIGz4TYLPvBDnXT
         Xs42tLaXuKIN1J6XcjmH2vbyK+uMeCLy+ztTsT8TiLOmc4bizRBQqqI7GhE/We+txXnZ
         Hscg==
X-Gm-Message-State: AO0yUKVSfdTK6pYZOVQtRUnU/OBEIn9BX//RQGkE8FktM9T6dZniBsi1
        DfyXRVPgQSocAJoghnUoSbCuyg==
X-Google-Smtp-Source: AK7set+faacEFbuyaWCfRFYG2V0EhpSmAjWujyP1fyxeJV54nDc+J7N1cs8blrEkU+GccFX2iB7UoQ==
X-Received: by 2002:aa7:c245:0:b0:4ac:c44e:a493 with SMTP id y5-20020aa7c245000000b004acc44ea493mr36246588edo.2.1678781689499;
        Tue, 14 Mar 2023 01:14:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6932:5570:6254:9edd? ([2a02:810d:15c0:828:6932:5570:6254:9edd])
        by smtp.gmail.com with ESMTPSA id v10-20020a50a44a000000b004fd204d180dsm600243edb.64.2023.03.14.01.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 01:14:49 -0700 (PDT)
Message-ID: <43a38d58-c105-cdc7-2d83-affd9d724780@linaro.org>
Date:   Tue, 14 Mar 2023 09:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2 2/3] mailbox: qcom-apcs-ipc: drop the IPQ8074 and
 IPQ5332 compatible
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230314050005.10409-1-quic_kathirav@quicinc.com>
 <20230314050005.10409-3-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314050005.10409-3-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 06:00, Kathiravan T wrote:
> Since the IPQ8074 and IPQ5332 mailbox are compatible with IPQ6018, we can
> use the compatible fallback to IPQ6018. With that, we can drop the
> IPQ8074 and IPQ5332 compatible references, as well we don't bloat the
> of_device_id table.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I never suggested anything like this, so: NAK
(also responded to v1)

Best regards,
Krzysztof

