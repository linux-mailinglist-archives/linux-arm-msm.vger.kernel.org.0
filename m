Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB4C6639683
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 15:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiKZOgl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Nov 2022 09:36:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiKZOgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Nov 2022 09:36:40 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E0725F0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 06:36:39 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id j2so5665083ljg.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlFReAZi452KKu7243poUVzcc36SKDtK5buSrZcN41s=;
        b=DorUbsjYYdMtXqG8uYYRoi3VrC9zXVvjY0opQcp3A3zmx0YAIYYSz4W4hrFigdIEbz
         xoWq+S5zgz6xfoGnxKxGECIFqfzz5y0onEZ3+cO0KEju2Tqcpa1QdXYZP1IgpQq/ZHeW
         +uTJux2bDqSe3sSYpQQjw/24qcymzPpR3zVurTJYfwcfG5VJlDMCSEElTdUNMMf1gZVG
         2hL7vvNikjb4BYAQav+A/5eqqvtuJpVMSVvwPNMHrAzXRJxneilvjOZDKJsf3gr6K/Yo
         cImEYzBvvqdcLzdws/U13nbJOyTNyotCdO5SXieAH7LkXuO7sCTkuChrN7jiWSx7mxOj
         O/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlFReAZi452KKu7243poUVzcc36SKDtK5buSrZcN41s=;
        b=S18PGoamMEm5yYJpUlXcf4CrvZQyqaZZNzAhZ0a2WtwwdDcHU06xVBzE0ezAzJVe59
         QFtQOepEUfKIv5774TuZ0LcdfnVnVSt2a8zKGWxtz3pOEMTbhEYYEEmbN8rgTiZCZchF
         j1cZwR59DzjFal9aFTHxU93O+hFRGnbDX2eOgJlDkop81wYgkxQ/LgVTCQinNOMI/O9g
         aheCqme/5Wb15GIn19KmTZ9kV3EY8X1K2EG578jI06moAiu+ripq1qeJ9os3erEYqTgK
         SjKVy6XWfpA3/Iu+anLyihkI51K+TO48ASRcrmreThSuMVTI4euTHVgzEwAqlxBmU8oK
         I9+A==
X-Gm-Message-State: ANoB5pmkevOKAex0mhKEnmj/1EUrSdO7bXIpz4BtEvnjE8Kk3AJxkseR
        e2kdEPdXDZZAZR3oNEWnitdK6Q==
X-Google-Smtp-Source: AA0mqf6gn8Q7/ZynZ1o+yZj/px5dRRu0hgVNiyv5nl70fRpr5NXgnEbAQ+G0uTryw6wn2mtWrRyuqw==
X-Received: by 2002:a05:651c:1108:b0:277:e8c:a5a4 with SMTP id e8-20020a05651c110800b002770e8ca5a4mr9138752ljo.311.1669473397489;
        Sat, 26 Nov 2022 06:36:37 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h5-20020ac24da5000000b0049480c8e7bcsm946797lfe.176.2022.11.26.06.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 06:36:37 -0800 (PST)
Message-ID: <4fd1500d-e3ca-45fd-1cc8-81783697b809@linaro.org>
Date:   Sat, 26 Nov 2022 15:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 03/18] dt-bindings: msm: dsi-controller-main: Rename
 qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-4-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124004801.361232-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/11/2022 01:47, Bryan O'Donoghue wrote:
> We will add in a number of compat strings to dsi-controller-main.yaml in
> the format "qcom,socname-dsi-ctrl" convert the currently unused
> qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl.

It is used: drivers/gpu/drm/msm/dsi/dsi.c

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index cf782c5f5bdb0..67d08dc338925 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -16,7 +16,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,mdss-dsi-ctrl
> -      - qcom,dsi-ctrl-6g-qcm2290
> +      - qcom,qcm2290-dsi-ctrl

That's a bit surprising. Did we discuss it? It breaks the ABI, so I
doubt (driver/bindings were already upstreamed).

Best regards,
Krzysztof

