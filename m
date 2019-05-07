Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F201016468
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 15:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfEGNSE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 09:18:04 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:42274 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbfEGNSD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 09:18:03 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 31DE92002B;
        Tue,  7 May 2019 15:17:58 +0200 (CEST)
Date:   Tue, 7 May 2019 15:17:56 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     jagdsh.linux@gmail.com, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, bskeggs@redhat.com, hierry.reding@gmail.com,
        jcrouse@codeaurora.org, jsanka@codeaurora.org,
        skolluku@codeaurora.org, paul.burton@mips.com,
        jrdr.linux@gmail.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] gpu/drm: Remove duplicate headers
Message-ID: <20190507131756.GA17647@ravnborg.org>
References: <1556906293-128921-1-git-send-email-jagdsh.linux@gmail.com>
 <20190506144334.GH17751@phenom.ffwll.local>
 <20190507100532.GP17751@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507100532.GP17751@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
        a=4sjd1iRJTynRc3plxrAA:9 a=CjuIK1q_8ugA:10
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 07, 2019 at 12:05:32PM +0200, Daniel Vetter wrote:
> On Mon, May 06, 2019 at 04:43:34PM +0200, Daniel Vetter wrote:
> > On Fri, May 03, 2019 at 11:28:13PM +0530, jagdsh.linux@gmail.com wrote:
> > > From: Jagadeesh Pagadala <jagdsh.linux@gmail.com>
> > > 
> > > Remove duplicate headers which are included twice.
> > > 
> > > Signed-off-by: Jagadeesh Pagadala <jagdsh.linux@gmail.com>
> > 
> > I collected some acks for the msm and nouveau parts and pushed this. For
> > next time around would be great if you split these up along driver/module
> > boundaries, so that each maintainer can pick this up directly.
> > 
> > Thanks for your patch.
> > -Daniel
> > 
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c             | 1 -
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c        | 2 --
> > >  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 1 -
> 
> Correction, this didn't compile, so I dropped the changes to panel-rpi.
> Another reason to split patches more for next time around. Also, needs
> more compile testing (you need cross compilers for at least arm to test
> this stuff).
I will try to resurrect my patch series for drm/panel/ that
addresses:
- removal of drmP.h
- removal of duplicated include files
- sort all include files

In other words - panel-raspberrypi-touchscreen.c will be dealt with.
I expect to look at it in two weeks time (on vacation starting friday).

	Sam
