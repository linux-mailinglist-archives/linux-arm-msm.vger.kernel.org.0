Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1AF5834FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 23:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbiG0V7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 17:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbiG0V7B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 17:59:01 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50894D82D
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 14:59:00 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id ss3so33698815ejc.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 14:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2GNpZTvzEOIdMaTG5mdwYQJAfUQRhiWdyOdea2yhnhc=;
        b=g4yEODJXnCca1ye9cHtb/uc3oEbsGeeLFdHft+OzXy+l6oZuSj0OUP/dx4uDW2TEYm
         bpxc748TQR7loOcWJpuxD8PHNv2frrFxtqL/Azhw3s4a+ViWrAZc9z6R3/kkwaS1vd/k
         oCdXgBjvwfhI1ULsqSmQKywBduaaqVn5OmQvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2GNpZTvzEOIdMaTG5mdwYQJAfUQRhiWdyOdea2yhnhc=;
        b=AgdF/JJoMLbx/ecBZlTiP6LoDeq9CKoRju5zzAcAFoqBebcWllUT5X7/RMcPfLZd97
         LfVIWr+fTWBJuMgs/qca1UBiISez5Uf1J9HU7Mec9WK0jXoERg6hOF5gWFFE7fssgpBg
         OBqlVBlC5cshYA7aD94kfePJuqh0XB5THM8h2YUaKOzs6HgK0lgUqIn9xe7UTpOjG6zy
         pVmGUdF68+yQiwsVpmcQVwggGcI3zVuvGPXEH51Uc3UN/wRis/BWo51gDED0pPSPwq70
         M41JU4oLIDPtXMYSKJvQCQBmvdk+vw9cYlkHUwV3IIiMefpzJXM/26hsjWB2Htq5QbuU
         mg0Q==
X-Gm-Message-State: AJIora/eMqHZEOsqi5fphY9hRhF2CpmX8Fi81BET+WNBEbEbrKpWpMb4
        xigZzXQFohbDb4f6nfngPmt33mRqXu6pH3CCovU=
X-Google-Smtp-Source: AGRyM1v5rm2XOtpjuYdCizCcyC6tdRoKngAU7As82maF3L1kM0k7pyNASDYCBsEafiEb4UQUiUJDYQ==
X-Received: by 2002:a17:907:60c6:b0:72f:4645:ead3 with SMTP id hv6-20020a17090760c600b0072f4645ead3mr18619918ejc.321.1658959139133;
        Wed, 27 Jul 2022 14:58:59 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id q28-20020a056402249c00b0043cab10f702sm2051392eda.90.2022.07.27.14.58.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 14:58:42 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id u5so26215761wrm.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 14:58:39 -0700 (PDT)
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr16061950wrn.138.1658959119013; Wed, 27
 Jul 2022 14:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220726212354.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
 <20220727160320.GA2755147-robh@kernel.org> <CAD=FV=U8ek0FR=hZwemK5JcbUP=JsnRTtv7WzJKmOb-UFwHfXA@mail.gmail.com>
 <CAL_JsqJ=jj6isKbBEKGjax266MS_h+Oehn9zYMMjXzc3K-t4Wg@mail.gmail.com>
In-Reply-To: <CAL_JsqJ=jj6isKbBEKGjax266MS_h+Oehn9zYMMjXzc3K-t4Wg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 27 Jul 2022 14:58:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XPTUVKMSrcZdaoztrMU9pCJWXkHLfW-1dHqG70-iR3Yw@mail.gmail.com>
Message-ID: <CAD=FV=XPTUVKMSrcZdaoztrMU9pCJWXkHLfW-1dHqG70-iR3Yw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: document zoglin board
To:     Rob Herring <robh@kernel.org>
Cc:     Bob Moragues <moragues@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 27, 2022 at 12:43 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jul 27, 2022 at 11:40 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Jul 27, 2022 at 9:03 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Jul 26, 2022 at 09:24:31PM -0700, Bob Moragues wrote:
> > > > Zoglin is a Hoglin Chromebook with SPI Flash reduced from 64MB to 8MB.
> > > > Zoglin is identical to Hoglin except for the SPI Flash.
> > > > The actual SPI Flash is dynamically probed at and not specified in DTS.
> > > >
> > > > Signed-off-by: Bob Moragues <moragues@chromium.org>
> > > >
> > > > Signed-off-by: Bob Moragues <moragues@google.com>
> > > > ---
> > > >
> > > >  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > > > index 581485392404..63091df3cbb3 100644
> > > > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > > > @@ -475,6 +475,7 @@ properties:
> > > >
> > > >        - description: Qualcomm Technologies, Inc. sc7280 CRD platform (newest rev)
> > > >          items:
> > > > +          - const: google,zoglin
> > > >            - const: google,hoglin
> > > >            - const: qcom,sc7280
> > >
> > > Is just "google,hoglin", "qcom,sc7280" no longer valid? If it is valid,
> > > you need another entry.
> >
> > If it makes people happy to have another entry then it wouldn't hurt,
> > but it has no long term benefit and I would recommend against it. The
> > next patch in this series changes the existing "hoglin" device tree to
> > have all 3 compatible strings and thus when both patches land then
> > make dtbs_check will pass. I assume that is the only goal of
> > documenting these boards here. Certainly if you had a device tree that
> > had only "google,zoglin" it would boot fine on zoglin devices and if
> > you had a device tree that had only "google,hoglin" it would boot fine
> > on hoglin device. This is true of all of the entries for Chromebooks
> > that have multiple compatible entries.
>
> Why even add the entry? If it is just a different SPI flash, you can
> tell that from the SPI flash compatible or device ID.

Yeah, it's really unfortunate. :( The issue is a limitation in the
ChromeOS bootloader infrastructure. The ChromeOS build infrastructure
cannot handle something that it considers the same "board" as having
different SPI flash sizes. This is because the infrastructure always
requires that the bootloader "image" be the exact same size as the SPI
flash and it assumes a universal firmware (single image) per board.
It's unfortunately not very flexible but normally for a given board
the SPI flash size is chosen at the start and never changed. The CRD
board was an exception here. Though it's not beautiful, this means
that the firmware considers this as a different board and looks for a
different compatible string on the kernel command line.

-Doug
