Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 069003C1B49
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 23:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhGHWCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 18:02:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33484 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhGHWCj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 18:02:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625781597; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=foQZWcxZgegObXgHqgBDEXunbwEGNs+mS0D1mjRzN8g=;
 b=NVhMuAE6jMI6DVdqCbO9Fj4d6QERA1axXRmJs9VE0b7JCO5oDRBsxpdrNRnQdhXF4WcQ52lf
 TFDIw1KK5bA0BHocS7/TjRsmlrGw8BXuRSuSeLOJIBPLIoflmtE2hKyHEYQI1tXRft0zjSHT
 Jz27WMBnGA3y3b1d+kwgHaOQR/0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60e7755cec0b18a745196178 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Jul 2021 21:59:56
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6E443C43460; Thu,  8 Jul 2021 21:59:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 44FB3C433D3;
        Thu,  8 Jul 2021 21:59:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Jul 2021 14:59:53 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, abhinavk@codeaurora.org, aravindh@codeaurora.org,
        airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] drm/msm/dp: reset aux controller after
 dp_aux_cmd_fifo_tx() failed.
In-Reply-To: <CAE-0n53JxLuQZBUMLOuH_Bm7zQ7Vite2OhjTB_xO=s_KAGarXw@mail.gmail.com>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-4-git-send-email-khsieh@codeaurora.org>
 <CAE-0n53JxLuQZBUMLOuH_Bm7zQ7Vite2OhjTB_xO=s_KAGarXw@mail.gmail.com>
Message-ID: <a5bb5f6bf7defa9c9bbf7d1fde87ca49@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-08 00:34, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-07-06 10:20:16)
>> Aux hardware calibration sequence requires resetting the aux 
>> controller
>> in order for the new setting to take effect. However resetting the AUX
>> controller will also clear HPD interrupt status which may accidentally
>> cause pending unplug interrupt to get lost. Therefore reset aux
>> controller only when link is in connection state when 
>> dp_aux_cmd_fifo_tx()
>> fail. This fixes Link Layer CTS cases 4.2.1.1 and 4.2.1.2.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_aux.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
>> b/drivers/gpu/drm/msm/dp/dp_aux.c
>> index 4a3293b..eb40d84 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>> @@ -353,6 +353,9 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
>> *dp_aux,
>>                         if (!(aux->retry_cnt % MAX_AUX_RETRIES))
>>                                 
>> dp_catalog_aux_update_cfg(aux->catalog);
>>                 }
>> +               /* reset aux if link is in connected state */
>> +               if (dp_catalog_link_is_connected(aux->catalog))
> 
> How do we avoid resetting aux when hpd is unplugged and then plugged
> back in during an aux transfer?
i am not sure this is possible.
it should get unplug interrupt followed by plugin interrupt.
In this case, aux will be re set and initialized
> 
>> +                       dp_catalog_aux_reset(aux->catalog);
>>         } else {
>>                 aux->retry_cnt = 0;
>>                 switch (aux->aux_error_num) {
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
