Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7FAF120A12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 16:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbfLPPs5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 10:48:57 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:38839 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728475AbfLPPs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 10:48:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576511336; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=D61wg0YKs0GJoXGtAmt02CkXp7OUcIuxpmefn8nqekE=; b=l1/8ZsT0aUrywyTH3EH79WxqpSzxgBFryTO0lXsLzkWcQ3AxF6szBVJb/ijoi8gG+ITM5Wzj
 7ESHUfwvUbtK8tnd2d+/RA++/QWLPfj09u9Q67EBO7jp2wxcR1lIif2tuCedtfEH7eSg/Trs
 GSdQp7R7/nP0YIOUp7HVZn58rwU=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7a765.7fd173c78730-smtp-out-n02;
 Mon, 16 Dec 2019 15:48:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CAC67C433CB; Mon, 16 Dec 2019 15:48:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6BC29C4479D;
        Mon, 16 Dec 2019 15:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6BC29C4479D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 16 Dec 2019 08:48:48 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/msm/dpu: Remove unneeded semicolon in dpu_plane.c
Message-ID: <20191216154848.GC487@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: zhengbin <zhengbin13@huawei.com>, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
References: <1576315910-124558-1-git-send-email-zhengbin13@huawei.com>
 <1576315910-124558-4-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576315910-124558-4-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Dec 14, 2019 at 05:31:49PM +0800, zhengbin wrote:
> Fixes coccicheck warning:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:741:2-3: Unneeded semicolon
> 

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 58d5acb..8d4fdc3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -738,7 +738,7 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
>  	} else {
>  		pstate[R0]->multirect_index = DPU_SSPP_RECT_0;
>  		pstate[R1]->multirect_index = DPU_SSPP_RECT_1;
> -	};
> +	}
> 
>  	DPU_DEBUG_PLANE(dpu_plane[R0], "R0: %d - %d\n",
>  		pstate[R0]->multirect_mode, pstate[R0]->multirect_index);
> --
> 2.7.4
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
