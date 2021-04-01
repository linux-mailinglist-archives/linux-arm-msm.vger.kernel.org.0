Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2ADA351FC4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 21:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbhDAT1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 15:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbhDAT1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 15:27:41 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E07C03D20D
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 12:07:39 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id f5so2925582ilr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 12:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=9C+FFwnBAe64h+qwHiP+qtCvnvucT5ifSE8KQCnxsp8=;
        b=C9EQAWrni2VVf/IH5dUSEExom9+aSu9C68jL+QiborrKED99S8W2GaA5rmp0M7mKXc
         nYsXjh/MsONwdIzQ+O/91MoLjiXhZqVewk0ZsaEza3Ne/fMLkwXQYk0jYzXkNkRxZJKo
         SX97pVO2pvswfSNL6cn46FCl4kpajC7RIaauZYUgWb+EzC1iJ2pUq2lOZ4p/ngHGhZOM
         +4JCAISPw204JloFi+N071TkD0FrYbWMMsiNkstYaEV9YTigdbk2TlCcBmeQs0JGzox0
         q5Fmw9eRVkAtGeSmsbov0DCU+o9I7CY8npufRTiVXbatHjx0l2f971lKkafrhMnhoAUf
         2X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=9C+FFwnBAe64h+qwHiP+qtCvnvucT5ifSE8KQCnxsp8=;
        b=qzaTtaAEYdzaBskCSFewUGraG4Mb2YGFBLKfesKQw4/d1GoiaXgY2MBOK3JrU1x0Uk
         ZaIaqedNmcIOjHCjBEi2OS1OUI0u7MjgUbSU7dURfbjhTBvoUi8dwN16uytapMip8azH
         sM1OP3VEDUmajCRXbV9Z/QvLlUeggtGTsYKdyOzznRJKZIvelOC6HXLcisEeo0j6DZDX
         CxIeQUHAQjW4MfotlTLfHC9qMiV+Nr24Qn+fyW7nNgErhPL2Na/lympvJks78mGl659V
         yQmq05ydT8P+kSVwAfFUnUJtt1iQQe5gCC62TbOnTCMUhH7d8GbO6Y0snZvF5xRMmlCP
         bKbQ==
X-Gm-Message-State: AOAM5302z9xfaXSM7QEk4p9omJ/2Nl1gFTVCdAcACTe+grmA48pgVs69
        JHH7fTOKZuK3OytRuE654l3eQg==
X-Google-Smtp-Source: ABdhPJxiRs/x+5B2W/f1zPuC9GKMaBC8DgCx8seLEH3tteQmxTEfXXxXlf1ZnjyW6A5osVZNP0AGkg==
X-Received: by 2002:a92:d74c:: with SMTP id e12mr8081607ilq.13.1617304059115;
        Thu, 01 Apr 2021 12:07:39 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net. [71.237.100.236])
        by smtp.gmail.com with ESMTPSA id k6sm2972150ili.12.2021.04.01.12.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 12:07:38 -0700 (PDT)
Date:   Thu, 1 Apr 2021 13:07:36 -0600
From:   Jordan Crouse <jordan@cosmicpenguin.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: a6xx: fix version check for the A650 SQE
 microcode
Message-ID: <20210401190736.7snhq4qqe2nvbdul@cosmicpenguin.net>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        freedreno@lists.freedesktop.org
References: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 31, 2021 at 05:02:23PM +0300, Dmitry Baryshkov wrote:
> I suppose the microcode version check for a650 is incorrect. It checks
> for the version 1.95, while the firmware released have major version of 0:
> 0.91 (vulnerable), 0.99 (fixing the issue).
> 
> Lower version requirements to accept firmware 0.99.

Ugh, my ugly.  .95 is the actual version that fixed it but since .99 is what is
going into the l-f repo it is fine to use that as a baseline.

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>


> Fixes: 8490f02a3ca4 ("drm/msm: a6xx: Make sure the SQE microcode is safe")
> Cc: Akhil P Oommen <akhilpo@codeaurora.org>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index cb2df8736ca8..896b47dc9c85 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -567,17 +567,17 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>  	}  else {
>  		/*
>  		 * a650 tier targets don't need whereami but still need to be
> -		 * equal to or newer than 1.95 for other security fixes
> +		 * equal to or newer than 0.95 for other security fixes
>  		 */
>  		if (adreno_is_a650(adreno_gpu)) {
> -			if ((buf[0] & 0xfff) >= 0x195) {
> +			if ((buf[0] & 0xfff) >= 0x095) {
>  				ret = true;
>  				goto out;
>  			}
>  
>  			DRM_DEV_ERROR(&gpu->pdev->dev,
>  				"a650 SQE ucode is too old. Have version %x need at least %x\n",
> -				buf[0] & 0xfff, 0x195);
> +				buf[0] & 0xfff, 0x095);
>  		}
>  
>  		/*
> -- 
> 2.30.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
