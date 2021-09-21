Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318C9413A01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 20:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbhIUSWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 14:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbhIUSW0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 14:22:26 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15EEC061767
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 11:20:19 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id c8-20020a9d6c88000000b00517cd06302dso29563500otr.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 11:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WKyzmgnHJINWtPvZlYfzre1HLxtYPHyz4zYYlK0FW9o=;
        b=GKzRmBJQRm1k1ryPF8jAS67Da1No9r+QlbLv/Mp5fkG/sy+sXYXns7Hvau6T7dTr2m
         ZyAd1O+ceitHZciaNwjT01FjhrkUlS6d7PXh/qSYV8jzbNDI7QNjDqGbo1hsTxT+Tc2O
         bMA/7FAkIWNY9AOJgNKSqwzJZPLIAp/HUNT90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WKyzmgnHJINWtPvZlYfzre1HLxtYPHyz4zYYlK0FW9o=;
        b=TgSgl1ZmT1D2kvrfFPzb6JAbrq+OdC7pR6KoxM3jBDPePVah3oEyJ47nZOYvXU1TDc
         uyhkojFQZp1tmqv16uC1T34D35uI8x1X7FQRy38/i5Kr1E44TvQliO0Lv9LZlk1xoHqz
         Erikz5GgEADm7cmmqulj52TWa9zoIy4Iq2KWE5KR91RJhVeBwlcMkhCJ4RJQW5ggD5aI
         MzKMsBdyzP8drVbexpL7Q2TdcmTWFKcbiMf/SNtk9en/KaxVwIBvBWAOA7LDYg5dmV2D
         7rXCJ4UX76Vizb7HwTKNA0qA4xQxXolhf8lc/TbWCwkFZ280EWPbauJLmzoLtlqOAxNp
         UWmw==
X-Gm-Message-State: AOAM532g1EXgEKSNF1T3lSYY+XE1ijtG9Lr5YqhR947kZVYz5lEWvWRh
        vcnk6YvcdkvDkpedfbvZxm/irHebtaO18t6xUEZgjg==
X-Google-Smtp-Source: ABdhPJwVQGpbXDcYSl+Em67fjmFB/rKdlJft8dje1JqsYl2U4YoBQvz1TLbEhMxpdkTtU8DB4uh691tnAAAHkyLkxz4=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr25764077otp.159.1632248419338;
 Tue, 21 Sep 2021 11:20:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Sep 2021 11:20:18 -0700
MIME-Version: 1.0
In-Reply-To: <20210921152120.6710-2-stephan@gerhold.net>
References: <20210921152120.6710-1-stephan@gerhold.net> <20210921152120.6710-2-stephan@gerhold.net>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 21 Sep 2021 11:20:18 -0700
Message-ID: <CAE-0n51Ukr0FMhzHotrGnrJjE3=w2X_u4ukc1KC_HpjjsUdNfg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8916: Drop underscore in node name
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephan Gerhold (2021-09-21 08:21:19)
> Using underscores in device tree nodes is not very common.
> Additionally, the _region suffix in "smem_region@..." is not really
> useful since it's obvious that it describes a reserved memory region.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 5551dba2d5fd..95dea20cde75 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -41,7 +41,7 @@ tz-apps@86000000 {
>                         no-map;
>                 };
>
> -               smem_mem: smem_region@86300000 {
> +               smem_mem: smem@86300000 {

Shouldn't that be smem_mem: memory@86300000? Node names should be
generic.

>                         reg = <0x0 0x86300000 0x0 0x100000>;
>                         no-map;
>                 };
