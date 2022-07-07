Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D3E569988
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 06:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235067AbiGGEwO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 00:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235055AbiGGEwN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 00:52:13 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0181413F29
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 21:52:12 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-31c89653790so108128917b3.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 21:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aJfGJzjxVAKhoKCVJ8klBa53+9jTf1FVsY0qg/EsTOI=;
        b=Pi7QYWRf8bNo+sPlDBtZV+Y4948Efq5v9ghPW8aMWjQLnbge3mjlwt//u/Si02DGuy
         foQnyWH/Q9V3EJ2n9kpVui0OHbLQOvHwN98jK7KdnOZeoBGuZuRm3GsSHFFFi/D8XVGP
         7zcpYobuKLdshbjgBBN+elTKIPQM+KL9eiVm9v1ddiT9RNFoyGMx1Z0wzGNPf4Bt51kY
         +7Jd/bD4PBELmPJziEQWfkoc6+WTggye02Zt1iRfUosMYbauEoHexe2t0jHg9/QioAh0
         TpaZIlo2Ze3Jwrapm4aseQ3VP9vj6ocypeLWerl/ozNc891uwI0RSCabyoRYx6QXbJtQ
         wAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJfGJzjxVAKhoKCVJ8klBa53+9jTf1FVsY0qg/EsTOI=;
        b=K7S1rqWbxH4y23GEcc8wkSUvgmRuGat7ZqZdbojITtsSBgCdLTNjtVv4coogbZxIq3
         B8SKsO3pXRAXgHsQZGTOi/gbSmjqspTcml1KlGCCvAh8DJs8Jp7zpLme0PXpRDDgPeQR
         gSPFEj4DzqK5QqcSy/tGXNTTRrW7Uk5Ke2uutUyefb2SiWBO9VldjacIMR0wZARkI6jQ
         +uEDvtxu0zwFuf5+VuDS+LesD6o1BzCWge//XwgV0lNE1c0YD9W/LZ60VCGTWM1EZLPg
         a1jo4sw6rmvyw3pKCsKrKTE84bDykkddHmvNu11pVti+LaKFjxdFM9BDxYslKs62dot3
         LbFg==
X-Gm-Message-State: AJIora95zsRB1+PEVTyjcwxzDBXcu1PNyefV+xNIH31hSgs0rL/JIjxT
        ll2yWk+Kuot+MNi+3pXtez3R411EYQ5Ki/Qis6NxXQ==
X-Google-Smtp-Source: AGRyM1sPJbcMou8+hmlWmyyluLv5JAb/UeXz/SRt6zKtbw2bNZfOSpgQSwhvFb/VoQSqTP6AElFgl+zkMZKVLj1Q+SM=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr26827236ywe.455.1657169531098; Wed, 06
 Jul 2022 21:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220706155347.778762-1-abel.vesa@linaro.org>
In-Reply-To: <20220706155347.778762-1-abel.vesa@linaro.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 6 Jul 2022 21:51:34 -0700
Message-ID: <CAGETcx_MV8QsAFC_ztY6CjysshxPSZZ2ZbgpyXhSpH1v2knhzA@mail.gmail.com>
Subject: Re: [RFC v2] driver core: Fix repeated device_is_dependent check for
 same link
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 6, 2022 at 8:54 AM Abel Vesa <abel.vesa@linaro.org> wrote:
>
> In case of a cyclic dependency, if the supplier is not yet available,
> the parent of the supplier is checked for dependency. But if there are
> more than one suppliers with the same parent, the first check returns
> true while the next ones skip that specific link entirely because of
> having DL_FLAG_MANAGED and DL_FLAG_SYNC_STATE_ONLY set, which is what
> the relaxing of the link does. But if we check for the target being
> a consumer before the check for those flags, we can check as many
> times as needed the same link and it will always return true, This is
> safe to do, since the relaxing of the link will be done only once
> because those flags will be set and it will bail early.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/base/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 753e7cca0f40..2c3b860dfe80 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -297,13 +297,13 @@ int device_is_dependent(struct device *dev, void *target)
>                 return ret;
>
>         list_for_each_entry(link, &dev->links.consumers, s_node) {
> +               if (link->consumer == target)
> +                       return 1;
> +
>                 if ((link->flags & ~DL_FLAG_INFERRED) ==
>                     (DL_FLAG_SYNC_STATE_ONLY | DL_FLAG_MANAGED))
>                         continue;

Thanks for trying to fix this issue, but I'll have to Nack this patch.

The whole point of the SYNC_STATE_ONLY flag is to allow cycles. It's
needed to maintain correctness of sync_state(). I think I described
those in the commit text that added the SYNC_STATE_ONLY flag. Check it
out if you are interested. So this change of yours will break
sync_state() functionality.

There's a bunch of nuance to fixing the dual cycle issue and I don't
mind fixing this myself in a week or two if you can wait.

Thanks,
Saravana

>
> -               if (link->consumer == target)
> -                       return 1;
> -
>                 ret = device_is_dependent(link->consumer, target);
>                 if (ret)
>                         break;
> --
> 2.34.3
>
