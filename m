Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F165AF79B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 00:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiIFWCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 18:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiIFWCk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 18:02:40 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D544C9C528
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 15:02:39 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id fg1so4187492ejc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 15:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gWiVAJ1vQrOofDy43ExTt485XyWsWt/DtnUeKN55C6M=;
        b=QOtex57gheFOTGO1C5lhYmROB4obQ7aMCcimsx9+Z+D/F/scKPgau9HFvNGS9FA23x
         sWQpXsFuxz4UfS0qlljJMoyLhb6Q6+9i8lVpw70z5M9sHD8l3AMiEnI8+tgZSc+jGgHN
         1+Bmd+a3ee1ssjizqR8lSsK0eVCIVvGXAEUFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gWiVAJ1vQrOofDy43ExTt485XyWsWt/DtnUeKN55C6M=;
        b=H8vXP0ML87YrA/58m7eFwPoXiCskZPzyEpMqskfsvNZ3Hfh9xqVcaQf3VF02kvhtml
         mE3NNWQv149er0OUY8CoZyArTgXrbGWzeoUi/Bh0E4x7Ut6fuA0AHFiFI0GukWJSNsoT
         VP3VR5N6/MNsOkZTYc4oYTvJd0pWGT0vSKD+DXKSZkMbHr5a0E/2dHFHE1UDmpWOtP8n
         0JBomMUl3uu0RKNA375CkQtFTBK9CFW3N0cZ+Y+c3y5T//+vMtTD6IYGxRaeb8kUWNOB
         H/ytFooSoKauj6H6axaNZMIDrV/ndnuwkSanFFLdkYMK5NrJgruxAcqaZP7L72RAD+Kd
         HNyQ==
X-Gm-Message-State: ACgBeo3aNjBckVYsP7S+xCbKvH/lEqWcMRsHRUbGDeT+Dy67qRDxApVU
        iTPQnrxpR+b9Bxq08jfP/rEFremssCYcwB7A
X-Google-Smtp-Source: AA6agR5OcLuf23L6wGiaOEVg1DQoFHzPCZvUMMTfmEV0X0LNOqyxxqw8K5ifmDGuVcUrZ/MwO0YM0g==
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id hp3-20020a1709073e0300b00722e6940438mr344023ejc.755.1662501758190;
        Tue, 06 Sep 2022 15:02:38 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a26-20020aa7d91a000000b0044ee18e5f79sm1652013edr.28.2022.09.06.15.02.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 15:02:35 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id t14so10173821wrx.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 15:02:34 -0700 (PDT)
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr255055wra.617.1662501754524; Tue, 06
 Sep 2022 15:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220722093238.v24.1.I7a1a6448d50bdd38e6082204a9818c59cc7a9bfd@changeid>
 <CAD=FV=WkiNZQ0G9MivhA2TwG09wkyPX2AD5T9cMBJeSKWhddvA@mail.gmail.com>
In-Reply-To: <CAD=FV=WkiNZQ0G9MivhA2TwG09wkyPX2AD5T9cMBJeSKWhddvA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 6 Sep 2022 15:02:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ULGGf2yVG8iULOUzD5XJL7nS+hgis6csrP4f0FKNBn5Q@mail.gmail.com>
Message-ID: <CAD=FV=ULGGf2yVG8iULOUzD5XJL7nS+hgis6csrP4f0FKNBn5Q@mail.gmail.com>
Subject: Re: [PATCH v24 1/2] arm64: dts: qcom: sc7180-trogdor: Add nodes for
 onboard USB hub
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Aug 18, 2022 at 2:31 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Jul 22, 2022 at 9:32 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Add nodes for the onboard USB hub on trogdor devices. Remove the
> > 'always-on' property from the hub regulator, since the regulator
> > is now managed by the onboard_usb_hub driver.
> >
> > For anyone using trogdor-based devices on Linux, it should be
> > noted that this requires "CONFIG_USB_ONBOARD_HUB=y".
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This series depends on 3a6bf4a08142 ("usb: core: hub: Create platform
> > devices for onboard hubs in hub_probe()") which landed in -next [1].
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=3a6bf4a08142826698121bef16b244dcf50a6431
> >
> > Changes in v24:
> > - renamed 'companion-hub' to 'peer-hub' according to the change
> >   in the binding
> >
> > Changes in v23:
> > - added note about enabling CONFIG_USB_ONBOARD_HUB to the commit
> >   message
> >
> > Changes in v22:
> > - none
> >
> > Changes in v21:
> > - patch dropped from onboard_usb_hub series
> >
> > Changes in v20:
> > - renamed hub labels to 'usb_hub_2/3_x'
> > - added comment for 'regulator-boot-on' of 'pp3300_hub'
> > - added 'Reviewed-by' tags from Stephen and Doug
> >
> > Changes in v19:
> > - none
> >
> > Changes in v18:
> > - also adjust config for pompom rev1
> >
> > Changes in v17:
> > - none
> >
> > Changes in v16:
> > - none
> >
> > Changes in v15:
> > - none
> >
> > Changes in v14:
> > - none
> >
> > Changes in v13:
> > - none
> >
> > Changes in v12:
> > - none
> >
> > Changes in v11:
> > - rebased on qcom/arm64-for-5.14 (with the rest of the series)
> >
> > Changes in v10:
> > - keep 'regulator-boot-on' property
> > - updated commit message
> >
> > Changes in v9:
> > - none
> >
> > Changes in v8:
> > - none
> >
> > Changes in v7:
> > - rebased on qcom/arm64-for-5.13 (with the rest of the series)
> >
> > Changes in v6:
> > - added 'companion-hub' entry to both USB devices
> > - added 'vdd-supply' also to hub@2
> >
> > Changes in v5:
> > - patch added to the series
> >
> >  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 19 ++++++++----------
> >  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 12 +++++------
> >  .../dts/qcom/sc7180-trogdor-pompom-r1.dts     | 11 ++++------
> >  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 19 ++++++++----------
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 20 ++++++++++++++++++-
> >  5 files changed, 44 insertions(+), 37 deletions(-)
>
> The driver changes have landed and stuck. They're in Linus's tree, so
> I think we're now ready to land these two patches! Hooray!
>
> FWIW: I've continued my experiment of landing changes that I'm keeping
> track of in a github tree:
>
> https://github.com/dianders/kernel-staging/commits/qcom/arm64-staging

I believe this series continues to be ready to land. Perhaps now would
be a good time for it? ;-)

-Doug
