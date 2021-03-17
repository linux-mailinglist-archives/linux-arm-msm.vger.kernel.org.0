Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C6933EB40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 09:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhCQIRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 04:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhCQIRi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 04:17:38 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D03AC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 01:17:38 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id o16so858598wrn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 01:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aQQTr9x52WQZKbGN+UXyTfuQuaro1IAnE7CQNIF7EbQ=;
        b=rRsEAx6F2ouRMDv3fBBX9mDEf8icI52AiOIMJydya6x9UZqnppIvI6XSwDSxnntRMV
         wujEyUkyZkaHaSdl7lbvibzroxqY2gth5BM5cUpakazc2JHIEYFfEaRrPtI2awbMRA4U
         u/tVzLXMMw7jI+1rQhsMyvbcaG0usBhJM1xkGPlhYsrnhHZNYsO4UVGDWykv9Z5svoO4
         SWjItz8pw2cklFtc1Phz1+whnj4HEFPJGgOqEuf183+3ad6AML7i9L0JE1uvBNum0Wnw
         /Y8VQhLtB/JbXzwTIBYOobcwMIAHsfoBUsVi3emW9HPR/r/vWxFyWR18uEnT3CbTOnKo
         66bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aQQTr9x52WQZKbGN+UXyTfuQuaro1IAnE7CQNIF7EbQ=;
        b=B4A3hT5TiSbXP0Dao6q3qHeinweF16NxEppa4xgo7GjxTcrf5BJor3uZvEeKJARpm+
         QDAs2t3mJCpkuGwtuSxGHnMm3ajBvAs4WD2V+foevaZ84YwgYu5hMcZsl3KWHosaPR/l
         +p13u0KrRQZXn95n3zx4b6rP5G47/QFevrh82wofr73o2wqpKujwpIw16krHr1CvxCiD
         1Cv6cD+8xI9Y+DhSzbos9c+eeIF1EMMccAJ73xEk5xHGT+419FkcfkTt3rHa7u1ku65j
         W51T4kM3g8RgJM57CH49cplbN8mD6tejogfDeADs+bFX1AkI2k4/mXuh1tzRaKrngHtP
         Xv/A==
X-Gm-Message-State: AOAM532GxxFd7pmnwX2FVah4wfOV9ybw2CLGLa0NKQ/Onf4pwRwJWC2O
        d+dALZdM5teHax+3fUToQ3KxVg==
X-Google-Smtp-Source: ABdhPJy+NLJm3S/51dMjrLtGpbwVG+P/h3mK0TfjCNGg++tWCJlVzWFiOG8og26jGqtuchvHPsPpNg==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr3056746wru.401.1615969057113;
        Wed, 17 Mar 2021 01:17:37 -0700 (PDT)
Received: from dell ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id v9sm25014417wrn.86.2021.03.17.01.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 01:17:36 -0700 (PDT)
Date:   Wed, 17 Mar 2021 08:17:29 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Roland Scheidegger <sroland@vmware.com>,
        linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Jeremy Kolb <jkolb@brandeis.edu>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        nouveau@lists.freedesktop.org,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rob Clark <rob.clark@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>
Subject: Re: [RESEND 00/53] Rid GPU from W=1 warnings
Message-ID: <20210317081729.GH701493@dell>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell>
 <YEobySvG0zPs9xhc@phenom.ffwll.local>
 <20210311135152.GT701493@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210311135152.GT701493@dell>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Mar 2021, Lee Jones wrote:

> On Thu, 11 Mar 2021, Daniel Vetter wrote:
> 
> > On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> > > On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> > > 
> > > > The vmwgfx ones look all good to me, so for
> > > > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > > > That said, they were already signed off by Zack, so not sure what
> > > > happened here.
> > > 
> > > Yes, they were accepted at one point, then dropped without a reason.
> > > 
> > > Since I rebased onto the latest -next, I had to pluck them back out of
> > > a previous one.
> > 
> > They should show up in linux-next again. We merge patches for next merge
> > window even during the current merge window, but need to make sure they
> > don't pollute linux-next. Occasionally the cut off is wrong so patches
> > show up, and then get pulled again.
> > 
> > Unfortunately especially the 5.12 merge cycle was very wobbly due to some
> > confusion here. But your patches should all be in linux-next again (they
> > are queued up for 5.13 in drm-misc-next, I checked that).
> > 
> > Sorry for the confusion here.
> 
> Oh, I see.  Well so long as they don't get dropped, I'll be happy.
> 
> Thanks for the explanation Daniel

After rebasing today, all of my GPU patches have remained.  Would
someone be kind enough to check that everything is still in order
please?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
