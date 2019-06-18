Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B05524AC05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 22:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730350AbfFRUo1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 16:44:27 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35571 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730341AbfFRUo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 16:44:27 -0400
Received: by mail-io1-f68.google.com with SMTP id m24so33115706ioo.2;
        Tue, 18 Jun 2019 13:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a72KOM/txntfmB99IxHWW0QKe5DAoHdDFqzs/tLeZAU=;
        b=GxA/N9uny+NZFEUb7AtULKqb8Ajxz7iTbt3Ei3hBq0QRSOsoa7MU9rulCbQ0m8EReR
         dE2Lia0ULFg65uPitn7uvoXu3kv2jNZj37vxH9z7Wy2VppPKwYNLOvC5HC4f15t0hkIr
         GgQwJUFn7jX5RDOfFmOLENjcrrN1jwtmyxXNyIRqDDCY0VY0wQnNLQYm8Iy0Y/ZljoJE
         LuVEsXfIZyHANdv1Nu5XFr/iprpqTLNwf0ncamYOJIj7l7jiGRLie6cyk8k08J1v7DPj
         1ae3KpyY0HvRyGdIL3DXert/tCJbNpMQd5lYjgI8AgW9fklGrvJqFu6/5C58kfdJu+zS
         7agQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a72KOM/txntfmB99IxHWW0QKe5DAoHdDFqzs/tLeZAU=;
        b=iIaZMAKJAQHBtUl3iSp6e/CgubUrswRObZ/OYj6mRvm19R2/ICU7cNpOkeYXVJuvdh
         dTNiPyor6hoG/BBUkwpiFkqdBQjmfR/zy8IM72/iQeyrsuQl+yYqm49BGgkFBLx01uMX
         Gumcab/0KaRT1iqkG+jAah1IndVr4BE6K0vuE0S4jxA4vAav5rEARHj2PndG3qugaijR
         kuY/n0T8nk9E2mOVbgrYVAJEWrNa7270cWfhrsl4oOVoO/JP9lKFG4KDpTetnuc1YBlx
         ///wYopLqEkxlVIhlpkz9IsEuhkWueU6+F7uU+4sxhOgJXhgbwgSrITWk4h/dvWjyIQc
         n1YQ==
X-Gm-Message-State: APjAAAXs/OGEoD1sDoGJU9CrQOO1x0fuPG30fGjcSg8t2oNbexuiZUpZ
        COGb7aS9SOBQlsQts7LM2+fMsmeiPm9n3GWWaTA=
X-Google-Smtp-Source: APXvYqxbySU81wsAKNVUl0cXCPZBOmJuLDgdov2SODjSSaCWp2BuHkbnaOEoYGJRizW6ZpyupRoe52WDZcTefI/O2N8=
X-Received: by 2002:a02:b10b:: with SMTP id r11mr5142549jah.140.1560890666538;
 Tue, 18 Jun 2019 13:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190618202425.15259-1-robdclark@gmail.com> <20190618202425.15259-6-robdclark@gmail.com>
In-Reply-To: <20190618202425.15259-6-robdclark@gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 18 Jun 2019 14:44:16 -0600
Message-ID: <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 18, 2019 at 2:25 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Georgi Djakov <georgi.djakov@linaro.org>
>
> The interconnect API provides an interface for consumer drivers to
> express their bandwidth needs in the SoC. This data is aggregated
> and the on-chip interconnect hardware is configured to the most
> appropriate power/performance profile.
>
> Use the API to configure the interconnects and request bandwidth
> between DDR and the display hardware (MDP port(s) and rotator
> downscaler).
>
> v2: update the path names to be consistent with dpu, handle the NULL
>     path case, updated commit msg from Georgi.
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 97179bec8902..eeac429acf40 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -16,6 +16,7 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#include <linux/interconnect.h>
>  #include <linux/of_irq.h>
>
>  #include "msm_drv.h"
> @@ -1050,6 +1051,19 @@ static const struct component_ops mdp5_ops = {
>
>  static int mdp5_dev_probe(struct platform_device *pdev)
>  {
> +       struct icc_path *path0 = of_icc_get(&pdev->dev, "mdp0-mem");
> +       struct icc_path *path1 = of_icc_get(&pdev->dev, "mdp1-mem");
> +       struct icc_path *path_rot = of_icc_get(&pdev->dev, "rotator-mem");
> +
> +       if (IS_ERR_OR_NULL(path0))
> +               return PTR_ERR_OR_ZERO(path0);

Umm, am I misunderstanding something?  It seems like of_icc_get()
returns NULL if the property doesn't exist.  Won't this be backwards
incompatible?  Existing DTs won't specify the property, and I don't
believe the property is supported on all targets.  Seems like we'll
break things by not calling the below component_add() if the
interconnect is not supported, specified, or the interconnect driver
is not compiled.

> +       icc_set_bw(path0, 0, MBps_to_icc(6400));
> +
> +       if (!IS_ERR_OR_NULL(path1))
> +               icc_set_bw(path1, 0, MBps_to_icc(6400));
> +       if (!IS_ERR_OR_NULL(path_rot))
> +               icc_set_bw(path_rot, 0, MBps_to_icc(6400));
> +
>         DBG("");
>         return component_add(&pdev->dev, &mdp5_ops);
>  }
> --
> 2.20.1
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
