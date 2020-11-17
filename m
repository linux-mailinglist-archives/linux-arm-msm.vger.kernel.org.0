Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C727F2B6F61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 20:53:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730527AbgKQTw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 14:52:56 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:19339 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729022AbgKQTwz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 14:52:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605642775; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hnQE3V/VgsKShe0gpDn4RBB+Bf9jSoeX13bACRrVaWE=;
 b=QsXPHKJvy6bf3nRvpi+WVYtyQAPqZ/ehM/a4eQgGGoZIcQJV1197NN0aD9YdN9ejcNdTckV0
 rNKdLiM1OGNNA9Agv3Z2pSgsqI9NAtUbjfViE0O2m92GM9Xy25CRtgeU9Z1grQsaJp3o+vxb
 SdekwFrDdnjNbr67LSRL13Wotg4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fb42a17d6e6336a4e1e4f01 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Nov 2020 19:52:55
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 06648C43467; Tue, 17 Nov 2020 19:52:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 12D24C43460;
        Tue, 17 Nov 2020 19:52:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Nov 2020 11:52:52 -0800
From:   abhinavk@codeaurora.org
To:     Wei Li <liwei391@huawei.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        guohanjun@huawei.com
Subject: Re: [PATCH] drm/msm: Fix error return code in msm_drm_init()
In-Reply-To: <20201117023649.26657-1-liwei391@huawei.com>
References: <20201117023649.26657-1-liwei391@huawei.com>
Message-ID: <e1539aaff024566bc1e64eb7897ec6c7@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-16 18:36, Wei Li wrote:
> When it fail to create crtc_event kthread, it just jump to 
> err_msm_uninit,
> while the 'ret' is not updated. So assign the return code before that.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Li <liwei391@huawei.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
> b/drivers/gpu/drm/msm/msm_drv.c
> index 49685571dc0e..37a373c5ced3 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -506,6 +506,7 @@ static int msm_drm_init(struct device *dev, struct
> drm_driver *drv)
>  			"crtc_event:%d", priv->event_thread[i].crtc_id);
>  		if (IS_ERR(priv->event_thread[i].worker)) {
>  			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
> +			ret = PTR_ERR(priv->event_thread[i].worker);
>  			goto err_msm_uninit;
>  		}
