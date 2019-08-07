Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C01038535E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 21:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730180AbfHGTBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 15:01:15 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:43186 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730178AbfHGTBP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 15:01:15 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 93C9980486;
        Wed,  7 Aug 2019 21:01:10 +0200 (CEST)
Date:   Wed, 7 Aug 2019 21:01:09 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Clark <robdclark@gmail.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH] drm/msm: Make DRM_MSM default to 'm'
Message-ID: <20190807190109.GA32503@ravnborg.org>
References: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org>
 <20190807173838.GB30025@ravnborg.org>
 <CAF6AEGv6EY5UBYF8D9tuSaMDvkdrBt+zvRxQA+V4PG6ZfKhUAg@mail.gmail.com>
 <20190807184648.GA30521@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807184648.GA30521@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=LpQP-O61AAAA:8 a=-ipZeBXR2iWv2Qf4ONQA:9 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22 a=pioyyrs4ZptJ924tMmac:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jordan/Rob.

On Wed, Aug 07, 2019 at 12:46:49PM -0600, Jordan Crouse wrote:
> On Wed, Aug 07, 2019 at 11:08:53AM -0700, Rob Clark wrote:
> > On Wed, Aug 7, 2019 at 10:38 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Jordan.
> > > On Wed, Aug 07, 2019 at 11:24:27AM -0600, Jordan Crouse wrote:
> > > > Most use cases for DRM_MSM will prefer to build both DRM and MSM_DRM as
> > > > modules but there are some cases where DRM might be built in for whatever
> > > > reason and in those situations it is preferable to still keep MSM as a
> > > > module by default and let the user decide if they _really_ want to build
> > > > it in.
> > > >
> > > > Additionally select QCOM_COMMAND_DB for ARCH_QCOM targets to make sure
> > > > it doesn't get missed when we need it for a6xx tarets.
> > > >
> > > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/msm/Kconfig | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > > > index 9c37e4d..3b2334b 100644
> > > > --- a/drivers/gpu/drm/msm/Kconfig
> > > > +++ b/drivers/gpu/drm/msm/Kconfig
> > > > @@ -14,11 +14,12 @@ config DRM_MSM
> > > >       select SHMEM
> > > >       select TMPFS
> > > >       select QCOM_SCM if ARCH_QCOM
> > > > +     select QCOM_COMMAND_DB if ARCH_QCOM
> > > >       select WANT_DEV_COREDUMP
> > > >       select SND_SOC_HDMI_CODEC if SND_SOC
> > > >       select SYNC_FILE
> > > >       select PM_OPP
> > > > -     default y
> > > > +     default m
> > >
> > > As a general comment the right thing would be to drop this default.
> > > As it is now the Kconfig says that when DRM is selected then all of the
> > > world would then also get DRM_MSM, which only a small part of this world
> > > you see any benefit in.
> > > So they now have to de-select MSM.
> > 
> > If the default is dropped, it should probably be accompanied by adding
> > CONFIG_DRM_MSM=m to defconfig's, I think
That would be best. So the defconfigs end up with the same config as
before.

> 
> In general I prefer to not use a default but this is the only GPU driver for
> ARCH_QCOM and I think its safe to stay that 99% of ARCH_QCOM users would select
> this module and those that wouldn't will omit DRM entirely.
> 
> I feel it is net negative if we dropped the default but then had to turn around
> and enable it in every defconfig.
"in every" equals three defconfigs:
$ git grep ARCH_QCOM | grep defconfig
arch/arm/configs/multi_v7_defconfig:CONFIG_ARCH_QCOM=y
arch/arm/configs/qcom_defconfig:CONFIG_ARCH_QCOM=y
arch/arm64/configs/defconfig:CONFIG_ARCH_QCOM=y

	Sam
