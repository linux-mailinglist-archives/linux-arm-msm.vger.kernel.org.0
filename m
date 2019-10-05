Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDA9CC91F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 11:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfJEJe2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 05:34:28 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38653 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfJEJe2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 05:34:28 -0400
Received: by mail-wr1-f66.google.com with SMTP id w12so9835289wro.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2019 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihOI4gm6hRizEvLNEnamyniwwFr7PUlkkpGC0HKX6Is=;
        b=Y+scmVjJvbOUAqslPlcrUAq/YgPwU8/NJTPZBHaPt5UhgQrXVTWSgALCtRtsnipiAg
         217v2lKEBiRmvYps/dylHmvxNWqTZz+lmD++8zfr48eZv8vuUiMfe1jm+hyCln6Ko9rH
         h6sQLWcDI/eL5+uMzeYWw00cVL0h648N3CRam9yrnoIbsPrGFsA3nkkbA8OfgGuGEYRt
         a9bh8OsxWt1sHzcYR6uJL+jFpoZ81Mb3kb0iMjjl7+tg1YyIGXt5iHQGBiehUHghB4go
         WjeP/acvKaFRoL/ZxpvVy1ErJUfd6IayX6AsmIlS08jo4kY+lK/35Oxl9uLVKbPbxgJ1
         8vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihOI4gm6hRizEvLNEnamyniwwFr7PUlkkpGC0HKX6Is=;
        b=oCkYCp86GIbmjrIT56N4NL6ClWUrNU4azS9wEkg9+sVxqAnm3d8WLOhHPcwI5pYA/X
         lO2lGrqL8trDr/JEkRZHQG8APenrv07oyU3RKBheCMAZXkAqz4NRjOxjK2IdsFNjU4s2
         L/eGUAkSbU8gwzLkDGPEEtXX9P0THqNaNVh4JL9xgsnKo1EJR23rcyYI9nulFAmbm12X
         3E6xH1jXINDMcBNP/PlAILOEY9DP0Pxshe0OUry5zOzBSEnlrXjoUd075LCQNu6EDTUE
         o+ztkiQjr6mNLxy7B6jvxx7gVwt7otz6/ALLlK2cWXt0cuAQSkQMSJCYcq944uDM3HJD
         Ercg==
X-Gm-Message-State: APjAAAXqBRjflCWW9P9qbQoBuQAASn5hGniw3lJAfeZGzv/cBJ+YYsWX
        MmEGiagKUhk0nuqE4BE+7JdCEa+lBWlHvOmN84k=
X-Google-Smtp-Source: APXvYqzuSPdg+b75mfuUEtIYzFjQFP/rJ2FCVGIOkYHn7gtTV04cbRPGovXTPMLxd4mgMDyuZDluyw+uNqPWeZkroTg=
X-Received: by 2002:adf:ea88:: with SMTP id s8mr15762064wrm.114.1570268064627;
 Sat, 05 Oct 2019 02:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191001085707.8424-1-kholk11@gmail.com> <20191001085707.8424-2-kholk11@gmail.com>
 <CAP245DXyPraU_cL6PezSLL8sHP7-JQ6J-qtjqfV6eOxmhOb9pg@mail.gmail.com>
 <f1881a4a-f8d4-ec64-972f-cbef506bef0c@linaro.org> <CAHLCerPXEXV_poraTzS93Ximitf-mx=CNdCikfczNfW7_NUSfA@mail.gmail.com>
In-Reply-To: <CAHLCerPXEXV_poraTzS93Ximitf-mx=CNdCikfczNfW7_NUSfA@mail.gmail.com>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Sat, 5 Oct 2019 11:34:13 +0200
Message-ID: <CAK7fi1Y3NizYq9R+F=aMFAzkt0qcJAWf40f_SGDchkF3orq9qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] thermal: qcom: tsens-v1: Add support for MSM8956
 and MSM8976
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        marijns95@gmail.com, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il giorno gio 3 ott 2019 alle ore 16:02 Amit Kucheria
<amit.kucheria@linaro.org> ha scritto:
>
> On Wed, Oct 2, 2019 at 8:57 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> >
> > On 02/10/2019 01:00, Amit Kucheria wrote:
> > > On Tue, Oct 1, 2019 at 2:27 PM <kholk11@gmail.com> wrote:
> > >>
> > >> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > >>
> > >> Add support for reading calibrated value from thermistors in
> > >> MSM8956, MSM8976 and their APQ variants.
> > >>
> > >> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > >> ---
> >
> > [ ... ]
> >
> > >> -/* v1.x: qcs404,405 */
> > >> +static int calibrate_8976(struct tsens_priv *priv)
> > >> +{
> > >> +       int base0 = 0, base1 = 0, i;
> > >> +       u32 p1[11], p2[11];
> > >> +       int mode = 0, tmp = 0;
> > >> +       u32 *qfprom_cdata;
> > >> +
> > >> +       qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
> > >> +       if (IS_ERR(qfprom_cdata))
> > >
> > > kfree(qfprom_data) here
> >
> > (Assuming s/qfprom_data/qfprom_cdata/)
> >
> > Where the allocation happen?
> >
>
> nvmem_cell_read() call inside qfprom_read()
>
> /Amit

Thanks for the review. I will apply the suggested changes and resend ASAP.
