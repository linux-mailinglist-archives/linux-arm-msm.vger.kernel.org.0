Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED336067B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 20:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbiJTSDG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 14:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbiJTSCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 14:02:45 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998D51F9A3E
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 11:01:14 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id i127so466765ybc.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 11:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1GtB92fhNQxO6gg8nNI9VqRIiHgvlqGny+IoHGO4TzI=;
        b=HgTG3NrpDGlnxqPryUhPpOUkuGhg3qqWDz8wmPz60FqJoHuDlwPC+IKivWNll4Cie+
         N14ZryT3xAtcx8AbieEOXjxAZ8aBiQcd6FeyX+4Yc57VrywflvmPUjBrbZw8QX49OHr4
         B7Y0fVvEv73JS+taHFsdYfwJtDymXGeh4nSzpZlZ81fH9Arlh9jYOAJGPUcVAr6ZAeFN
         QYZGNzGbIXP44+tOSWLqW839qFdsbQMEOGJzauhR4u0Ol8XPZUMDExccFixSUpdpoaTJ
         Q2z92W/R+xO2AXXe/jeTh4DLlILlpqKbkxpWrxYSDukMwp5yKPr7Ta0QnS5j10bR9ddR
         1fuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GtB92fhNQxO6gg8nNI9VqRIiHgvlqGny+IoHGO4TzI=;
        b=uSj7r8YUNUmrXnxQ4Ee3aDVkV3oJLwm7wwadZZXDjgMMvVeLTmSX0+s+agB8iTnE4T
         6KDJcs1PaQo51E+t1yWQdpq4/0SB1xeFTE+4uAVzn93NgYQ+m7r+xsuY0EGXSaZuxcyH
         kZAf41zjrzk/1C+V97YtmAGEAY1IuqlYUHsCKhwUdo3nnf9wsRqJnfkND+jlU7Lj9q1x
         hcHmx7C73JOrqls9Y3w8gg/VPo+qWmPBBtb+eBDyT7WSooW3S/NQ1Y37rL/SVSl9XxQ+
         sgafFHTpkxS6Sal0TVbWhG9Az+786qp0L9Sjdn8fs9G9Ianwp/XEmqx0zZMDaZg3Ll/R
         NXBA==
X-Gm-Message-State: ACrzQf3AeEEr4UFXRMbygi6NsTaMFOOVKZJ7/EQ0qtmuNM5PZ4JqcWgU
        y2ywi0dkhsKHYItJwtTt1Jx8rqhz2DLFXPBzojWyFw==
X-Google-Smtp-Source: AMsMyM5jTcg02fgT3GlmDVIlkrXlzFnypPS2TfFZ5OGrRUPLtRTSerYmXsJUifgvfx/RvZXK3D7ttGATLZikC4QA3Js=
X-Received: by 2002:a25:dad2:0:b0:6c4:716:b273 with SMTP id
 n201-20020a25dad2000000b006c40716b273mr13041944ybf.275.1666288859697; Thu, 20
 Oct 2022 11:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
 <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
 <CAF6AEGtsw5GTB+MzvA7mE8y=m6qDFtQNFnnAVtuFSxnDAT0YuA@mail.gmail.com>
 <DM8PR02MB8169E5D5C972BE45207F70C2F32B9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <CANHAJhG2PM-KS9GVHOE0xh+5KpKy5qjFBqteRGqNONiasjprBg@mail.gmail.com>
In-Reply-To: <CANHAJhG2PM-KS9GVHOE0xh+5KpKy5qjFBqteRGqNONiasjprBg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 20 Oct 2022 21:00:48 +0300
Message-ID: <CAA8EJprUPw8NChfOferwXEmahkhOHrQvRxpVOhpNJUoZgexHkQ@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
To:     Nathan Hebert <nhebert@chromium.org>
Cc:     Vikash Garodia <vgarodia@qti.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, 20 Oct 2022 at 19:52, Nathan Hebert <nhebert@chromium.org> wrote:
>
> On Wed, Oct 19, 2022 at 10:09 AM Vikash Garodia
> <vgarodia@qti.qualcomm.com> wrote:
> >
> > Hi Rob,
> >
> > > -----Original Message-----
> > > From: Rob Clark <robdclark@gmail.com>
> > > Sent: Wednesday, October 19, 2022 9:32 PM
> > > To: Nathan Hebert <nhebert@chromium.org>
> > > Cc: linux-firmware@kernel.org; linux-arm-msm@vger.kernel.org; Vikash
> > > Garodia (QUIC) <quic_vgarodia@quicinc.com>; Fritz Koenig
> > > <frkoenig@chromium.org>; Bjorn Andersson <andersson@kernel.org>
> > > Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
> > >
> > > WARNING: This email originated from outside of Qualcomm. Please be wary of
> > > any links or attachments, and do not enable macros.
> > >
> > > Actually, isn't the .mbn the joined fw?  If so all you need to do is remove the
> > > other files?
> > .mbn is the complete firmware image. We have migrated to .mbn for sc7280, while the
> > Initial days of sc7280 was with .mdt binaries (split ones). So to support the boards which
> > Have not upgraded the driver, we are retaining all binaries.
> >
>
> Thanks for the feedback (on and off-list). I will push a V2 of the pull request
> with the following changes:
>
> 1. Update both split and non-split binaries for venus-5.4 (SC7180). Also,
> update the version in WHENCE. We can remove the legacy split images in a later
> commit if it is feasible to do so.

The mdt loader doesn't care about the file extension, the mdt loader
will determine the type of the file based on the file contents. Thus
I'd suggest adding only mbn files and adding a compat symlinks
pointing from venus.mdt to venus.mbn

> 2. Remove the split firmware images for vpu-2.0 (SC7280). There is no released
> device that uses the older firmware loader. I have tested to make sure the
> non-split image can be loaded and that the venus media functions work on a
> SC7280 device using a ChromeOS kernel based on 5.15.
> 3. Update the VPU-2.0 non-split binaries to the latest version and update the
> version in the WHENCE file.


-- 
With best wishes
Dmitry
