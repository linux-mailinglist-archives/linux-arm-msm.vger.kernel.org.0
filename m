Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEDE515077
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 18:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378471AbiD2QNp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 12:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378911AbiD2QNn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 12:13:43 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C4B41631
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 09:10:23 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id a1so9628126edt.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=38G2yLvTesO/mAjiyLWZJ7vMR9eg3xKJsvKaGBhlj48=;
        b=Z6/QtEfer9f+OTdeWiWLTDLQrtwaSk794Vgsbs8yANjijC/n6xI7dAdrszE6zXzZs3
         eDk12zl2F8a46AyeYidW8tq2bsM7D0pA7biW1+/+uO/MCZkgqGi0OHA0fOrQzuzRKcVd
         w63F5C7NaCxtPl8jO7Bxi1shpsUpt6qi/ApdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=38G2yLvTesO/mAjiyLWZJ7vMR9eg3xKJsvKaGBhlj48=;
        b=lL4Lo9euuXZ72BaCgcn9L0D14xDb5WmhaBb3VnbYI2g+M0GJ5lmkT1yOaCE5vmI+HS
         yXZ1LNvj4HztMFPU5xcOhU01y0bJxtZi6sSX5twixjgC6lMzrnLA4Ioplii7fWjxPL62
         LbBTyR2BixY3m98I6S4LStmTPlrdul1KsHkmhKN5AJpWnqZw7ziJZpgEXF4QrdRXgzP4
         okLeTEcO76iadKMx9CDLmOU433U67i1+z+fzU/S9K9Uls9Uxsk64aMhG3CF3icfRp+Ig
         /KK/F4leWUBNtqgQ+rIClOszTMMaBPb9euQ2qJc361kpIvFZ0wUQcG9lpoWECGe4jRZw
         xzfg==
X-Gm-Message-State: AOAM532YBZlju97nIo4tDfXKY6wTos0MPexBlx/bxoCJIWGYDu0Saf+1
        OHfEjCXjBpBbodqTNrGYeDb/ZJgk+Du9Xm66
X-Google-Smtp-Source: ABdhPJz3LdLGnhtj19yauXtBr8Vtww696Eij//J2MN0ClSzcORlLFnUwGfS20ZTISskomnoQ2XISlg==
X-Received: by 2002:a05:6402:485:b0:425:a529:c29e with SMTP id k5-20020a056402048500b00425a529c29emr42008481edv.354.1651248621407;
        Fri, 29 Apr 2022 09:10:21 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id hz12-20020a1709072cec00b006f3ef214dcbsm772049ejc.49.2022.04.29.09.10.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 09:10:20 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id c11so1570428wrn.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 09:10:19 -0700 (PDT)
X-Received: by 2002:adf:f50d:0:b0:20a:e096:ef with SMTP id q13-20020adff50d000000b0020ae09600efmr17925110wro.679.1651248619233;
 Fri, 29 Apr 2022 09:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <1651079383-7665-1-git-send-email-quic_srivasam@quicinc.com>
 <1651079383-7665-5-git-send-email-quic_srivasam@quicinc.com> <YmsrB6Q89II5w1+9@google.com>
In-Reply-To: <YmsrB6Q89II5w1+9@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 29 Apr 2022 09:10:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XxeZsiOVVBDK_vmx0nhT7roB2FqcaPXsH3+jzTHFXMxw@mail.gmail.com>
Message-ID: <CAD=FV=XxeZsiOVVBDK_vmx0nhT7roB2FqcaPXsH3+jzTHFXMxw@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] arm64: dts: qcom: sc7280-herobrine: Add lpi
 pinmux properties for CRD 3.0/3.1
To:     Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        quic_rohkumar@quicinc.com,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 28, 2022 at 5:02 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Wed, Apr 27, 2022 at 10:39:43PM +0530, Srinivasa Rao Mandadapu wrote:
> > Add LPASS LPI pinctrl properties, which are required for Audio
> > functionality on herobrine based platforms of rev5+
> > (aka CRD 3.0/3.1) boards.
> >
> > Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> > Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> > Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>
> I'm not super firm in pinctrl territory, a few maybe silly questions
> below.
>
> >  arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts | 84 +++++++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
> > index deaea3a..dfc42df 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
> > @@ -111,6 +111,90 @@ ap_ts_pen_1v8: &i2c13 {
> >   * - If a pin is not hooked up on Qcard, it gets no name.
> >   */
> >
> > +&lpass_dmic01 {
> > +     clk {
> > +             drive-strength = <8>;
> > +     };

Ugh, I've been distracted and I hadn't realized we were back to the
two-level syntax. Definitely not my favorite for all the reasons I
talked about [1]. I guess you took Bjorn's silence to my response to
mean that you should switch back to this way? :(

Bjorn: can you clarify?

[1] https://lore.kernel.org/r/CAD=FV=VicFiX6QkBksZs1KLwJ5x4eCte6j5RWOBPN+WwiXm2Cw@mail.gmail.com/

> > +};
> > +
> > +&lpass_dmic01_sleep {
> > +     clk {
> > +             drive-strength = <2>;
>
> Does the drive strength really matter in the sleep state, is the SoC actively
> driving the pin?

My understanding is that if a pin is left as an output in sleep state
that there is a slight benefit to switching it to drive-strength 2.


> > +             bias-disable;
>
> What should this be in active/default state? If I understand correctly
> after a transition from 'sleep' to 'default' this setting will remain,
> since the default config doesn't specify a setting for bias.

Your understanding matches mine but I haven't tested it and I remember
sometimes being surprised in this corner of pinmux before. I think
it's better to put the bias in the default state if it should be that
way all the time, or have a bias in both the default and sleep state
if they need to be different.
