Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D812606647
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 18:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiJTQwW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 12:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbiJTQwV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 12:52:21 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D691B65D7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 09:52:19 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id b1so372674lfs.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s/ZEXKDRDRj3WNNr3hTK31vGtN01dCNnxQgVkyZFvXk=;
        b=MCAncbePD1KRjyATSdVpV/pz75l4UrRbEkvXPGcnW7sCexuHzPieoFtTxDHdZ6K7k0
         A/KG1RH9os9yi5+X140BnoSuSIhIUzmHym/5Iw5Fnc6Z5twF/c3IUIpmBUdukBPwVPlf
         9NKplRt0s6EFHLSYLfjDx3t4Sb/Ak0PgN2f9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/ZEXKDRDRj3WNNr3hTK31vGtN01dCNnxQgVkyZFvXk=;
        b=SrNkPu4HrX/pJwlT0VA1BgHyPpR0G7WfCZff+e/rmGDXpYP64j2ti18XmwDMdjKqgQ
         Cl3RwsyIiuS2mi4RmoSiXDCVH5t2xNaY6JargqycrR7/Jxq5oefP3u+RaXE5Ad+GbVG/
         fnDi3xoBj9pB4XikV0VmjpkFsJvFceC9jSHNXObwO4EU9KMubZhCrdEze6+Nrs5ROp7S
         T4vzKROq7XEPRXYY5C4YnxhSdRMnEU2Bnp6XeOobLJytIObvLgd846IsGxK+Qy8ZlPZa
         WaSCxNBVE/CsfOQM6ougiKFlPuqw4RqN4sQWC50wzPI2WFWIx3Q8mix59Jr97hpeP1fD
         WNeg==
X-Gm-Message-State: ACrzQf0SDe6Kn2Cl4wIhbgnpqeA9j4tl3VL9Ws+3jdRGVuK1zkEVeQZS
        FLbETyO9d/wqhR1KueWtSPWFFFEP4OBqI96QvJONOQ==
X-Google-Smtp-Source: AMsMyM6foqy60+V71r5PMJ0enkd1Nd/f7VvEQyYXSD/OhVePzreiswI+fR0A/ZowIhO2a4vFIoPAUwjMakApyrsmXCA=
X-Received: by 2002:a05:6512:6d4:b0:4a2:f89:db7d with SMTP id
 u20-20020a05651206d400b004a20f89db7dmr5048536lff.125.1666284737895; Thu, 20
 Oct 2022 09:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
 <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
 <CAF6AEGtsw5GTB+MzvA7mE8y=m6qDFtQNFnnAVtuFSxnDAT0YuA@mail.gmail.com> <DM8PR02MB8169E5D5C972BE45207F70C2F32B9@DM8PR02MB8169.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB8169E5D5C972BE45207F70C2F32B9@DM8PR02MB8169.namprd02.prod.outlook.com>
From:   Nathan Hebert <nhebert@chromium.org>
Date:   Thu, 20 Oct 2022 09:52:06 -0700
Message-ID: <CANHAJhG2PM-KS9GVHOE0xh+5KpKy5qjFBqteRGqNONiasjprBg@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
To:     Vikash Garodia <vgarodia@qti.qualcomm.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 19, 2022 at 10:09 AM Vikash Garodia
<vgarodia@qti.qualcomm.com> wrote:
>
> Hi Rob,
>
> > -----Original Message-----
> > From: Rob Clark <robdclark@gmail.com>
> > Sent: Wednesday, October 19, 2022 9:32 PM
> > To: Nathan Hebert <nhebert@chromium.org>
> > Cc: linux-firmware@kernel.org; linux-arm-msm@vger.kernel.org; Vikash
> > Garodia (QUIC) <quic_vgarodia@quicinc.com>; Fritz Koenig
> > <frkoenig@chromium.org>; Bjorn Andersson <andersson@kernel.org>
> > Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary of
> > any links or attachments, and do not enable macros.
> >
> > Actually, isn't the .mbn the joined fw?  If so all you need to do is remove the
> > other files?
> .mbn is the complete firmware image. We have migrated to .mbn for sc7280, while the
> Initial days of sc7280 was with .mdt binaries (split ones). So to support the boards which
> Have not upgraded the driver, we are retaining all binaries.
>

Thanks for the feedback (on and off-list). I will push a V2 of the pull request
with the following changes:

1. Update both split and non-split binaries for venus-5.4 (SC7180). Also,
update the version in WHENCE. We can remove the legacy split images in a later
commit if it is feasible to do so.
2. Remove the split firmware images for vpu-2.0 (SC7280). There is no released
device that uses the older firmware loader. I have tested to make sure the
non-split image can be loaded and that the venus media functions work on a
SC7280 device using a ChromeOS kernel based on 5.15.
3. Update the VPU-2.0 non-split binaries to the latest version and update the
version in the WHENCE file.

> > On Wed, Oct 19, 2022 at 8:52 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > Hmm, does venus not support the combined firmware yet?  Elsewhere
> > > we've moved away from split fw to using a single ELF file..
> > >
> > > BR,
> > > -R
> > >
> > > On Tue, Oct 18, 2022 at 2:18 PM Nathan Hebert <nhebert@chromium.org>
> > wrote:
> > > >
> > > > The following changes since commit
> > 48407ffd7adb9511701547068b1e6f0956bd1c94:
> > > >
> > > >   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43
> > > > -0400)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://github.com/nathan-google/linux-firmware.git
> > > > update_sc7180_and_sc7280_firmwares
> > > >
> > > > for you to fetch changes up to
> > 76e160366a28010fa06ddc965659c38a44d159d9:
> > > >
> > > >   qcom: update venus firmware files for VPU-2.0 (2022-10-18 13:42:58
> > > > -0700)
> > > >
> > > > ----------------------------------------------------------------
> > > > Nathan Hebert (2):
> > > >       qcom: update venus firmware files for v5.4
> > > >       qcom: update venus firmware files for VPU-2.0
> > > >
> > > >  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> > > >  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> > > >  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
> > > >  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
> > > > qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
> > > > qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> > > >  qcom/vpu-2.0/venus.b00   | Bin 692 -> 692 bytes
> > > >  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 7376 bytes
> > > >  qcom/vpu-2.0/venus.b02   | Bin 300 -> 300 bytes
> > > >  qcom/vpu-2.0/venus.b04   | Bin 20 -> 20 bytes
> > > >  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 939472 bytes
> > > >  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 43120 bytes
> > > >  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
> > > >  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 8068 bytes
> > > >  14 files changed, 0 insertions(+), 0 deletions(-)
>
> Thanks,
> Vikash
