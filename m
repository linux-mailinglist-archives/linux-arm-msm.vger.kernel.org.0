Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 622D1F35F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 18:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730274AbfKGRnM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 12:43:12 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39986 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbfKGRnM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 12:43:12 -0500
Received: by mail-wm1-f68.google.com with SMTP id f3so3398522wmc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 09:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KpzG87r35EsZrqE/IUkJdVHfxUuuO7z6BfNkPZgsL6o=;
        b=VRBInIVqqovYgG87MdJQDmvchFsoAPEUi6MZB224Oeu+93Hr+hLd75ykTAdedIncMr
         MTA18XjNvJddxEmULDe7wkHgiG0pqVid8vIuqSzWTrDmiSBKSfXS2w5cT6BBJduhe3Xh
         zMbWnJRHH21qtPIM4Vjd4r0YIfNKdoUbZcCyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=KpzG87r35EsZrqE/IUkJdVHfxUuuO7z6BfNkPZgsL6o=;
        b=q7n7WAZmemHHA29DehSwFspVz6Uha2gKnm/r76qhhNi8MMAAZ3wDU/8U0yp2w0UuYm
         m/Zj5A/0YYsXsI7hZX8+svfb/KV+oOItwcKa6fTdb7kSl/b5z4N3pE37fMl/AYzLmCJF
         qXWi//ZmUmP5jrRDBPgGV71OzF1XTKOvYrJq/bjZxHKskW3DyN/bWfVEFtdCY/zNCXM0
         oQs5fGAlcFPawuND6OSKmUjXw8BFYfPx98m10x22IHFzEEYWnpTN8NKxCIUNdJNT82oN
         A/DtkxIcfg9rCmAGjJG8zIp60C8su+Kjgw101n5EDCoTiv3J1MOI6QS3EhUzqj8P+Z0d
         0Oew==
X-Gm-Message-State: APjAAAXjeQXGrb7R1swkmeQh4QblxLQCM1zXFLPPkS0vbKhQu0xlPKsy
        57q5fZ8dwew8vPzSUNHwjr9LaQ==
X-Google-Smtp-Source: APXvYqyGO5IIm7hx0yfbYBQADBczX5Ibv3hJOD+rPNObmhL0D74jU4CBc/gpKSB04YYQGcQAcBwxhQ==
X-Received: by 2002:a7b:c347:: with SMTP id l7mr230296wmj.48.1573148589814;
        Thu, 07 Nov 2019 09:43:09 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id f188sm2587065wmf.3.2019.11.07.09.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:43:09 -0800 (PST)
Date:   Thu, 7 Nov 2019 18:43:07 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Eric Anholt <eric@anholt.net>
Cc:     Rob Clark <robdclark@gmail.com>,
        Fritz Koenig <frkoenig@google.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/msm/dpu: Add UBWC support for RGB8888 formats
Message-ID: <20191107174307.GR23790@phenom.ffwll.local>
References: <20191106232553.76553-1-frkoenig@google.com>
 <CAF6AEGuXv+ePcGtuN2XTFazrMrtyCYMjZOvYn5CZ3bKE2UhVQg@mail.gmail.com>
 <87wocbiofp.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wocbiofp.fsf@anholt.net>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 07, 2019 at 09:30:50AM -0800, Eric Anholt wrote:
> Rob Clark <robdclark@gmail.com> writes:
> > On Wed, Nov 6, 2019 at 3:26 PM Fritz Koenig <frkoenig@google.com> wrote:
> >>
> >> Hardware only natively supports BGR8888 UBWC.
> >> UBWC support for RGB8888 can be had by pretending
> >> that the buffer is BGR.
> >
> > Just to expand, this aligns with how we handle RGB component order in
> > mesa for tiled or tiled+ubwc.  If uncompressed to linear the component
> > order is RGB, but in tiled or tiled+ubwc, the component order is
> > always the hw "native" order (BGR) regardless of what the outside
> > world thinks.  But that detail kinda doesn't matter, it's not like
> > generic code is going to understand the tiled or tiled+ubwc format in
> > the first place.. and code that does understand it, knows enough to
> > know that tiled/tiled+ubwc is always in the native component order.
> >
> >> Signed-off-by: Fritz Koenig <frkoenig@google.com>
> >
> > Reviewed-by: Rob Clark <robdclark@gmail.com>
> 
> Seems like a reasonable workaround to me, and permissible by our fourcc
> modifier rules ("you just have to have one way to address the pixels
> given a fourcc and a modifier").

Yeah we have some other aliasing going on already I think. And since for
interopt you just need to pick matching (fourcc, modifier) pairs worst
case that means drivers need to add a bunch of dummies/duplicates. Like we
do here.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

> 
> Reviewed-by: Eric Anholt <eric@anholt.net>



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
