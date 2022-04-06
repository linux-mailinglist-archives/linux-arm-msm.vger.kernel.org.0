Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32B84F6632
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 19:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238051AbiDFRDn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 13:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238696AbiDFRCj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 13:02:39 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF9E48C268
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 07:50:24 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 17so3583473lji.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UGnLkTqCELTBFaSqMXTfWHZuWgTtkPCAkZqgsLO5Kg8=;
        b=QO1SBDU20mwhil2dNyoItjQRcPfzmAt1Lu/Jgd5Z6pMa0P5Y3vDnaSDvLwlLktAM0s
         PngBw2IZjX0lmzelI40JlKFI4VtvGY4l+7ggY7BPg48KXQdsaLyGSfUxceybx5g97tSV
         W39WKKIrxplFlPVKK9nNIUwmZuoP3tczjH8ua6A23IeZ7R+vKrBGV/CWgczAVJ4dTr15
         oHpH9QWHEaNV+hz8MBKoFT82bDVvC3ZvtzEerYamAkjTRs14q8RYlNqjAEY8eEHmfTQf
         72FNgOEcgqzgMYBeolpay33rQsS6awSE59sD7K7xb+tzkXOr4fth9cFTWiAb2QEekJiv
         265A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UGnLkTqCELTBFaSqMXTfWHZuWgTtkPCAkZqgsLO5Kg8=;
        b=Qu9Im49b8t2B78g/r6wsu1qltShtdo9MWNJmUx7l6+2SAgLbjBW9inG/koUIs6jTwl
         PW7V/N84iZx63mQHh9Y7BWjUXT963a3u110WFhDQiizTRrtNAsEvjXmABpCRE14EMtF1
         zJHeXmk2sf1RPDSdfjDMvRAzg1yh3IRWta+iLCI7pcSTovVMg8S0QB0ki3usJhZA3GDl
         rOrEUnZ+hY+NZmj4sIHX5eT/F2xQH2yuUfBSJVIwliKZKtcotWsyqsLrscE/iaN0Xd83
         pClBbdt/h/Kvo39ORmx8ERd//gKgseSzrdI8fXTSwkrHep+wgIKWwHab7vmKa2vdO/Y1
         J4kw==
X-Gm-Message-State: AOAM531s/S5xT0x6K3uHbIs/Di02ZL0TBQU8YFy0LjUPSpnm5kE3T/Pd
        XSY/Z2+UClVzHDv41DOaP29pn+R00Yk1BcATaALB7ev/p/CL3w==
X-Google-Smtp-Source: ABdhPJxvvBQ5AibBUrHQG5pwBKe7uNSo6RJTvLK3rzdgI8ek8VR+r/hnNLoH6wHR1lBxQc7vPOZ7/KfkFj5WLVKnIt0=
X-Received: by 2002:a2e:9048:0:b0:249:78bb:375e with SMTP id
 n8-20020a2e9048000000b0024978bb375emr5584753ljg.229.1649256622309; Wed, 06
 Apr 2022 07:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220403145133.93583-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20220403145133.93583-1-bhupesh.sharma@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 6 Apr 2022 16:49:45 +0200
Message-ID: <CAPDyKFp2U0MgrJYeV9T=fJ+82+2OP-VT1rSqgbyrAQM2E9ssfw@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: mmc: sdhci-msm: Add compatible string
 for sm8150
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-mmc@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        Rob Herring <robh@kernel.org>
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

On Sun, 3 Apr 2022 at 16:51, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> Add sm8150 SoC specific compatible strings for qcom-sdhci controller.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index 6216ed777343..35a7d78da213 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -25,6 +25,7 @@ Required properties:
>                 "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
>                 "qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
>                 "qcom,sdx55-sdhci", "qcom,sdhci-msm-v5";
> +               "qcom,sm8150-sdhci", "qcom,sdhci-msm-v5"
>                 "qcom,sm8250-sdhci", "qcom,sdhci-msm-v5"
>         NOTE that some old device tree files may be floating around that only
>         have the string "qcom,sdhci-msm-v4" without the SoC compatible string

Even if this is a trivial change to the existing DT bindings, I would
really like to see all mmc bindings getting converted to the new (not
so new any more) yaml format.

Would you mind having a look and doing this conversion?

Kind regards
Uffe
