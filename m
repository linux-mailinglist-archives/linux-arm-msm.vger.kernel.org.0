Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86B8956A34C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 15:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235524AbiGGNQg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 09:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235510AbiGGNQe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 09:16:34 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015B22CDFD
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 06:16:33 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id c20so327032qtw.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 06:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MqlMfZ8fQXOwxTDqrntRkHE3D7MxEI/E5lq6JAfP4jE=;
        b=WfQtu9rHhospRacVsjlUlb0LkygWfaJnaJaKYCL/TG+u0P+63HS6EvDZhohiyhLVCJ
         BTZLcvVKMf4pSGEueFQNRTjePXe0vRWOBR7lBUOdX+4Ib+h/m8zte/7AP7d/81+15MSq
         07tny2LKbipaTDVNGyfxCRcciiO56WQ7aPdpCr31REiLrLVi9zYmmnGeE3yQXEDmiwyj
         U85JSfCvACZ5RO2nQnGcA8Mn5kvQIv5MI8wtRLBxTtsLJHazAQQi1uvLwxbIVasSxZvD
         GVy0JZ2lcjCRv4gb5F0hfN3+YAZx4Uq7ZXUSkje+guR/BzCGhAI1a+ty8myJ4xvnZJ95
         4hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MqlMfZ8fQXOwxTDqrntRkHE3D7MxEI/E5lq6JAfP4jE=;
        b=RrNkOTumQod+Vb396zImBnAiergMRuy1zRsE/eaZwMJ2pB9W02Kiw+OleAFy/Fb1ig
         T1lzme5WKMlEkUehqPqjskTlZRmk3wfm2b+JlUGBjAB/wDi+BDdwUdr3N12lscSsiVaf
         zwjPXYxlB1CeAk+9MxdT3HvCwVED8L07WGBDTnqr75XKR93y8aw8urER5RtsizKoQ/BI
         V2hzfxA/kc/+pZ+zgnOnBHH6tskOOt6vBDFn3c5QDlCZrvZip9B3697cVRnDRtlE7S97
         Y0xy5J4hfOLpwN0RiTTHj1os1JXZ9VwXd2me3CubD+B5QCl2CaX7a7loClSOqWRRzG7R
         3QHw==
X-Gm-Message-State: AJIora/EyC06q3QYA7GF2SlMyV2+S5E5dpsFWnOFEY9ERayFGvNCycxp
        KH+B3dLPR0UKTsU3gPcBXsW/nwF3jkyYu6BOIw9mUA==
X-Google-Smtp-Source: AGRyM1ul3iuz5ajc9yApAncXOGwSRLVhNG/Nr3i0uRHfHk55LX9XPHmvYzBTEwB1AM2+4S/r20SQNdu1vMCLrBeKBFo=
X-Received: by 2002:a05:6214:2a84:b0:473:2958:2b02 with SMTP id
 jr4-20020a0562142a8400b0047329582b02mr3813815qvb.122.1657199791909; Thu, 07
 Jul 2022 06:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220707125848.379610-1-sunliming@kylinos.cn>
In-Reply-To: <20220707125848.379610-1-sunliming@kylinos.cn>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Jul 2022 16:16:20 +0300
Message-ID: <CAA8EJpoXaJgU_oGmkHiMjX366+eWLYDBAbaLRCJfOm9ySFb+ig@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: fix the inconsistent indenting
To:     sunliming <sunliming@kylinos.cn>
Cc:     christian.koenig@amd.com, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kelulanainsley@gmail.com, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Jul 2022 at 15:59, sunliming <sunliming@kylinos.cn> wrote:
>
> Fix the inconsistent indenting in function msm_dsi_dphy_timing_calc_v3().
>
> Fix the following smatch warnings:
>
> drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:350 msm_dsi_dphy_timing_calc_v3() warn: inconsistent indenting
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>  2                                     | 947 ++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c |   2 +-
>  2 files changed, 948 insertions(+), 1 deletion(-)
>  create mode 100644 2
>
> diff --git a/2 b/2
> new file mode 100644
> index 000000000000..56dfa2d24be1
> --- /dev/null
> +++ b/2

Please drop this part & resubmit.

> @@ -0,0 +1,947 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015, The Linux Foundation. All rights reserved.
> + */

[skipped the rest]

-- 
With best wishes
Dmitry
