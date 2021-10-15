Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B49242FCEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 22:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234408AbhJOUVO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 16:21:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:22940 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238554AbhJOUVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 16:21:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634329147; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ztFtYLAon4S9+RSVFvUiWbeqZf6yDNUuttsNFdoZDqs=;
 b=lYJ6cdzq2gSsBm2+1UUYsiu/aAJatd+5Kx9MNGeUbunMXrDkpAnzCuWj7eH1ZiGAhYHCAmE/
 33SQ+fb3KMDdk/ABXjgpJ2vd8/OJggMpCCa08YvxywJiJ5Yn7j6g6VtzxbHyiCTMHe+E3J3D
 i0Hka6fkGLn2vjQUwbCl8TES3w0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6169e225f3e5b80f1f39f90e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Oct 2021 20:18:44
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D3F2EC43618; Fri, 15 Oct 2021 20:18:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E1AC8C4338F;
        Fri, 15 Oct 2021 20:18:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 Oct 2021 13:18:43 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 0/3] drm/msm: drop old eDP support
In-Reply-To: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
References: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
Message-ID: <8590f18041e51860e5fc0c3a749beb26@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

No concerns from our side to drop this.

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org> for the series.

Thanks

Abhinav

On 2021-10-01 09:50, Dmitry Baryshkov wrote:
> MSM DRM driver has support for eDP block present on MSM 8x74/8x84 SoC
> families. However since addition back in 2015 this driver received only
> generic fixes. No actual devices with these SoCs supported upstream (or
> by the community) seem to support eDP panels. Judging from downstream
> kernels the eDP was present only on MSM8974 LIQUID or on APQ8084 CDP.
> Remove this driver.
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (3):
>       drm/msm/mdp5: drop eDP support
>       drm/msm/edp: drop old eDP support
>       dt-bindings: display/msm: remove edp.txt
> 
>  .../devicetree/bindings/display/msm/edp.txt        |   56 -
>  drivers/gpu/drm/msm/Makefile                       |    6 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   17 +-
>  drivers/gpu/drm/msm/edp/edp.c                      |  198 ---
>  drivers/gpu/drm/msm/edp/edp.h                      |   77 --
>  drivers/gpu/drm/msm/edp/edp.xml.h                  |  388 ------
>  drivers/gpu/drm/msm/edp/edp_aux.c                  |  265 ----
>  drivers/gpu/drm/msm/edp/edp_bridge.c               |  111 --
>  drivers/gpu/drm/msm/edp/edp_connector.c            |  132 --
>  drivers/gpu/drm/msm/edp/edp_ctrl.c                 | 1375 
> --------------------
>  drivers/gpu/drm/msm/edp/edp_phy.c                  |   98 --
>  drivers/gpu/drm/msm/msm_drv.c                      |    2 -
>  drivers/gpu/drm/msm/msm_drv.h                      |   12 -
>  13 files changed, 1 insertion(+), 2736 deletions(-)
>  delete mode 100644 
> Documentation/devicetree/bindings/display/msm/edp.txt
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c
