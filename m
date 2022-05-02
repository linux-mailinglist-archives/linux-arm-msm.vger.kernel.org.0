Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F9D516BA9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 10:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359111AbiEBIJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 04:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383653AbiEBIJE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 04:09:04 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350F037BDF
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 01:05:36 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2f7c57ee6feso139837807b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pkED2ob7beSbV7dxZktMXjEINCdftZ7x+GOUm/NUPeI=;
        b=TAvAENhMvrGwzmPBadnLxV8W7lPrEBQhCdgtGGiuvwg9C7UqfCJ5weozGQFVEcVeDy
         9zHHts4vJYenln1281EwtIB/mmbMbqUZ/Bzx1MU80ZGS0Jkk/e8q4r3uuOXPw0EcpLLD
         g9+d2t2UrJ7ncBVRs0Z4NGNTmhcOuZpIOKGOLFFpAu71wYnR61d3a5i69LHavy9BbE1L
         icR4rHqLySa96fCcjA6fxV8aSaY8Wyh142DZ+GxyDmXjkIK51kpoqEUwZc89AZgRnzqL
         CzqSVQc5StRFBzYrE1HGn9NnhCuPdgV+vDID7D1fkEZEkRzXK+v1faqzEheFGPAxm1ec
         yoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pkED2ob7beSbV7dxZktMXjEINCdftZ7x+GOUm/NUPeI=;
        b=uUk6t793s62G75v6YrfAndaRVNuV5cSpkR/CdWsq/Pud4BTjotpJPiNFOKD9opTAC7
         wAjwk+6ctbHNdHAmiKVpQiCptPKxd9/FyGq8UpPHlBHrTwbauE1atKb2ZvtUj7PYzYHz
         ZMPCKKPXAUQ7CUaVfhpt51ADZ1Zdg1xyHuPLC1HT72Vgraq86DhrPuzgz3DMJ2ew0Haw
         9eLGRVnq0DnBFSOqroRYI3vwKnCB8ev876mwdU3076tnD47D038KKIWckQLBPjmWkxDL
         EoJaNkHPyx7BibmFrTMoOActIaPju41IQD6WQ/DiyJ71j8Fv0UgPSzamaDIoQw5Njh3T
         8lVA==
X-Gm-Message-State: AOAM532GBsYia+VEFLhaHLw9ekB2iAVk3cqrWfRerAPw/6ZTVpCgXdvV
        sGw/02unVsFKr6632OMRib3b4HtYGMmUtYB8jUdU0w==
X-Google-Smtp-Source: ABdhPJxjd/UXBkLDQ8v0mFv7qO6LcXwqsQ00DKef/H8r0Zu4XJme0fm1NhlnpF7VjbqgBLVTYHmD7fYUsLF7zRWf/mk=
X-Received: by 2002:a81:4c11:0:b0:2d1:1925:cd70 with SMTP id
 z17-20020a814c11000000b002d11925cd70mr10043140ywa.101.1651478735419; Mon, 02
 May 2022 01:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <1650952931-31988-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n52cSR_xCxF+_UeK8CaHqsu=4HOtfWQ3BMmx2Tx3kmk-ZA@mail.gmail.com>
 <e20d94d7-a865-21f7-0514-706992294614@linaro.org> <200eddae-02b8-5479-3e81-1f3885200ac0@quicinc.com>
In-Reply-To: <200eddae-02b8-5479-3e81-1f3885200ac0@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 2 May 2022 11:05:24 +0300
Message-ID: <CAA8EJppVawrs+i0JBfmyO=68yKqA=2+ixm-KN+70Ah9OaUvG9g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/disp/dpu1: avoid clearing hw
 interrupts if hw_intr is null during drm uninit
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        quic_kalyant@quicinc.com, robdclark@gmail.com,
        linux-kernel@vger.kernel.org, dianders@chromium.org
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

On Mon, 2 May 2022 at 04:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Looks like our new CI has given all the answers we need :) which is a
> great win for the CI in my opinion.
>
> Take a look at this report :
> https://gitlab.freedesktop.org/drm/msm/-/jobs/22015361
>
> This issue seems to be because this change
> https://github.com/torvalds/linux/commit/169466d4e59ca204683998b7f45673ebf0eb2de6
> is missing in our tree.
>
> Without this change, what happens is that we are not hitting the return
> 0 because we check for ENODEV.
>
>
>    /*
>       * External bridges are mandatory for eDP interfaces: one has to
>       * provide at least an eDP panel (which gets wrapped into
> panel-bridge).
>       *
>       * For DisplayPort interfaces external bridges are optional, so
>       * silently ignore an error if one is not present (-ENODEV).
>       */
>      rc = dp_parser_find_next_bridge(dp_priv->parser);
>      if (!dp->is_edp && rc == -ENODEV)
>          return 0;
>
> So, I think we should do both:
>
> 1) Since we are running CI on the tree, backport this change so that
> this error path doesnt hit?
>
> 2) Add this protection as well because this shows that we can indeed hit
> this path in EDEFER cases causing this crash.

I have been waiting for v2 for the last week or so. It should include
a fixed Fixes tag and an updated description (which should note that
this happens in the error path, etc) as requested by Stephen.

>
> Thanks
>
> Abhinav
>
> On 4/27/2022 3:53 AM, Dmitry Baryshkov wrote:
> > On 27/04/2022 00:50, Stephen Boyd wrote:
> >> Quoting Vinod Polimera (2022-04-25 23:02:11)
> >>> Avoid clearing irqs and derefernce hw_intr when hw_intr is null.
> >>
> >> Presumably this is only the case when the display driver doesn't fully
> >> probe and something probe defers? Can you clarify how this situation
> >> happens?
> >>
> >>>
> >>> BUG: Unable to handle kernel NULL pointer dereference at virtual
> >>> address 0000000000000000
> >>>
> >>> Call trace:
> >>>   dpu_core_irq_uninstall+0x50/0xb0
> >>>   dpu_irq_uninstall+0x18/0x24
> >>>   msm_drm_uninit+0xd8/0x16c
> >>>   msm_drm_bind+0x580/0x5fc
> >>>   try_to_bring_up_master+0x168/0x1c0
> >>>   __component_add+0xb4/0x178
> >>>   component_add+0x1c/0x28
> >>>   dp_display_probe+0x38c/0x400
> >>>   platform_probe+0xb0/0xd0
> >>>   really_probe+0xcc/0x2c8
> >>>   __driver_probe_device+0xbc/0xe8
> >>>   driver_probe_device+0x48/0xf0
> >>>   __device_attach_driver+0xa0/0xc8
> >>>   bus_for_each_drv+0x8c/0xd8
> >>>   __device_attach+0xc4/0x150
> >>>   device_initial_probe+0x1c/0x28
> >>>
> >>> Fixes: a73033619ea ("drm/msm/dpu: squash dpu_core_irq into
> >>> dpu_hw_interrupts")
> >>
> >> The fixes tag looks odd. In dpu_core_irq_uninstall() at that commit it
> >> is dealing with 'irq_obj' which isn't a pointer. After commit
> >> f25f656608e3 ("drm/msm/dpu: merge struct dpu_irq into struct
> >> dpu_hw_intr") dpu_core_irq_uninstall() starts using 'hw_intr' which is
> >> allocated on the heap. If we backported this patch to a place that had
> >> a73033619ea without f25f656608e3 it wouldn't make any sense.
> >
> > I'd agree here. The following tag would be correct:
> >
> > Fixes: f25f656608e3 ("drm/msm/dpu: merge struct dpu_irq into struct
> > dpu_hw_intr")
> >
> >
> >>
> >>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +++
> >>>   1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >>> index c515b7c..ab28577 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >>> @@ -599,6 +599,9 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
> >>>   {
> >>>          int i;
> >>>
> >>> +       if (!dpu_kms->hw_intr)
> >>> +               return;
> >>> +
> >>>          pm_runtime_get_sync(&dpu_kms->pdev->dev);
> >>>          for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
> >
> >



-- 
With best wishes
Dmitry
