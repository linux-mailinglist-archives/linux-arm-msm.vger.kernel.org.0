Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854D435739A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 19:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234321AbhDGRwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 13:52:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:56641 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229841AbhDGRwj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 13:52:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617817949; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Uf0AVv8aqmiXb0YftRz/h5+MlBMvFR0+UaFhKIo1nCw=;
 b=qVqRzvmaQKR1Arg5AVnnI1HyPblG1NyvleMG4gFeYMggVV524EWYX9ErDUYvQ9ZKth+J9UlG
 CffWHKF4QvOLT5o2Msgua3znaJgBdd283Kp379Vv1/TRsnJavmzdZQTg3EW36sq3IbldwbMF
 NU34ytwncrMFrwmKU8X9GZt8IzE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 606df152f34440a9d459978c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 17:52:18
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 298A8C43466; Wed,  7 Apr 2021 17:52:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 130AAC433ED;
        Wed,  7 Apr 2021 17:52:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 07 Apr 2021 10:52:17 -0700
From:   abhinavk@codeaurora.org
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: [Freedreno] [PATCH 1/1] drm/msm/dpu: remove unused local variable
 'cmd_enc'
In-Reply-To: <20210407083334.2762-1-thunder.leizhen@huawei.com>
References: <20210407083334.2762-1-thunder.leizhen@huawei.com>
Message-ID: <fb7d8e6daf9586c4aff0606bdcd1e32d@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-07 01:33, Zhen Lei wrote:
> Fixes the following W=1 kernel build warning:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function
> ‘dpu_encoder_phys_cmd_wait_for_commit_done’:
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:688:31: warning:
> variable ‘cmd_enc’ set but not used [-Wunused-but-set-variable]
> 
> Fixes: fe286893ed34 ("drm/msm/dpu: Remove unused call in 
> wait_for_commit_done")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index b2be39b9144e449..088900841bf8baa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -685,10 +685,6 @@ static int 
> dpu_encoder_phys_cmd_wait_for_tx_complete(
>  static int dpu_encoder_phys_cmd_wait_for_commit_done(
>  		struct dpu_encoder_phys *phys_enc)
>  {
> -	struct dpu_encoder_phys_cmd *cmd_enc;
> -
> -	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
> -
>  	/* only required for master controller */
>  	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>  		return 0;
