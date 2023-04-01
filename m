Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F816D3319
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 20:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjDASXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 14:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjDASXn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 14:23:43 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE2DE39A
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 11:23:41 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id ek18so102226118edb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 11:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680373420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UoX5rHBOYG5rTBj5NCONE2/0l/MXe772YETmFOQhDKw=;
        b=dIzHiWCHN/6CGq84po38OHbVG5NclnfWExGRUNmyHq1yVLuYoOvnOwU2r+vNp/+rtf
         6kzqKI/kJMzMup2ZjbGW66rkAIkW1BEGvSYP2C8eU5ivHE4nYjJT9/nmLR4FsQoyAP89
         wm2JICB99mh2zaNxRDHLqpWdi68tk1uTZtR2LN4KzoB6Ea7pvKU4kGBqMACfoQsTesuW
         jdvxLAmoNdfUzXElJokOEH5D+ZgCxwuMc5DptuPtOxy0KD5bS+S484C5yakZb3zL9NVN
         LBXvFGA96ifMub9U/euKHYD+3r9sVKm54EbJDDnJCqKr7hrbRmNGCAYbJZL4Bay0K6D7
         QHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680373420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoX5rHBOYG5rTBj5NCONE2/0l/MXe772YETmFOQhDKw=;
        b=fZZW+ZPnJM3JAx8Y11Gn+ExSZHlszm9znCI+VgTksFijziFoJj1cPTqvG2lOce8vWv
         3X5LP5g5p/dJ4lz75RCKUHsVT+4Ax4WiDz9sMfY74VtEU96nRKs/7CXFh+4FaP5eycV5
         p7QXWRH+p79VB/XxQrj3A+5WWBdDF65anDtS/wJNxb5rAPc+oQIJ9Baq3R+QMhJn/kWZ
         yEkX7RrnLE0o5urIgQ/6ctLeKm/nCyqya/hpU0GYTj4nm7VQzAA0mYd0F/6dNQGCU9bO
         acXByHVG2dCK00kE/Tr1aO+C1F0B1XCqzHkqge3QW8euuPD1hVlnh+44NPhvJTJoI2ZX
         OEyQ==
X-Gm-Message-State: AAQBX9fpoQ4oc8PO5LX2XAuKMmOgqMSphRtl+1s5QxaT/o1wXpET9zXA
        Qpfk/SZt/A6BMBI4PON2xec6YtN1iDlDsvmblQs=
X-Google-Smtp-Source: AKy350aG1+n0W0ipZNVQktLKl6YEJa+ln5i98f96z8do5VNVsBmTqsp/qTp/eJLyQaX4fXaOOBZPKhTWc29DkQLy/Us=
X-Received: by 2002:a17:907:8a85:b0:947:9f2a:8ca0 with SMTP id
 sf5-20020a1709078a8500b009479f2a8ca0mr2917991ejc.10.1680373420155; Sat, 01
 Apr 2023 11:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230131200414.24373-1-pvorel@suse.cz> <20230131200414.24373-3-pvorel@suse.cz>
 <20230208234717.gums2uqipzzbkhwn@ripper> <Y+Sq3sEfSYYcm1C+@pevik>
In-Reply-To: <Y+Sq3sEfSYYcm1C+@pevik>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Sat, 1 Apr 2023 20:23:29 +0200
Message-ID: <CAB1t1CwGbSznr1cEMdvhp9S+QvXo3YOphZXN4Yv2JmTZO8GJFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: msm8994-angler: removed clash with smem_region
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>,
        Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

any chance you could merge this patchset? Both patches apply on the
top of current qcom/for-next tree, because (as I wrote 2 months ago)
you applied Jamie's patch [1].

Kind regards,
Petr

[1] https://lore.kernel.org/linux-arm-msm/167591660371.1230100.18259207897974955566.b4-ty@kernel.org/

On Thu, 9 Feb 2023 at 09:12, Petr Vorel <pvorel@suse.cz> wrote:
>
> > On Tue, Jan 31, 2023 at 09:04:14PM +0100, Petr Vorel wrote:
> > > This fixes memory overlap error:
> > > [    0.000000] reserved@6300000 (0x0000000006300000--0x0000000007000000) overlaps with smem_region@6a00000 (0x0000000006a00000--0x0000000006c00000)
>
> > > smem_region is the same as in downstream (qcom,smem) [1], therefore
> > > split reserved memory into two sections on either side of smem_region.
>
> > > Not adding labels as it's not expected to be used.
>
> > > [1] https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-mr1/arch/arm/boot/dts/qcom/msm8994.dtsi#948
>
> > > Fixes: 380cd3a34b7f ("arm64: dts: msm8994-angler: fix the memory map")
>
> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > ---
> > >  arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi          | 5 -----
> > >  arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts | 4 ++--
> > >  arch/arm64/boot/dts/qcom/msm8994.dtsi                      | 5 +++++
> > >  3 files changed, 7 insertions(+), 7 deletions(-)
>
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> > > index cdd796040703..a100b05abf56 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> > > @@ -60,11 +60,6 @@ reserved@5000000 {
> > >                     reg = <0x0 0x05000000 0x0 0x1a00000>;
> > >                     no-map;
> > >             };
> > > -
> > > -           reserved@6c00000 {
> > > -                   reg = <0x0 0x06c00000 0x0 0x400000>;
> > > -                   no-map;
> > > -           };
>
> > I've not picked up the change that introduces this, and it seems that
> > there's some request for changes on that thread.
>
> > Please try to sync up with Jamie to get the patch updated, or let me
> > know how you would like me to proceed.
>
> You merged v2 [1] as cd451939fdda ("arm64: dts: msm8994-angler: removed clash
> with smem_region"), therefore my patchset is applicable the current
> qcom/for-next. Can you please merge it? Or am I missing something?
>
> Kind regards,
> Petr
>
> [1] https://lore.kernel.org/linux-arm-msm/167591660371.1230100.18259207897974955566.b4-ty@kernel.org/
>
> > Thanks,
> > Bjorn
>
> > >     };
> > >  };
>
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> > > index 59b9ed78cf0c..29e79ae0849d 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> > > +++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> > > @@ -41,8 +41,8 @@ tzapp_mem: tzapp@4800000 {
> > >                     no-map;
> > >             };
>
> > > -           removed_region: reserved@6300000 {
> > > -                   reg = <0 0x06300000 0 0xD00000>;
> > > +           reserved@6300000 {
> > > +                   reg = <0 0x06300000 0 0x700000>;
> > >                     no-map;
> > >             };
> > >     };
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> > > index 9ff9d35496d2..24c3fced8df7 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> > > @@ -228,6 +228,11 @@ adsp_mem: memory@c9400000 {
> > >                     reg = <0 0xc9400000 0 0x3f00000>;
> > >                     no-map;
> > >             };
> > > +
> > > +           reserved@6c00000 {
> > > +                   reg = <0 0x06c00000 0 0x400000>;
> > > +                   no-map;
> > > +           };
> > >     };
>
> > >     smd {
> > > --
> > > 2.39.1
>
