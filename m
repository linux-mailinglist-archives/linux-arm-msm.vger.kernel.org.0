Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBCB3794A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 18:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbhEJQ4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 12:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbhEJQ4Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 12:56:16 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9738C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 09:55:10 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id c3so16326923oic.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 09:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=sVOf3rnQQoCxErFwACuycQahXXh0Mo2aHzmf0ZUSPko=;
        b=HQy+UmcK03DuKLfDIAryB3qD1Mil6T0UDB98z17huWfwRWDjMSI+T3c85L9CGSPeay
         DU+Evt3AJhioziDQCNcCJSrpcKj5BsrsNIscNv7h4V1kko81oWGTehQmGxZDnyW4CUe5
         yw9wsqE9adjtg4qamSlq2FebUWGdDllpv8PeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=sVOf3rnQQoCxErFwACuycQahXXh0Mo2aHzmf0ZUSPko=;
        b=GKld01z181V4/X4N8CKBrdla1x1eao/rdjE2hLYQnmKOxXH7DdxqJdSzldJIeXuCS6
         vr2fzSBagJuacvExCHn5HCPxNxyh1BTuplW5dHJRrgXdbyqSb3SaGIQPAOq8cAJryaXP
         vALBmdIt9vgD8Kpz1jqCxHxOrnpkT9Z5Qy1gXCgQkPlZJPEqMUKf45npt6fNpKvt4rzG
         DzyR21XNXsIug6xI1GynN14Loh8l4hS3y1PrRJEIEH/YHCqF8yFkN/MS7GmG9cdGMmTY
         hotdNCZipWPUEeWpJBSsF6qDtEWakujiMM1OevCpdgPLbJvY6fL0ncgsCeJ3wjytqe4u
         85sg==
X-Gm-Message-State: AOAM532S1UddElMDSAB4XoHz6wOo6dIx56yZe5uOmxhTpkS5rvqOzXT/
        Zdkbl3O0mVoRr/1CEltYm8hJe/MFNzrnpGCND7zpHQ==
X-Google-Smtp-Source: ABdhPJz5RLoBLot1CVzxTjJkBJp56d5KozQuBoFhRpWF7SSXLzx/nTWQb1uAogO6gMhleLVVnQnOjunOH/YyigS6+KU=
X-Received: by 2002:aca:211a:: with SMTP id 26mr18395539oiz.19.1620665710136;
 Mon, 10 May 2021 09:55:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 May 2021 09:55:09 -0700
MIME-Version: 1.0
In-Reply-To: <20210510063805.3262-2-thunder.leizhen@huawei.com>
References: <20210510063805.3262-1-thunder.leizhen@huawei.com> <20210510063805.3262-2-thunder.leizhen@huawei.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 10 May 2021 09:55:09 -0700
Message-ID: <CAE-0n52a4hAsg0bq-1PeL=gK3uFQ0mkvWngdfA_NqdhgWg6tuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/msm/dpu: Fix error return code in dpu_mdss_init()
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Zhen Lei (2021-05-09 23:38:05)
> The error code returned by platform_get_irq() is stored in 'irq', it's
> forgotten to be copied to 'ret' before being returned. As a result, the
> value 0 of 'ret' is returned incorrectly.
>
> After the above fix is completed, initializing the local variable 'ret'
> to 0 is no longer needed, remove it.
>
> In addition, when dpu_mdss_init() is successfully returned, the value of
> 'ret' is always 0. Therefore, replace "return ret" with "return 0" to make
> the code clearer.
>
> Fixes: 070e64dc1bbc ("drm/msm/dpu: Convert to a chained irq chip")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
