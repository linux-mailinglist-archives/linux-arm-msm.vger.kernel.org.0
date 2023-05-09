Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B387F6FC4D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 13:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjEILUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 07:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235490AbjEILUc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 07:20:32 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 209B35263
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 04:20:18 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-55a5e0f5b1aso54004507b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683631218; x=1686223218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nj5ZJfc+Qax9NXCTvd4GxbHCGA/QVBQ8vtIwYId/7g=;
        b=k0zK5hDFUSQ/nRKX50jjHhsz+OO9rj0nNdJjHZKkoUxISxvovTkZHF2X+kfWWeRdeU
         tRyYRXD3FpwJz3/cVlKGFa/bQrj4WhlC4EKtjJirwSDuWl0CUANNTMN3SEP5UvUwP+4i
         4Ae8xT6UnAv6DmN0yj6x8hNwxpOtmynMiOb5+HslR6Nlsl/XKXdariRNG6BvmOPYmPjU
         NNKUA69JiSr1raZWFek2Ba4PnJY4chTEtVaFBqNn0seGWJ9X3OjlAWdpe2H6hw/w1GDx
         4zO6oD2dlJ4RH0QyBvSYoaQs1e6y3aoR8nAYkUjVpt8eV3JBAx7XKYJQyqR4YiUAZA+7
         u9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683631218; x=1686223218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nj5ZJfc+Qax9NXCTvd4GxbHCGA/QVBQ8vtIwYId/7g=;
        b=W33oP7o67P+XZ9dJNFWhX7LAjBHWu/nPFQrAt397J68KNPNhhnmkHrc7y2lZ0RqcFF
         c7dZEAU2Ui0BBOGLItZYRTuZwYEsc4m1hcp/8l5xsD7WgVzTl+XDQl0XVPu5V4aoWnci
         ljICD7CdJRLOgkdUwQxpvY5SUu7Mb+9zQcNlro1QOyfm8F8b3VMseKi21axuhdj3AAuY
         96f14fg4S7aW9JDZze6xC58eqeHMTAdZC8yoqKHJMMffSesv5vsj4G955GN3NxsrUlMs
         +YEqE2RUMcMT8qxkVtsPjF2NLGXhzANhxyycT1wNSYoBWCPmQCx8gCRPGODKUmTj1nbw
         1sPQ==
X-Gm-Message-State: AC+VfDzGoK5l1U33flZN9wM7MkTTs/96bbmNpLS9Zmd7iQCFV1luATbY
        2WLz8H8EhrLfzgq5MjsGoLfbIKD27aI8Qcvc4LMA0w==
X-Google-Smtp-Source: ACHHUZ7hnhDsY7WocEpJA8iNH2OWefgS5/6WnH3E1+AHEkvkQnIrG3Hb+xHW6i2F2qtqG/JiRjHJc8DqOPyLu+rJw5g=
X-Received: by 2002:a0d:e0c5:0:b0:55a:1cb0:7982 with SMTP id
 j188-20020a0de0c5000000b0055a1cb07982mr15631974ywe.23.1683631218113; Tue, 09
 May 2023 04:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org> <20230509055044.GA4823@thinkpad>
In-Reply-To: <20230509055044.GA4823@thinkpad>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 9 May 2023 14:20:07 +0300
Message-ID: <CAA8EJpoJr6gK=7fmwmF4+Xi5Ch_-+8L1q1WHkfVOOg+6qj=P3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 May 2023 at 08:50, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Sun, May 07, 2023 at 08:53:35PM +0300, Dmitry Baryshkov wrote:
> > Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
> > The gdsc doesn't fully come out of retention mode. Change it's pwrsts
> > flags to PWRSTS_OFF_ON.
> >
>
> What does "stop working" implies? Does it work during boot and randomly s=
topped
> working or it stopped working after resume from suspend?

It stops working during the boot. I observed the MDP not starting up
properly. Mea culpa, I did not look deep enough into the details, just
stomped upon this change which fixes the problem for me.

>
> Even though reverting to non-retention mode works, I think the issue migh=
t be
> somewhere else. Like the vote might be missing to get the GDSC out of ret=
ention
> mode.

I don't think there is a vote missing. The driver votes on MDSS_GDSC
before enabling access to any of the registers from the MDSS region.

>
> - Mani
>
> > Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET s=
upport")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/mmcc-msm8974.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-ms=
m8974.c
> > index aa29c79fcd55..277ef0065aae 100644
> > --- a/drivers/clk/qcom/mmcc-msm8974.c
> > +++ b/drivers/clk/qcom/mmcc-msm8974.c
> > @@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc =3D {
> >       .pd =3D {
> >               .name =3D "mdss",
> >       },
> > -     .pwrsts =3D PWRSTS_RET_ON,
> > +     .pwrsts =3D PWRSTS_OFF_ON,
> >  };
> >
> >  static struct gdsc camss_jpeg_gdsc =3D {
> > --
> > 2.39.2
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D



--=20
With best wishes
Dmitry
