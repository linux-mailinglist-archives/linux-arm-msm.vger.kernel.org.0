Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B4B3AE217
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 06:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhFUEPB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 00:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhFUEOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 00:14:50 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F5BC061574;
        Sun, 20 Jun 2021 21:03:16 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id s19so7305737ilj.1;
        Sun, 20 Jun 2021 21:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p5UDpfgo5AOHCaX0JpdGKP9xzPLEPt9T/y03N0fRCY4=;
        b=OKkVl4teqRhhXxqcimH2zxCDycQ76+S+dawezbfPtGtQUIrXeRuMaw78L5ZOypI8y1
         KgtSCVVuPK9I5pqB1q/ynBzH7aPG9I78ws77f/v1q715UgUgrr0zstQavSOSTakJx322
         wsEuWo3CwxFClq6+7AKBZVryXHa7bJYlQTt1duwXNCzFZN/N8z8+Wi8BOiE31tiknNf+
         g2fgYLOXJHx1Uf158iLhT+jKun7/xVdocu03oDdt/L+whV2N5phxxxSRtQFtjVm9Stad
         PCHJDSF3ZVHjty0cCkAMG7MOYZjo3SWLufz9117JFWoOjpeNHo60UTuj2JD5pFdCs06u
         +o3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p5UDpfgo5AOHCaX0JpdGKP9xzPLEPt9T/y03N0fRCY4=;
        b=UVNoDwwN1vgxjjuFLaO976t7CF7X1Y1XzGNAsolHYFlyum97A5DQB+sYh0tdb28QhP
         mi0FMCC/cDseh87t2YXhJtZLQiskqjDWiz+987PZp9ioODYtNnsEE7dRhiss6qcixRr+
         WjZkZraqhleH0oDtEmnfXolJsFesJeUsOqX1F+RL94PPLJpFKivkZwIcwsmwtenf/PJy
         H4musJIStl4xiuMOpW9zZpaDlLeL6y6ym1MShIaVGH6tD3ytboXa3q+lJ3EMVEK6+Vy7
         Q1Pl1V5hfDP9MVWVNWKfArhmuhJ7uvlBsm0/h6AyYm8TAFBgnCRP7d/OsFCJh8Ng0yhj
         VWIA==
X-Gm-Message-State: AOAM533/wCAKgJxmv7q9XprpxWt2eKUrjPWCvMSfqZxjK6qbhZGlkjhZ
        WWB0kF/71xu/RcxEogCGlr6GB0ar7XfuC5IUDsPvDMW+E2o=
X-Google-Smtp-Source: ABdhPJx82zEJKWuu/YOeqVSNgybYGrfy6xikBlOfVE8L1pPAKxWlvZZIJ3ln8yeS4PYziDhMe4H5MjQaPpgPMoHKotw=
X-Received: by 2002:a05:6e02:1d97:: with SMTP id h23mr3880075ila.108.1624248195557;
 Sun, 20 Jun 2021 21:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210612094631.89980-1-martin.botka@somainline.org> <20210612094631.89980-3-martin.botka@somainline.org>
In-Reply-To: <20210612094631.89980-3-martin.botka@somainline.org>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Sun, 20 Jun 2021 23:03:04 -0500
Message-ID: <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
To:     Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 12, 2021 at 4:46 AM Martin Botka
<martin.botka@somainline.org> wrote:
>
> This commit adds compatible for the SM6125 SoC
>
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> None
> Changes in V3:
> Change compatible to apcs-hmss-global
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index f25324d03842..f24c5ad8d658 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
>         .offset = 8, .clk_name = NULL
>  };
>
> +static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
> +       .offset = 8, .clk_name = NULL
> +};
> +
>  static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
>         .offset = 12, .clk_name = NULL
>  };
> @@ -166,6 +170,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>         { .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
>         { .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
>         { .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
> +       { .compatible = "qcom,sm6125-apcs-hmss-global", .data = &sm6125_apcs_data },
>         { .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>         { .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
>         {}
>
These all are basically different names for the same controller.
The 'offset' is a configuration parameter and the 'clock', when NULL,
is basically some "always-on" clock.
I am sure we wouldn't be doing it, if the controller was third-party.

-Jassi
