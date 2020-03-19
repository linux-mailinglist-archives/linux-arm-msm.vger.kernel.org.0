Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98DF918C0E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 20:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbgCST4X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 15:56:23 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:33416 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgCST4X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 15:56:23 -0400
Received: by mail-vk1-f196.google.com with SMTP id d11so1115639vko.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 12:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DLBNTBHIjEyXTiw55gKa/omvhkGIw8WPWOA9rE0GXXs=;
        b=n2qP4XqtmbRkwTffuQFwXJ8Kyni1t5QKf1wQ8bKFluTixABW8LclzLmeroCG6blV/l
         awphaC3e1tqOhhxG8oIRoFCgEHirN44udIlHn+jv7e/H0fLrNxw2T9El9mTkJTlcv2RH
         kaN8TRp+3RuLDIfeopbdNQOj1rMzW0u0soesEQnHj/Q2gMVVlWsC6l51kX3+W5spG3/M
         tSNiUojk//lSCskPzJvYQXr6JAidCMkL64aYox05L2ttTMQf7wFZIVJiuVZHwgdFPkWJ
         5sFDbFx/h68TUjJujkzCTnqXHGiDDOZe0V5D/GioJ4LrIYoyAsPTvsoQLMLVns2QxzHQ
         /L5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DLBNTBHIjEyXTiw55gKa/omvhkGIw8WPWOA9rE0GXXs=;
        b=Rs6RruFP9Szzd3ndpq1jjMTB4Hn9M4g3Q4zKN8nDSCUiaoo+dzQJAOwYltdG0YoC5Q
         o8SvnnnIWEC+YMv2N22zoeKQNb0HF6GIBDerN4UMzQSGGXx6h57SYKD3QOA8mhlNGyDV
         w8nmiRxXsBW4TDOIPSPQXJ4Mfi+SV1IgYl1YE1Uf4tRlR01DNW7Eak8b4efuI2yf7YQT
         64G4BFfXdv25biygnIsFzc00gYW0DWvd7IDQBepdKwouHZJHiuCADR5ZpYgOKBHMVnrs
         iUBc/bHbcg7xk9pvG+WSDbVVYDJw0Bq6DeXrZueC+o/V3QR/nTmiWjdWjG9ZqnPveRCu
         DG7w==
X-Gm-Message-State: ANhLgQ3saD7noeeTjv4ddu7vf0a9fhQpb+nCCslrvWxZMx3kMacPbhB4
        pT4GPQ0zMhkh6UBkpeAmETJ7i/ZLU19L6BP5yvmIHg==
X-Google-Smtp-Source: ADFU+vsaENDE48G+5hFTrdcp8SdOg6jmNmlEKUXleLosv38MNvy4urf9d4m7YrrZOIG7TGgcaOW4KO2DKYZxBmH4lSc=
X-Received: by 2002:a1f:e004:: with SMTP id x4mr3982623vkg.79.1584647781469;
 Thu, 19 Mar 2020 12:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200319184838.GA25767@embeddedor.com>
In-Reply-To: <20200319184838.GA25767@embeddedor.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Fri, 20 Mar 2020 01:26:10 +0530
Message-ID: <CAHLCerN0itdrifCGr95aynjYGOmH9EiJbR+7QCGN174aRTELZA@mail.gmail.com>
Subject: Re: [PATCH] thermal: qcom: tsens.h: Replace zero-length array with
 flexible-array member
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 20, 2020 at 12:18 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  drivers/thermal/qcom/tsens.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
> index e24a865fbc34..92503712596a 100644
> --- a/drivers/thermal/qcom/tsens.h
> +++ b/drivers/thermal/qcom/tsens.h
> @@ -488,7 +488,7 @@ struct tsens_priv {
>         struct dentry                   *debug_root;
>         struct dentry                   *debug;
>
> -       struct tsens_sensor             sensor[0];
> +       struct tsens_sensor             sensor[];
>  };
>
>  char *qfprom_read(struct device *dev, const char *cname);
> --
> 2.23.0
>
