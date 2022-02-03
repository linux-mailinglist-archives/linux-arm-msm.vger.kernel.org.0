Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C617D4A9142
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 00:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355533AbiBCXmw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 18:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiBCXmv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 18:42:51 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C0CC061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 15:42:51 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id h7so5386629iof.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HBIR3SgcCgpJJdWb5kZtiaVw7ysO23qQm40mLVGeDCM=;
        b=Hz7fL4YFJIgd4+XEZGvHvaiwSYWJSSUoPgO41PSAjwvQO7gmi+oAhS9Wj52NWzTJWu
         E0vNjKLmXD6aZX5zY0CLcrkmVwzMapb+YV9+j42fd1oiPqXkQEOe4ILoMBAbzVieskgH
         zUjpKzlfr9tR48i3u24t27ZTdj7XOlLYN5a1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HBIR3SgcCgpJJdWb5kZtiaVw7ysO23qQm40mLVGeDCM=;
        b=tN6nbzhydqUk8cdMJlU9ZG0+ZO82ahtZNJ/ek9zuszvYpygPQ7MMPlQj7pyy/zxFiB
         OS4Zee6o0XbjTM2Z9elGPai7F8LzBEGrqdD1jBK/0FSSRyAlSf80mLCkbsm60oiCWSb3
         61bXXa/T8lvyR+sxhJexCao51TBQA2iCawU5ivraQEVirDCHfZYClaJZzuIENh8thQTt
         qt/n5/1lUMSuq6a+06vEPQ/JqqmpwsvKCPNn3j9zdCcOZ9M4hh+5j0S8IyZ+IzzCxvSL
         n6+HU9qmAEDDPVSebbHDB/H2iTtWE9Twj42LqclEDFpH7pOzlRXrFCdwBCEXAU/Nc+5N
         bbdQ==
X-Gm-Message-State: AOAM533oVNnDsKZJwwN2aNUICe9IM5xWSkCx0Vb+it8ihGERl+hNslDa
        Os3I2lkf+MM3v/X1ott1xemx7Afua54JIQ==
X-Google-Smtp-Source: ABdhPJwjSdwVlas5MSd9MwI1wwiUMQe4pWif+ADptOJkZ/kELFMaUTWPXJwcBmDwRHmb9auG0n+nOQ==
X-Received: by 2002:a05:6602:2d0d:: with SMTP id c13mr146085iow.103.1643931770748;
        Thu, 03 Feb 2022 15:42:50 -0800 (PST)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id j3sm126669iow.35.2022.02.03.15.42.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 15:42:50 -0800 (PST)
Received: by mail-il1-f174.google.com with SMTP id z4so3484555ilz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 15:42:50 -0800 (PST)
X-Received: by 2002:a05:6e02:1bed:: with SMTP id y13mr195347ilv.27.1643931769767;
 Thu, 03 Feb 2022 15:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20220202212348.1391534-1-dianders@chromium.org>
 <20220202132301.v3.9.I5f367dcce8107f2186b2aad4aef0dfcfafa034b9@changeid>
 <CAE-0n51N4wB7aTRbZR3zh3hjz56vdkFNwOSuKjU7n9gd_JDcvA@mail.gmail.com>
 <CAD=FV=UKKZaHHz3-idahLg-ey3xmSZWKeTVVipzpZNQAkUVKmQ@mail.gmail.com> <CAE-0n50Xb2qwDDOCaLwZPr5-YES3gYyA+7218=EXa4ZSJuFGjw@mail.gmail.com>
In-Reply-To: <CAE-0n50Xb2qwDDOCaLwZPr5-YES3gYyA+7218=EXa4ZSJuFGjw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Feb 2022 15:42:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X-Bu=r+Le2DRbBUuKik-Vo6mMu8QFaAGa7U910BXdY0A@mail.gmail.com>
Message-ID: <CAD=FV=X-Bu=r+Le2DRbBUuKik-Vo6mMu8QFaAGa7U910BXdY0A@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] arm64: dts: qcom: sc7280: Disable pull from pcie1_clkreq
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Feb 3, 2022 at 1:59 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2022-02-03 13:53:09)
> > Hi,
> >
> > On Thu, Feb 3, 2022 at 1:42 PM Stephen Boyd <swboyd@chromium.org> wrote=
:
> > >
> > > Quoting Douglas Anderson (2022-02-02 13:23:43)
> > > > I believe that the PCIe clkreq pin is an output. That means we
> > > > shouldn't have a pull enabled for it. Turn it off.
> > >
> > > It sounds like it's a request from the PCI device to the PCI phy that
> > > the clk should be on. I googled pcie clkreq open drain and this pdf[1=
]
> > > says
> > >
> > > "The CLKREQ# signal is an open drain, active low signal that is drive=
n
> > > low by the PCI Express M.2 add-I Card function to request that the PC=
I
> > > Express reference clock be available (active clock state) in order to
> > > allow the PCI Express interface to send/receive data"
> > >
> > > so presumably if there isn't an external pull on the signal the open
> > > drain feature will not work and the PCIe device won't be able to driv=
e
> > > it low.
> > >
> > > [1] https://advdownload.advantech.com/productfile/PIS/96FD80-P512-LIS=
/Product%20-%20Datasheet/96FD80-P512-LIS_datasheet20180110154919.pdf
> >
> > Yeah, I had some trouble figuring this out too, so if someone knows
> > better than me then I'm more than happy to take advice here. I thought
> > I had found something claiming that "clkreq" was an output and on the
> > schematic I have from Qualcomm it shows an arrow going out from the
> > SoC for this signal indicating that it's an output from the SoC. Of
> > course, those arrows are notoriously wrong but at least it's one piece
> > of evidence that someone thought this was an output from the SoC.
> >
> > Hrm, but I just checked the sc7280 "datasheet" which claims that this
> > is an input. Sigh.
> >
> > I guess the options are:
> > * If we're sure this is an input to the SoC then I think we should
> > remove the drive-strength, right?
> > * If we don't know then I guess we can leave both?
>
> I'll wait for qcom folks to confirm. Maybe it's bidirectional because it
> is an open drain signal. I'm showing my cards that I'm no PCIe expert :)

Ah ha! I searched some more and found a Qualcomm PCIe user guide on this!

CLKREQ# signal properties =E2=80=93 Bi-directional clock request signals
whether the RC or AP requires control

So it sounds as if leaving it as pull-up and having drive-strength as
2 is right.  tl;dr: drop this patch from the series...

> > In any case, for now we can just drop this patch?
> >
>
> Sounds good to me. It needs to be resolved through for herobrine-r1?

Yup. I responded to that patch and for now I'll wait for Bjorn to give
me direction on how to handle it.

-Doug
