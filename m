Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78FA069600C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 11:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjBNKAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 05:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232077AbjBNJ7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 04:59:31 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCB8CA07
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:58:48 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id x40so22658166lfu.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z31+u7gZL8nW1cmPz6BSxABmqB9vacjwbwX5mpxJFQM=;
        b=i6gc8vAYifUC6e6eu+J6m4694sUMuHHwJNsRsF7kRNaPsca3LAr1YQVxyz5tT51kGy
         92X13ZOuJyZhS/02z+kc1fXyLVZZgDNrgimD5xj77zpohTeT9zHwHJSuKHeHvxsDuxQw
         lT0Kutlt6bNU/K8NlugfvAjU7RCYHnXjssUsP0ldGyVuuwPoI+pI26oXKtQRIQa8S/rJ
         dYpJt/16jQ+gyt7Y1G5U+FQPqPTli31isxdTah5Zh7sWcKwoYo14e0ucaL1jG0Seb1jp
         yOk+eyKv2hSO46IjJXUauEL+UYAtGrJ1gq1vJ/c74z1sCiWu9q28ZOsBR2WEdcuQK0pF
         WmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z31+u7gZL8nW1cmPz6BSxABmqB9vacjwbwX5mpxJFQM=;
        b=X6TESQr2qxqgjcsJ9L1lEEyrWNKOl402R42QCwb40oabfX38MTGRzt3mZVO/h7Trj+
         8VPY5AsNKOaBXKZuzNid919iKVquTF6jOSH4/FoIaFlz0ouXVHRZRUB6uvqYN4MV1TbS
         MwWJoensQmVPoZY7s6Sqzh0NmuHalBZ47DNnGmeckVQl9fmVH7WnivGZg6GAvDY65Wmg
         D9gxFrFphwBWmiEBiJdEN/o6yJ4hpRRzoVwdKh4Iyaca5rvSUuRVOBt1pQFIdqtEdboG
         OA5gvu+67L7uKawCLzlXNNt8pA1s4Oq5uDXbvgpWxMtpFcvfoq4Rw/NCg3HSsOeyUTXE
         N4kw==
X-Gm-Message-State: AO0yUKWyVQvQ4EdiHUWHWTSPVNkDk0RLT0XmB2xYeL7pRzIOJeMzEhiS
        pLDliRM58W9Fchu2d6rh+LtUSFFw+RfNzEP2ELfVWA==
X-Google-Smtp-Source: AK7set+N7u3aeKPcym1uDH32evhIh6wD0VUqL7zeScGxllOAlXTLds7SrFDo37IMAv6vqFykg2reEQrJM3JH3xdZlRY=
X-Received: by 2002:ac2:51b4:0:b0:4cc:9bfb:69cf with SMTP id
 f20-20020ac251b4000000b004cc9bfb69cfmr121009lfk.229.1676368726401; Tue, 14
 Feb 2023 01:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20230214095435.2192153-1-konrad.dybcio@linaro.org>
In-Reply-To: <20230214095435.2192153-1-konrad.dybcio@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 14 Feb 2023 15:28:35 +0530
Message-ID: <CAH=2NtwWjQpSb-cpvF18uAqJ_Hvs4Yagnq0D5K8xoiZzBEd5Xw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: qcom,rpmpd: Add SA8155P
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Feb 2023 at 15:25, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add a compatible for SA8155P platforms and relevant defines to the
> include file.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  include/dt-bindings/power/qcom-rpmpd.h                  | 9 +++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index afad3135ed67..f9c211a9a938 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -29,6 +29,7 @@ properties:
>        - qcom,qcm2290-rpmpd
>        - qcom,qcs404-rpmpd
>        - qcom,qdu1000-rpmhpd
> +      - qcom,sa8155p-rpmhpd
>        - qcom,sa8540p-rpmhpd
>        - qcom,sa8775p-rpmhpd
>        - qcom,sdm660-rpmpd
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 1bf8e87ecd7e..5a6dd5ded087 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -4,6 +4,15 @@
>  #ifndef _DT_BINDINGS_POWER_QCOM_RPMPD_H
>  #define _DT_BINDINGS_POWER_QCOM_RPMPD_H
>
> +/* SA8155P Power Domain Indexes */
> +#define SA8155P_CX     0
> +#define SA8155P_CX_AO  1
> +#define SA8155P_EBI    2
> +#define SA8155P_GFX    3
> +#define SA8155P_MSS    4
> +#define SA8155P_MX     5
> +#define SA8155P_MX_AO  6
> +
>  /* SA8775P Power Domain Indexes */
>  #define SA8775P_CX     0
>  #define SA8775P_CX_AO  1
> --
> 2.39.1

Tested on my SA8155p-ADP, so for the series:

Reviewed-and-Tested-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.
