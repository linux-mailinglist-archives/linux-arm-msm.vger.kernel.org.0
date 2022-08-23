Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D523759EE37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 23:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiHWVbN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 17:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiHWVbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 17:31:12 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A1E5AC5A
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 14:31:12 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id o15-20020a9d718f000000b00638c1348012so10652518otj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 14:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=8ZboJ+gALwBhWvL4dlU7KPc90cYPf0VICAV5D3dyilo=;
        b=N8os5fKmzT0/gfD0YXlR2aM/DG2R7410uKS9Eakn1wLD+Uo05BGGBIZYkAT47MRMhZ
         UmchDXRS45VUtA3D2fGJvrR3CAnmtWbdUvZgplLstLvDjEOp5BDCxOcq/tH1Cnc4SBoo
         cblCtfNdbUKXPATK8ilLSGT06GsmQ7l75bByk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=8ZboJ+gALwBhWvL4dlU7KPc90cYPf0VICAV5D3dyilo=;
        b=uWs1PJwwcdKrkZ2SLr2byNg8ARNF42ep87TWgrxv1TuvV5tzM7uw4lxvbMntuPHBrW
         EbPoEEKj+79Ufo9ZWK35vxnHbsupLfzNsZSYUvOfRBrZNOFFLIpoP1SiYJewmIw2U/Nx
         ZNrJt9ca0P22xNA5kWISiZ3Ryvvcoho6Uwn7WLje+BwBhW6KCqDWVvmXWfya79AewqCs
         zyA2fOhY2t4WVT+QRGbNLAmUZ7lc5rQz9P+kA41tJsqVTso9ODzHj9vR621XIU0/5gbi
         joIo+Gfe6jQ7VxGKHauDHEZCxbZ0YFzCvF8kSKcwFg+cCdG0N4axCfnLxiFWANFu1n/e
         5HQw==
X-Gm-Message-State: ACgBeo0xfjUYLDvwDjK37qkDmyWpi17KIR4cN+tcpRv0901ycvk3dIIk
        C50seRQz1drEkv+7S+qSqrYTh61UhGhbBeavaQhbhw==
X-Google-Smtp-Source: AA6agR6+bOJxyPJi+ZdRZme7+uoNUzSX4eStlilOe39pgMZX5L+Y9tdYtICzflFAOvd0qwR7ke5pFg6LaQA40ifHUtM=
X-Received: by 2002:a9d:738c:0:b0:638:9962:8cb6 with SMTP id
 j12-20020a9d738c000000b0063899628cb6mr9871156otk.73.1661290271516; Tue, 23
 Aug 2022 14:31:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Aug 2022 16:31:11 -0500
MIME-Version: 1.0
In-Reply-To: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 23 Aug 2022 16:31:11 -0500
Message-ID: <CAE-0n51XQEoi-+6njQaz3oR=wMwe+WVnqA1PApmZDuQ3-gjMqg@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm: lookup the ICC paths in both mdp5/dpu and
 mdss devices
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-08-05 04:56:30)
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index 7b504617833a..d02cd29ce829 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -124,3 +126,23 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
>         work->worker = worker;
>         kthread_init_work(&work->work, fn);
>  }
> +
> +struct icc_path *msm_icc_get(struct device *dev, const char *name)
> +{
> +       struct device *mdss_dev = dev->parent;
> +       struct icc_path *path;
> +
> +       path = of_icc_get(dev, name);
> +       if (path)
> +               return path;
> +
> +       /*
> +        * If there are no interconnects attached to the corresponding device
> +        * node, of_icc_get() will return NULL.
> +        *
> +        * If the MDP5/DPU device node doesn't have interconnects, lookup the
> +        * path in the parent (MDSS) device.
> +        */
> +       return of_icc_get(mdss_dev, name);

Perhaps this would be better served by having another icc_get() API that
looks in the device and also the parent? Or maybe there should be
interconnect-ranges (similar to clock-ranges) so that interconnects can
be mapped to child nodes in DT.
