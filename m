Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F471F5CF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 22:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgFJUSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 16:18:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:59058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbgFJUSm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 16:18:42 -0400
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B3795207C3;
        Wed, 10 Jun 2020 20:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591820321;
        bh=lZD7Sa+lOxkbDXZoiCEaR5gV4LQiphLbs7wsQ+7OUGA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2MY6RsEg8AE2qbI2zGFtH4+jGHVA0PEHwFVAhqnqr9RkbYkjLxIpCyCtDV6SV7+vV
         mXSnExBwV41CziZyJhWMpMidhxWu7mp0XB2T/xpXaaa0dOkBzpTsCT5zpN/Z2y4ogO
         Xa9AXfDHzWrEjqKC+eQuaGE8Arh20givzxJRc0Sw=
Received: by mail-ot1-f52.google.com with SMTP id g7so2747971oti.13;
        Wed, 10 Jun 2020 13:18:41 -0700 (PDT)
X-Gm-Message-State: AOAM5308XZJlwzfGOpLJkM0ANd54ZYOVsyhWPitoSOmYqVsHxwP0J/fR
        gGYrD5H0T+0h2En2efkneTaMcMo/SvtN+VAXEg==
X-Google-Smtp-Source: ABdhPJwyNrli2IyO7NvXxO4E/Ji/aw1Bh37+jXYs5prN7IoJzLfRj7nt48qp5876ykVDiZ4z1KCiN3+jvukHbLzH6gE=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr4180042ots.192.1591820321058;
 Wed, 10 Jun 2020 13:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200602200837.321712-1-konradybcio@gmail.com>
In-Reply-To: <20200602200837.321712-1-konradybcio@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Jun 2020 14:18:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ-eHd5yfQ=qg+SSTd6a=xr8C2mGWKMKutDQBfY9XoH+g@mail.gmail.com>
Message-ID: <CAL_JsqJ-eHd5yfQ=qg+SSTd6a=xr8C2mGWKMKutDQBfY9XoH+g@mail.gmail.com>
Subject: Re: [PATCH 1/1] Documentation: Document an existing qcom,rpm-msm8996 compatible
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 2, 2020 at 2:08 PM Konrad Dybcio <konradybcio@gmail.com> wrote:
>
> This compatible has been included in the driver for
> some time, but it has been overlooked in documentation.
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> index 25541a475ead..4b916d67064a 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> @@ -24,6 +24,7 @@ resources.
>                     "qcom,rpm-msm8974"
>                     "qcom,rpm-msm8976"
>                     "qcom,rpm-msm8994"
> +                   "qcom,rpm-msm8996"

This is dependent on your patch adding 8994. Send them as a series
please (or at least mention the dependency).

And use consistent subjects. Run 'git log --oneline' on the path a
patch touches to find the pattern used. ('dt-bindings: soc: qcom: ...'
here).

>                     "qcom,rpm-msm8998"
>                     "qcom,rpm-sdm660"
>                     "qcom,rpm-qcs404"
> --
> 2.26.2
>
