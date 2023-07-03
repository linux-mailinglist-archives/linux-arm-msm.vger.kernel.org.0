Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 739E774648C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 22:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjGCU63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 16:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjGCU63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 16:58:29 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98517E54
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 13:58:27 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-c4d04d50c4cso1859222276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 13:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688417907; x=1691009907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=61fmpik8Z7YpXgrDkPK5kpEXwSV1Qu5SSqMtqctrBCE=;
        b=gMurl/iB2fr/RoZYalDTgJLgpXie/a0X4x8szaBEdgzKSfrh4pEKJn23lnBEmUQDfi
         woc22T4tVyqd7FVnqvi8zWWMk6+3nVoVVCB/pT8dVJWbEa/AEf2J4UuCu6PcW8Sbd1Br
         8qOFetLuBMugyqKVMT7v9Uytor5XpV3NCxV3HaMDTVKAxO5vX1SfQidKr0gXSW+Atzbz
         qGAS0yIG7OxOGqA145AR6ObDC6cEB6yY7UTHU9DkxNALIP26GO/A7IwzU1JjMnm+yPyd
         AYa9BBFCj2DvwS0lm5u+lxbX1RgpC5qHjLu0frauY/vmlpMCY+jV53zb0sYYP0W7hepT
         bbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688417907; x=1691009907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61fmpik8Z7YpXgrDkPK5kpEXwSV1Qu5SSqMtqctrBCE=;
        b=HXA+9vomvKhzoAPApj3sGDqPakH0orP1PuoaK6haORXWEbkwIdO9L5FDWP+3kL5/TD
         k45NqBx4113aJNncUfnhmveNsBXecUZNdtEMVMJ0vIWVOX7DcMh1B6NNCw+WcA7t611D
         WrSs/G5Xki1poF0c/QdPyWftcG5ZsNWFMXVoiMyKPnXhUkE8FHT70CCDE7YXdpMV15p/
         WXqSOKrJ61FSxua1FHjUA89nNxjIJIUrHy/PMJxiS5bjKXw3dVhi4GvBjXlZjzhH4CZy
         1csGhLRHabV5JIsKMi/00EplQkrDLWOA8G91T86+HAjLmcsX9U7E4KXi879oKlxt3R0/
         zJmw==
X-Gm-Message-State: ABy/qLbs2CmPval1f46Z6vo4xKA9VJ/k9UKsqHJVx59SsvsmNIZsHTik
        RZOCn4UdQixfeoD8cK5WAPQA9gkjF4WCpxQl22TvxQ==
X-Google-Smtp-Source: APBJJlGCiOAwtwNc2ltkHxBFijycW7XEhOaZd/YQAt6du97DF0RFEHd8Oat44g+uZZ7DR2U8bLHQMcxI8lWY/h24HCs=
X-Received: by 2002:a25:744b:0:b0:c19:61fc:db04 with SMTP id
 p72-20020a25744b000000b00c1961fcdb04mr11076515ybc.58.1688417906853; Mon, 03
 Jul 2023 13:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-15-dmitry.baryshkov@linaro.org> <b11a9c1f-0f20-e12e-57cd-1bf7f9839e34@quicinc.com>
In-Reply-To: <b11a9c1f-0f20-e12e-57cd-1bf7f9839e34@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 3 Jul 2023 23:58:16 +0300
Message-ID: <CAA8EJprXC531DaTJR1XoCC0ZeHn4q3L2vt6zLMKmYPXyLrab6Q@mail.gmail.com>
Subject: Re: [PATCH v4 14/19] drm/msm/dpu: inline MERGE_3D_BLK macros
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 3 Jul 2023 at 23:29, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
> > To simplify making changes to the hardware block definitions, expand
> > corresponding macros. This way making all the changes are more obvious
> > and visible in the source files.
> >
> > Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> the value of MERGE_3D_SM8150_MASK is 0, so to be uniform with what has
> been done with some of the prev patches to drop 0 feature fields
> assignment, do you want to do the same here?

These patches do macro expansion (+ obvious 0-field removal). So
removal of MERGE_3D_SM8150_MASK had to wait until patch 18.



-- 
With best wishes
Dmitry
