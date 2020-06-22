Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DB6203C83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 18:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbgFVQ0R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 12:26:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60930 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729407AbgFVQ0Q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 12:26:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592843176; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=B8MkbA73HBcHUgVuuaeIgAVxKFah+m4d+ECDIS3Ed+0=; b=pt4XPdlv+8RX5pDkJiyBlbVfKEG8phsYLMbvh8BN7OTuNdTN5U9cScVmSAEOtJ9hHsX8WtPg
 B75B+edzlwF7M3bAQaTbZK/UT4LsAoxqnjAz9aPWvdZ3fhqK+fGv9xqzjXSylLudfy42eehs
 W73YNwaMA862BLuaa7jeDLLUTKY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ef0db98bfb34e631c46a28c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Jun 2020 16:26:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AB0C6C433C8; Mon, 22 Jun 2020 16:25:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57767C433C6;
        Mon, 22 Jun 2020 16:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57767C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 22 Jun 2020 10:25:54 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Eric Anholt <eric@anholt.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Fix address space size after refactor.
Message-ID: <20200622162554.GA9114@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Eric Anholt <eric@anholt.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200617205310.2183722-1-eric@anholt.net>
 <CAF6AEGu1jV+SWg8apDdq5QghGUvr1wKV38R8XwTL97VXfVUmdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGu1jV+SWg8apDdq5QghGUvr1wKV38R8XwTL97VXfVUmdQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 17, 2020 at 07:39:08PM -0700, Rob Clark wrote:
> On Wed, Jun 17, 2020 at 1:53 PM Eric Anholt <eric@anholt.net> wrote:
> >
> > Previously the address space went from 16M to ~0u, but with the
> > refactor one of the 'f's was dropped, limiting us to 256MB.
> > Additionally, the new interface takes a start and size, not start and
> > end, so we can't just copy and paste.
> >
> > Fixes regressions in dEQP-VK.memory.allocation.random.*
> >
> > Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
> > Signed-off-by: Eric Anholt <eric@anholt.net>
> 
> 
> rebased on https://patchwork.freedesktop.org/series/78281/ (which
> fixed half of the problem) and pushed this and 2/2 to msm-next so it
> should show up in linux-next shortly..
> 
> planning to wait a short time more to see if we find any other issues
> and then send a -fixes PR

I'll fix up the rest of the flubbed addresses sizes.

Jordan

> BR,
> -R
> 
> 
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 89673c7ed473..5db06b590943 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -194,7 +194,7 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
> >         struct msm_gem_address_space *aspace;
> >
> >         aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> > -               0xfffffff);
> > +               0xffffffff - SZ_16M);
> >
> >         if (IS_ERR(aspace) && !IS_ERR(mmu))
> >                 mmu->funcs->destroy(mmu);
> > --
> > 2.26.2
> >

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
