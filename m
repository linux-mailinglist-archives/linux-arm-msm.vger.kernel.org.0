Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A82344B35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 17:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbhCVQ0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 12:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbhCVQ0E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 12:26:04 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A490C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 09:26:04 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id t18so8735748pjs.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 09:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LdoGx5oDl8gk5x9p4tYOogHfvxPqQ4lONZ8abnnWI5s=;
        b=CXHsrE0Ycxw/IfmXoMWR4BugaH4HPKEnfCCZL0DyKEpKpPERuTUkAaILqb3tg2zqwH
         xowcxFSgq0w8E9eafAxpCLw+7nS5Ee9fsfQbBub1XF6M6B7juALdmPNis8pmoF1ouoHh
         nesbXKk1Xtb6BFEf6NOBPjtk04Z5zfDVFEMsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LdoGx5oDl8gk5x9p4tYOogHfvxPqQ4lONZ8abnnWI5s=;
        b=fvgH2wtlTBYZqk+n65abMLg9sBRjVLOJgvWNTx4MIcVSYcWWtYlOOiGS3eyvT7guRe
         2ZLprbInITL8tKMAFTK/2kYKxk3VjsJuQh3e46MwbpMuNpM27ztAeHNbk5zcMsvVsW1l
         EKmSV/MOXJN/RNd4M78Lb1KiiaZD2f08QyEMjedbBpxUZOef1U5Ch1JH25hEp3zZHJyn
         wrNMtEO8VE7GuLM5WWTjewxqWPe639VRTK/MT+keCbOTmgyNaxmZwLHw95h8hek1F/ua
         1s2tPlusWhWk7X6ArxDHuF5mRU4kPpfwQsGrCQDuFWGnqgep5GHyq6aqpllAFJwzto7h
         Cypg==
X-Gm-Message-State: AOAM532KA8SVjz/oRChBORvfgf+XPisxHNXliEPk06O8Ui8ugJ7lB+IT
        cVCUxkKECBeJoV+Jie+T3DM38g==
X-Google-Smtp-Source: ABdhPJy7SFdYJZMBr+cLAhIFydT26KK7t0PO36o7RilHCUXk20IMO6kcI9wziE53YpcwYc5b6MeBKQ==
X-Received: by 2002:a17:902:be0c:b029:e6:f0b:91ab with SMTP id r12-20020a170902be0cb02900e60f0b91abmr492009pls.2.1616430363930;
        Mon, 22 Mar 2021 09:26:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:90a9:b908:f93a:2f78])
        by smtp.gmail.com with UTF8SMTPSA id 12sm13106117pgw.18.2021.03.22.09.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 09:26:03 -0700 (PDT)
Date:   Mon, 22 Mar 2021 09:26:01 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sc7180: Add pompom rev3
Message-ID: <YFjFGbFdiS5gARhs@google.com>
References: <20210316011516.1314686-1-mka@chromium.org>
 <20210315181509.v3.2.I4138c3edee23d1efa637eef51e841d9d2e266659@changeid>
 <CAD=FV=XxTuFSosYFcpvbTUMfrAkaLbg3QvqBwhrt4niVzDRN9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=XxTuFSosYFcpvbTUMfrAkaLbg3QvqBwhrt4niVzDRN9w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 19, 2021 at 08:12:40AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Mar 15, 2021 at 6:15 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > The only kernel visible change with respect to rev2 is that pompom
> > rev3 changed the charger thermistor from a 47k to a 100k NTC to use
> > a thermistor which is supported by the PM6150 ADC driver.
> >
> > Disable the charger thermal zone for pompom rev1 and rev2 to avoid
> > the use of bogus temperature values from the unsupported thermistor.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> > Changes in v3:
> > - don't add LOCK key
> >
> > Changes in v2:
> > - moved keyboard definition to sc7180-trogdor-pompom.dtsi instead
> >   of duplicating it, use cros-ec keyboard for rev1
> > - squashed with 'arm64: dts: qcom: sc7180: pompom: Disable charger
> >   thermal zone for rev1 and rev2'
> >
> >  arch/arm64/boot/dts/qcom/Makefile             |  2 +
> >  .../dts/qcom/sc7180-trogdor-pompom-r1.dts     | 12 ++++++
> >  .../dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |  4 +-
> >  .../dts/qcom/sc7180-trogdor-pompom-r2.dts     | 38 +++++--------------
> >  .../dts/qcom/sc7180-trogdor-pompom-r3-lte.dts | 14 +++++++
> >  .../dts/qcom/sc7180-trogdor-pompom-r3.dts     | 15 ++++++++
> >  .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  | 29 ++++++++++++++
> >  7 files changed, 83 insertions(+), 31 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index a81966d59cf7..11aa83ca798f 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -49,6 +49,8 @@ dtb-$(CONFIG_ARCH_QCOM)       += sc7180-trogdor-pompom-r1.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pompom-r1-lte.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pompom-r2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pompom-r2-lte.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pompom-r3.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pompom-r3-lte.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-r1.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-r1-lte.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)        += sdm630-sony-xperia-ganges-kirin.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
> > index e720e7bd0d70..7f87877408c5 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
> > @@ -9,11 +9,23 @@
> >
> >  #include "sc7180-trogdor-pompom.dtsi"
> >
> > +/delete-node/ keyboard_controller;
> 
> So I just tried to compile your patch and I found that it doesn't
> compile. :( The above needs to be:
> 
> /delete-node/ &keyboard_controller;

I swear I did a test build, it seems I did that build in another
kernel tree :/
