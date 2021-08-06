Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE573E2750
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 11:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244496AbhHFJeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 05:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244184AbhHFJeJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 05:34:09 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A059BC061798
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Aug 2021 02:33:54 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id l19so15824078pjz.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Aug 2021 02:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/PAHZ6izmDRAipgvMP8OVcdAgcVJx3pNuT3Zbcu+DFI=;
        b=OsKUIo1LpUmpiMGh4Bl39RX5M1zGKrqQJbxyypW2KYYN/wWz0agxdJoZKsnHxC5he2
         a283sBe3QhwBt7cVMcnTvKxmBvTgqPlRCpaHI+45XIh+FaOKMOx76zvDdNVSMRHGB4M7
         NSBhKWOzlpmRNRcq0CWOcVFFD0PWi9lWgDFJgPtPZKXmO5wAktrLDl43S8o6Udwrkej0
         +0e6xRVVWI0aEWlAztxcOYovDCKWBRsIC2PNe81Y2RTcfs488i+9+CG5FugSeT8TEnn7
         9bCzLI4cvLdATe+wZLZ7O02WbzyYnBaDwJ6EF4UF2Cqzv7JzaO8+D8dAS841/ew7/CGN
         ZOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/PAHZ6izmDRAipgvMP8OVcdAgcVJx3pNuT3Zbcu+DFI=;
        b=A+XEJzlIFpCEQPBl+xFKDSgPWK38vjyQHBxN9LHPeHJd85mRhsDVDt/1mGmk+lh7le
         5PXh2xTerkk2+y2FRAcl457T92Bwz8WmLj+trqDLz/f5J7rPzlr3yrIH3kz0imz+WSDW
         Eep02AUxOKUojVLfIhBbXuTHPaw5FpQWbSSoO9mVD/THeu3KLWAXvNSpSWyu6h9ubxAt
         ujUzBx9fLNEah3d14935jL8N42WcbLlo9TpoXO2THqvPlHdBDA8AI5eXvbKy+2OEY1QI
         GPqoes4j1kDFOpLgohwOJ6LI+cvd1hiUqJYAHCgmi48VcYV2csvkOIEmSCjI8gCBVpsP
         y8/A==
X-Gm-Message-State: AOAM531V+yoBkw+lGwrSRYIAN0qq0c2fa8S8Zp2BJHu5GUN/8Mmo2HRs
        0e11CVZCc5XrsXi6To1kZdjX7xViWbmdF4J56MrHnw==
X-Google-Smtp-Source: ABdhPJwTyPeTNNpSXzg+7KuSlYcNearqEMQlgnr3eCHw8UntIzfNxEoTUwTRJCUo98KTR9Nwseha7li8dXa2yGtn2w0=
X-Received: by 2002:a63:5d4d:: with SMTP id o13mr1071225pgm.173.1628242434149;
 Fri, 06 Aug 2021 02:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <9a6a00acc60c676f39f89a8ce2989416bed1b24d.camel@alliedtelesis.co.nz>
In-Reply-To: <9a6a00acc60c676f39f89a8ce2989416bed1b24d.camel@alliedtelesis.co.nz>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 6 Aug 2021 11:43:34 +0200
Message-ID: <CAMZdPi812vx7cjvLXpj_NnbZPOmcierQMFikVHwsUd9gYawHVw@mail.gmail.com>
Subject: Re: bus: mhi: parse_xfer_event running transfer completion callbacks
 more than once for a given buffer
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Paul Davey <Paul.Davey@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ MHI people

On Fri, 6 Aug 2021 at 06:20, Paul Davey <Paul.Davey@alliedtelesis.co.nz> wrote:
>
> Hi linux-arm-msm list,
>
> We have been using the mhi driver with a Sierra EM9191 5G modem module
> and have seen an occasional issue where the kernel would crash with
> messages showing "BUG: Bad page state" which we debugged further and
> found it was due to mhi_net_ul_callback freeing the same skb multiple
> times, further debugging tracked this down to a case where
> parse_xfer_event computed a dev_rp from the passed event's ev_tre
> which does not lie within the region of valid "in flight" transfers
> for the tre_ring.  See the patch below for how this was detected.
>
> I believe that receiving such an event results in the loop which runs
> completion events for the transfers to re-run some completion
> callbacks as it walks all the way around the ring again to reach the
> invalid dev_rp position.
>
> What could cause parse_xfer_event to receive a transfer event with a
> tre pointer which would be outside the range of in-flight transfers?
> For example receiving events where the tre pointers do not only
> increase or receive a second event of types MHI_EV_CC_OVERFLOW,
> MHI_EV_CC_EOB, or MHI_EV_CC_EOT for a previous tre.
>
> The existing mhi driver code appears to assume that transfer events
> are received strictly in order such that you can never receive a
> transfer completion event for a transfer descriptor outside the
> current set of "in flight" transfers in the tre ring (those between
> the read pointer and write pointer).
>
> Thanks,
> Paul Davey
>
> ----8<----
>
>
> From bf3e3821a90b89758a30cefed662d32a78dcb766 Mon Sep 17 00:00:00 2001
> From: Paul Davey <paul.davey@alliedtelesis.co.nz>
> Date: Fri, 6 Aug 2021 15:36:05 +1200
> Subject: [PATCH] bus: mhi: Detect invalid xfer event dev_rp
>
> Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
> ---
>  drivers/bus/mhi/core/main.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index c67fd001ded1..238689a5dfc7 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -596,6 +596,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>                 void *dev_rp;
>                 struct mhi_buf_info *buf_info;
>                 u16 xfer_len;
> +               bool rp_valid;
>
>                 if (!is_valid_ring_ptr(tre_ring, ptr)) {
>                         dev_err(&mhi_cntrl->mhi_dev->dev,
> @@ -609,6 +610,15 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>                 if (dev_rp >= (tre_ring->base + tre_ring->len))
>                         dev_rp = tre_ring->base;
>
> +               if (tre_ring->rp < tre_ring->wp)
> +                       rp_valid = (dev_rp <= tre_ring->wp && dev_rp > tre_ring->rp);
> +               else
> +                       rp_valid = !(dev_rp <= tre_ring->rp && dev_rp > tre_ring->wp);
> +
> +               WARN_ON(!rp_valid);
> +               if (!rp_valid)
> +                       goto end_process_tx_event;
> +
>                 result.dir = mhi_chan->dir;
>
>                 local_rp = tre_ring->rp;
> --
> 2.32.0
>
