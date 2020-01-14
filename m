Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38EB713B009
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 17:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgANQwz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 11:52:55 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40533 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgANQwz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 11:52:55 -0500
Received: by mail-io1-f67.google.com with SMTP id x1so14548273iop.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2020 08:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=tvuqfPAmqeW5h6hFaCyRKpXD9b4Gjd3nwj+gcAvShZ0=;
        b=PE93tZWV+hg39DY1pUEJSq12EHHeocyMtfjbCr6ey/aNdjanGCOl24Wd3BFEcmEQet
         x8iyqIov7uNNXR1EI8XKsIR6DC8z8BpZIf2f4x55M6W21g94/Hmp1Hogt7ZOK3GXDqHv
         09vied9075nNzXfQBJu47599bfeJMHVmsOLbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=tvuqfPAmqeW5h6hFaCyRKpXD9b4Gjd3nwj+gcAvShZ0=;
        b=SaJnNkli6WgzL9oYnEom86NmLPIvpEBxQzVtMXNaKcDyw+M/ysrHGRzwMJZCNFy1SA
         oeZJsCOWRmFioAh1Ls7U2rnMLRQUyr/1tJC83h4BDBvrWxbE3RbTTAAll122nbCxqSCW
         4qI4yNlEPEksqip80sIg4UfhR93rYqWlAgOkbPERedRjnOwEJkDIYiQCPj23wSxFAyvM
         q7JoWLK3Zmlmx9Upy5c4FDs2Hr24pkObOcWSMPdDCTPXB4CGRzbLM4j8G3ChaogLmdbE
         nNEriLPRA97Lwf/IJECydxLo+ZXDKpB3w1nW/KtG6gZXgr9raWsOxdC8nH9Qm5OmWZrW
         l7OA==
X-Gm-Message-State: APjAAAXAoEB1GUhd3H97Ym1v2ip7BFqHIkqVCvLoBE9PsIONJnUEtBCp
        5LYUQkwXx2xbpv8tTx+EJpXUT4+k9h0hXZnDt2UNcQ==
X-Google-Smtp-Source: APXvYqxxSfCxs2zloh33teGyEGvf4zfmbUq0cbRO0d/xAKS5BgM2oPkXId2AZGiWDUDB+p8gcRw82UZWfTwiar2I8kc=
X-Received: by 2002:a6b:6f06:: with SMTP id k6mr18407733ioc.204.1579020774522;
 Tue, 14 Jan 2020 08:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20200113153605.52350-1-brian@brkho.com> <20200113153605.52350-3-brian@brkho.com>
 <20200113175148.GC26711@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200113175148.GC26711@jcrouse1-lnx.qualcomm.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 14 Jan 2020 08:52:43 -0800
Message-ID: <CAJs_Fx6AVwA73eN+Rs=GAvBPD1Leq=WKG9w_2hohpzmecK_C_A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
To:     Brian Ho <brian@brkho.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kristian Kristensen <hoegsberg@chromium.org>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 13, 2020 at 9:51 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Mon, Jan 13, 2020 at 10:36:05AM -0500, Brian Ho wrote:
> > +
> > +     vaddr = base_vaddr + args->offset;
> > +
> > +     /* Assumes WC mapping */
> > +     ret = wait_event_interruptible_timeout(
> > +                     gpu->event, *vaddr >= args->value, remaining_jiffies);
>
> I feel like a barrier might be needed before checking *vaddr just in case you
> get the interrupt and wake up the queue before the write posts from the
> hardware.
>

if the gpu is doing posted (or cached) writes, I don't think there is
even a CPU side barrier primitive that could wait for that?  I think
we rely on the GPU not interrupting the CPU until the write is posted

BR,
-R
