Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB631F72C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 06:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgFLEQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 00:16:22 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:33336 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725763AbgFLEQV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 00:16:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591935381; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9jW2UZWQi53Kk3w5fHkJfOEaqlYtV6xo4Hhqo7akco4=;
 b=iuET9S4W+6Ij1+PXUyqpG3r3D1eacG1PrKa4seHCT59hsBRsbJFGJY0ztYlUmTwf46+tY4wm
 CLCRKJD0WlE7bbkHhmluTHCB4TwiYYTV3UfZkeTjwHId3penb6qwXXCAgQKPU3PLulduvUVb
 Grx7cEK6OLPBcS+ErFzvWlAy2gY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ee301716bebe35debcee715 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 04:15:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 62730C433CB; Fri, 12 Jun 2020 04:15:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CC032C433C8;
        Fri, 12 Jun 2020 04:15:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Jun 2020 21:15:44 -0700
From:   abhinavk@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        pdhaval@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
        aravindh@codeaurora.org
Subject: Re: [PATCH] drm/msm: call drm_mode_config_reset before
 drm_dev_register
In-Reply-To: <CAF6AEGsOX_QoOnMhqKuUHhhNjL_PgxF_5O7sYKi1Hkj5FmRpGw@mail.gmail.com>
References: <20200610004659.10401-1-abhinavk@codeaurora.org>
 <CAF6AEGsOX_QoOnMhqKuUHhhNjL_PgxF_5O7sYKi1Hkj5FmRpGw@mail.gmail.com>
Message-ID: <f99fefebb7a0a92c7e07afceb6abad4c@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob

Thanks for the review.

Yes, this was a cleanup we noticed.

Abhinav
On 2020-06-11 20:35, Rob Clark wrote:
> On Tue, Jun 9, 2020 at 5:47 PM Abhinav Kumar <abhinavk@codeaurora.org> 
> wrote:
>> 
>> As per the documentation of drm_dev_register, all drivers should
>> call drm_dev_register after all the initialization is completed.
>> This also means that drm_mode_config_reset should be done before
>> drm_dev_register.
>> 
>> Change the sequence to align with this documentation.
>> 
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> 
> I assume this is just a cleanup you noticed, and not fixing a bug you
> are hitting (in which case I'll pick it up next merge window, rather
> than -fixes)
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> 
>> ---
>>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 29295dee2a2e..9e77cc7f1fa4 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -538,12 +538,12 @@ static int msm_drm_init(struct device *dev, 
>> struct drm_driver *drv)
>>                 }
>>         }
>> 
>> +       drm_mode_config_reset(ddev);
>> +
>>         ret = drm_dev_register(ddev, 0);
>>         if (ret)
>>                 goto err_msm_uninit;
>> 
>> -       drm_mode_config_reset(ddev);
>> -
>>  #ifdef CONFIG_DRM_FBDEV_EMULATION
>>         if (kms && fbdev)
>>                 priv->fbdev = msm_fbdev_init(ddev);
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
