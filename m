Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8CC557F6C4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 22:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiGXUKh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 16:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiGXUKg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 16:10:36 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96D0B1EC
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 13:10:33 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id q3so6264961qvp.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 13:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9NQyh2bs88XAyOOdXIMOFXmDnOwmGl1o/0rUMi4/QHQ=;
        b=PTRW02txEXSRXk8Xo1Q2TayCDLjbCuulOWRBmQ5t7Qi4FjCMoPit1qMWO0hbUeK56c
         E64UPS1q/n68EwFHdAiCJyjc0At5jFUT4KhA6iRj6vQXkW6SGSGmU6wqFlcjqppswMx6
         D5L1diBp31p8SEVf5tD7KLA2sOMQBmlTkWpj+3xA1MEySDiFWsc1koRhLM18/EQn5dk6
         DYdZUug9O7n5Kso9Uxz6878taL42QEbsQxBW36fflVmEqBfd5rmLTTmqWGUyyiMR93vd
         rYsZus7SMgWJsypemqb6MYdM/EW9zEt4PzrK41q4LXNfXv2cqF9PhI/PiSFw2i+H9bv1
         I/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9NQyh2bs88XAyOOdXIMOFXmDnOwmGl1o/0rUMi4/QHQ=;
        b=XTs184EfH11iJR1/8bNIqH+aekGefgJMXxt+3tsc8o785efH1HxgX1hnLAFls3L2vx
         Hwk82JBMAqCYXMgTahP4BFN1ZfhV2BY5yHM22oijeDzEY3fOM8Qb8DIz6efr7Z3zipMb
         37z/v4J7b6Xn4bxxRJzFEse03iGE6Eaa/+ysuaVtSug8ceuiocucNRvNEsfQ0hDbGFda
         8UDeZyLmnArv84yfSua0Z6tCjBvji2+5ZURQ/IxdEjlVM1PPKGm3GGf2T7O9Do44kAh7
         hZLUu+ECMT57s59nQYTg/GQ8UEolkaw9bw4Emq964pMCTlE7xGvA+lua7LXGGqLZeo/O
         zKNA==
X-Gm-Message-State: AJIora9yyt1KqXgCHxhnX6wzEBcbl8sb54jNUcFj+M+2HF7mf8+2qWAi
        UYcJbv07juVsOfWQbHG1equdXgfK5zklhC64kSM1xg==
X-Google-Smtp-Source: AGRyM1v7WhO0L7GbCrccVmyoYUn068LyDJDUELP+QZpK71QGYLNkxFlkoRfB9mBp1JKXkq9msK6IFtm0la5TZjy7Rus=
X-Received: by 2002:a0c:8ecc:0:b0:473:2fa4:df7c with SMTP id
 y12-20020a0c8ecc000000b004732fa4df7cmr7835949qvb.55.1658693433038; Sun, 24
 Jul 2022 13:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220724111327.1195693-1-javierm@redhat.com> <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
 <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com> <630a6654-0305-f3a8-e062-f13a0074d35a@redhat.com>
In-Reply-To: <630a6654-0305-f3a8-e062-f13a0074d35a@redhat.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 24 Jul 2022 23:10:21 +0300
Message-ID: <CAA8EJpr1xf9mkfT-FhK9M58syMnWCFXozWHH9L_gxtXOqgh0yw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Make .remove and .shutdown HW shutdown consistent
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 24 Jul 2022 at 22:51, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> On 7/24/22 20:47, Javier Martinez Canillas wrote:
> > Hello Dmitry,
>
> [...]
>
> >> Now there is no point in having this as a separate function. Could you
> >
> > The only reason why I kept this was to avoid duplicating the same comment
> > in two places. I thought that an inline function would be better than that.
> >
> >> please inline it?
> >>
>
> Or do you mean inline it as dropping the wrapper helper and just call to
> drm_atomic_helper_shutdown() in both callbacks ? I'm OK with that but as
> mentioned then we should probably have to duplicate the comment.
>
> Since is marked as inline anyways, the resulting code should be the same.

Yes, I'd like for you to drop the wrapper. I'm fine with duplicating
the comment, since it will be in place where it matters (before
checking ddev->registered) rather than just stating the contract for
the wrapper (which can be easily ignored).

(And yes, I do read patches and commit messages before commenting.)

-- 
With best wishes
Dmitry
