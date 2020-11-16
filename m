Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984172B4E71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733271AbgKPRsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733190AbgKPRsp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:48:45 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBC7C0613CF;
        Mon, 16 Nov 2020 09:48:43 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id r17so19728850wrw.1;
        Mon, 16 Nov 2020 09:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oo28y8CwbarIIHt9QVICKSL/cPf2jBzgOsxS9+pjqV4=;
        b=Xo+6RoUKW5EPAQ5AfiLMX2ZOBP3YtaRXNtMeaOx5Kz6LQeDbTNdN8Tn1drGDcfrXbC
         mPk13Xv0teQZptYrVKdoX4Wo9+81F0IAhppDl0rbxUZYifSBDn25uao5eQeQo1F2qh2o
         oDFsFeLhHS524Vtqx1v5iCCJ0CKyCSNVG917jK5sS0i0nGSSY43ASsqSX+k+7zleqUwP
         m2J84Jhrk0YOxQ22Cg7UdO7tOgwcWJJBKfgbfpM6wwxzC4Q2UsWXPFW+TpnUHVet2yv/
         91PQg079/9WnamlCea28HYMTRO6Pt3f6splsJ4ecRed2px63Gik6CAV0aQZU1XnWjgeZ
         gUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oo28y8CwbarIIHt9QVICKSL/cPf2jBzgOsxS9+pjqV4=;
        b=AtRqJJlwNgVMOtmwuXDmik7Tf8n7zLzf58XyqNOjDaAi2KtgQv4dKTAYR83iaD1mHf
         gchDHncf5Ohu3x9KS42GsIGMjD5raSnUMRqfxSj44dwYMnT7y3hqhdcp5a3cqe3Nrayn
         vkh1IfQdE81jZ1NUjk8N9Rutp1txVesj9w8LIbVKmIbUXXTP35dWGNqiiex/EiyDgkBH
         GcX08sYZeUDYe0hvnpr6tsDLhTKgAOekfWcn+vYPCQ5xXROE6tbAZnA2to9jcWnu3F/a
         KkUC0OUsSU0aR4krxuEH4kOqf5FO38Y7I2MeXUfDpOkmfmVfsRpB/RedBVYQbsEud4dx
         p/nQ==
X-Gm-Message-State: AOAM530hIOtCgPr5H0EIyrnK15wBxL+GIDMRH+x+ieRrlMO1GEBMu1Fl
        dnWCWwcLlpanX6dDfXAJHY4zAyjmMzBuGtRo739mmIgX99c=
X-Google-Smtp-Source: ABdhPJwLUHRCNxP780S9wB4HTWCUx9z/UF/ZjtKuXyrKptvA/sOlIX/C0TT7KCOFIw7oMBBwToUFga8s7TvJdYI0jDU=
X-Received: by 2002:adf:f04b:: with SMTP id t11mr19535784wro.147.1605548922581;
 Mon, 16 Nov 2020 09:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20201114151717.5369-1-jonathan@marek.ca> <20201114151717.5369-5-jonathan@marek.ca>
 <20201114162406.GC24411@lst.de> <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca> <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
 <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca> <20201116173346.GA24173@lst.de>
In-Reply-To: <20201116173346.GA24173@lst.de>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 16 Nov 2020 09:50:28 -0800
Message-ID: <CAF6AEGuFzsurd4n6G-nUmCusTJ8vMo9Kqjzs3JRS_d6n+qHgEA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 16, 2020 at 9:33 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, Nov 14, 2020 at 03:07:20PM -0500, Jonathan Marek wrote:
> > qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like
> > dma_sync_single_for_cpu() does deal in some way with the partial cache line
> > case, although I'm not sure that means we can have a nonCoherentAtomSize=1.
>
> No, it doesn't.  You need to ensure ownership is managed at
> dma_get_cache_alignment() granularity.

my guess is nonCoherentAtomSize=1 only works in the case of cache
coherent buffers

BR,
-R
