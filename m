Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE64229DFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 19:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgGVRIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 13:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731677AbgGVRI3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 13:08:29 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC6AC0619DC
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 10:08:29 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id f16so1738054pjt.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 10:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VaLaF6yamBawSm5kIKdzTcEbjjs1t/WxcQSgHm9Kq7Y=;
        b=WHkUNeeu1Xlha2UJQ+Co9e4kZ1SOTALKH9eWds9DKQGx50y3sG6OauogygOiPW92NE
         nM5+GllcvmAfs+EUR2FptgZX2Kvgfs0fAKmSVtx1ZhQzDx9Zy3zhriJ63Cl4JqrgPyV0
         3GmMRas7mmFdhqa8CHG6gazr4HI3vlNoVeVwjHEuSG9ZVykZ/xw3uAEpOZwgun5tdjvj
         AlYFgj2emHebrm+zey6aalEHZ8MuHf4yjmyhv6BxnI4zUIB70Xj80mFDMeP2yt2ZKvK7
         9zjWWpePmZBAjXGlFMhQyHz70iTz/JIneP9+fEm8K9Vyn6dzYr+B68yb0aEAJYFX1pxb
         CB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VaLaF6yamBawSm5kIKdzTcEbjjs1t/WxcQSgHm9Kq7Y=;
        b=ksrrahQmhw4+aG40aymzzp+VrXZn5kW4JUw2KxXqmhS/Re+0/PqqZw0UF1CoVROzUs
         WL2lSo4vldvpwGL1oO5VnqcSJUw0IrLUDwqzz1Eyattx5cV6x+Q9rADRms7k9VzGzi8S
         itBGpxrEwgwHXZmvwJ8XfFtiCdMwRMn4SIR5DYOwW+zqgeWwzd+6pOxJ7DSfMZeSWPIc
         LfRqsjOGecbQQr0lC6hMSI0zva0CPwp+lNU24EEYRFxzJHgG/VoUF5+qL9DQpRnUvAQR
         Bij5sBi7QlV9jqHkl2sJzvSrbjJpEnKX7j2qeeahgsRgn+dGkD9pr8dEZTFEe2vWlGJw
         JLeg==
X-Gm-Message-State: AOAM531zBxFm919idKOmVLF36oWNCVCakzIj5HxEBDLU4l6ffCnUz5kq
        0JG7nkKGExc944wMwB7FN5ePyAdFrRySroFtqfZphw==
X-Google-Smtp-Source: ABdhPJzKYQ6DmTiW/2UpPTlu6aqslRhBhWcjTOPR2Y/sZJ6l7sf695aW7sWrvk5too3R6PH4NWNrIZcS2i/48uFJeGw=
X-Received: by 2002:a17:90a:784b:: with SMTP id y11mr363849pjl.51.1595437708705;
 Wed, 22 Jul 2020 10:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200722110139.24778-1-georgi.djakov@linaro.org> <20200722110139.24778-2-georgi.djakov@linaro.org>
In-Reply-To: <20200722110139.24778-2-georgi.djakov@linaro.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 22 Jul 2020 10:07:52 -0700
Message-ID: <CAGETcx-QM8P2nVxcQJZz+m5Zwi==2qLfinb0FkDXJ7dNVP5bEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] interconnect: Add sync state support
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        Mike Tipton <mdtipton@codeaurora.org>, okukatla@codeaurora.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 22, 2020 at 4:01 AM Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> The bootloaders often do some initial configuration of the interconnects
> in the system and we want to keep this configuration until all consumers
> have probed and expressed their bandwidth needs. This is because we don't
> want to change the configuration by starting to disable unused paths until
> every user had a chance to request the amount of bandwidth it needs.
>
> To accomplish this we will implement an interconnect specific sync_state
> callback which will synchronize (aggregate and set) the current bandwidth
> settings when all consumers have been probed.
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  drivers/interconnect/core.c           | 61 +++++++++++++++++++++++++++
>  include/linux/interconnect-provider.h |  5 +++
>  2 files changed, 66 insertions(+)
>
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index e5f998744501..0c4e38d9f1fa 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -26,6 +26,8 @@
>
>  static DEFINE_IDR(icc_idr);
>  static LIST_HEAD(icc_providers);
> +static int providers_count;
> +static bool synced_state;
>  static DEFINE_MUTEX(icc_lock);
>  static struct dentry *icc_debugfs_dir;
>
> @@ -255,6 +257,12 @@ static int aggregate_requests(struct icc_node *node)
>                         continue;
>                 p->aggregate(node, r->tag, r->avg_bw, r->peak_bw,
>                              &node->avg_bw, &node->peak_bw);
> +
> +               /* during boot use the initial bandwidth as a floor value */
> +               if (!synced_state) {
> +                       node->avg_bw = max(node->avg_bw, node->init_avg);
> +                       node->peak_bw = max(node->peak_bw, node->init_peak);
> +               }

Sorry I didn't reply earlier.

I liked your previous approach with the get_bw ops. The v2 approach
forces every interconnect provider driver to set up these values even
if they are okay with just maxing out the bandwidth. Also, if they can
actually query their hardware, this adds additional steps for them.

I think the default should be:
1. Query the current bandwidth at boot and use that.
2. If that's not available, max out the bandwidth.

The interconnect providers that don't like maxing out and don't have
real get_bw() capability can just cache and return the last set_bw()
values. And they start off with those cached values matching whatever
init_bw they need.

That way, the default case (can get bw or don't care about maxing out)
would be easy and the extra work would be limited to drivers that want
neither.

-Saravana
