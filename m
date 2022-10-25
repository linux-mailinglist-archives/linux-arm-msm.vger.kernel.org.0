Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B542860D017
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 17:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbiJYPNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 11:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbiJYPNv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 11:13:51 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08277FBCF7
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 08:13:50 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r12so6356882lfp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mPdvsYX06rc3Ks/14FGdPaOc6oYfWhC+pbCymphc/4c=;
        b=Z6hpRPd+ofAVsWbCHiNzB2FCVrfltXUwBHR1jZ9v2LCIuY5anRar+hUxLgxH8bKIvi
         nTpaz6taj11oo7uqq5E6WyKrwtQtNYIxb4cG1GJ7KI5BkaAjFSV+tpkn8zMuiw7zN+ii
         FewxLez0ati7+ufi35rWbchuumT5Zyv1KLEec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPdvsYX06rc3Ks/14FGdPaOc6oYfWhC+pbCymphc/4c=;
        b=w+cBOCULHh1j/BK2yU/oOowlve0C7jsdp5QbEn6Yyr51QSRJFNQ1g7U/bxWnrjYRVh
         yLqb4F0iJrYLjt4Fgdi5klF81qP7p/BPpwwaLTeUQwP2VOFtkWC3FXXwG3NxlSK2dE8J
         MeyIOjqHbPJHK6aqH+mj+e/6OQNVxhrbsZ0OXHVqZGGyFLGADlb1GIUo+rpZ6W3lqVVD
         9kOPAf39pz2VbyKFfrgK6yrNDHOy6I2VXBVAEA5ZOGUcmnA/P2qNOd+TFMicvlS21vpi
         X5W+E47l4FFUkpGdlPAVU7JhKxrIJ9F0Oo1n382Y1PIOjGurN5HZKQjA6lIkSyylX01n
         QFwg==
X-Gm-Message-State: ACrzQf1ivdsb3tyRd0Cepvli7y/WuXGlddUYNIRDyMPdTi0q+y9x4ac9
        Cg/iyuGcgFvAXN9m17pA7iPWET6m9WMT7Vwu5QzBmw==
X-Google-Smtp-Source: AMsMyM504ELQJTw1poH/bkNrCCC7+x2XnF/JoEga1UIU8SOjes9OxdupjSJOJHZF6uaoaYawS2vlBmRSJKj/YpO2Q0U=
X-Received: by 2002:a05:6512:104e:b0:4a2:6bd2:4db5 with SMTP id
 c14-20020a056512104e00b004a26bd24db5mr14745643lfb.52.1666710828422; Tue, 25
 Oct 2022 08:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
 <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
 <CAF6AEGtsw5GTB+MzvA7mE8y=m6qDFtQNFnnAVtuFSxnDAT0YuA@mail.gmail.com>
 <DM8PR02MB8169E5D5C972BE45207F70C2F32B9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <CANHAJhG2PM-KS9GVHOE0xh+5KpKy5qjFBqteRGqNONiasjprBg@mail.gmail.com>
 <CAA8EJprUPw8NChfOferwXEmahkhOHrQvRxpVOhpNJUoZgexHkQ@mail.gmail.com> <DM8PR02MB8169A81C4117598D4053084EF3319@DM8PR02MB8169.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB8169A81C4117598D4053084EF3319@DM8PR02MB8169.namprd02.prod.outlook.com>
From:   Nathan Hebert <nhebert@chromium.org>
Date:   Tue, 25 Oct 2022 08:13:37 -0700
Message-ID: <CANHAJhF_TjOGbKqkOHDaZ+7nGRax4MAcF35iYe51tLEfhi_LZg@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
To:     Vikash Garodia <vgarodia@qti.qualcomm.com>
Cc:     "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vikash,

On Mon, Oct 24, 2022 at 11:20 PM Vikash Garodia
<vgarodia@qti.qualcomm.com> wrote:
>
> Hi Dmitry,
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Thursday, October 20, 2022 11:31 PM
> > To: Nathan Hebert <nhebert@chromium.org>
> > Cc: Vikash Garodia <vgarodia@qti.qualcomm.com>; Rob Clark
> > <robdclark@gmail.com>; linux-firmware@kernel.org; linux-arm-
> > msm@vger.kernel.org; Vikash Garodia (QUIC) <quic_vgarodia@quicinc.com>;
> > Fritz Koenig <frkoenig@chromium.org>; Bjorn Andersson
> > <andersson@kernel.org>
> > Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary of
> > any links or attachments, and do not enable macros.
> >
> > Hi,
> >
> > On Thu, 20 Oct 2022 at 19:52, Nathan Hebert <nhebert@chromium.org>
> > wrote:
> > >
> > > On Wed, Oct 19, 2022 at 10:09 AM Vikash Garodia
> > > <vgarodia@qti.qualcomm.com> wrote:
> > > >
> > > > Hi Rob,
> > > >
> > > > > -----Original Message-----
> > > > > From: Rob Clark <robdclark@gmail.com>
> > > > > Sent: Wednesday, October 19, 2022 9:32 PM
> > > > > To: Nathan Hebert <nhebert@chromium.org>
> > > > > Cc: linux-firmware@kernel.org; linux-arm-msm@vger.kernel.org;
> > > > > Vikash Garodia (QUIC) <quic_vgarodia@quicinc.com>; Fritz Koenig
> > > > > <frkoenig@chromium.org>; Bjorn Andersson <andersson@kernel.org>
> > > > > Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware
> > > > > updates
> > > > >
> > > > > WARNING: This email originated from outside of Qualcomm. Please be
> > > > > wary of any links or attachments, and do not enable macros.
> > > > >
> > > > > Actually, isn't the .mbn the joined fw?  If so all you need to do
> > > > > is remove the other files?
> > > > .mbn is the complete firmware image. We have migrated to .mbn for
> > > > sc7280, while the Initial days of sc7280 was with .mdt binaries
> > > > (split ones). So to support the boards which Have not upgraded the driver,
> > we are retaining all binaries.
> > > >
> > >
> > > Thanks for the feedback (on and off-list). I will push a V2 of the
> > > pull request with the following changes:
> > >
> > > 1. Update both split and non-split binaries for venus-5.4 (SC7180).
> > > Also, update the version in WHENCE. We can remove the legacy split
> > > images in a later commit if it is feasible to do so.
> >
> > The mdt loader doesn't care about the file extension, the mdt loader will
> > determine the type of the file based on the file contents. Thus I'd suggest adding
> > only mbn files and adding a compat symlinks pointing from venus.mdt to
> > venus.mbn
>
> sc7180 is using venus-5.4 firmware and currently the name is passed as "qcom/venus-5.4/venus.mdt" while making call to "request_firmware()"
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/qcom/venus/core.c#L765
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/qcom/venus/firmware.c#L104
Thanks for the code links! That is helpful.
>
> IIUC, before we remove the split files (.mdt), we should also make change in driver to update the name from .mdt to .mbn.
> Please help to clarify if we can remove the split files with driver still referring to "qcom/venus-5.4/venus.mdt" in call to request_firmware().
I think Dmitry is saying that we could remove the venus.b0* files and
replace the venus.mdt
file with a symbolic link to venus.mbn. This would achieve the goal of
reducing the size of the
files that are stored and deployed, while staying compatible with the
existing driver code.

The best solution would probably be to change the driver to load the
.mbn files, but using the
symbolic link seems like a good intermediate solution. If there is no
complaint about Dmitiry's
suggestion, I will make a PR V3 with an additional commit to remove
the split files and use a
symbolic link linking venus.mdt to venus.mbn. This commit will precede
the commit to update
venus 5.4 firmware.
>
> > > 2. Remove the split firmware images for vpu-2.0 (SC7280). There is no
> > > released device that uses the older firmware loader. I have tested to
> > > make sure the non-split image can be loaded and that the venus media
> > > functions work on a
> > > SC7280 device using a ChromeOS kernel based on 5.15.
> > > 3. Update the VPU-2.0 non-split binaries to the latest version and
> > > update the version in the WHENCE file.
> >
> >
> > --
> > With best wishes
> > Dmitry
