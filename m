Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1696B768108
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 20:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjG2Sgo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 14:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjG2Sgn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 14:36:43 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE933592
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 11:36:23 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4EB083F2A4;
        Sat, 29 Jul 2023 20:36:21 +0200 (CEST)
Date:   Sat, 29 Jul 2023 20:36:19 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: shift IRQ indices by 1
Message-ID: <poi2s3buyyxubsha2pq5sbf5x7ljegwxdqgrd2yfu4p4kweaf6@gnutzjm45zbu>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
 <20230727150455.1489575-5-dmitry.baryshkov@linaro.org>
 <dzqrazaaedomrvdr6xjawzc75zy2whp7nyfuzwsamd22bvbpzq@wdv7k3vpovgf>
 <CAA8EJpqPa8uAqQ3r929Js1b8vYfEhjvEXBNCan8faS08AtOZaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqPa8uAqQ3r929Js1b8vYfEhjvEXBNCan8faS08AtOZaw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-28 18:03:35, Dmitry Baryshkov wrote:
<snip>
> > > -     if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
> > > +     if (!irq_idx || irq_idx > intr->total_irqs) {
> > >               pr_err("invalid IRQ index: [%d]\n", irq_idx);
> >
> > Logs like this might be harder to interpret (and compare) when the
> > numbering is different.  In addition, all the IRQs in
> > /d/dri/0/debug/core_irq are shifted up by 1 making them harder to
> > compare to downstream.
> > (Which I hope to not have to do again for a while, now that my INTF TE
> >  series is finalized and merged)
> 
> I hesitated here. Maybe we should log the register and index instead
> of logging the raw index.

Sure that might help.

> As for the core_irq vs downstream, that's a good question. I don't
> like the idea of adding -1 there. Maybe I'll change that again to
> register + index.

I don't like that either.  It also isn't a given that the numbers will
always match up, as they're a software/kernel construct for bookkeeping
purposes and not a hardware index.  In other words, it only matches when
enum dpu_hw_intr_reg is in sync with downstream.  And I don't think it
still is (in the higher numbers) now that 7xxx variants have been
culled.

Preferably both downstream and upstream should have a named "interrupt
register" together with the bit index, but again it's not something
that's super critical nor used often.

- Marijn
