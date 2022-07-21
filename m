Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D7157D4B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 22:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbiGUUTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 16:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiGUUTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 16:19:23 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46ECD8EEE6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 13:19:22 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id q3so1244657qvp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 13:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nHZhsJvZuU8x8cSV7hJ3bwYV3pDJsGuu8QgGpzsHbKI=;
        b=i3M7DR7R/92yls/0qJasv9Mdrw0PUg60oMhsu7k2wXs0clqJcf4XZSIidylzk7XvNm
         Kj/G/ydgomlXntOBztn/Xdn11KSc5WdAoY0Y98B9SjtG7qXeu8Ai66pmjl5aLDea1jH6
         0pqUs7UHObk7IUP2TZ+CUM0aGIEq8wMAd5Kpw9F57ezZuApAFUyLG7o+As22AxiOcu8/
         RRZp2gGNATKlUqyJ8xiQ20dmkbLmWUg5jXtCtg9l7Tw6Pq6TnQL6nB3X0+sBh+J8xaSE
         4X08lxqqGKlXulgEKo7uuexd/DISTQ7DXsnKkWnk3TmdZ0FjvxAqL8V0io6NMRXUEc96
         sFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nHZhsJvZuU8x8cSV7hJ3bwYV3pDJsGuu8QgGpzsHbKI=;
        b=VK9vPCDLOtxRsTO5ExtwZZPLQTTslkXJsARTSuLxQwVVrhYJCQMa7UiX/nFolStEHK
         fEaWLlqasweDU4o9uqIJPqC51SpmPaSGiPmewAIPUT0u/8+un3nldXIluUVqYTI+Pqbw
         dk/RdU/FVheBpUI8X3sN+NldRTwjff5UnBIA12ZPQOPD/uU5pHeF/xjVbUGoS++7JTym
         pf3bic0CtwsCrl35KWppTdMvty3tQDehDfVCmASX3HCaGXRpPNeahU7WGd/lnrBNYR2G
         XBGxbSVJ5FWyZssDuzV445LxsDg5C/RMdAP4CNLhOd0QNHX+n6BGoZdrbyWFm1m762qq
         BqnA==
X-Gm-Message-State: AJIora/SgzQdnKjbeqdiXvQlILEPJpXP9kJzM3CqPNCB40WplXH+LJST
        wKrUVJ+QTjjh2VhJrb9JkS7veUq5WxI7gSKPBGXHKg==
X-Google-Smtp-Source: AGRyM1tmIb9QZW3GuI3H9geW6F1Yo2ZDUH8ndpTeEDQeOHPdXB96hnQnvYJMducw/HqOnVQWQTotOyM59G4sVGFAdbY=
X-Received: by 2002:a05:6214:d03:b0:473:7764:2ab with SMTP id
 3-20020a0562140d0300b00473776402abmr247073qvh.119.1658434761411; Thu, 21 Jul
 2022 13:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220721195502.1525214-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20220721195502.1525214-1-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 21 Jul 2022 23:19:10 +0300
Message-ID: <CAA8EJppGS38aP7gyd1c3kNgraAVJDoqUef2cDfZpu2aL_iwW0g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: Describe optional 'reg' property used
 for Qualcomm LPG nodes
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org, pavel@ucw.cz
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 21 Jul 2022 at 22:55, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> As Bjorn noted in [1], it is useful to describe the optional
> 'reg' property for Qualcomm LPG nodes as it is used in
> some Qualcomm dts files.

I don't think this is correct. LPG block maps to several regions, so
using just one of them in reg doesn't look correct.

> This fixes the following 'make dtbs_check' error reported for
> pm8350c & sc8280xp pwm nodes:
>
> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb:
>  pwm@e800: 'reg' does not match any of the regexes:
>  '^led@[0-9a-f]$', 'pinctrl-[0-9]+'

I'd prefer to follow the existing schema and to drop the region from
those files.

>
> [1]. https://lore.kernel.org/linux-arm-msm/Ytg3tIaL5h5b9ewH@builder.lan/
>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: robh@kernel.org
> Cc: pavel@ucw.cz
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> index fe336fa16518..f394ab7a757b 100644
> --- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> @@ -27,6 +27,9 @@ properties:
>        - qcom,pmi8994-lpg
>        - qcom,pmi8998-lpg
>
> +  reg:
> +    maxItems: 1
> +
>    "#pwm-cells":
>      const: 2
>
> --
> 2.35.3
>


-- 
With best wishes
Dmitry
