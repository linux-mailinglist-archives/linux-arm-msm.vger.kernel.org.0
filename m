Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325254232EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 23:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236550AbhJEVks (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 17:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235679AbhJEVkr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 17:40:47 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0123C061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 14:38:56 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso606092otb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 14:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XwBxFBF/Wz7qJo21AO0Spsmb8Z2fz8+ghFhMq6YjQTU=;
        b=WQ8XmZxsPfbZllzokRO7+Jjx/nD/hJboaXKtbethxbp3yID6yrPSP1lSPe2WQPhrn5
         aeG5uWM9yj3v7XY1gQVk6l3rK/YsaGZIADln28Ae7thnLpJf9Ee1SIDTiQdmshxmsX20
         nRwZfEheKCBrFroqZt1ZFnHViTUarBBJrk/mHHGt9sZpCdy06NetQ5pQv86QuaHuLGOf
         keRle//NDqbe2CoGUEJb57LfABJe3RsjgPaU2tIFKthI80mE0XR+6OrW4NKZuCu0ZZnP
         EnhGft/J5pAEvxsRah9fc9NjZjBOlRsX8VYzyOnNtTbHbBtod0DGP66L9iPCddng66Ge
         zmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XwBxFBF/Wz7qJo21AO0Spsmb8Z2fz8+ghFhMq6YjQTU=;
        b=j/luKsJoHzFnpboPOpc3jNQHNAco6oNVmU2PpuctQr+/9Ivpdzijbflrh6DJ0bf3qL
         kh9LvfUYte+ktGp7Nv0zBqht7zyWNXDmgfkaQHXnq+lPVxlL+Z2Si7KFZhmDuCI7ERvt
         I+fEYzsLMc9f8lnXByBEGd1WZLtoH5t9o/8XG2919UgVgzTESqXhmuXJa43iGlpm3Tau
         W1xi6YcPVIHkSVHAlAahRnINJUOrrMg0iLsgYJjt0kt3Do3tpW/qVHOLYAMJ81Mi5/i2
         WG2SKG05W9DJe10et6BplnMX0f7sBDcUQaBgtStMOTsr+fH/h/LavhX4E2rfIpEEMJs6
         QSxA==
X-Gm-Message-State: AOAM530vUgMMD/g+t6VnPWUODkXmS+q9dn50+AppMFeBHoBUNm8+Uzos
        OddPAU+lDeSmVWIKlBJN8AzLDQ==
X-Google-Smtp-Source: ABdhPJxZU82kUOM2pe8hCHCAjxEF1gNb5QXbBnbhthExkr2zHei0ZXp/UlrjxB3s9dJBtIBvaocs5w==
X-Received: by 2002:a05:6830:812:: with SMTP id r18mr16200467ots.282.1633469936358;
        Tue, 05 Oct 2021 14:38:56 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id z24sm3514610oic.26.2021.10.05.14.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 14:38:55 -0700 (PDT)
Date:   Tue, 5 Oct 2021 14:40:38 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sankeerth Billakanti <sbillaka@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
Message-ID: <YVzGVmJXEDH0HfIL@ripper>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > Found in the middle of a patch from Sankeerth was the reduction of the
> > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > is initalized and HPD interrupt start to be serviced, so in the case of
> > eDP this reduction improves the user experience dramatically - i.e.
> > removes 9.9s of bland screen time at boot.
> >
> > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> re-read the code a couple times to understand that it's waiting 100ms
> times the 'delay' number. Whaaaaat?
> 

I assume you're happy with the current 10s delay on the current
devices, so I don't think we should push for this to be backported.
I have no need for it to be backported on my side at least.

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks,
Bjorn
