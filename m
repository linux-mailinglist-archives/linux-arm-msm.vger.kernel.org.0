Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C386181E1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 17:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729673AbgCKQla (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 12:41:30 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:16909 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726314AbgCKQla (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 12:41:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583944890; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=P3nuzvX5xd3YsQYJQ9Xi+FrBp3p+TbR93WHjGeNo43Q=; b=QkztOIiijB7P8ZxeQJ5IA2mxd2DlDsLPznlt/rmHGIxcMF/qmlszLs8VEMGkeTudTocQVXKF
 yLIbFZ6pXrx6Cbu6obfOWxMe5SyfYvISmNUwd02hoO+B2hG2NkujFxq7bz+P7bSL40//pgx7
 yoVi3BZ6e3BWXvCehaUdX0jAUfk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6914b8.7effbe8584c8-smtp-out-n03;
 Wed, 11 Mar 2020 16:41:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 952DCC43636; Wed, 11 Mar 2020 16:41:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A7FEC433D2;
        Wed, 11 Mar 2020 16:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A7FEC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 11 Mar 2020 10:41:25 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: Use scnprintf() for avoiding potential buffer
 overflow
Message-ID: <20200311164125.GA12013@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20200311073410.6599-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311073410.6599-1-tiwai@suse.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 11, 2020 at 08:34:10AM +0100, Takashi Iwai wrote:
> Since snprintf() returns the would-be-output size instead of the
> actual output size, the succeeding calls may go beyond the given
> buffer limit.  Fix it by replacing with scnprintf().

How embarrassing. I'm usually the guy singing the praises of scnprintf().
Thanks for the fix.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 7fd29829b2fa..1d5c43c22269 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -673,7 +673,7 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
>  		return NULL;
>  
>  	for (i = 0; i < l; i++)
> -		buf_itr += snprintf(buf + buf_itr, buffer_size - buf_itr, "%s",
> +		buf_itr += scnprintf(buf + buf_itr, buffer_size - buf_itr, "%s",
>  				ascii85_encode(src[i], out));
>  
>  	return buf;
> -- 
> 2.16.4
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
