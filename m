Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D992956AFE2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 03:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236895AbiGHB2w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 21:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236513AbiGHB2v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 21:28:51 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C74C675A4
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 18:28:51 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id n66so16296269oia.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 18:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=HQoQSqm1Y6gc3vLd2/YcryN+qPwBTmG72+1Cc+N5QmA=;
        b=CykAEtsvYnPfrFIuJwuOCf0sw8z7xciHsnHSMcRh16QnXk6QlIvfrYCuLdkrEmDw8Y
         xUg/8KmL2U/g8kmyvsdHQy7ZmsMN3fBtiainjMMGzfllqj0dlPHpKGRfFA4CTnWyv2mx
         SaD57uEHfP6TCBWZoutJutR3hP34XDXxaOhfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=HQoQSqm1Y6gc3vLd2/YcryN+qPwBTmG72+1Cc+N5QmA=;
        b=f9QCDEwE2c+rZ+yD00M1aFcvDvSyWYOap1rFOR2kTL2rLf2i3twWJ1UAp2gAM3MzY+
         1KBLEzU1cybqzZ0u98KapVeHiWwZO+/l4CNeyNiDEwif/W1zfXKqBs6n+Wn6amVxnn7P
         fhZ4jnwJSQ9rxVXBxrsT6NGAsCMS7Y93MBH28HocqSPqa/hgT3U0g/hNXhTklDCx65Pj
         1kEGDuRFUajmxswMOPeFD59EfEQgP62BP2wZpEPSkQMZ/SVOD/HyBnmaoeyaRf5r7jwP
         1tD1TjkYWrPHifWREn4qT8GXeIjK1ssI3MaqJ6kWHg7d0BTRfp3Qkw9lMqcIE+xXCr5d
         0YXg==
X-Gm-Message-State: AJIora+/oL2HX/D0pAvEmgXAbJWL8VkRd3Evscb8cM8TqLwxLKpGTl5l
        C6fHpqWnNqq4anwcdscsaDl/RMSnqnA7uLRnE7IZmQ==
X-Google-Smtp-Source: AGRyM1uJ8/E8SerdAnJl3f3McgySgrfAOxikx5UkGEHyUZlQA3GOjpCjdWqPyZoanxplGHhTQrvxDsHhBt2MrfSEudI=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr457469oil.193.1657243730587; Thu, 07 Jul
 2022 18:28:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:28:50 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org> <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Jul 2022 18:28:50 -0700
Message-ID: <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-07-07 14:31:56)
> The p1 region was probably added by mistake, none of the DTS files
> provides one (and the driver source code also doesn't use one). Drop it
> now.

Yes, looks like the driver doesn't use it.

>
> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 94bc6e1b6451..d6bbe58ef9e8 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -29,7 +29,6 @@ properties:
>        - description: aux register block
>        - description: link register block
>        - description: p0 register block
> -      - description: p1 register block

The p1 registers exist on sc7180. They start where the example starts,
at 0xae91400.
