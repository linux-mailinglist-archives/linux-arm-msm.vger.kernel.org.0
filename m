Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C66313CB9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbhBHSJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235444AbhBHSGp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:06:45 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88927C0617A9
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Feb 2021 10:06:03 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id q131so10197915pfq.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Feb 2021 10:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1RrfaCk/ab0gQx86EL5Lr0A0foJQv5sUEHlv15Ow4xg=;
        b=y2DYs/64pOfUxtEFP0JTu0LQ6E4NCRqRR8vmIatkdpBvCBAvWm5qxghhKRxCzMw5WP
         M50nJDQq6rBg5MdAec9YEQ2JZtYpiT+bvrnNS9qIm29xzPM6CLMsWVSrZyp1A1DawCfP
         B+OaXZEOq1R0YW2cnqfzbA46KlLHYJ0F9XwTWNRY9T3qrEZdjHitI0Fsl4pSB9HcWV74
         3HjCMoc0DJiVZuWNpzlK87YY1LnQVORNzH5mZqSOVGBTL5XruU/jDmKGb3ZAypyn7i9Z
         cBZnplDZ10Tsl3CH0IxZovpvkQhxrZ1YLSZ0kcpC8z+KXXUXuV+AzF+pDXgfU+RvGzQo
         77iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1RrfaCk/ab0gQx86EL5Lr0A0foJQv5sUEHlv15Ow4xg=;
        b=psPB3m0tQsN4QU6tqvQ0lNJTLjcJvrUBVK+TR3ErPjMok30CpMVll/0CW3eMiGysO3
         IyttyNOfuVHSoc1KifbvG0ytr7GcbC6mOPxKtJAD8KwP3U49bakuk0VasnRgYEFU7BfR
         mxtnzkicTDs9bG70ewD8eR6umrJZK9fzpJsRDdSCUnl2XlQKbIwf7t+R8DHa1N/8Dj21
         MF7GjkDHACS99nZQ83eR8cZFOKbM/9P984Ee5o+zy5M1aeIOEgqnubATmdwQE1ysGpjd
         2KeaoEWSFBbaxajbG3z9UsjcNUi1CPEfb+ynsNOGBDm1jPgAewRbkLI/3fasBl4rNbVQ
         USOQ==
X-Gm-Message-State: AOAM532JlgoaxZanjNCHEard+UmvzsdZgmqT4+zXTQJy896JaCPrG/uK
        OmiphH0uqOBUsOgxJWsAVyXjX1+2KAFXuoHNWG/X7g==
X-Google-Smtp-Source: ABdhPJxmN7mpOQo+VyXhtq0eFDx6U+wJTaUAzUw3pzcQ9XjhtXKyYcGlBd7iTXqYYVt9bMZmNHjUL8PTrbsM0qUD3FY=
X-Received: by 2002:a63:5b4f:: with SMTP id l15mr18563509pgm.339.1612807563034;
 Mon, 08 Feb 2021 10:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20210205104414.299732-1-robert.foss@linaro.org>
 <20210205104414.299732-12-robert.foss@linaro.org> <104e9dad-6819-119e-8f76-d83473374642@linaro.org>
In-Reply-To: <104e9dad-6819-119e-8f76-d83473374642@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 8 Feb 2021 19:05:51 +0100
Message-ID: <CAG3jFyt7_UD-12UXNBWHMYK12reWos4x51z98xuihj2JY5hv8g@mail.gmail.com>
Subject: Re: [PATCH v4 11/22] media: camss: Add support for CSIPHY hardware
 version Titan 170
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        linux-media <linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Andrey,

On Mon, 8 Feb 2021 at 19:02, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Robert,
>
> Thank you for your patchset!
>
> On 05.02.2021 13:44, Robert Foss wrote:
> > Add register definitions for version 170 of the Titan architecture
> > and implement support for the CSIPHY subdevice.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 182 ++++++++++++++++-=
-
> >   .../media/platform/qcom/camss/camss-csiphy.c  |  66 +++++--
> >   drivers/media/platform/qcom/camss/camss.c     |  74 +++++++
> >   3 files changed, 290 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b=
/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > index 97cb9de85031..148b8c50382c 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > @@ -47,6 +47,105 @@
> >   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID BIT(1)
> >   #define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(n)        (0x8b0 + 0x4 * (n=
))
> >
> > +#define CSIPHY_DEFAULT_PARAMS            0
> > +#define CSIPHY_LANE_ENABLE               1
> > +#define CSIPHY_SETTLE_CNT_LOWER_BYTE     2
> > +#define CSIPHY_SETTLE_CNT_HIGHER_BYTE    3
> > +#define CSIPHY_DNP_PARAMS                4
> > +#define CSIPHY_2PH_REGS                  5
> > +#define CSIPHY_3PH_REGS                  6
> > +
> > +struct csiphy_reg_t {
> > +     int32_t  reg_addr;
> > +     int32_t  reg_data;
> > +     int32_t  delay;
> > +     uint32_t csiphy_param_type;
> > +};
> > +
> > +static const struct
> > +csiphy_reg_t lane_regs_sdm845[5][14] =3D {
>
> <snip>
>
> > @@ -208,6 +294,66 @@ static void csiphy_lanes_enable(struct csiphy_devi=
ce *csiphy,
> >
> >       val =3D CSIPHY_3PH_LNn_MISC1_IS_CLKLANE;
> >       writel_relaxed(val, csiphy->base + CSIPHY_3PH_LNn_MISC1(l));
> > +}
> > +
> > +static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
> > +                                  u8 settle_cnt)
> > +{
> > +     int i, l;
> > +     u32 val;
> > +
> > +     for (l =3D 0; l < 5; l++) {
> > +             for (i =3D 0; i < 14; i++) {
> > +                     struct csiphy_reg_t *r =3D &lane_regs_sdm845[l][i=
];
>
> - this line gives me a compilation warning :
> warning: initialization discards =E2=80=98const=E2=80=99 qualifier from p=
ointer target type [-Wdiscarded-qualifiers]
>    306 |    struct csiphy_reg_t *r =3D &lane_regs_sdm845[l][i];
>
> Change it to:
>         const struct csiphy_reg_t *r =3D &lane_regs_sdm845[l][i];
> ?
>

Yep, I applied that change to my local tree. But didn't thank the bot
for it's graceful contribution.


Rob.
