Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80A2D18D40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 17:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfEIPof (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 11:44:35 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:36237 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfEIPof (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 11:44:35 -0400
Received: by mail-vs1-f67.google.com with SMTP id c76so1720257vsd.3;
        Thu, 09 May 2019 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RcBYHFb2VRl+G/ml3PE5KyX4Y2ArNtemhuBC2yVI+N8=;
        b=RW/mabvtJSrLmVv7PlmehAyIlrBPBIydXThWjcE6PW3sRVyZXnekJeThvK/zKSbX43
         MTX+2eTp3PTZM07EToj4KsL8E+ZEOyKoK5W70/JSULDmSC8bbGKorllbGLWQptjDXBKt
         OtDrJGML3ikOjypowx+vxxAaTMKbTuhZhu/zHn0ncY/fexcF4tI3YVqqDXQxCXXIRROu
         g0lDSIhtYmC9eI5B+5tKysq1Y+RwPNRvPVS+U+wFoo4k0uSNoJJ9jUOfTTl+0ncSICU+
         vPwyLpExPqKtxs8eOczTPdOMGMxg94LVG9J8iYjL0UUJTayOrgIa3xMtRpn5rfcYCFrB
         2Qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RcBYHFb2VRl+G/ml3PE5KyX4Y2ArNtemhuBC2yVI+N8=;
        b=SL+aDs26JKZGgu2FBQEXrnqAJi/AqeIDC23fii2LmAmGh/eJbVTLU/qmXcAVEYbofF
         MEYm/KKtDBJtRPS+RcqJo2hrIx/yCqpy23A0A0lKAWZ1UpupcN3kAN9Z4oYv4ef/gDDb
         cF847tUCD0bSe6sxgcsbAmUvpl5Rgk3AwJcGx2j5LUgoB3j5OxSojOCXrweqVZXUSNEu
         aQ4M76OsCrmxiXdzJE2QW/05Gp6Vw7nFtAQEgQF/JwVilVukSRZePmg2HhrlmJIjC8g5
         StENGzbwOzEotlNxT0v1bdJ3mro/yZ/3mdch+kQqRDDTAS1UTlQ20gvpuHWgIKu2Q0sL
         r0xQ==
X-Gm-Message-State: APjAAAVd3YSA2O2UhloxA0frUuqAkRYsexmJDu2Ejtgf6+9R7FBGIyyL
        2pj3ZCclXZp5kKuLc5TKgrTtojQFf5ZBqd7zGOk=
X-Google-Smtp-Source: APXvYqyIfckGvSZPt6GVquhDgP/SJhQm82pPsCtjomPTm9avhaGajfjptH9iuJX9amyLt9fy4EOTmVkwFbBf+wDb/jw=
X-Received: by 2002:a67:f554:: with SMTP id z20mr2829383vsn.143.1557416673764;
 Thu, 09 May 2019 08:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org> <1557256691-25798-3-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1557256691-25798-3-git-send-email-jcrouse@codeaurora.org>
From:   =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date:   Thu, 9 May 2019 08:44:22 -0700
Message-ID: <CAOeoa-dcVkFRHztX6NxPPJ6=By55sgM=q3qOEjNKfP2wrsq2tA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu: Avoid a null de-ref while
 recovering from kms init fail
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bruce Wang <bzwang@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 7, 2019 at 12:18 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> In the failure path for dpu_kms_init() it is possible to get to the MMU
> destroy function with uninitialized MMU structs. Check for NULl and skip

s/NULl/NULL

> if needed.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> ---
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 885bf88..1beaf29 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -56,7 +56,7 @@ static const char * const iommu_ports[] = {
>  #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
>
>  static int dpu_kms_hw_init(struct msm_kms *kms);
> -static int _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
> +static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
>
>  static unsigned long dpu_iomap_size(struct platform_device *pdev,
>                                     const char *name)
> @@ -725,17 +725,20 @@ static const struct msm_kms_funcs kms_funcs = {
>  #endif
>  };
>
> -static int _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
> +static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
>  {
>         struct msm_mmu *mmu;
>
> +       if (!dpu_kms->base.aspace)
> +               return;
> +
>         mmu = dpu_kms->base.aspace->mmu;
>
>         mmu->funcs->detach(mmu, (const char **)iommu_ports,
>                         ARRAY_SIZE(iommu_ports));
>         msm_gem_address_space_put(dpu_kms->base.aspace);
>
> -       return 0;
> +       dpu_kms->base.aspace = NULL;
>  }
>
>  static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
> --
> 2.7.4
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
