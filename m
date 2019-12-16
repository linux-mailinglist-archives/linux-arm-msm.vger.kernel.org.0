Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D56120A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 16:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbfLPPsl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 10:48:41 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:38839 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728421AbfLPPsl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 10:48:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576511320; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=2imyOPRS4c7qAe7BhEksxU07+ViB5mEOLUAnvaEHfHA=; b=pf9m0soruH2Gh61+ZEq+Uf3dS2pTFfb7Z8o7SVnZxYoMg5iMwwPU655kC5K/QY0jNeUfd0l5
 rRR0vooK1Fa3DbO8SB9dcE1lJ9edYqeFdO0GZfL1a5kbBPJwXxPWjS5cM2/pGSrcL12d/8o2
 zYigo0o/qJXd6G4zzYVwRLA4jco=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7a753.7f928b4c6ca8-smtp-out-n01;
 Mon, 16 Dec 2019 15:48:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25DE2C447A5; Mon, 16 Dec 2019 15:48:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9C8AC4479D;
        Mon, 16 Dec 2019 15:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9C8AC4479D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 16 Dec 2019 08:48:30 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/msm/mdp5: Remove unneeded semicolon
Message-ID: <20191216154829.GB487@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: zhengbin <zhengbin13@huawei.com>, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
References: <1576315910-124558-1-git-send-email-zhengbin13@huawei.com>
 <1576315910-124558-3-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576315910-124558-3-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Dec 14, 2019 at 05:31:48PM +0800, zhengbin wrote:
> Fixes coccicheck warning:
> 
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:905:2-3: Unneeded semicolon
> 

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index 1f48f64..e3c4c25 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -902,7 +902,7 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
>  				major, minor);
>  		ret = -ENXIO;
>  		goto fail;
> -	};
> +	}
> 
>  	/* only after mdp5_cfg global pointer's init can we access the hw */
>  	for (i = 0; i < num_handlers; i++) {
> --
> 2.7.4
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
