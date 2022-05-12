Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45CA9524203
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 03:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiELB3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 21:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiELB3J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 21:29:09 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E3E146424
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 18:29:08 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-ed9ac77cbbso5001203fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 18:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=nlBxn7EbHMfvqAK9TKNXoiDCi+sQenNLw/cNQhu/9WI=;
        b=FUFfr//9h2g+RgJBdz93Ja3DvE2LJXZMaa0DNrKz7YJxt1hlI1Cp7xQbEWj2eVGT05
         ZGGU/I/JB4uIxHdwRCSsTeesVOIXsUyqIrt/0B27NhyFr/3j47tc7XapVd4Mzysku7ut
         qcrlB6GeNNf7yUa0w/zN74VWgAXgNisPS7p/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=nlBxn7EbHMfvqAK9TKNXoiDCi+sQenNLw/cNQhu/9WI=;
        b=54z7ejLf5jzdGWEBd2CrZRqJilmU/2U7HXEHOhVuMcqtzteCkOwMW3V+y0dNK5P0qW
         zfV3lmPGhEQakgoGcHsig66NAACiSolS3WdoVs2kwtXK7Mw2ik+NvRZEPvjtMsg4JvCS
         h4qHv5TU+eh/IlH9riDlDdl8PlHsrtBz1PRAA/aQwkSq8wrGjc1WSnZEoFVyrtPTWbyX
         Rv6oWINRGsW0H+Pq/3n96cARffpQNnk1/D9dCJaEr/3PjcgHXf2KZEJF6NkVi+tkoOaY
         X4HRz0i/ETXcwxRH0u2s0jM16jZWJNGAk2fYa26b42eVxILni1LyvwFM4Xkx8imKcOE/
         C0DQ==
X-Gm-Message-State: AOAM531BsRog9NLfW1yN0LDJ7pafKiCMVR/eHToym8akBCiN60f7a6no
        jdIGE8kAwekEb31s5dUC1aQuO53/Ik5HncG54XMWSw==
X-Google-Smtp-Source: ABdhPJw4OYNNFu6Zneq7n+svBtNk46Bb9D/X/paXlDhz48aT/quR7ndNb7X6ENvkZKqIC7RZf0qq4//EhBQYQwBeY9s=
X-Received: by 2002:a05:6870:40c1:b0:ed:9a12:3f95 with SMTP id
 l1-20020a05687040c100b000ed9a123f95mr4225578oal.193.1652318947719; Wed, 11
 May 2022 18:29:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 18:29:07 -0700
MIME-Version: 1.0
In-Reply-To: <CAA8EJpqFksVc+Lj4-G81z26GH-WbQ3CKOUwgsx0Xar-F+EMNRg@mail.gmail.com>
References: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50tgiNj6j8+90xNw2Sku7rHKOGQYrHRjHCHb8-rqnOAxg@mail.gmail.com> <CAA8EJpqFksVc+Lj4-G81z26GH-WbQ3CKOUwgsx0Xar-F+EMNRg@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 May 2022 18:29:07 -0700
Message-ID: <CAE-0n51KAdQHvpgon6-qpLXZT7X8ghZ+9bSeTji-duMOG2wYiQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: don't free the IRQ if it was not requested
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-05-11 18:01:31)
> On Thu, 12 May 2022 at 03:54, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-05-06 18:00:20)
> >
> > Does this supersede commit 01013ba9bbdd ("drm/msm/disp/dpu1: avoid
> > clearing hw interrupts if hw_intr is null during drm uninit")? I mean
> > that with this patch applied kms->irq_requested makes the check in
> > dpu_core_irq_uninstall() irrelevant because it isn't called anymore?
>
> Yes.
>

I didn't see it deleted in the second patch so is a revert going to be
sent?
