Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889C43AF66A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 21:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhFUTsv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 15:48:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:56132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230347AbhFUTsv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 15:48:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B349D61357;
        Mon, 21 Jun 2021 19:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624304796;
        bh=lnxmRAOLx2G/gfVU9uDFWE8tnhIK83k9r8INnlkRAM0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=c2+nlVyJd/TabDbWdW+hYVLVm+ZPbx5EBZmwqTvwxQYB49WdOXvMpfPptzbLmgGw9
         Bt0R4fusIbFbY0lFRG79rp1tJMIbteIwnsoUaGfaUPpq7QgoKL7CynXlYhJ9/BlIDU
         tYABJcdTsPGfYEr/JaUTmN02WJQGx8/i79Mq1/VBfufbLQ6zL0BAQvOeCKcBOHzar3
         h4aOCETkJKFK999YWkcmOFmqFvzNNufj/EVFwe1EU/8IpfSeMsqgoOAB9mbp5LbNSt
         opSqgRiLtnU0Ger/HnZACrFcTMvEfE5OBKA+sXXtKNXuN/et7G42FO8gYHAh2wMftF
         48nYR4A+DLd0g==
Received: by mail-ej1-f46.google.com with SMTP id g20so30773698ejt.0;
        Mon, 21 Jun 2021 12:46:36 -0700 (PDT)
X-Gm-Message-State: AOAM531tXJtgOpmL31Tz+4hrL90VXdbCkRzpXHCMj2cSNdqDWQQ9o0Kh
        aqJJ18M2AapEZ4leYFDUFSWvF4qa0yidJxAznQ==
X-Google-Smtp-Source: ABdhPJx/sbO2gPBSW7o+uJ5mY4gfi05JpBn63eNZ7EKWJUPYGXGRlLXdWMYYNKj8dov2Lkh6T/MPI/081uehPLaTrU8=
X-Received: by 2002:a17:906:3b13:: with SMTP id g19mr24880860ejf.360.1624304795292;
 Mon, 21 Jun 2021 12:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210612094631.89980-1-martin.botka@somainline.org>
 <20210612094631.89980-3-martin.botka@somainline.org> <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
In-Reply-To: <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 21 Jun 2021 13:46:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
Message-ID: <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 20, 2021 at 10:03 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
>
> On Sat, Jun 12, 2021 at 4:46 AM Martin Botka
> <martin.botka@somainline.org> wrote:
> >
> > This commit adds compatible for the SM6125 SoC
> >
> > Signed-off-by: Martin Botka <martin.botka@somainline.org>
> > ---
> > Changes in V2:
> > None
> > Changes in V3:
> > Change compatible to apcs-hmss-global
> >  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > index f25324d03842..f24c5ad8d658 100644
> > --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > @@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
> >         .offset = 8, .clk_name = NULL
> >  };
> >
> > +static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
> > +       .offset = 8, .clk_name = NULL
> > +};
> > +
> >  static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
> >         .offset = 12, .clk_name = NULL
> >  };
> > @@ -166,6 +170,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
> >         { .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> >         { .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
> >         { .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
> > +       { .compatible = "qcom,sm6125-apcs-hmss-global", .data = &sm6125_apcs_data },
> >         { .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
> >         { .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
> >         {}
> >
> These all are basically different names for the same controller.
> The 'offset' is a configuration parameter and the 'clock', when NULL,
> is basically some "always-on" clock.
> I am sure we wouldn't be doing it, if the controller was third-party.

If newer implementations are 'the same', then they should have a
fallback compatible to the existing one that is the same and no driver
change is needed. If the differences are board or instance (within an
SoC) specific, then a DT property would be appropriate.

3rd party IP is generally not any different. SoC vendors manage to
make their implementations unique...

Rob
