Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5D3E5ED58C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 08:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbiI1G7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 02:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233357AbiI1G7E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 02:59:04 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E190A00E9
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 23:58:55 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d42so19072360lfv.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 23:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Qh1HEBzOLKDQSq0ZCiaGc/8pGpWdAfOlGQkcVarHmY8=;
        b=kW9bbA11CiWU1L2dWJmMwja44loWoFbidpsQJ5KAS+WpEfkOZXCxUMegXZsEYoFj9q
         4VBXxNL2nRP46fTS5BDRiLvegZxm7ZZVg6kFZbHGhsQQ/D+Uuc7nCggqJAw7rNV/AMoz
         TSePwOkEupsjhipwKygDqUr7Jar1FE7Wkn5/pf+NL0dxAGr3jNHO5hMspe9+YFJVO5Rt
         LcJXxMsepP7F50m3f2t9NvT+mtiCANcL9D93dYPVcwxZsfFyiKRaKJRe+Yzp8cY0l97R
         Lrx2jCclRRzR5eu00Y0bqg45MkIYrt4wxh8HzbmJXl2ZoCXgfdiDjZszSRqe7yAxgwQr
         loQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Qh1HEBzOLKDQSq0ZCiaGc/8pGpWdAfOlGQkcVarHmY8=;
        b=Pna6rvbVAJ8PSk43WoEaANCKfnaVqYUOySRSvnB6F4OQbWUEFeSic92JQjLvs89Qu9
         J5Ci6UU0yaxM1dqyDke3jtdgy+YExDV6PKyLLtPqK8cgZ/F9os22kNt6eSrZStaf2jW0
         F1Pxrolung5IjKggzUhBOwDrl74M7RngStxVBdPJzqQ5VKqvPsfEv98zy3/zmJBTQnjh
         +hHPm1aVxmMjwYqJ1jbJbWa4wSV0V+BWR5FbVjyUp1Y396vCTrZJxYf6aJZQicbukGbF
         XFhuLe6pXiz2wmJKSiSdDQOfMo/JyaI1wQxPgimuVwhUYh2zly6w58/sLRJVKhSLo6RN
         9A4g==
X-Gm-Message-State: ACrzQf3eBCtv/R2fql5SyXMYY/d87n8DzgWvMIeepKqT60Ytndpjamdn
        DuutWdiYTefO7rAUmAz3Gzt0Sw==
X-Google-Smtp-Source: AMsMyM6ZOnG6OM/VwMga05nNjO5UO83JomTav5VouqvC5bQK33X7nG932sZ9IrZriMo0gRh2lG+S5w==
X-Received: by 2002:a05:6512:3b91:b0:49f:d530:97 with SMTP id g17-20020a0565123b9100b0049fd5300097mr12283022lfv.172.1664348333477;
        Tue, 27 Sep 2022 23:58:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512220400b0048b969ac5cdsm389758lfu.5.2022.09.27.23.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 23:58:52 -0700 (PDT)
Message-ID: <3e9ca09c-4134-e05c-3a48-3f0467ba7e8a@linaro.org>
Date:   Wed, 28 Sep 2022 08:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v9 1/7] dt-bindings: remoteproc: qcom: Add SC7280 ADSP
 support
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org
References: <1664287003-31450-1-git-send-email-quic_srivasam@quicinc.com>
 <1664287003-31450-2-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1664287003-31450-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 15:56, Srinivasa Rao Mandadapu wrote:
> Add ADSP PIL loading support for SC7280 SoCs.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---

Thank you for your patch. There is something to discuss/improve.

> +  qcom,smem-state-names:
> +    description: The names of the state bits used for SMP2P output
> +    const: stop
> +
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +
> +  glink-edge:
> +    $ref: qcom,glink-edge.yaml#
> +    type: object

You still miss here unevaluatedProperties: false on this level of
indentation.

> +    description: |
> +      Qualcomm G-Link subnode which represents communication edge, channels
> +      and devices related to the ADSP.
> +
Best regards,
Krzysztof

