Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE6BA76B05C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Aug 2023 12:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbjHAKHb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Aug 2023 06:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233803AbjHAKHa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Aug 2023 06:07:30 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9567A116
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Aug 2023 03:07:26 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so8628651e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Aug 2023 03:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1690884445; x=1691489245;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1/ktHF3masxab3vl++0ZCMEyPiHHu6fAAPxOuhQTwg=;
        b=xsjiWuIwfUDV/UvQ4A+bNQ6Kll4xU/AWU7vrqDequWsRjYbxqyr6NpQ9L1k2WXfGXX
         iQmBDBjsVgWbjYlcUjZUXXQVXnrEMnQK46i9/PiL9V3Fo0IXBw8vbMT3dL+W6Dtxt0qn
         RK0oylHJogJybBe0f2yQMbQpJcvrdmqfCmfaH7tUN4IYtW/rzH418YGFkFhRaGo3aA9L
         x6Df8m49fyrYPq8sm23wef7IDELHRngYTWhaSyMCM+zGa9s9mAYlE0p06z2arZdeA1Zj
         odemvH6lvXjzKfn0dI9wHccAxaKLRVHpusXPpanuqDzOLtRQrr+I4M1DOUx2A8qCb3YJ
         bxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690884445; x=1691489245;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J1/ktHF3masxab3vl++0ZCMEyPiHHu6fAAPxOuhQTwg=;
        b=gUgPDj9+jxt9TLJvC/Cd+Cjim6/Mcwi07tEM4ecXiRqGX+ilrfcNIe0pH5OzzMisZ4
         dS7JJWbBf85UpxEZxQtTFsjyJPceXkRk1/lkAKn9Q+3y/jMvqEjZxZ5PLu0gBKSXsoMO
         vwV7FtNvl7QEVmDMj+Ufs7ICX9GlUlnfrZZUT310MTl4EDO0QwaqGXVACg9zmj3LBNX8
         /TL4E2VVinj+4h8SCglQ3AUyA2dKQQm2g7fDoTUiPr9cYrjPLx58i25LQeHDj/EokyV0
         5iRW7MLWeoecHZAjuQOO6YgRep+1R+3+LcfpFIJUZvtZqBju01P94nDCTSsCQZC3PUjk
         Tb+A==
X-Gm-Message-State: ABy/qLYEvqE+lTCHAECsctdXLX7y7VkvNkRYr9s5vTWiNRLFNFiLrC/9
        Q0KBo6v/1S3rQpUm2pTW3dUdhA==
X-Google-Smtp-Source: APBJJlFLcqzXBAeAzahiYVP4fQYhmRmePiAZ7Yb6nHC/hVOWnsutc6859fMSxTqWPAPLzdg6erg9dA==
X-Received: by 2002:ac2:5b4e:0:b0:4fe:1f1c:184f with SMTP id i14-20020ac25b4e000000b004fe1f1c184fmr1894304lfp.44.1690884444841;
        Tue, 01 Aug 2023 03:07:24 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id c7-20020aa7c747000000b0052237839229sm6658440eds.21.2023.08.01.03.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 03:07:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 01 Aug 2023 12:07:24 +0200
Message-Id: <CUH4IE1600FN.2SYHOEBM2LS1K@otso>
Cc:     "David S. Miller" <davem@davemloft.net>,
        "Eric Dumazet" <edumazet@google.com>,
        "Jakub Kicinski" <kuba@kernel.org>,
        "Paolo Abeni" <pabeni@redhat.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Marcel Holtmann" <marcel@holtmann.org>,
        "Johan Hedberg" <johan.hedberg@gmail.com>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/4] Add WCN3988 Bluetooth support for Fairphone 4
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Luca Weiss" <luca.weiss@fairphone.com>,
        "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>
X-Mailer: aerc 0.15.2
References: <20230421-fp4-bluetooth-v2-0-3de840d5483e@fairphone.com>
 <CABBYNZJPw=Oxi+J2oA=6aosEZjCBK=u=8HEJywzRJCCrmGnkGA@mail.gmail.com>
 <CSMMO2ZBOS6Y.3SAQOHDLW68ME@otso>
In-Reply-To: <CSMMO2ZBOS6Y.3SAQOHDLW68ME@otso>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Luiz,

On Mon May 15, 2023 at 8:12 AM CEST, Luca Weiss wrote:
> On Fri May 12, 2023 at 10:53 PM CEST, Luiz Augusto von Dentz wrote:
> > Hi Luca,
> >
> > On Fri, May 12, 2023 at 6:58=E2=80=AFAM Luca Weiss <luca.weiss@fairphon=
e.com> wrote:
> > >
> > > Add support in the btqca/hci_qca driver for the WCN3988 and add it to
> > > the sm7225 Fairphone 4 devicetree.
> > >
> > > Devicetree patches go via Qualcomm tree, the rest via their respectiv=
e
> > > trees.
> >
> > Just to be sure, patches 1-2 shall be applied to bluetooth-next the
> > remaining are going to be handled elsewhere?
>
> Sounds good.

Is anything missing for the patches 1 & 2 to be applied? I don't see
them yet in linux-next. Should I resend them?

Regards
Luca

>
> >
> > > --
> > > Previously with the RFC version I've had problems before with Bluetoo=
th
> > > scanning failing like the following:
> > >
> > >   [bluetooth]# scan on
> > >   Failed to start discovery: org.bluez.Error.InProgress
> > >
> > >   [  202.371374] Bluetooth: hci0: Opcode 0x200b failed: -16
> > >
> > > This appears to only happen with driver built-in (=3Dy) when the supp=
orted
> > > local commands list doesn't get updated in the Bluetooth core and
> > > use_ext_scan() returning false. I'll try to submit this separately si=
nce
> > > this now works well enough with =3Dm. But in both cases (=3Dy, =3Dm) =
it's
> > > behaving a bit weirdly before (re-)setting the MAC address with "sudo
> > > btmgmt public-addr fo:oo:ba:ar"
> > >
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > ---
> > > Changes in v2:
> > > - Add pinctrl & 'tlmm 64' irq to uart node
> > > - Pick up tags
> > > - Link to v1: https://lore.kernel.org/r/20230421-fp4-bluetooth-v1-0-0=
430e3a7e0a2@fairphone.com
> > >
> > > ---
> > > Luca Weiss (4):
> > >       dt-bindings: net: qualcomm: Add WCN3988
> > >       Bluetooth: btqca: Add WCN3988 support
> > >       arm64: dts: qcom: sm6350: add uart1 node
> > >       arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth
> > >
> > >  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |   2 +
> > >  arch/arm64/boot/dts/qcom/sm6350.dtsi               |  63 +++++++++++=
++
> > >  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 103 +++++++++++=
++++++++++
> > >  drivers/bluetooth/btqca.c                          |  13 ++-
> > >  drivers/bluetooth/btqca.h                          |  12 ++-
> > >  drivers/bluetooth/hci_qca.c                        |  12 +++
> > >  6 files changed, 201 insertions(+), 4 deletions(-)
> > > ---
> > > base-commit: f2fe50eb7ca6b7bc6c63745f5c26f7c6022fcd4a
> > > change-id: 20230421-fp4-bluetooth-b36a0e87b9c8
> > >
> > > Best regards,
> > > --
> > > Luca Weiss <luca.weiss@fairphone.com>
> > >

