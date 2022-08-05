Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADBC258AB71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 15:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237246AbiHENPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 09:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiHENPJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 09:15:09 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D66140E2
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 06:15:08 -0700 (PDT)
Date:   Fri, 05 Aug 2022 13:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1659705304; x=1659964504;
        bh=ziI5V+sIub4XwCkMXnfzTYqZ1lrMICCCmyYVkMbZJ64=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
         Feedback-ID:Message-ID;
        b=FAZEeCddvGry0RRerFlnxxBc2UyoIGfr56LjriN9eMRNygtTSGxPO5QnIMOx8wl2c
         dSFITvunQak+jqDJcqx+gBEVw3veJnduFGbwnGO7VKOptySadtuBGlSvYoPz5d3vIN
         7EFYfH7F5Too/d1gcX303LiTtQdM2UowKc9+77PD5j87JLHDZqZ/H100t9j2I/lzLF
         OawfSicHFQVlV7kT5YgXOLCTrSmDc02SczVQhJiNTf3icSkrEwWkKfERjzJ4vy1uly
         7zTPOwF6x4G1rDEYgV60ougjBlhww1H+wx99rKV5NtvBRAst7eAaVSP5ZSxkN51rvO
         8PU4QrvmxCIhA==
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [RFC PATCH] drm/msm: lookup the ICC paths in both mdp5/dpu and mdss devices
Message-ID: <jqNAyNB27XoGsxddwc_bag0mjFI1qbGMGS7BtyDbd8ZK15RKmQNvVgJYUzcEc_U-h_Ei0mKju27yZJ5qI1xDxPbGvpcLkxX9aG_tmbxxzBI=@protonmail.com>
In-Reply-To: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
Feedback-ID: 6882736:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Friday, August 5th, 2022 at 12:56 PM, Dmitry Baryshkov <dmitry.baryshkov=
@linaro.org> wrote:

> The commit 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master
> components") changed the MDP5 driver to look for the interconnect paths
> in the MDSS device rather than in the MDP5 device itself. This was left
> unnoticed since on my testing devices the interconnects probably didn't
> reach the sync state.
>
> Rather than just using the MDP5 device for ICC path lookups for the MDP5
> devices, introduce an additional helper to check both MDP5/DPU and MDSS
> nodes. This will be helpful for the MDP5->DPU conversion, since the
>
> driver will have to check both nodes.
>
> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
> Reported-by: Marijn Suijten marijn.suijten@somainline.org
>
> Reported-by: Yassine Oudjana y.oudjana@protonmail.com
>
> Signed-off-by: Dmitry Baryshkov dmitry.baryshkov@linaro.org
>
> ---
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 7 ++-----
> drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 9 +++------
> drivers/gpu/drm/msm/msm_drv.h | 2 ++
> drivers/gpu/drm/msm/msm_io_utils.c | 22 ++++++++++++++++++++++
> 4 files changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/ms=
m/disp/dpu1/dpu_kms.c
> index e23e2552e802..9eff6c2b1917 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -383,12 +383,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dp=
u_kms *dpu_kms)
> struct icc_path *path1;
> struct drm_device *dev =3D dpu_kms->dev;
>
> struct device *dpu_dev =3D dev->dev;
>
> - struct device *mdss_dev =3D dpu_dev->parent;
>
>
> - /* Interconnects are a part of MDSS device tree binding, not the
> - * MDP/DPU device. */
> - path0 =3D of_icc_get(mdss_dev, "mdp0-mem");
> - path1 =3D of_icc_get(mdss_dev, "mdp1-mem");
> + path0 =3D msm_icc_get(dpu_dev, "mdp0-mem");
> + path1 =3D msm_icc_get(dpu_dev, "mdp1-mem");
>
> if (IS_ERR_OR_NULL(path0))
> return PTR_ERR_OR_ZERO(path0);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/m=
sm/disp/mdp5/mdp5_kms.c
> index 3d5621a68f85..b0c372fef5d5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -921,12 +921,9 @@ static int mdp5_init(struct platform_device *pdev, s=
truct drm_device *dev)
>
> static int mdp5_setup_interconnect(struct platform_device pdev)
> {
> - / Interconnects are a part of MDSS device tree binding, not the
> - * MDP5 device. */
> - struct device *mdss_dev =3D pdev->dev.parent;
>
> - struct icc_path *path0 =3D of_icc_get(mdss_dev, "mdp0-mem");
> - struct icc_path *path1 =3D of_icc_get(mdss_dev, "mdp1-mem");
> - struct icc_path *path_rot =3D of_icc_get(mdss_dev, "rotator-mem");
> + struct icc_path *path0 =3D msm_icc_get(&pdev->dev, "mdp0-mem");
>
> + struct icc_path *path1 =3D msm_icc_get(&pdev->dev, "mdp1-mem");
>
> + struct icc_path *path_rot =3D msm_icc_get(&pdev->dev, "rotator-mem");
>
>
> if (IS_ERR(path0))
> return PTR_ERR(path0);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.=
h
> index 08388d742d65..d38510f6dbf5 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -441,6 +441,8 @@ void __iomem *msm_ioremap_size(struct platform_device=
 *pdev, const char *name,
> phys_addr_t *size);
> void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char =
*name);
>
> +struct icc_path *msm_icc_get(struct device *dev, const char *name);
> +
> #define msm_writel(data, addr) writel((data), (addr))
> #define msm_readl(addr) readl((addr))
>
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm=
_io_utils.c
> index 7b504617833a..d02cd29ce829 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -5,6 +5,8 @@
> * Author: Rob Clark robdclark@gmail.com
>
> */
>
> +#include <linux/interconnect.h>
>
> +
> #include "msm_drv.h"
>
> /*
> @@ -124,3 +126,23 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *=
work,
> work->worker =3D worker;
>
> kthread_init_work(&work->work, fn);
>
> }
> +
> +struct icc_path *msm_icc_get(struct device *dev, const char *name)
> +{
> + struct device *mdss_dev =3D dev->parent;
>
> + struct icc_path path;
> +
> + path =3D of_icc_get(dev, name);
> + if (path)
> + return path;
> +
> + /
> + * If there are no interconnects attached to the corresponding device
> + * node, of_icc_get() will return NULL.
> + *
> + * If the MDP5/DPU device node doesn't have interconnects, lookup the
> + * path in the parent (MDSS) device.
> + */
> + return of_icc_get(mdss_dev, name);
> +
> +}
> --
> 2.35.1

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com> # msm8996
