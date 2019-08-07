Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 425698532C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 20:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389303AbfHGSqy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 14:46:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43056 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389158AbfHGSqy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 14:46:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E228860F3D; Wed,  7 Aug 2019 18:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565203612;
        bh=rsEXH2qa68Qo5lqAMtQMabxaQZa7nU/AWE5S0APaSZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NwMh1gwmE5zgFWdg0AZUvRfvK5RVaT2KWK9q3eo+tCOCGSLDIQPyozi7Jelu5cKim
         rDdj/Q7Tdo3HLZeohAgXyFCq8HupctEoL3SJGVR8gLdqp48iaHF9KQ5HSatgM1l1ac
         l2b9h5RiYqGOPr+hfm+HxqMbfa+y9VSDOVQMUC00=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E1D0B60A0A;
        Wed,  7 Aug 2019 18:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565203611;
        bh=rsEXH2qa68Qo5lqAMtQMabxaQZa7nU/AWE5S0APaSZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bwDckWat45TZ3snu3ZWqiEivSf2rJ6duxb1hBFhgawz2MeXhGSUHqcWz/1juGzqGm
         krB5zA0czpW/RjnCEKUzWb5FxeKwxZ8rrpnh7PCRqnv6XdwVs6P3971M702S4/nN9/
         DHD2i05d8IjtTyi24JXOOdhrW8DNnP5uErkUXSqQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E1D0B60A0A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 7 Aug 2019 12:46:49 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH] drm/msm: Make DRM_MSM default to 'm'
Message-ID: <20190807184648.GA30521@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
References: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org>
 <20190807173838.GB30025@ravnborg.org>
 <CAF6AEGv6EY5UBYF8D9tuSaMDvkdrBt+zvRxQA+V4PG6ZfKhUAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGv6EY5UBYF8D9tuSaMDvkdrBt+zvRxQA+V4PG6ZfKhUAg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 07, 2019 at 11:08:53AM -0700, Rob Clark wrote:
> On Wed, Aug 7, 2019 at 10:38 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Jordan.
> > On Wed, Aug 07, 2019 at 11:24:27AM -0600, Jordan Crouse wrote:
> > > Most use cases for DRM_MSM will prefer to build both DRM and MSM_DRM as
> > > modules but there are some cases where DRM might be built in for whatever
> > > reason and in those situations it is preferable to still keep MSM as a
> > > module by default and let the user decide if they _really_ want to build
> > > it in.
> > >
> > > Additionally select QCOM_COMMAND_DB for ARCH_QCOM targets to make sure
> > > it doesn't get missed when we need it for a6xx tarets.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > ---
> > >
> > >  drivers/gpu/drm/msm/Kconfig | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > > index 9c37e4d..3b2334b 100644
> > > --- a/drivers/gpu/drm/msm/Kconfig
> > > +++ b/drivers/gpu/drm/msm/Kconfig
> > > @@ -14,11 +14,12 @@ config DRM_MSM
> > >       select SHMEM
> > >       select TMPFS
> > >       select QCOM_SCM if ARCH_QCOM
> > > +     select QCOM_COMMAND_DB if ARCH_QCOM
> > >       select WANT_DEV_COREDUMP
> > >       select SND_SOC_HDMI_CODEC if SND_SOC
> > >       select SYNC_FILE
> > >       select PM_OPP
> > > -     default y
> > > +     default m
> >
> > As a general comment the right thing would be to drop this default.
> > As it is now the Kconfig says that when DRM is selected then all of the
> > world would then also get DRM_MSM, which only a small part of this world
> > you see any benefit in.
> > So they now have to de-select MSM.
> 
> If the default is dropped, it should probably be accompanied by adding
> CONFIG_DRM_MSM=m to defconfig's, I think

In general I prefer to not use a default but this is the only GPU driver for
ARCH_QCOM and I think its safe to stay that 99% of ARCH_QCOM users would select
this module and those that wouldn't will omit DRM entirely.

I feel it is net negative if we dropped the default but then had to turn around
and enable it in every defconfig.

Jordan

> BR,
> -R
> 
> > Kconfig has:
> >     depends on ARCH_QCOM || SOC_IMX5 || (ARM && COMPILE_TEST)
> >
> > So maybe not all of the world but all QCOM or IMX5 users. Maybe they are all
> > interested in MSM. Otherwise the default should rather be dropped.
> > If there is any good hints then the help text could anyway use some
> > love, and then add the info there.
> >
> > The other change with QCOM_COMMAND_DB seems on the other hand to make
> > sense but then this is another patch.
> >
> >         Sam
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
