Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E858D57424
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 00:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfFZWP2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jun 2019 18:15:28 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43581 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfFZWP2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jun 2019 18:15:28 -0400
Received: by mail-ed1-f67.google.com with SMTP id e3so5102496edr.10;
        Wed, 26 Jun 2019 15:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zemuVaUHq/tphy/ciHMFp8B8qf7n17M0tqs1U3HVNUA=;
        b=sIVip1emTJrjRVlVLKWWy33DQoZHWO0Z0I5dKDSqgG/SwETQ9Ws6VsRSdabsaQGnhX
         Q52J6WKzpJJFXGXKwr3GuEDddItg/HvA2IlPK6IS040GCjSI0SW6BsVLGxS6covCYPXM
         5stA83oCS9bCo/sW3a0WZHEWeUEprE15RtoozRxI4cI0l8d/88/pNOFyzbvP6LfJv9BM
         uTvG9LHhSCN0uk+hkvvchyHcBLD5o+Kmrz2LYjxeDq/b9V//TC1y0j5Y2Cl0uUUI9+/r
         0717wBPzuTTuE0V8QNndRrsU8l51qCw9KNpyjvIpd3KUNjogWab6G2z5Me6n2wyHT4Zb
         C0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zemuVaUHq/tphy/ciHMFp8B8qf7n17M0tqs1U3HVNUA=;
        b=qcePR+JInBhxcXzeC28rcvWD7xXPY0bacTm8TZhaXGAnBKZoqa4GzgC9uMWlS/XhUf
         6Bp5lhGSvGOapAoBvEtpCRbQ4lxhuCKqseD95oI4jU0nOpIOvarmBPW3NfRoKh3BZQ8p
         0kf5k+ZNapoqFO+LYN8Xw0qmYA2HgSw4AfuQLjGpcilsHqxsp12FXCTjwb6xpHOx4VTw
         Ej3kXxXux310RBsEbbkVHrWDqWa1sow23T7gDuGavbqrm/UCE2X3fSBJPo7zaoMoJWeW
         9P42voFaJwdgO7LOttCfz4sWtZeGKIBc4tiHIGp5Bysl2L/5YnOr0kr1K8v1yNd2Be2P
         ZSeA==
X-Gm-Message-State: APjAAAV25ez9mUmLqn2tPYcN1nHud2HR7CfO6AafdmIgmiQ802TrNJ1K
        YOzN5fN2zHgjE1HhIc5M7dxsy6vjt7+vGvbXbzs=
X-Google-Smtp-Source: APXvYqyGfVsc/dMcR6jO79hcglfAjrPcJGKF1Z+B55tLE12kxP2ei5HxKdhsi5lm9yFS9jAZA8HHVNLKKZ89hvzj/Ow=
X-Received: by 2002:a17:906:3612:: with SMTP id q18mr98024ejb.278.1561587325940;
 Wed, 26 Jun 2019 15:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190626180015.45242-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190626180015.45242-1-jeffrey.l.hugo@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 26 Jun 2019 15:15:10 -0700
Message-ID: <CAF6AEGuLVQfwtDOr=fGEpKR9+QdYecrvm-aaJr1ahPRyu=qd6g@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: Fix add_gpu_components
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 26, 2019 at 11:00 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> add_gpu_components() adds found GPU nodes from the DT to the match list,
> regardless of the status of the nodes.  This is a problem, because if the
> nodes are disabled, they should not be on the match list because they will
> not be matched.  This prevents display from initing if a GPU node is
> defined, but it's status is disabled.
>
> Fix this by checking the node's status before adding it to the match list.

hmm, I guess a case I had certainly never tested ;-)

I wonder if it really makes sense for gpu to ever be disabled (since
it isn't depending on external non-SoC-specific wiring up of things..
but I guess that might still be useful for bring-up.. either way,

Reviewed-by: Rob Clark <robdclark@gmail.com>

Sean, want to pick this up in drm-misc-fixes?

BR,
-R

>
> Fixes: dc3ea265b856 ("drm/msm: Drop the gpu binding")
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index ab64ab470de7..4aeb84f1d874 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1279,7 +1279,8 @@ static int add_gpu_components(struct device *dev,
>         if (!np)
>                 return 0;
>
> -       drm_of_component_match_add(dev, matchptr, compare_of, np);
> +       if (of_device_is_available(np))
> +               drm_of_component_match_add(dev, matchptr, compare_of, np);
>
>         of_node_put(np);
>
> --
> 2.17.1
>
