Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B85F4D24B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 00:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiCHXN5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 18:13:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiCHXN4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 18:13:56 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165DE2A714
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 15:12:51 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id e22so683509qvf.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 15:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=einqUj8Wi+UvD8w2Ta+vJyxofhSyix4HSnpUvssthgk=;
        b=CKAddMg6Dq2FAD8EVcpxFwXN6hfdoCH0AXMFbVIPbC61cQk788y9T2Thx3pRqEA+Pq
         NGBF2xP1CZKX+9OEKOidtavyVZebq9UjF1q6yPZ/kG/n1VWbMa51u1yVoDjEakWNazqw
         7qM+CIbEh/7wr+oHVMKBIz230FNDLsc5O1RwcVV6SKxeBIHkKtvmIxFF7GYyD3C6Z1jq
         NiAZ4GmQXM5+Zqzwpuf6qUJoF2jjPatDE95RuEcgfw2zK1KZbR4BfotbsEFAyxfWwhwq
         4lg+Z0qiOCvukGomPenNFelv1ticP+T7TqY8JVlpW48i8VbPYHXEU2HR6wpCED8DZ0vq
         5Klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=einqUj8Wi+UvD8w2Ta+vJyxofhSyix4HSnpUvssthgk=;
        b=0N5QJXcCKwbaihNQOEmNeejIFq1+LyHoRlJdczLBldxZaF2hdSdPqJ7NVWVRVpsZIT
         J7jOFXDNvA1i0zZ7nfRKbFx2+LhZUu/vk68E1vHdjG5gHC6clwboUn7Zto63Qx67kcmB
         wIsuUsbEKHCniSTMe1IUvjkchV3VB4lgM0kMKVR4wMu+BjHh+giSXksMZ5TJmJCd6Z5J
         5FhSkC4r03KVZwlyJwGzLp0Sps4j2xZ3bpfVhEtlFbkwE9Ml8fK6HWkpHvfJjGSBANQX
         doMihCmCdm2ujer2gM0ueMlQwEkDe1UAQEzUxhYGpi6D03AXPN3Iq4WiisribCey9y+3
         o75Q==
X-Gm-Message-State: AOAM5333L8nuwsnkO47S3kqWGJoQiNo12yY4fPL2rD8quRU2l9PduGX8
        GQBJTPnSnWoHOoMqTHSULVkaHas2Rb5qVbkJHsIp6A==
X-Google-Smtp-Source: ABdhPJyd7YsOQm5k52ejOSHIDMQwROLiroHruV6sH8sfZCy36WJv0vZlu4MQ7BhUV2wmwLn0RSWCWqidsrI3MvD+Kb0=
X-Received: by 2002:a0c:d807:0:b0:42c:1ff7:7242 with SMTP id
 h7-20020a0cd807000000b0042c1ff77242mr14521431qvj.119.1646781135658; Tue, 08
 Mar 2022 15:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
 <20220303084824.284946-4-bhupesh.sharma@linaro.org> <CAA8EJpow=NPM5TrK24qsziVWgrD0cfbtwUxBD45CE2EQAg-msA@mail.gmail.com>
 <YifiOa38WGMAeEq7@builder.lan>
In-Reply-To: <YifiOa38WGMAeEq7@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 9 Mar 2022 02:12:04 +0300
Message-ID: <CAA8EJpoEhfRrXpmyL_EBFOL2u8QMvU8h_vJrFW3TgDGLGYMiFA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] clk: qcom: gcc: Add emac GDSC support for SM8150
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 9 Mar 2022 at 02:09, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Thu 03 Mar 04:33 CST 2022, Dmitry Baryshkov wrote:
>
> > On Thu, 3 Mar 2022 at 11:48, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> > >
> > > Add the EMAC GDSC defines and driver structures for SM8150.
> > >
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > > ---
> > >  drivers/clk/qcom/gcc-sm8150.c               | 10 ++++++++++
> > >  include/dt-bindings/clock/qcom,gcc-sm8150.h |  1 +
> > >  2 files changed, 11 insertions(+)
> > >
> > > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> > > index 85a431ac417b..08ba29e3a835 100644
> > > --- a/drivers/clk/qcom/gcc-sm8150.c
> > > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > > @@ -3448,6 +3448,15 @@ static struct clk_branch gcc_video_xo_clk = {
> > >         },
> > >  };
> > >
> >
> > Is it available on sm8150 or only on sa8155au? I think this deserves
> > at least a comment.
> >
>
> The ethernet controller is there on SM8150 as well.

Ack

>
> Regards,
> Bjorn
>
> > > +static struct gdsc emac_gdsc = {
> > > +       .gdscr = 0x6004,
> > > +       .pd = {
> > > +               .name = "emac_gdsc",
> > > +       },
> > > +       .pwrsts = PWRSTS_OFF_ON,
> > > +       .flags = POLL_CFG_GDSCR,
> > > +};
> > > +
> > >  static struct gdsc usb30_prim_gdsc = {
> > >         .gdscr = 0xf004,
> > >         .pd = {
> > > @@ -3714,6 +3723,7 @@ static const struct qcom_reset_map gcc_sm8150_resets[] = {
> > >  };
> > >
> > >  static struct gdsc *gcc_sm8150_gdscs[] = {
> > > +       [EMAC_GDSC] = &emac_gdsc,
> > >         [USB30_PRIM_GDSC] = &usb30_prim_gdsc,
> > >         [USB30_SEC_GDSC] = &usb30_sec_gdsc,
> > >  };
> > > diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-bindings/clock/qcom,gcc-sm8150.h
> > > index 3e1a91876610..40596b9ded06 100644
> > > --- a/include/dt-bindings/clock/qcom,gcc-sm8150.h
> > > +++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
> > > @@ -243,5 +243,6 @@
> > >  /* GCC GDSCRs */
> > >  #define USB30_PRIM_GDSC                     4
> > >  #define USB30_SEC_GDSC                                         5
> > > +#define EMAC_GDSC                                              6
> > >
> > >  #endif
> > > --
> > > 2.35.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
