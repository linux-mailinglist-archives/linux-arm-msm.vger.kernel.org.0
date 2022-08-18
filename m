Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E399598F96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Aug 2022 23:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242000AbiHRVbe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 17:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344275AbiHRVbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 17:31:33 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEBFDD7
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 14:31:31 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id t5so3440677edc.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 14:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WtOE4rfhF66ne01EBVrR7ZUIyy4xQlFOqom1OJOeD+M=;
        b=SaC7ba1CjNgoZw9KWatwWIypAr4NqaW9BwLesRw6skKKu816G9b58HArxq6Oitstp2
         nnKplFcQcS9MGVfxpa8Q+lFgUr9XSJbTvAGmAva+NILo/fg2ZuDOfPQZWTUJpP4e0Nfy
         bpxcgt3SIJahWl7LAdH7CeZy/k7DNcq8ZFwFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WtOE4rfhF66ne01EBVrR7ZUIyy4xQlFOqom1OJOeD+M=;
        b=JRNuw2EB6twpfvxxr85cxvdWjWQ7I+Y9TsvEqnWohLWiJxhKlGA+ANfQ6UR+yu7/s6
         vdbzAejSctb5eEPQp32B4ieHDsaDbLWUKPnA/7+n0MLOxglQIw+zW5N2hcNYFXIzuVKQ
         KM6cJCuue94fBPGq16Exs235TUT4uzvtuf3EzQFCoApBiTk0Z2OUNW2WsEWFzII8T1fR
         SgEQzwqLted3Mjl2TRhgV12e87d843acroFRqw80R4gt4HSmlVWmkRw/HjpJYD3tGkkC
         MlNv+LR3dT13EnG8tQ95lw0Ydr8EybkOsIzJBQUnVLDHzaVoT1HeRC2ZHcxesA6d1bca
         TFpA==
X-Gm-Message-State: ACgBeo2vUxB6yH4vNvNZA5xFX0XkXGem8O0QSWNY8Z8IiCOIuVjSr7v0
        k4C/hE7xqvvbJOScu+NW1GOD3s7lhZDXBgAV
X-Google-Smtp-Source: AA6agR4FH4+A7vmB3XxPauzaSAagu30xNVUiXjDAxEj3sgRvlGS8TgbMZvU5UZ0bGw7FqgGpSEKPrA==
X-Received: by 2002:a05:6402:f17:b0:43e:4700:f63e with SMTP id i23-20020a0564020f1700b0043e4700f63emr3673740eda.190.1660858290169;
        Thu, 18 Aug 2022 14:31:30 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id q3-20020a1709064cc300b0072abb95eaa4sm1331232ejt.215.2022.08.18.14.31.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 14:31:29 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id n4so3105422wrp.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 14:31:28 -0700 (PDT)
X-Received: by 2002:a05:6000:1541:b0:222:cf65:18d7 with SMTP id
 1-20020a056000154100b00222cf6518d7mr2475897wry.659.1660858288014; Thu, 18 Aug
 2022 14:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220722093238.v24.1.I7a1a6448d50bdd38e6082204a9818c59cc7a9bfd@changeid>
In-Reply-To: <20220722093238.v24.1.I7a1a6448d50bdd38e6082204a9818c59cc7a9bfd@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Aug 2022 14:31:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WkiNZQ0G9MivhA2TwG09wkyPX2AD5T9cMBJeSKWhddvA@mail.gmail.com>
Message-ID: <CAD=FV=WkiNZQ0G9MivhA2TwG09wkyPX2AD5T9cMBJeSKWhddvA@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 22, 2022 at 9:32 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add nodes for the onboard USB hub on trogdor devices. Remove the
> 'always-on' property from the hub regulator, since the regulator
> is now managed by the onboard_usb_hub driver.
>
> For anyone using trogdor-based devices on Linux, it should be
> noted that this requires "CONFIG_USB_ONBOARD_HUB=y".
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> This series depends on 3a6bf4a08142 ("usb: core: hub: Create platform
> devices for onboard hubs in hub_probe()") which landed in -next [1].
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=3a6bf4a08142826698121bef16b244dcf50a6431
>
> Changes in v24:
> - renamed 'companion-hub' to 'peer-hub' according to the change
>   in the binding
>
> Changes in v23:
> - added note about enabling CONFIG_USB_ONBOARD_HUB to the commit
>   message
>
> Changes in v22:
> - none
>
> Changes in v21:
> - patch dropped from onboard_usb_hub series
>
> Changes in v20:
> - renamed hub labels to 'usb_hub_2/3_x'
> - added comment for 'regulator-boot-on' of 'pp3300_hub'
> - added 'Reviewed-by' tags from Stephen and Doug
>
> Changes in v19:
> - none
>
> Changes in v18:
> - also adjust config for pompom rev1
>
> Changes in v17:
> - none
>
> Changes in v16:
> - none
>
> Changes in v15:
> - none
>
> Changes in v14:
> - none
>
> Changes in v13:
> - none
>
> Changes in v12:
> - none
>
> Changes in v11:
> - rebased on qcom/arm64-for-5.14 (with the rest of the series)
>
> Changes in v10:
> - keep 'regulator-boot-on' property
> - updated commit message
>
> Changes in v9:
> - none
>
> Changes in v8:
> - none
>
> Changes in v7:
> - rebased on qcom/arm64-for-5.13 (with the rest of the series)
>
> Changes in v6:
> - added 'companion-hub' entry to both USB devices
> - added 'vdd-supply' also to hub@2
>
> Changes in v5:
> - patch added to the series
>
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 19 ++++++++----------
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 12 +++++------
>  .../dts/qcom/sc7180-trogdor-pompom-r1.dts     | 11 ++++------
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 19 ++++++++----------
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 20 ++++++++++++++++++-
>  5 files changed, 44 insertions(+), 37 deletions(-)

The driver changes have landed and stuck. They're in Linus's tree, so
I think we're now ready to land these two patches! Hooray!

FWIW: I've continued my experiment of landing changes that I'm keeping
track of in a github tree:

https://github.com/dianders/kernel-staging/commits/qcom/arm64-staging

-Doug
