Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8C149589C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 04:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbiAUDpi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jan 2022 22:45:38 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:6173 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbiAUDpg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jan 2022 22:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642736736; x=1674272736;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OZFYwFviT7nGE0W3AQLERAg4K4gUI7SOGuYUPR9qDP0=;
  b=aGl8+1hZW0AGshsz/q5I0ulBUMqzJksJLDws3c25PuR7YC2Q1UGxColu
   UaVCd/Swgu+WvD/mGJ5YQcXjVkXiAVCQb8OpJvvplHVRMrS3e2l1jzoJz
   BuXTO64HMoXHQLRAG2JCO66cIZg793jaGhZxFb9jPwYEXs+nCf8PzV3bh
   8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 20 Jan 2022 19:45:36 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 19:45:35 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 20 Jan 2022 19:45:35 -0800
Received: from [10.111.160.59] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 20 Jan
 2022 19:45:32 -0800
Message-ID: <ed76272d-91cb-9118-2bda-808cd43e408a@quicinc.com>
Date:   Thu, 20 Jan 2022 19:45:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Freedreno] [RFC PATCH] drm: allow passing a real encoder object
 for wb connector
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <swboyd@chromium.org>, <khsieh@codeaurora.org>,
        <robdclark@gmail.com>, <nganji@codeaurora.org>,
        <seanpaul@chromium.org>, <daniel@ffwll.ch>,
        <dmitry.baryshkov@linaro.org>, <aravindh@codeaurora.org>,
        <freedreno@lists.freedesktop.org>
References: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
 <YeodzTsHmejDm9M6@pendragon.ideasonboard.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YeodzTsHmejDm9M6@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Laurent

Thanks for the response.

On 1/20/2022 6:43 PM, Laurent Pinchart wrote:
> Hi Abhinav,
> 
> Thank you for the patch.
> 
> On Thu, Jan 20, 2022 at 06:29:55PM -0800, Abhinav Kumar wrote:
>> Instead of creating an internal encoder for the writeback
>> connector to satisfy DRM requirements, allow the clients
>> to pass a real encoder to it by changing the drm_writeback's
>> encoder to a pointer.
>>
>> If a real encoder is not passed, drm_writeback_connector_init
>> will internally allocate one.
>>
>> This will help the clients to manage the real encoder states
>> better as they will allocate and maintain the encoder.
> 
> A writeback connector is a bit of a hack. It was implemented that way to
> minimize the extensions to the KMS userspace API for writeback support.
> There's no "encoder" there, as there's no real "connector" either. The
> only reason we register a drm_encoder in the writeback implementation is
> because encoders are exposed to userspace and are thus required (this is
> considered a historical mistake that we can't fix anymore). Why do you
> thus need to create a "real encoder" ?

On some hardware, it is possible that the writeback encoder is shared.
That is, in terms of hardware resources, we can only mutually drive 
either the physical interface or the writeback one.

In that case, it would be better that drm_writeback accepts the real 
encoder that is being used instead of allocating a dummy one internally.

Moreover, the drm_writeback_connector_init() does already accept passing 
our own enc_helper_funcs to perform necessary checks on the internal 
encoder.

These hooks are provided to perform various operations on the encoder to
fit the respective needs.

In that case why shouldnt the writeback have its own real encoder?

Thanks

Abhinav


> 
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_writeback.c | 11 +++++++----
>>   include/drm/drm_writeback.h     |  2 +-
>>   2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
>> index dccf4504..fdb7381 100644
>> --- a/drivers/gpu/drm/drm_writeback.c
>> +++ b/drivers/gpu/drm/drm_writeback.c
>> @@ -189,8 +189,11 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   	if (IS_ERR(blob))
>>   		return PTR_ERR(blob);
>>   
>> -	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
>> -	ret = drm_encoder_init(dev, &wb_connector->encoder,
>> +	/* allocate the internal drm encoder if a real one wasnt passed */
>> +	if (!wb_connector->encoder)
>> +		wb_connector->encoder = devm_kzalloc(dev->dev, sizeof(struct drm_encoder), GFP_KERNEL);
>> +	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
>> +	ret = drm_encoder_init(dev, wb_connector->encoder,
>>   			       &drm_writeback_encoder_funcs,
>>   			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>>   	if (ret)
>> @@ -204,7 +207,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   		goto connector_fail;
>>   
>>   	ret = drm_connector_attach_encoder(connector,
>> -						&wb_connector->encoder);
>> +						wb_connector->encoder);
>>   	if (ret)
>>   		goto attach_fail;
>>   
>> @@ -233,7 +236,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>   attach_fail:
>>   	drm_connector_cleanup(connector);
>>   connector_fail:
>> -	drm_encoder_cleanup(&wb_connector->encoder);
>> +	drm_encoder_cleanup(wb_connector->encoder);
>>   fail:
>>   	drm_property_blob_put(blob);
>>   	return ret;
>> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
>> index 9697d27..f0d8147 100644
>> --- a/include/drm/drm_writeback.h
>> +++ b/include/drm/drm_writeback.h
>> @@ -31,7 +31,7 @@ struct drm_writeback_connector {
>>   	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>>   	 * function.
>>   	 */
>> -	struct drm_encoder encoder;
>> +	struct drm_encoder *encoder;
>>   
>>   	/**
>>   	 * @pixel_formats_blob_ptr:
> 
