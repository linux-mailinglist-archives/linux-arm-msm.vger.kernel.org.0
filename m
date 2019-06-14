Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC0684558A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 09:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbfFNHRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 03:17:15 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34170 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFNHRP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 03:17:15 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so2093561edb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 00:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zMBRrx89XY9/+cL2HUa95GjmKLop61XwxaeCfqLnOfI=;
        b=MvETRBGtOehmzavPf1Rm3d1PGdnh9uTubB7/3mBIErJrCRoXNK6BWVVX4yIvllU5j6
         8xIM5O/r2/cCghVo0IDPMUl1Pehqw4c5A18Ma1lWbKMUO0/QwXPKyfKpvpbY81SiZOVP
         QAEjGktQy16P8I7UcU35og7XzDmsRK05KMEtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zMBRrx89XY9/+cL2HUa95GjmKLop61XwxaeCfqLnOfI=;
        b=kLCFc5QL/1t7ls1qnhvGwMD4jFzQqVqf1ffGFLVb8eKztr/Nwit6dobHu+yPDrvDwB
         IZbVZR2fylFzt3gI21aQkobcSkjoq0O15YmwGGMXnEvXdPD8epJ8WkbB+ufb1ntUXVpz
         LnAxsWN0GDP8pB81Q2Gzq0fU+AM0YYfRee6Gw3tddjWX4GUqK+ovJnFaF//EoxeLLhJ9
         /SEMeyKNRSCBBg/6XzlfmhYW7jDHViXZ4LDGjuCfplWMbtGXRf4XrjUYEtwS1lJI1RQB
         q5t/Ze3hbj4M19kWXr83IYK/911uYagGlbNlcVlOQaoCCw/B5FmIQsXw5GnSQR7Hiurr
         /43A==
X-Gm-Message-State: APjAAAU6C3O7TB79yhZ6H9XagDLQxoVc+jqQZ7Kbeak+4DrUCq9Utvvx
        jgKqClSlipfseiXzDhiEAAauHRh/TdM=
X-Google-Smtp-Source: APXvYqxhIvZId23XHyhkZj6Wgg/i9Jf/0RMT4fxwwJJuG2zXDl//NhXZCiIuwzM65xHLgwWFUwXh/Q==
X-Received: by 2002:a17:906:644c:: with SMTP id l12mr29931705ejn.199.1560496633384;
        Fri, 14 Jun 2019 00:17:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id d44sm612439eda.75.2019.06.14.00.17.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 00:17:12 -0700 (PDT)
Date:   Fri, 14 Jun 2019 09:17:10 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        clang-built-linux@googlegroups.com
Subject: Re: Cleanup of -Wunused-const-variable in
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
Message-ID: <20190614071710.GU23020@phenom.ffwll.local>
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
 <CAF6AEGt+f+cPFXLmS-y_73K+ecms5vqwZQog_3s9N6g+4kLr=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGt+f+cPFXLmS-y_73K+ecms5vqwZQog_3s9N6g+4kLr=Q@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 13, 2019 at 01:52:02PM -0700, Rob Clark wrote:
> so, for dpu_format_map_tile, I'd like to define a fourcc modifier for
> tiled formats (we currently have a workaround in userspace w/ a
> private modifier in the gallium driver).. I think the problem is
> defining the layout of the tiled format(s) (there are at least two per
> generation and I can't guarantee they are the same across adreno
> generations).  We've mostly avoided needing to know the exact layout
> by using gpu blits to go from tiled<->linear so far.
> 
> For the others, those look like formats we haven't wired up yet.
> 
> I'd say they are all things we want to support eventually, although
> not sure what the timeline will be..  but I'd ask if you remove them
> then split into at least a separate patch for dpu_format_map_tile vs
> others, so we can more easily revert/amend to bring them back.

We've been kinda cheating on this with i915 modifiers too, X/Y tiled
depend upon the chip you're running on :-) But on all modern chips it's a
lot more well-defined, so probably not a huge problem.

I think there's little chance right now for adreno to become a discrete
gpu, so could do the same tricky. If it ever becomes discrete or we want
to share more, then we'd need to bake in the layout properly I think.

I guess the question is: Is the format shared with e.g. camera blocks, or
purely a freedreno internal thing.
-Daniel

> 
> BR,
> -R
> 
> On Thu, Jun 13, 2019 at 1:13 PM Nathan Huckleberry <nhuck@google.com> wrote:
> >
> > Hey all,
> >
> > I'm looking into cleaning up ignored warnings in the kernel so we can
> > remove compiler flags to ignore warnings.
> >
> > There are several unused variables in dpu_formats.c
> > ('dpu_format_map_tile', 'dpu_format_map_p010',
> > 'dpu_format_map_p010_ubwc', 'dpu_format_map_tp10_ubwc').
> > They look like modifiers that were never implemented. I'd like to
> > remove these variables if there are no plans moving forward to
> > implement them. Otherwise I'll just leave them.
> >
> > https://github.com/ClangBuiltLinux/linux/issues/528
> >
> > Thanks,
> > Nathan Huckleberry

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
