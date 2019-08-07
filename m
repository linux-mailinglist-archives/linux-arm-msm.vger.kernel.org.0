Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C51EB85232
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 19:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388603AbfHGRin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 13:38:43 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:35907 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387999AbfHGRin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 13:38:43 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id F095020187;
        Wed,  7 Aug 2019 19:38:39 +0200 (CEST)
Date:   Wed, 7 Aug 2019 19:38:38 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/msm: Make DRM_MSM default to 'm'
Message-ID: <20190807173838.GB30025@ravnborg.org>
References: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8
        a=AFl41HnQPOZoGf6WJ1QA:9 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jordan.
On Wed, Aug 07, 2019 at 11:24:27AM -0600, Jordan Crouse wrote:
> Most use cases for DRM_MSM will prefer to build both DRM and MSM_DRM as
> modules but there are some cases where DRM might be built in for whatever
> reason and in those situations it is preferable to still keep MSM as a
> module by default and let the user decide if they _really_ want to build
> it in.
> 
> Additionally select QCOM_COMMAND_DB for ARCH_QCOM targets to make sure
> it doesn't get missed when we need it for a6xx tarets.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/gpu/drm/msm/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 9c37e4d..3b2334b 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -14,11 +14,12 @@ config DRM_MSM
>  	select SHMEM
>  	select TMPFS
>  	select QCOM_SCM if ARCH_QCOM
> +	select QCOM_COMMAND_DB if ARCH_QCOM
>  	select WANT_DEV_COREDUMP
>  	select SND_SOC_HDMI_CODEC if SND_SOC
>  	select SYNC_FILE
>  	select PM_OPP
> -	default y
> +	default m

As a general comment the right thing would be to drop this default.
As it is now the Kconfig says that when DRM is selected then all of the
world would then also get DRM_MSM, which only a small part of this world
you see any benefit in.
So they now have to de-select MSM.

Kconfig has:
    depends on ARCH_QCOM || SOC_IMX5 || (ARM && COMPILE_TEST)

So maybe not all of the world but all QCOM or IMX5 users. Maybe they are all
interested in MSM. Otherwise the default should rather be dropped.
If there is any good hints then the help text could anyway use some
love, and then add the info there.

The other change with QCOM_COMMAND_DB seems on the other hand to make
sense but then this is another patch.

	Sam
