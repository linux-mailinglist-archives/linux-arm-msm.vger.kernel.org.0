Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1911FCA000
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 16:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbfJCOCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 10:02:37 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:43804 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729378AbfJCOCh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 10:02:37 -0400
Received: by mail-vs1-f68.google.com with SMTP id b1so1758910vsr.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 07:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dhOJGsC4Fdv94t4svtqRa/Qyq/VJml/pE/ShGwRDryg=;
        b=xC0DLOGiKrOZq6c+lRFer6ZcHmy9R3m4dvVGvEv7TH1OLWeNlAsET4LMBkgS/7c8pm
         8dtq90OChpILtlVJqIVdGhoSwhyL54n25YbeKDWb5AFyW7lqqXZZwKYIN3fV4Zr3UB6x
         8cgb71dKdEGKZ833tacq3Pf2u/ruPJhjEGLHFj52tswaFW2lGFJZkuKRFgc7k7IN7YeS
         wpBy7IpqcTQx0+12lmLkFrKnllnyP6v0wsRnIWt7MLxV9Y4huUFYVjaV+QKN7/ANr0Y3
         rurc6q+mZH+7R8rHOTiBkLb4KW2optnBhqOQiqoFiW5atnqgYO+79dP1HGYEcdRc4Q5Q
         5IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dhOJGsC4Fdv94t4svtqRa/Qyq/VJml/pE/ShGwRDryg=;
        b=GjNNdsVNsPSDPJZMFlFkpOnqPglraGD+/x0LY3IV5PCv6eG8S26/xyB/DMrvSVFuzA
         XMVTSCpVSI74r+QRPDiwvUKQdjhpeH5/8R2U1UMuusHFnF0fpdpre991WmHgLz5ouwi0
         d4xqYRwv3i+s6pzBl5TAlUMpSTlJ0d98Lsk6vq15aJIZTHJT47kT5PWdeRA5aeolboUo
         TUjUryCgOlZYr3rm6n2JzfnosCIJKTgva7K5rqAVWRu1n+B+mB/tUGLFILcCrlJ6Djwk
         HIZF/5AvpVtZzsujS1DPXCadbuXWBKyBi92J4nUCryEB8EdE6saAErtjZejsjrXQDzQp
         7Lkw==
X-Gm-Message-State: APjAAAUb10MDA2R6Kq3GAYcAUXHzaMPWOJV37ZIyyHzKuzncCv6Z0KYa
        GWuF0sdpLnSSww4fq6DPVDTi8o8YubPotcGQVZLVPA==
X-Google-Smtp-Source: APXvYqy3aZJ0/USWcIEcP384uK/pmAU9PSqcX7sFEWOFfdow/EZyjScqsrpUg2HEkkfcZIVgP4E954nJckFYow0Goto=
X-Received: by 2002:a67:d789:: with SMTP id q9mr5102405vsj.159.1570111354565;
 Thu, 03 Oct 2019 07:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191001085707.8424-1-kholk11@gmail.com> <20191001085707.8424-2-kholk11@gmail.com>
 <CAP245DXyPraU_cL6PezSLL8sHP7-JQ6J-qtjqfV6eOxmhOb9pg@mail.gmail.com> <f1881a4a-f8d4-ec64-972f-cbef506bef0c@linaro.org>
In-Reply-To: <f1881a4a-f8d4-ec64-972f-cbef506bef0c@linaro.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 3 Oct 2019 19:32:23 +0530
Message-ID: <CAHLCerPXEXV_poraTzS93Ximitf-mx=CNdCikfczNfW7_NUSfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] thermal: qcom: tsens-v1: Add support for MSM8956
 and MSM8976
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     kholk11@gmail.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        marijns95@gmail.com, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 2, 2019 at 8:57 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 02/10/2019 01:00, Amit Kucheria wrote:
> > On Tue, Oct 1, 2019 at 2:27 PM <kholk11@gmail.com> wrote:
> >>
> >> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >>
> >> Add support for reading calibrated value from thermistors in
> >> MSM8956, MSM8976 and their APQ variants.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >> ---
>
> [ ... ]
>
> >> -/* v1.x: qcs404,405 */
> >> +static int calibrate_8976(struct tsens_priv *priv)
> >> +{
> >> +       int base0 = 0, base1 = 0, i;
> >> +       u32 p1[11], p2[11];
> >> +       int mode = 0, tmp = 0;
> >> +       u32 *qfprom_cdata;
> >> +
> >> +       qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
> >> +       if (IS_ERR(qfprom_cdata))
> >
> > kfree(qfprom_data) here
>
> (Assuming s/qfprom_data/qfprom_cdata/)
>
> Where the allocation happen?
>

nvmem_cell_read() call inside qfprom_read()

/Amit
