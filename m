Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E10456595F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 08:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234775AbiL3Hyt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 02:54:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234615AbiL3Hyr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 02:54:47 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2233017893
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 23:54:46 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bq39so22999716lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 23:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/u2lHtYt55h9eLW2aJ8+8WfUAL34DdGK7BA4/nzMmE=;
        b=OopDNledczuyTzgtVFh2rmVJwXXPMsGu5yX/fyAnjBIIa87cnSEhCvBYBRXvL42x1a
         3i4xB94tUgIsqxkLksrKqYko0zEmGb2m/ZLDevg6ZYfIMaFSfhDyBwRCUQRA9FJloRL1
         F2GD8txY7GFpnaf3OrWLJKanpUrvG0ZSNhdmgs4Y651Ir5ELHPicOPj51pWYcWxTQ6j5
         V6vWW9b+DKkZKfGGEvcZFOYski2TFhH35YPlnoVEA8oi/tLY/leMVNuKVPoRtVKdpBNc
         nbY6HFnIc52C9OZ+4IpZE/Wdf8Zn46px6BZwiY0x9s0ls4P3anN1nWIIKXPkS7PtdqXP
         LaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/u2lHtYt55h9eLW2aJ8+8WfUAL34DdGK7BA4/nzMmE=;
        b=bv4pTUzj+mT44gDg1APGznnMdsNYec0lRnWZUNGAxQRCwYZquGgMRipb1xwM4t5geY
         ovv8+zgCy7Zm13gRKE74p5pXJ2SpSp4KFE982vSiytDkvNlrzZxgUtVLQIURH8iMl+X7
         l6zHL7qPle29OtOb8mn/5Ib3nCZxx+t9EB2HtDZJsUE1j4YT1oHZRlxRK9U1lbUGenGV
         9BEBCygmFzfsG7iTx/NAFk7Gbprdg/ginq2btzjRR4d4BAmafolDTDcfsHWGq7Ym9t7Y
         LxAHqB5AoP8+3qCuhPlFQilNjYrB3YD2weGmDX7jFjSO8K913TLa2Lo5odnL0eu3uZBo
         r4Dw==
X-Gm-Message-State: AFqh2kr/o1HD6wtr924yehrCRjJCaquZ6cxuA3aOIftU+EPM7KIV3OD7
        lVGPJ5/Mq1/l3lxQYByQKFO7jA==
X-Google-Smtp-Source: AMrXdXs6UbI+YlGXHQdgRobkLgdafexKjyXND6gJW3NXNDJkoQVoneNf4yNrc33qh+lahEZxrBHZzA==
X-Received: by 2002:a05:6512:108f:b0:4a4:68b8:c2e4 with SMTP id j15-20020a056512108f00b004a468b8c2e4mr9867605lfg.59.1672386884508;
        Thu, 29 Dec 2022 23:54:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bt17-20020a056512261100b00494942bec60sm3363337lfb.17.2022.12.29.23.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 23:54:43 -0800 (PST)
Message-ID: <115b649b-f0ff-1fc6-36c8-fae63e5c73f5@linaro.org>
Date:   Fri, 30 Dec 2022 08:54:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] dt-bindings: ufs: qcom: Add reg-names property for
 ICE
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221209-dt-binding-ufs-v2-0-dc7a04699579@fairphone.com>
 <20221209-dt-binding-ufs-v2-2-dc7a04699579@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209-dt-binding-ufs-v2-2-dc7a04699579@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/12/2022 08:42, Luca Weiss wrote:
> The code in ufs-qcom-ice.c needs the ICE reg to be named "ice". Add this
> in the bindings so the existing dts can validate successfully.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

