Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8791AB416
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 01:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388476AbgDOXMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 19:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388104AbgDOXMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 19:12:44 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6719C061A0C;
        Wed, 15 Apr 2020 16:12:43 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x18so2569668wrq.2;
        Wed, 15 Apr 2020 16:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=Gm2Rd5l6DnoYokZ1IoTpz0zKlkvip4QX12cLk0Sh6/Y=;
        b=Ii7+b4Ty/DtxMiNuZpivZZjQ3R8YyWC+6OAPG6Csb0Ff18LTuHK5Kc54s7zo7FopNt
         Fjs8JVkdqkT2UHwxkraislcANwMZbYs2JoH/8TwFgA14VGFO+rXyuL8OdzFtG7k2oRGr
         5thp0XbD6cfvool2rYkxBgVmRFH9n9NzcPmoaRmQLTelO7NZ+SY4zic/g2+/1FPM88Qg
         BMc+1QEhXzECwfrpZVcFZxYwb8ZOyISzYLzsOaOZj5hxw7OkmRGaEdQTJFoByKu0oLO3
         0oP7p5lAN7eB5WHVrk9QVfd/pE6ztuS3lz6bQiFMA9abRjOHcpyFFKrJ+MOrzHSAB1Iw
         SToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=Gm2Rd5l6DnoYokZ1IoTpz0zKlkvip4QX12cLk0Sh6/Y=;
        b=Kr4jk7+0gqXr4xf1Pv1cJhaFmN8TL7P3iVQT6J31zcwQeMMqrcpY3OFHSqal6KP6cz
         mZTlEBR3O3h8hochrVCf2fO5kpGvp1rrgKN/Ses3I13aRMODHccRH6Ih7eUiU9p4w0Vw
         NALS9AVwbBsVHECx4ve6CtHYHFabAtw/4Q1MXLd/Ckvff4fmSTpwigiCsq3wuqPADxHZ
         3R+OaxP6dYnL8taOVfNd4jMc7WddLlVIWqvYI8unV/3O3kPC6twK2fCzG8TP18Gf5H+N
         FQil521dUT3UX7gCbKRIP4R8++zxRZ17T5NJPVCdGdni1HH7XcHMDcrTjEPfX8uqeMAd
         D/WQ==
X-Gm-Message-State: AGi0Puaoe723tFxk6dBZeLvNpDioGnIJVNjtfN7J+w0zNG2zRDyZiBcw
        JDblhQG2RSNBISygjv0QiPsRWMpcfv+hsgnb
X-Google-Smtp-Source: APiQypICyCFJ/9PIcka/IfQfq2zd/BrN9iZHxRR5P1Zp5e6XGgqSpT7CshecraQpcd+sI0I+m/Is9Q==
X-Received: by 2002:a5d:6688:: with SMTP id l8mr14527286wru.179.1586992362312;
        Wed, 15 Apr 2020 16:12:42 -0700 (PDT)
Received: from AnsuelXPS (host93-255-dynamic.47-79-r.retail.telecomitalia.it. [79.47.255.93])
        by smtp.gmail.com with ESMTPSA id p16sm18711418wro.21.2020.04.15.16.12.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 16:12:41 -0700 (PDT)
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
References: <20200330205647.24806-1-ansuelsmth@gmail.com> <158587766752.125146.7582840761926137726@swboyd.mtv.corp.google.com> <00f701d60958$a9ed46c0$fdc7d440$@gmail.com> <158605625697.158626.12280118012638752686@swboyd.mtv.corp.google.com>
In-Reply-To: <158605625697.158626.12280118012638752686@swboyd.mtv.corp.google.com>
Subject: R: R: [PATCH v2] ARM: qcom: Disable i2c device on gsbi4 for ipq806x
Date:   Thu, 16 Apr 2020 01:12:39 +0200
Message-ID: <011701d6137b$5cc6dcd0$16549670$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQGo1QQgHzu0HPOv8BNyQx6G4xhnEwIGzuWZAjtxbVgBYzMGUaioH+Tg
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Messaggio originale-----
> Da: Stephen Boyd <sboyd@kernel.org>
> Inviato: domenica 5 aprile 2020 05:11
> A: 'Andy Gross' <agross@kernel.org>; ansuelsmth@gmail.com
> Cc: 'Mathieu Olivari' <mathieu@codeaurora.org>; 'Bjorn Andersson'
> <bjorn.andersson@linaro.org>; 'Rob Herring' <robh+dt@kernel.org>; =
'Mark
> Rutland' <mark.rutland@arm.com>; 'Michael Turquette'
> <mturquette@baylibre.com>; linux-arm-msm@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> clk@vger.kernel.org
> Oggetto: Re: R: [PATCH v2] ARM: qcom: Disable i2c device on gsbi4 for
> ipq806x
>=20
> Quoting ansuelsmth@gmail.com (2020-04-02 18:39:04)
> >
> >
> > > -----Messaggio originale-----
> > > Da: Stephen Boyd <sboyd@kernel.org>
> > > Inviato: venerd=C3=AC 3 aprile 2020 03:34
> > > A: Andy Gross <agross@kernel.org>; Ansuel Smith
> > > <ansuelsmth@gmail.com>
> > > Cc: Ansuel Smith <ansuelsmth@gmail.com>; Mathieu Olivari
> > > <mathieu@codeaurora.org>; Bjorn Andersson
> > > <bjorn.andersson@linaro.org>; Rob Herring <robh+dt@kernel.org>;
> Mark
> > > Rutland <mark.rutland@arm.com>; Michael Turquette
> > > <mturquette@baylibre.com>; linux-arm-msm@vger.kernel.org;
> > > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > > clk@vger.kernel.org
> > > Oggetto: Re: [PATCH v2] ARM: qcom: Disable i2c device on gsbi4 for
> > > ipq806x
> > >
> > > Quoting Ansuel Smith (2020-03-30 13:56:46)
> > > > diff --git a/drivers/clk/qcom/gcc-ipq806x.c =
b/drivers/clk/qcom/gcc-
> > > ipq806x.c
> > > > index b0eee0903807..f7d7a2bc84c1 100644
> > > > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > > > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > > > @@ -991,6 +991,7 @@ static struct clk_branch gsbi4_h_clk =3D {
> > > >                 .hw.init =3D &(struct clk_init_data){
> > > >                         .name =3D "gsbi4_h_clk",
> > > >                         .ops =3D &clk_branch_ops,
> > > > +                       .flags =3D CLK_IGNORE_UNUSED,
> > >
> > > Is this necessary? Shouldn't we skip clks that are protected =
during the
> > > unused phase?
> > >
> >
> > gsbi4_h_clk is not protected. gsbi4_h_clk needs to not be disabled =
if
> unused
> > (as it's used by rpm) but can't be protected since it's used by uart =
gsbi4.
> > (With some test protecting also this clk cause the malfunction of =
uart
> gsb4)
> >
>=20
> Who owns gsbi4 on this platform? Is it RPM? If so, it should be
> protected and we shouldn't touch this clk from the kernel.

Sorry for the late replay. Trying to protect gsbi4 clk cause the uart =
serial to
not work at all as it can't be used by the driver. If for some=20
reason some dev decide to not use gsbi4 uart, GSBI4_CLK gets disabled=20
(as it would be not used), this is the reason of the IGNORE_UNUSED.=20
I really can't find another way to keep both gsbi4 protected and and =
permit
gsbi4 uart to use it.

