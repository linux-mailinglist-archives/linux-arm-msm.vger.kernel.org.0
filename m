Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F49426008
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 00:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhJGWsz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 18:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238708AbhJGWsy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 18:48:54 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEC5C061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 15:47:00 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id x1so4623445iof.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 15:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=COVdMKi4vGrLOvs+TWC65+Lqr3T2s/9tiuZQIejj6cA=;
        b=F3PD+1Hhdv7vBXT3BtD+4QLQhBQljFGKDrltOTGEjZnGbEhHZzSjtOs4iRGtPObT1B
         C5CoWXV2BESIIXFng4L7iwuiFTbsVrhDvRlK4Z08ex6QsBRgKjmSx5B7Guh4Mzlobk61
         41irwdC8dhfMkqK+vWH3cH7zDBLxcjTFjweBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=COVdMKi4vGrLOvs+TWC65+Lqr3T2s/9tiuZQIejj6cA=;
        b=kbRRG8xxMvPP6fvSq+VDuhhcW9qP/8vbtLkJeEIx5YcMWmYRdav8E422DY05zmxrHE
         +lCW/FihrRWXbMqUZ6ldn1G0T5G6erGWsbT9qen6N5nlNXopd6nRj0MUNAehWStopmIq
         o3UyWG7xaYf0DMLCrwIKVbXl7A+SUh6z+8mzM6oPnasp44znMc8QB3GnbZ023AlZ2WVQ
         eXa21R4ggVSXWycx8SEByXU8iMZ3Zt7uxlG42hp+UiC1TkdQ+QcyK2ivvBDl6VF/YFUC
         FhFkxSm18Lj3HAn5WUIHIZDddaanmEdJTD00R6rvBbeNsnMLy+RV97Xgs6DpmU11u4V5
         B+YA==
X-Gm-Message-State: AOAM533y7QhNSd+wafj5yZRlAXRJZPrAJ7hYLrZWMSqMAiB8lx7FV7rx
        KQo08aQpeg7jX4Az1n0OGNFW9FmG+nNvew==
X-Google-Smtp-Source: ABdhPJwXISRPj4m5H2M+QIJ18Favh6zuUS3gufJ9uEwI52F2n936F6NczWD0N6W+NfF955XBczr8XA==
X-Received: by 2002:a02:620b:: with SMTP id d11mr5122717jac.69.1633646819398;
        Thu, 07 Oct 2021 15:46:59 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id j20sm226926ioo.35.2021.10.07.15.46.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 15:46:58 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id s17so3405156ioa.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 15:46:58 -0700 (PDT)
X-Received: by 2002:a02:cba7:: with SMTP id v7mr2701595jap.54.1633646818484;
 Thu, 07 Oct 2021 15:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
 <CAD=FV=XP+mJCEG+=meCXDb06bmfPwze2SP9FaMuKZkSh25JCSg@mail.gmail.com> <CA+cxXhn3Bw4d_F2LwP34ko1UuDGHHoQWLxcdK17L-PoDJ3n+ug@mail.gmail.com>
In-Reply-To: <CA+cxXhn3Bw4d_F2LwP34ko1UuDGHHoQWLxcdK17L-PoDJ3n+ug@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 Oct 2021 15:46:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X1wTNE1wgou57UC6LcmN+4vTFJV9co9Sg9NgAXZm927A@mail.gmail.com>
Message-ID: <CAD=FV=X1wTNE1wgou57UC6LcmN+4vTFJV9co9Sg9NgAXZm927A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: sc7180: Factor out ti-sn65dsi86 support
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Oct 7, 2021 at 3:29 PM Philip Chen <philipchen@chromium.org> wrote:
>
> Hi
>
> On Thu, Sep 30, 2021 at 9:22 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Sep 29, 2021 at 5:35 PM Philip Chen <philipchen@chromium.org> wrote:
> > >
> > > Factor out ti-sn65dsi86 edp bridge as a separate dts fragment.
> > > This helps us introduce the second source edp bridge later.
> > >
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > > ---
> > >
> > > Changes in v2:
> > > - Move edp_brij_i2c completely out of sc7180-trogdor.dtsi to the
> > >   bridge dts fragment, so that we can cleanly assign different
> > >   edp bridge in every board rev.
> > >
> > >  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  1 +
> > >  .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  1 +
> > >  .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  1 +
> > >  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  1 +
> > >  .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi | 90 +++++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 86 ------------------
> > >  6 files changed, 94 insertions(+), 86 deletions(-)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> > > index a758e4d22612..1d13fba3bd2f 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> > > @@ -11,6 +11,7 @@
> > >  ap_h1_spi: &spi0 {};
> > >
> > >  #include "sc7180-trogdor.dtsi"
> > > +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> >
> > It looks like you're missing homestar, aren't you? I'd expect that
> > after applying your change that:
> >
> > git grep -A1 include.*sc7180-trogdor.dtsi
> >
> > ...should show your new include right after all includes of
> > sc7180-trogdor.dtsi, but I don't see it for homestar.
>
> I can't find homestar dts file in my upstream checkout.
> But I found: https://patchwork.kernel.org/project/linux-arm-msm/patch/20210909122053.1.Ieafda79b74f74a2b15ed86e181c06a3060706ec5@changeid/
> ...Is it merged anywhere?

The device trees need to be posted against the Qualcomm tree.

git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git

It should be in the for-next branch there.

-Doug
