Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22EF93AF8F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 01:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhFUXMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 19:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbhFUXMc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 19:12:32 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06F1C061574;
        Mon, 21 Jun 2021 16:10:17 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id v5so165996ilo.5;
        Mon, 21 Jun 2021 16:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v/En6LjgZY7niJnaQm8RdoU1wPtPLxbEaonoJs+EGx0=;
        b=ZmUtkxCOkuiwBj12vmqa5QcEHioVDk6d2VwahMZZ8Gac3P1YK2bjVlkn9sk8Zr3zhZ
         Xi0aBL/yIv+VoVIs22kjwNZppLSqN0BSmCdWRyNCvV8vQPJC294/IBFq8xzLJkeaFt/t
         rrRHV6VscFsoSv+JmwiAtkhtOzrXe3qPGqcWTzRsQdhRx6GDgXm3QEUxIbjxZiY1pR0d
         cbD6uhB6zP51lalY3ZbatDFCHhhtc2qDdxs1HhwMbNIeV1uk6MQIscDwl5L9H1UjvpBa
         GWkfCyowjeGdhBfQ4sLh4HJvuVixnC9ENU2JQG/6AMvf2brY+h76pTW61boHTqfib0BN
         T/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v/En6LjgZY7niJnaQm8RdoU1wPtPLxbEaonoJs+EGx0=;
        b=TKuj+okqQGDs1jaopGGqD9MuVPqxjhPHDKNgvcd1CHRuRCWFQE6NP8T0QysCjV1vWc
         4XZqPLv13nqJyXeV2gbkWzTKyDQd/q5VZ4I5VQATDlcOEQWHg6RKzAWyJDICUYEVRuKl
         4h2DxnTFPM757FUyDlpNCqZcPVHlbyvEfSgMjXt5uvHySqeAf+L/ljlW/tS8gGVHH+lE
         uixBf3ws67pyXCCh6mIOErRajNYxwrGWZXFsfeo8cB9LIF/C2WAvqF/eqg35h3X1nAjX
         s0eHY6VTbslnzfKWu004TkGCkv5w0lt54lhdiW+LE0phJYLFB//69DSZeNiXjpLkDbo1
         WyWQ==
X-Gm-Message-State: AOAM530DlZIkdEn5Dc/0Ri9y/MahZruTF5Qe64FS2bL40c8LPgST13NU
        j0eX/hZusxrqXBypcbYwLyzkdjAa/idy0kcRgpE=
X-Google-Smtp-Source: ABdhPJxVZ7ObH/DWNclWPKeQmYGx4hKLOy5XIVVIBooPBOnchNtMEYEAyeL7iYUjYelfZajrrRZ6ZxsAhQSh0s+WmB8=
X-Received: by 2002:a05:6e02:1e0d:: with SMTP id g13mr487732ila.178.1624317017012;
 Mon, 21 Jun 2021 16:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210612094631.89980-1-martin.botka@somainline.org>
 <20210612094631.89980-3-martin.botka@somainline.org> <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
 <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
In-Reply-To: <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Mon, 21 Jun 2021 18:10:06 -0500
Message-ID: <CABb+yY0sdSinTm788pMFrqEZ6QMC2OwCP7Kkto+pG9h1aGMzwQ@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
To:     Rob Herring <robh+dt@kernel.org>
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

On Mon, Jun 21, 2021 at 2:46 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Sun, Jun 20, 2021 at 10:03 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> >
> > On Sat, Jun 12, 2021 at 4:46 AM Martin Botka
> > <martin.botka@somainline.org> wrote:
> > >
> > > This commit adds compatible for the SM6125 SoC
> > >
> > > Signed-off-by: Martin Botka <martin.botka@somainline.org>
> > > ---
> > > Changes in V2:
> > > None
> > > Changes in V3:
> > > Change compatible to apcs-hmss-global
> > >  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > index f25324d03842..f24c5ad8d658 100644
> > > --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > @@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
> > >         .offset = 8, .clk_name = NULL
> > >  };
> > >
> > > +static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
> > > +       .offset = 8, .clk_name = NULL
> > > +};
> > > +
> > >  static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
> > >         .offset = 12, .clk_name = NULL
> > >  };
> > > @@ -166,6 +170,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
> > >         { .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> > >         { .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
> > >         { .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
> > > +       { .compatible = "qcom,sm6125-apcs-hmss-global", .data = &sm6125_apcs_data },
> > >         { .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
> > >         { .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
> > >         {}
> > >
> > These all are basically different names for the same controller.
> > The 'offset' is a configuration parameter and the 'clock', when NULL,
> > is basically some "always-on" clock.
> > I am sure we wouldn't be doing it, if the controller was third-party.
>
> If newer implementations are 'the same', then they should have a
> fallback compatible to the existing one that is the same and no driver
> change is needed. If the differences are board or instance (within an
> SoC) specific, then a DT property would be appropriate.
>
The controllers (13 now) only differ by the 'offset' where the
registers are mapped. Clock-name is a pure s/w artifact.
So, maybe we could push all these in DT.

thanks.
