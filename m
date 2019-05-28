Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 333612D077
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2019 22:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfE1UeM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 16:34:12 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35780 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfE1UeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 16:34:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6934B60DA8; Tue, 28 May 2019 20:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559075651;
        bh=3YYY/oSIJpE2sZL0TyIV1fARWnMKNlUOZvG75F73+Pc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E8zUtIegH/04Px9n7K9hJ0HNzItPzXZ+f06a3FgUZ8CKWjXmeDzYh7kQGfjgKJDhg
         AUXcJ9LXvq3YZhijNe4phflctA2qyLC4kTSOJcqbKxS5DjtvnZ2tHkF2VCagUnOhIY
         XR7sHjHua0q8JFdyzq2lMQTb89mcuWbabBFWv3fA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 391A360A24;
        Tue, 28 May 2019 20:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559075651;
        bh=3YYY/oSIJpE2sZL0TyIV1fARWnMKNlUOZvG75F73+Pc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E8zUtIegH/04Px9n7K9hJ0HNzItPzXZ+f06a3FgUZ8CKWjXmeDzYh7kQGfjgKJDhg
         AUXcJ9LXvq3YZhijNe4phflctA2qyLC4kTSOJcqbKxS5DjtvnZ2tHkF2VCagUnOhIY
         XR7sHjHua0q8JFdyzq2lMQTb89mcuWbabBFWv3fA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 391A360A24
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 28 May 2019 14:34:08 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Remove bogus comment
Message-ID: <20190528203408.GB23227@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org
References: <20190528154125.GA23227@jcrouse1-lnx.qualcomm.com>
 <20190528182657.246714-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528182657.246714-1-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 28, 2019 at 02:26:45PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This comment doesn't make any sense, remove it.
> 
> Suggested-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 885bf88afa3e..50d0e9ba5d2f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -243,7 +243,6 @@ static int _dpu_debugfs_init(struct dpu_kms *dpu_kms)
>  	if (IS_ERR_OR_NULL(entry))
>  		return -ENODEV;
>  
> -	/* allow root to be NULL */
>  	debugfs_create_x32(DPU_DEBUGFS_HWMASKNAME, 0600, entry, p);
>  
>  	dpu_debugfs_danger_init(dpu_kms, entry);
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
