Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384DA56B012
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 03:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237008AbiGHBcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 21:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236998AbiGHBcu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 21:32:50 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7216372EE6
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 18:32:49 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id s13-20020a0568301e0d00b00616ad12fee7so15250267otr.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 18:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=NZJnks1XrICiLmh83N/nfcU+CsA4QrBVqgFUGpAdW4k=;
        b=HPhW9RBebWqkQ9PrCQBGni3TYxxHU0PMMIzS+aI8g7tdTc/ktP9jChMXoLxyZLZzok
         6jJbBqFyVY98ivY+HhPAl1eSH/pKrNe+5DUTFW4SQ2V5tO+sIDjoHSgR24wBj+m1u0lf
         WaYaF42SUgX3aZq6FtJWxMtiennDcPDH2n2vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=NZJnks1XrICiLmh83N/nfcU+CsA4QrBVqgFUGpAdW4k=;
        b=HL90Ap4a0w9kWpAvE2h0l4L+2QWd+kb+Bp7Z5oCqXLu8ytPtv2D4fO8sno++wtxWRk
         pHi8lT8s52OUFgapXGG6GdA1OxR2bAHyCVfdnYrEyLeZ609RSGub5KJLS4p1nGHar1Tx
         MqE7OF4Ed9Lr2B3Yp1pD490N4oQTCssVEW1vhzKrrqMTvzE2uvgXho3xx8t0ZXO71QS6
         Mluem5UNJJ70Vl3Ryga3zBa3MzSWZlgkhPtKENgvZNSOVmBCfmXIY5WNZq50ZIz9Ib+c
         04cfk8sKuEDTv3uIgDegRHlJ0f0bqMompLy8rCS42wP947kWOEYyff2YUEGhIWjhmZUF
         Uf3g==
X-Gm-Message-State: AJIora8nHzgZICjmhMpcgE1J2TKHO1yYV1XzCkTJbzxbie5nSnDbKQD/
        U+8h25MoaKmdttbIeTJqBrU9NXxR7hBJ7kU3Jb2hqw==
X-Google-Smtp-Source: AGRyM1uyEcjzTSo/c6W2hKlHGeOkhVQpn/Aafq4q9l5KVnaNd85lX4vrq2pZIBrYfA8oXbPHME/u1frODdIdXteTN/I=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr474851otl.159.1657243968788; Thu, 07 Jul
 2022 18:32:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:32:48 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-6-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org> <20220707213204.2605816-6-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Jul 2022 18:32:48 -0700
Message-ID: <CAE-0n53An_S5H-jj7GPorLg0Q4jW=KqEn5CCrfqs6fn6LBtGNA@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: msm/dp: account for clocks specific for qcom,sc7280-edp
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

Quoting Dmitry Baryshkov (2022-07-07 14:32:00)
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f00eae66196f..1ef845005b14 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -119,6 +111,50 @@ required:
>    - power-domains
>    - ports
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-edp
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: XO clock

What is this for? I would guess it's for the eDP phy, but that isn't
part of the eDP controller, so probably it can be removed.

> +            - description: eDP reference clock

Same for this one, looking at the binding for qcom,sc7280-edp-phy. Can
we simply remove these two clks from sc7280? I think it will be fine.
