Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 967E55734B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 12:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiGMKzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 06:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235313AbiGMKzl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 06:55:41 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC3BFF591
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 03:55:40 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id z3so6433772ilz.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 03:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=plZSlH+I5O8PlpsjQVgP55GuUwpIHXkHnkPiVS3vYiY=;
        b=B5OeBVGlVuvH+a4ow6PdXZ4coDwTfkRH0D5Zbh0wAKomf3JxsCXnRYmEb7MNyDOuKr
         YTMelfs6dC/HuIm8EcBpVA1rFGiKYD/7NgYfaBAc3M9KUXuf1ZM7USxuNwS+YQZCluSw
         mvX67g56k4vXLNaDzu8WDcsp3kuFHMkLcosF1x+YpDTNYK3OIr7SRQSrhPL+s7+YFCiP
         djQ1Kcim6noT9sttX4cPkoleoZC9tN7T4cgNi/H5zxLh/Qwf3hRFZwxzGTDIT6oiFgn4
         hAqJSHpA5wGNVK5kyKGWr3pDO+AkIU20rAdJQrgGRwC+MYSy1b3EWPCxJG6SAMVAjp0/
         7Srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=plZSlH+I5O8PlpsjQVgP55GuUwpIHXkHnkPiVS3vYiY=;
        b=i/hr6SayKBmqY4wTFIwRHg9fDpalYeuk+GXRKRu2k3NT+RHHl5aQhTb9xT1V/cTy0W
         I8jVcRg7BPVgG4p9YZVz4TIspedi59gdO1teX0cGlg9QccnEbUYRG3aFk01FWCszP99K
         3rGkFJWp311LGYJnvstAK5P+a/NBxA4M/3OIzyDs2sRFo4t6suoHW2/e0JEuHkdhJPKu
         DXrCMB7GrNmCZbbr8eJVPSgNeU/djR8riYQcEYiV6qXKvcq/0+YMes/dqHvF/KLcIbyd
         3ORhGXrI0aaEgXvnr/NphFUDA/Pg1WC/7XW7qXZgQwKmhdj5+Y4KGXgM+xllIQghOKYN
         V8JQ==
X-Gm-Message-State: AJIora9+MJ8K6Dk/s4902BQeQ46zKiSVjng5YKTK1fHIlb6FS5x/CW8b
        ClorMajqRwvG5yL2MdFF9ySNjVikKUYj5UMOq2w6RQ==
X-Google-Smtp-Source: AGRyM1s9qYzsNvLD7gjbAFuTD/fV+NMhJpSkzOyRbmOcv8lTos3rKA267x/OYE4INghDUQXXPlc6Lk3HuREo6AEl6/I=
X-Received: by 2002:a05:6e02:20e9:b0:2dc:734b:d52b with SMTP id
 q9-20020a056e0220e900b002dc734bd52bmr1505139ilv.261.1657709739577; Wed, 13
 Jul 2022 03:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220712144245.17417-1-krzysztof.kozlowski@linaro.org> <20220712144245.17417-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712144245.17417-2-krzysztof.kozlowski@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 13 Jul 2022 12:55:03 +0200
Message-ID: <CAPDyKFodOTRavzy=+9WM0d9=UJQ2DTc2K+6iN531tRdFN=Rv9w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: mmc: sdhci-msm: fix reg-names entries
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Jul 2022 at 16:42, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Bindings before conversion to DT schema expected reg-names without
> "_mem" suffix.  This was used by older DTS files and by the MSM SDHCI
> driver.
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: edfbf8c307ff ("dt-bindings: mmc: sdhci-msm: Fix issues in yaml bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/sdhci-msm.yaml    | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 0853d0c32dc7..fc6e5221985a 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -60,22 +60,22 @@ properties:
>      maxItems: 4
>      oneOf:
>        - items:
> -          - const: hc_mem
> +          - const: hc
>        - items:
> -          - const: hc_mem
> -          - const: core_mem
> +          - const: hc
> +          - const: core
>        - items:
> -          - const: hc_mem
> -          - const: cqe_mem
> +          - const: hc
> +          - const: cqhci
>        - items:
> -          - const: hc_mem
> -          - const: cqe_mem
> -          - const: ice_mem
> +          - const: hc
> +          - const: cqhci
> +          - const: ice
>        - items:
> -          - const: hc_mem
> -          - const: core_mem
> -          - const: cqe_mem
> -          - const: ice_mem
> +          - const: hc
> +          - const: core
> +          - const: cqhci
> +          - const: ice
>
>    clocks:
>      minItems: 3
> --
> 2.34.1
>
