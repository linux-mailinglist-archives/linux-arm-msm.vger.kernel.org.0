Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7D67222E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 12:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbjFEKFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 06:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbjFEKFu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 06:05:50 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D68E6
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 03:05:48 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bb167972cffso5885246276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685959547; x=1688551547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/FS41Ih+vUtWqsRP9xk/SSbQ/TsVgc3IcFrySxyXAOw=;
        b=XYdvYRCtVg88YsxqwOeTmZpVKBps/jJvevf/4HoPJA9d8x95OX/S5meaL79fdZ+lcf
         TYo9EiIJxuqP8I6qT3/hs4a+sekKaLD3qHISTEdhINV/jCa8UfLVBQTVAnCtBimV9HIV
         IsUz2k1t2TnpiUzXKWYKOHwU1KsgmdGBhGasng7QrDgprD5hdibslehcmb3AUAEFF/2U
         hqxRhA4nXn7swnfehttcvH80+nzB/igq5TC0Su5RC38Rpqp3M9iDIK+J7E5QgGsnR6MU
         d/l+lwzxIjkgtyTDbWPAk2rmmdCzaivtkfhcI9PBvyBhf1/WvOcHQZwgRrqJZkHFIMCV
         UiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685959547; x=1688551547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FS41Ih+vUtWqsRP9xk/SSbQ/TsVgc3IcFrySxyXAOw=;
        b=NhdHHP/6bE0EdnxrMkcvKxZqr8QqlBX1nUrUzCdhTT6qP+IU4o5+/CDLScor40yYAq
         2XAAKeraL/y6yQR9S2urXsJ58aluMHaGIk3sMMV4elw2i2eI1yPEg1XhyGz+m+gu7Dc3
         kvmmrcwf/0kyGXIvmbT7B7j4tmnD4PmAzwtWe6QK2YZWev6KEiwpKV427jmS2Ru8VLoc
         m5ekUdfUDPBuAd027Gew4c5FcE9GJ1+TLlYCBpSDKZxLayw5IQoNETL9CGfhLFg3fIiw
         ZDeKB7Yumk0/smSk9vnx2wsYNcbgZgNnNwj04olkxoaU+vu1FomGflxTG937By0bq5rB
         6bgA==
X-Gm-Message-State: AC+VfDzr3FsS4WmCFHj49b0dfR/NEAwufyJmsOrytblxV/wqt/Msz1bq
        RVrhJyyZJie9tBCBAz83J52AtVz4cC75s6gtDkLQMw==
X-Google-Smtp-Source: ACHHUZ7ZahqapikQv5X3CgkTgJs9qJu2UzKM4VpKBCDBA8zf8Pp37d7CHhoxAHvX6jPlV3ZKeHf2tzZIaPEO8cq6JLY=
X-Received: by 2002:a0d:f447:0:b0:561:e561:9fd7 with SMTP id
 d68-20020a0df447000000b00561e5619fd7mr10796136ywf.39.1685959547562; Mon, 05
 Jun 2023 03:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230523151646.28366-1-johan+linaro@kernel.org> <ZH2ys6dVeL02JLCU@hovoldconsulting.com>
In-Reply-To: <ZH2ys6dVeL02JLCU@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 5 Jun 2023 13:05:36 +0300
Message-ID: <CAA8EJprBNzw4o4m0sn2OoOqnwioQWNcTPcKoKGqxLWGc_8xjWA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/msm/dp: set self refresh aware based on PSR support"
To:     Johan Hovold <johan@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        regressions@lists.linux.dev
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

On Mon, 5 Jun 2023 at 13:02, Johan Hovold <johan@kernel.org> wrote:
>
> [ +CC: Thorsten and regzbot so they can help with tracking this
> regression ]
>
> #regzbot introduced: v6.3..v6.4-rc1
>
> On Tue, May 23, 2023 at 05:16:46PM +0200, Johan Hovold wrote:
> > This reverts commit 1844e680d56bb0c4e0489138f2b7ba2dc1c988e3.
> >
> > PSR support clearly is not ready for mainline and specifically breaks
> > virtual terminals which are no longer updated when PSR is enabled (e.g.
> > no keyboard input is echoed, no cursor blink).
> >
> > Disable PSR support for now by reverting commit 1844e680d56b
> > ("drm/msm/dp: set self refresh aware based on PSR support").
> >
> > Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >
> > Bjorn reported that PSR support broke virtual terminals two months ago,
> > but this is still broken in 6.4-rc3:
> >
> >       https://lore.kernel.org/lkml/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> >
> > despite the following series that claimed to address this:
> >
> >       https://lore.kernel.org/lkml/1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com
> >
> > Let's revert until this has been fixed properly.
>
> Virtual terminals are still broken with 6.4-rc5 on the Lenovo ThinkPad
> X13s two weeks after I reported this, and there has been no indication
> of any progress in the other related thread:
>
>         https://lore.kernel.org/lkml/ZHYPHnWoDbXB-fqe@hovoldconsulting.com
>
> Seems like it is time to merge this revert to get this sorted.
>
> Rob, Abhinav, Dmitry, can either of you merge this one and get it into
> 6.4-rc6?

Rob sent the pull request few hours ago, see
https://lore.kernel.org/dri-devel/CAF6AEGuHujkFjRa6ys36Uyh0KUr4Hd16u1EMqJo8tOZ3ifVubQ@mail.gmail.com/

-- 
With best wishes
Dmitry
