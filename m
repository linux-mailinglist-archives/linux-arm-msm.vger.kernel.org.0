Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9CCD146D9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 16:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgAWP60 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 10:58:26 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:14093 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727453AbgAWP60 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 10:58:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579795105; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=cyM8CFsI8eeTQsNH7DLgcGWPSRi12+w5DPdW4N60rn0=; b=ZWocr9SvZ5He/Qo+CxbYlSJe2Uj6ZkjpT33mkdG24s5ad2ETjfooY4jdzkbSjKCt1n0jgYKc
 rUKP3Dg00vRwp6Noj8NQ8hDMEVDCuXb4C6zHWnonuTQ5mpT8rzxfs3mJe1GfktNC0JTnUclV
 apNDJf0TQ6xh9A5M3ZiX9TElSyA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e29c29d.7f93f000f880-smtp-out-n02;
 Thu, 23 Jan 2020 15:58:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0DF68C433A2; Thu, 23 Jan 2020 15:58:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 43DF1C433CB;
        Thu, 23 Jan 2020 15:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 43DF1C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 23 Jan 2020 08:58:17 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm: msm: Add 618 gpu to the adreno gpu list
Message-ID: <20200123155817.GA20380@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sharat Masetty <smasetty@codeaurora.org>,
        freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1579763945-10478-1-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579763945-10478-1-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 12:49:03PM +0530, Sharat Masetty wrote:
> This patch adds Adreno 618 entry and its associated properties
> to the gpulist entries.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

I'm extremely confused - these have been in linux-next for weeks. Why are you
sending them out again?

Jordan

> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index fbbdf86..cb3a6e5 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -167,6 +167,17 @@
>  		.init = a5xx_gpu_init,
>  		.zapfw = "a540_zap.mdt",
>  	}, {
> +		.rev = ADRENO_REV(6, 1, 8, ANY_ID),
> +		.revn = 618,
> +		.name = "A618",
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a630_sqe.fw",
> +			[ADRENO_FW_GMU] = "a630_gmu.bin",
> +		},
> +		.gmem = SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +	}, {
>  		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
>  		.revn = 630,
>  		.name = "A630",
> -- 
> 1.9.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
