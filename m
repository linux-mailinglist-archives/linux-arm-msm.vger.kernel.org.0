Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51E53CFC49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 16:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239462AbhGTNri (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 09:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239736AbhGTNqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 09:46:03 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8BEC0613B5
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 07:24:08 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id i94so26216691wri.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SFxqvandCjDRl0fUYEBNMfLKMtMBK/moBSvmGeLpe8A=;
        b=EDIWfob19WX9iUQJe1J5IXSmMhr8mlTZCU8guENY5JLlCWZ9hE8lw0Sh7rBstRSgOU
         /oxpS26rh8sbRuu6q5YmVHA7rd91a+uJgJZENH2FbZywAmR05gQQR01e6rwjkGwZO+4F
         aw1+W1Bwbpd+ggmfvL7ILmlGMfyqzbhgavun4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=SFxqvandCjDRl0fUYEBNMfLKMtMBK/moBSvmGeLpe8A=;
        b=H5wPINylm8OJk1rFs4dH04v4qKxtN+UKELfVAMHIHkUiQzz0HqdkhA+dbTQsaGgjS7
         81EkXqzhXTV090DX+X4OKaBivFoNx5Wz/Fxcf+x8hKjQ1+axwBRzG1RuVK70kOzbnDw7
         o5g18dbk9bFk9PoCdC/b8TDh112chf3YY5Kcevuw/u6frJVtdoez7MnbkvNqa13RmEtE
         9GTOtXYgNUeEJmul4Bn0YlyD6PMotHR6tFJ8Y5kCe855n76MCez7MjGryhqJ1LUBosMg
         Ce2bdlPgnLV7QTGTcQloQohZUlmr/W65prMdkCUaH/S1cQWACjt5yhS98QcoRpAdBbPw
         VBNA==
X-Gm-Message-State: AOAM5337CWL0BGip7xhUzVLqEUPwjfYR1tc7xXYklvhsz9FKELC98Shv
        yENyAMDiad2tEC2ZviovpdLsBw==
X-Google-Smtp-Source: ABdhPJyTvrKheJwNGUheDAAcCGTY+qv3s7J8bwr7G61A1ywBBEj71bQ7C/3g+gWu5XPyZIRFsUasCQ==
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr36112316wrw.163.1626791047204;
        Tue, 20 Jul 2021 07:24:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p9sm12391582wrj.54.2021.07.20.07.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 07:24:06 -0700 (PDT)
Date:   Tue, 20 Jul 2021 16:24:04 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Emma Anholt <emma@anholt.net>, Bernard Zhao <bernard@vivo.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Lee Jones <lee.jones@linaro.org>,
        Dave Airlie <airlied@redhat.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] [PATCH 00/11] drm/msm: drm scheduler conversion
 and cleanups
Message-ID: <YPbchJy4PIwZnhGE@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Emma Anholt <emma@anholt.net>,
        Bernard Zhao <bernard@vivo.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Lee Jones <lee.jones@linaro.org>, Dave Airlie <airlied@redhat.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210717202924.987514-1-robdclark@gmail.com>
 <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
 <YPbYnLBin9N4weiC@phenom.ffwll.local>
 <bbc4f7fc-9d51-695e-2bb7-62558d7523e2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbc4f7fc-9d51-695e-2bb7-62558d7523e2@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 20, 2021 at 04:16:56PM +0200, Christian König wrote:
> Am 20.07.21 um 16:07 schrieb Daniel Vetter:
> > On Mon, Jul 19, 2021 at 10:40:57AM +0200, Christian König wrote:
> > > Am 17.07.21 um 22:29 schrieb Rob Clark:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > > 
> > > > Conversion to gpu_scheduler, and bonus removal of
> > > > drm_gem_object_put_locked()
> > > Oh yes please!
> > > 
> > > If I'm not completely mistaken that was the last puzzle piece missing to
> > > unify TTMs and GEMs refcount of objects.
> > Why does drm/msm, a driver not using ttm at all, block ttm refactorings?
> > We can just check whether the TTM using driver is potentially using locked
> > final unref and have a special version of
> > drm_gem_object_put_guaranteed_unlocked or whatever the bikeshed will look
> > like, which doesn't have the migth_lock.
> 
> Because we now don't have any unrealistic lock inversion between
> dev->struct_mutex and obj->resv lockdep can complain any more.

Yeah I know, but we didn't have that since a while ago if you're limiting
the audit to ttm using drivers. Which are the only ones that matter for
this, the only thing that caused issues was object_put still being
dev->struct_mutex infested for backwards compat. But even that changed a
while ago I think.
-Daniel

> 
> Cheers,
> Christian.
> 
> > 
> > Anyway, deed is done now :-)
> > -Daniel
> > 
> > > Only problem is that I only see patch 7 and 9 in my inbox. Where is the
> > > rest?
> > > 
> > > Thanks,
> > > Christian.
> > > 
> > > > Rob Clark (11):
> > > >     drm/msm: Docs and misc cleanup
> > > >     drm/msm: Small submitqueue creation cleanup
> > > >     drm/msm: drop drm_gem_object_put_locked()
> > > >     drm: Drop drm_gem_object_put_locked()
> > > >     drm/msm/submit: Simplify out-fence-fd handling
> > > >     drm/msm: Consolidate submit bo state
> > > >     drm/msm: Track "seqno" fences by idr
> > > >     drm/msm: Return ERR_PTR() from submit_create()
> > > >     drm/msm: Conversion to drm scheduler
> > > >     drm/msm: Drop struct_mutex in submit path
> > > >     drm/msm: Utilize gpu scheduler priorities
> > > > 
> > > >    drivers/gpu/drm/drm_gem.c                   |  22 --
> > > >    drivers/gpu/drm/msm/Kconfig                 |   1 +
> > > >    drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
> > > >    drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
> > > >    drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
> > > >    drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
> > > >    drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
> > > >    drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   2 +-
> > > >    drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
> > > >    drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
> > > >    drivers/gpu/drm/msm/msm_drv.c               |  30 +-
> > > >    drivers/gpu/drm/msm/msm_fence.c             |  39 ---
> > > >    drivers/gpu/drm/msm/msm_fence.h             |   2 -
> > > >    drivers/gpu/drm/msm/msm_gem.c               |  91 +-----
> > > >    drivers/gpu/drm/msm/msm_gem.h               |  37 ++-
> > > >    drivers/gpu/drm/msm/msm_gem_submit.c        | 300 ++++++++++++--------
> > > >    drivers/gpu/drm/msm/msm_gpu.c               |  50 +---
> > > >    drivers/gpu/drm/msm/msm_gpu.h               |  41 ++-
> > > >    drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 ++++-
> > > >    drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
> > > >    drivers/gpu/drm/msm/msm_submitqueue.c       |  49 +++-
> > > >    include/drm/drm_gem.h                       |   2 -
> > > >    include/uapi/drm/msm_drm.h                  |  10 +-
> > > >    23 files changed, 440 insertions(+), 359 deletions(-)
> > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
