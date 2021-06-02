Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E0F3991C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 19:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhFBRgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 13:36:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45845 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230389AbhFBRf5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 13:35:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622655254; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=QE3wn3ZMtzTvI5TXNGRhJwPX/5BjO8Hpo3zddXF8OVs=; b=qiboUnn74YApsF6HC1Lp95DAR3o1RCwRKkfhara2XXBDSbZgXtvAS7UKGmx61pYrNgE2mBO0
 nl7XVyG3VSYRrS5BAJdfOnj2W//tXBEx5aCq1xJcWrDvm9MEe5XpLGOgek4NdNdClaMTZFXh
 tESKkSLNVpPfjCKel8uP8JmNaMs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60b7c107e27c0cc77f6f0cdb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 17:33:59
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F97BC433F1; Wed,  2 Jun 2021 17:33:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C088CC433D3;
        Wed,  2 Jun 2021 17:33:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 02 Jun 2021 10:33:56 -0700
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [Freedreno] [RESEND 14/26] drm/msm/dp/dp_link: Fix some potential
 doc-rot
Message-ID: <b668e09546c0ce86d90346f99f40853a@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-02 07:32, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/dp/dp_link.c:374: warning: expecting prototype
> for dp_parse_video_pattern_params(). Prototype was for
> dp_link_parse_video_pattern_params() instead
>  drivers/gpu/drm/msm/dp/dp_link.c:573: warning: expecting prototype
> for dp_parse_phy_test_params(). Prototype was for
> dp_link_parse_phy_test_params() instead
>  drivers/gpu/drm/msm/dp/dp_link.c:975: warning: expecting prototype
> for dp_link_process_downstream_port_status_change(). Prototype was for
> dp_link_process_ds_port_status_change() instead
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
> b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da78c4a5..1099604bd1c86 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -364,7 +364,7 @@ static int dp_link_parse_timing_params3(struct
> dp_link_private *link,
>  }
> 
>  /**
> - * dp_parse_video_pattern_params() - parses video pattern parameters 
> from DPCD
> + * dp_link_parse_video_pattern_params() - parses video pattern
> parameters from DPCD
>   * @link: Display Port Driver data
>   *
>   * Returns 0 if it successfully parses the video link pattern and the 
> link
> @@ -563,7 +563,7 @@ static int
> dp_link_parse_link_training_params(struct dp_link_private *link)
>  }
> 
>  /**
> - * dp_parse_phy_test_params() - parses the phy link parameters
> + * dp_link_parse_phy_test_params() - parses the phy link parameters
>   * @link: Display Port Driver data
>   *
>   * Parses the DPCD (Byte 0x248) for the DP PHY link pattern that is 
> being
> @@ -961,7 +961,7 @@ static int
> dp_link_process_link_status_update(struct dp_link_private *link)
>  }
> 
>  /**
> - * dp_link_process_downstream_port_status_change() - process port
> status changes
> + * dp_link_process_ds_port_status_change() - process port status 
> changes
>   * @link: Display Port Driver data
>   *
>   * This function will handle downstream port updates that are 
> initiated by
