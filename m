Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C71492C174F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 22:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729905AbgKWVGy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 16:06:54 -0500
Received: from z5.mailgun.us ([104.130.96.5]:17681 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729939AbgKWVGy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 16:06:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606165613; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=pVDvnBZoRhuxsGugrA9S3QxKjdkQCI4rMRDzzBJfqdg=;
 b=LFDUhhuXu27XoQFZ4cToLEAt4ESddCD2/0vQpOjpIQLbbxkHMH+xg5llqQMDTgWTc3+QkfP8
 +vTWflMcg/8GYbzVDZxM3H9IXoWQDSgcUdMQGM9cudOG6CjrM8xJSaS0C1wfZl1a2evyRGoj
 08GvWmluQWqo9d5oOFk2R7PCKKg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fbc246bd64ea0b7030e46cb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:06:51
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CA1ECC433ED; Mon, 23 Nov 2020 21:06:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A11C0C433C6;
        Mon, 23 Nov 2020 21:06:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 13:06:49 -0800
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 11/40] drm/msm/disp/dpu1/dpu_hw_blk: Add one
 missing and remove an extra param description
In-Reply-To: <20201123111919.233376-12-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-12-lee.jones@linaro.org>
Message-ID: <bd9e7b914116e49b60b082fe40daf78c@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c:28: warning: Function
> parameter or member 'hw_blk' not described in 'dpu_hw_blk_init'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c:120: warning: Excess
> function parameter 'free_blk' description in 'dpu_hw_blk_put'
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> index ca26666d2af91..819b26e660b9c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> @@ -19,6 +19,7 @@ static LIST_HEAD(dpu_hw_blk_list);
> 
>  /**
>   * dpu_hw_blk_init - initialize hw block object
> + * @hw_blk: pointer to hw block object
>   * @type: hw block type - enum dpu_hw_blk_type
>   * @id: instance id of the hw block
>   * @ops: Pointer to block operations
> @@ -114,7 +115,6 @@ struct dpu_hw_blk *dpu_hw_blk_get(struct
> dpu_hw_blk *hw_blk, u32 type, int id)
>  /**
>   * dpu_hw_blk_put - put hw_blk to free pool if decremented refcount is 
> zero
>   * @hw_blk: hw block to be freed
> - * @free_blk: function to be called when reference count goes to zero
>   */
>  void dpu_hw_blk_put(struct dpu_hw_blk *hw_blk)
>  {
