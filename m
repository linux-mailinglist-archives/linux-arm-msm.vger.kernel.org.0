Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB3313B0C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 18:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgANRX2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 12:23:28 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:59541 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726669AbgANRX2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 12:23:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579022608; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ExKH6Qx5NOKiFzMpvDrIYdTOxCKfXj+v5nlEnciqC7E=; b=FrxsU/iclqknQz+4bsUWuYH77IJxWCX3+P6BZ/TjKsCfpqbwmOb8nfAzotI29UnB8WwbCd1l
 noC/utySbWwoSa9GNcNLEYKk7HEk4p4PwGqpCbxI23ufJ0Ztfk++wjM9Y2rJTngp/Aris7QZ
 KAHEnzlw6VVCCgOTAPrNoPjzjSQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1df90c.7fad57f612d0-smtp-out-n02;
 Tue, 14 Jan 2020 17:23:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1716EC447A1; Tue, 14 Jan 2020 17:23:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 87268C433CB;
        Tue, 14 Jan 2020 17:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 87268C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 14 Jan 2020 10:23:19 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@chromium.org>
Cc:     Brian Ho <brian@brkho.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kristian Kristensen <hoegsberg@chromium.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
Message-ID: <20200114172319.GA2371@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@chromium.org>,
        Brian Ho <brian@brkho.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Kristian Kristensen <hoegsberg@chromium.org>,
        Sean Paul <sean@poorly.run>
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-3-brian@brkho.com>
 <20200113175148.GC26711@jcrouse1-lnx.qualcomm.com>
 <CAJs_Fx6AVwA73eN+Rs=GAvBPD1Leq=WKG9w_2hohpzmecK_C_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJs_Fx6AVwA73eN+Rs=GAvBPD1Leq=WKG9w_2hohpzmecK_C_A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 14, 2020 at 08:52:43AM -0800, Rob Clark wrote:
> On Mon, Jan 13, 2020 at 9:51 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > On Mon, Jan 13, 2020 at 10:36:05AM -0500, Brian Ho wrote:
> > > +
> > > +     vaddr = base_vaddr + args->offset;
> > > +
> > > +     /* Assumes WC mapping */
> > > +     ret = wait_event_interruptible_timeout(
> > > +                     gpu->event, *vaddr >= args->value, remaining_jiffies);
> >
> > I feel like a barrier might be needed before checking *vaddr just in case you
> > get the interrupt and wake up the queue before the write posts from the
> > hardware.
> >
> 
> if the gpu is doing posted (or cached) writes, I don't think there is
> even a CPU side barrier primitive that could wait for that?  I think
> we rely on the GPU not interrupting the CPU until the write is posted

Once the GPU puts the write on the bus then it is up to the whims of the CPU
architecture. If the writes are being done out of order you run a chance of
firing the interrupt and making it all the way to your handler before the writes
catch up.

Since you are scheduling and doing a bunch of things in between you probably
don't need to worry but if you start missing events and you don't know why then
this could be why. A rmb() would give you piece of mind at the cost of being
Yet Another Barrier (TM).

Jordan

> BR,
> -R
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
