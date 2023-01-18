Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF2E1671152
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjARCu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjARCu1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:50:27 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783D44FC23
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:50:25 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id mg12so7649609ejc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+oWeg8meSzs44XhiL5Rp/pA/MJaJDS/aigL4xzCGs0U=;
        b=DEL6t/7gj2s4mON5g5SB3CNFYOPx6YoirU9j0W7WYtN8eh30O2+T7Xun/VLqhea3xr
         QBYfEgxQo2G2W17p8ZgIMTO4Gnl0B92A9Oo3nPYQSec58ESAb9ipigyC9RtOIQFPZDAs
         FMhYHb75LBbnMHD55vJSrdxjPmXyRb9VY6ig7PuAGJrVX5+6URVQYHVr9Xw02TI5G+Qr
         IvWSPFK1BR33xrd2J7NKxaCOjm2yY+dTQ2vWPyMmJaEK+yKfb6Y+uJtYcMA1CiygjlR0
         XySUcKaf2oUM0AtsrXM5Z+j+Jp4ituhCmkF0wjEZaAq/M42Gux+n4+NyDWJ/4YGyDOtn
         MXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+oWeg8meSzs44XhiL5Rp/pA/MJaJDS/aigL4xzCGs0U=;
        b=0iyWBwxu9lQVIVSStxEvFZkWdLkP8tvX6hmizUJenGrkJkau2exVAr0krgUZHxqafn
         JF7EkJnvZjkpnANVuqebrLYGi0d/hR5ggUE0Zdq3pS8wc8rJyrohjLaUG2P4Hs5/xVZA
         sg4vPj3QPc2hPWCWhmiI/uZNaP7Xi23/7QSq9mbxidHTrztevRAg8B7Fi+aX68ZAUY7V
         LPkHeGIPZC8mGtnKDxbgo/q+x579YC4HIeILbaXqYYiOpA+SoMqk34Vf6v47ttU34x/z
         i+r7UN0+mRs6Z7jt+bEv1ZxVKxSHKhnldedzBpB+p2W6pIbE4rXafdCEsRlPX2ul69zz
         qxXQ==
X-Gm-Message-State: AFqh2kpg3Sus+gPGb01AwGJViwcaosoZ1nD5GbzXfosqmO5u/9aci1TT
        JErWr7DYW+sdzZHTYcidA1cXIA==
X-Google-Smtp-Source: AMrXdXsoTO6RqYHs+R3tr16MfQfaTjAir7uZ3UgRN3rJfitNwZUHfTX/Ux3TwerOOd+gF4amCKGOOA==
X-Received: by 2002:a17:906:a09:b0:7c1:4a3a:dc97 with SMTP id w9-20020a1709060a0900b007c14a3adc97mr6765984ejf.0.1674010224043;
        Tue, 17 Jan 2023 18:50:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e6-20020a170906314600b00781be3e7badsm13971460eje.53.2023.01.17.18.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 18:50:23 -0800 (PST)
Message-ID: <5d0eff7d-147c-b75a-9236-232a5a98e42a@linaro.org>
Date:   Wed, 18 Jan 2023 04:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 2/3] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
        dianders@chromium.org, david@ixit.cz,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        konrad.dybcio@somainline.org, agross@kernel.org,
        andersson@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
 <20230116225217.1056258-3-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230116225217.1056258-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 00:52, Bryan O'Donoghue wrote:
> Each compatible has a different set of clocks which are associated with it.
> Add in the list of clocks for each compatible.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../display/msm/dsi-controller-main.yaml      | 219 ++++++++++++++++--
>   1 file changed, 202 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 35668caa190c4..47faf08a37443 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

[skipped]

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8974-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 7
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: iface
> +            - const: bus
> +            - const: vsync

vsync clock is not used on msm8974 platform, it causes DT verification 
errors.

> +            - const: byte
> +            - const: pixel
> +            - const: core
> +            - const: core_mmss
> +-- 
With best wishes
Dmitry

