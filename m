Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A150496295
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 17:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344750AbiAUQFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jan 2022 11:05:14 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8135 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239055AbiAUQFO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jan 2022 11:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642781114; x=1674317114;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hwDS2cVhsvvw4aB0X37oWlVYGPvDpyDEh1cxbZHYKAA=;
  b=riZL/HqK9lqFujh/ftjR7Nh2emkB9CqsDlWRYyf++s+QjOWr1e/J42Hj
   s8XeJvdzK5NjIAiiTAk6DuGj9/sx/kVUEgxYS8JhfHB2foO6YEkMtLt/h
   Uv7BGqjv0gCKUu8MsL6GrCQCa/9i8fwtnamJDnsaVLYZg4c4ojEs3T1Zo
   I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 21 Jan 2022 08:05:14 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 08:05:14 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 21 Jan 2022 08:05:13 -0800
Received: from [10.111.160.59] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 21 Jan
 2022 08:05:10 -0800
Message-ID: <40ffe28d-60a0-dc7c-94bb-6f78876942d6@quicinc.com>
Date:   Fri, 21 Jan 2022 08:05:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] drm: allow passing a real encoder object for wb
 connector
Content-Language: en-US
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-arm-msm@vger.kernel.org>, <swboyd@chromium.org>,
        <khsieh@codeaurora.org>, <nganji@codeaurora.org>,
        <seanpaul@chromium.org>, <laurent.pinchart@ideasonboard.com>,
        <dmitry.baryshkov@linaro.org>, <aravindh@codeaurora.org>,
        <freedreno@lists.freedesktop.org>, <suraj.kandpal@intel.com>
References: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
 <87bl054fe4.fsf@intel.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <87bl054fe4.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jani

On 1/21/2022 1:17 AM, Jani Nikula wrote:
> On Thu, 20 Jan 2022, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
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
> See also the thread starting at [1], and please try to coordinate.
> 
> I don't know what the end result should be like, I'm just saying please
> collaborate instead of racing to get one set of changes in.
> 
> BR,
> Jani.
> 
> 
> [1] https://patchwork.freedesktop.org/patch/msgid/20220111101801.28310-1-suraj.kandpal@intel.com
> 
Thanks for pointing to this thread. Since 
https://patchwork.freedesktop.org/patch/469090/ has been posted earlier 
and is more complete in terms of handling other vendor changes, we can 
continue on that one.

But I dont see any comments on that one yet.

Hi Laurent

In that case can you please check the 
https://patchwork.freedesktop.org/patch/469090/ thread , we can continue 
our discussion there.

We also have the same issue too. Our encoder also maintains its own 
struct drm_encoder.

Thanks

Abhinav
>>
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
