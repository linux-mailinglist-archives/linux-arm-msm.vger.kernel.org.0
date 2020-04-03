Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 153CE19CE36
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 03:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389171AbgDCBjK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 21:39:10 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35144 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390161AbgDCBjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 21:39:10 -0400
Received: by mail-wm1-f66.google.com with SMTP id i19so6018782wmb.0;
        Thu, 02 Apr 2020 18:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=3AFMHS1WtjkegpTOd6VcZdSWdEDiYCNRGU1r6BLfA4c=;
        b=h9khXu4iGRCOEqc6AGX9JaFQ/zfObIQd3ONsEZqn5snz+vtAXcQLCNd49yy/4tl26+
         +68y4zXQrRoxvIZKXzM8aRL6FLfJjPNIQHmzhS44lQbsNE42ieya2IT1D29//HmhSD6F
         uOb5FZcGB4ab9B5t61d0lTGRtf1ncQtZ61cICEEg2S9EMPun2VmELQ9l/Tnta5ZgXbqI
         nIP0CO032qLaR5NC1poTwfBK+w0dzLe3CRJxvJO0Iuzx6aZOWOKbrgXhBmeTVnhAemdt
         a8vBLPrp4w99ls/diJ/XdCJltz1zAS6ljCp0KUejjnticfdISUMDgv1fLZE5zXknuQYZ
         Bq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=3AFMHS1WtjkegpTOd6VcZdSWdEDiYCNRGU1r6BLfA4c=;
        b=adYJXPPVaePdnzDmOjdmheVTBpjSK2BUSj6iDmSRbohVv+ND9DjK/m8jvP/PQRY3vg
         duQb3cTCcFMuGrF5YGUF0I67HwEqkiY+8/cGbrxKvGngeOsSzSB+GWaJXoekQnTK8Ufs
         3GDYNjPN0WNWR77Ci26Np15B2s9Rt8z+vErwNXn9EpCwhJAQK2/QjpVbWV72pXtKtzOv
         lgbtWkDnX34mCWqvdJ508kICg9N7B/aeuXlSZypzb1wLbalAySq7XPoFss2RzA4CVo3C
         tXJWcD5IfuMTh4Tjap3wPsraW9Z1kagE3tNuvU+ZxkAZD+qSJbslaXLI5+xM60yvQyy6
         Uzyg==
X-Gm-Message-State: AGi0PuYPvaHJ1tUPrDKAEabrhFz+qYwTVmEWi1jzmqLoMCW2J/5zDGQn
        MIg7jaKKdqeCKHYK6YpchPs=
X-Google-Smtp-Source: APiQypJh0jEGg74M2Qrhn52FkumZVE1QcoT+LEnI3m7Nmk8CPCIgnWQAexV8JnhYuE/7tuSExWLIFQ==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr6450052wma.83.1585877947650;
        Thu, 02 Apr 2020 18:39:07 -0700 (PDT)
Received: from AnsuelXPS (host133-251-dynamic.52-79-r.retail.telecomitalia.it. [79.52.251.133])
        by smtp.gmail.com with ESMTPSA id u17sm10755869wra.63.2020.04.02.18.39.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Apr 2020 18:39:07 -0700 (PDT)
From:   <ansuelsmth@gmail.com>
To:     "'Stephen Boyd'" <sboyd@kernel.org>,
        "'Andy Gross'" <agross@kernel.org>
Cc:     "'Mathieu Olivari'" <mathieu@codeaurora.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Mark Rutland'" <mark.rutland@arm.com>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20200330205647.24806-1-ansuelsmth@gmail.com> <158587766752.125146.7582840761926137726@swboyd.mtv.corp.google.com>
In-Reply-To: <158587766752.125146.7582840761926137726@swboyd.mtv.corp.google.com>
Subject: R: [PATCH v2] ARM: qcom: Disable i2c device on gsbi4 for ipq806x
Date:   Fri, 3 Apr 2020 03:39:04 +0200
Message-ID: <00f701d60958$a9ed46c0$fdc7d440$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQGo1QQgHzu0HPOv8BNyQx6G4xhnEwIGzuWZqLDQIBA=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Messaggio originale-----
> Da: Stephen Boyd <sboyd@kernel.org>
> Inviato: venerd=C3=AC 3 aprile 2020 03:34
> A: Andy Gross <agross@kernel.org>; Ansuel Smith
> <ansuelsmth@gmail.com>
> Cc: Ansuel Smith <ansuelsmth@gmail.com>; Mathieu Olivari
> <mathieu@codeaurora.org>; Bjorn Andersson
> <bjorn.andersson@linaro.org>; Rob Herring <robh+dt@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>; Michael Turquette
> <mturquette@baylibre.com>; linux-arm-msm@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> clk@vger.kernel.org
> Oggetto: Re: [PATCH v2] ARM: qcom: Disable i2c device on gsbi4 for
> ipq806x
>=20
> Quoting Ansuel Smith (2020-03-30 13:56:46)
> > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-
> ipq806x.c
> > index b0eee0903807..f7d7a2bc84c1 100644
> > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > @@ -991,6 +991,7 @@ static struct clk_branch gsbi4_h_clk =3D {
> >                 .hw.init =3D &(struct clk_init_data){
> >                         .name =3D "gsbi4_h_clk",
> >                         .ops =3D &clk_branch_ops,
> > +                       .flags =3D CLK_IGNORE_UNUSED,
>=20
> Is this necessary? Shouldn't we skip clks that are protected during =
the
> unused phase?
>=20

gsbi4_h_clk is not protected. gsbi4_h_clk needs to not be disabled if =
unused
(as it's used by rpm) but can't be protected since it's used by uart =
gsbi4.
(With some test protecting also this clk cause the malfunction of uart =
gsb4)

> >                 },
> >         },
> >  };
> > --
> > 2.25.1
> >

