Return-Path: <linux-arm-msm+bounces-3380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B310380442A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 02:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADA5DB20851
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 01:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A99510E8;
	Tue,  5 Dec 2023 01:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Smy806r6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53A7F0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 17:37:19 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ca03103155so20864111fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 17:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701740238; x=1702345038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WASjpjTYaDMI+M/17yk15wAWPvG4vdjSosKnmO8NGfY=;
        b=Smy806r6jc+egysqKo4xuHhljDwMzC2pcwJTiIv6vdW5hXseNpKF7B2EyRrip7Jep+
         dpL9QWr36qzqLT3CyeRVtBaQhuNuAMDLCol5XWbM6waDhuvNrmcnGr1zp0nspVb/uhHS
         0MEHVo/rTIJ9LUkDVQvYxutvUBE6UYcM1Oh4ICyTfD60MZTAbGy04B1ynHswqXomXnZ+
         aryj2p8HfX4RRSPnygL+TJ6/akFjoue9gIE8uTmPpT4F7LDaTLtqB5Yvpz3KBWHmHhO7
         OMUq5FKkqFwRkzrXW28oDn/oCnGdltvf+sUpk27zegRcDXFioeaRqRncRyTFkDre9k3S
         z+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701740238; x=1702345038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WASjpjTYaDMI+M/17yk15wAWPvG4vdjSosKnmO8NGfY=;
        b=SWW2Z4+vbvEtRMRFGPK4lQNE4GzBEU2E79sHHePzFfkco9TXJRogbAqppwm+ZsNej9
         cFkzCWkVMLHHssZ6x1ammOYUqfhSho3O4edroVcWZTrE7EQ1nHV8NtVmwMH2KbhsYw+a
         QK9KwQ0ITp/UgUgu89X8N12JrtMe/m5iWMDvMQzDd8al/fjhIh4sCjsRMjS4YsbJmch1
         +iE9x0XFU2wZ62yOpKhRO2NqroZDdELRpdXXUcoWvEoxGD7Q86W+Om6kwfvt1JAh1wGf
         Q9EXQthKqaD4aJE6lG88c9dm7bwNj0roBw5qj3l8WfHEoB4XfpO1P7yO9oOi7OJWsv6j
         SnvA==
X-Gm-Message-State: AOJu0YyY6ky+4UlBBgrVoUsvBpjuZiogegHCDCeWDKoxIdA06N2TO8H1
	Bo5chwtabil5aqu/ci7EqWWZUg==
X-Google-Smtp-Source: AGHT+IFslhiOic1qREeaSAz0mp7DKToeKSsKbXF1VH2ZlFwxZ1cI2ZJ9EDSlD4n7/CMoKxgEbVJkow==
X-Received: by 2002:a05:6512:3b0b:b0:50b:f51a:299c with SMTP id f11-20020a0565123b0b00b0050bf51a299cmr1142916lfv.30.1701740237875;
        Mon, 04 Dec 2023 17:37:17 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227? (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id g13-20020a19ac0d000000b0050bfdaf01e0sm269941lfc.260.2023.12.04.17.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 17:37:16 -0800 (PST)
Message-ID: <ff89354d-c9d1-486a-982b-0bb976f6b699@linaro.org>
Date: Tue, 5 Dec 2023 03:37:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20231201220843.2023117-1-dmitry.baryshkov@linaro.org>
 <uqrsl3gehpjybzb6cish7vpub3xznouomn4246b7j4i3qiiumv@enskrm5kpwa5>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <uqrsl3gehpjybzb6cish7vpub3xznouomn4246b7j4i3qiiumv@enskrm5kpwa5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2023 10:38, Maxime Ripard wrote:
> On Sat, Dec 02, 2023 at 12:07:49AM +0200, Dmitry Baryshkov wrote:
>> The drm_atomic_helper_check_wb_encoder_state() function doesn't use
>> encoder for anything other than getting the drm_device instance. The
>> function's description talks about checking the writeback connector
>> state, not the encoder state. Moreover, there is no such thing as an
>> encoder state, encoders generally do not have a state on their own.
>>
>> Drop the first argument and rename the function to
>> drm_atomic_helper_check_wb_connector_state().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> Resending, no reaction for two months
>>
>> ---
>>   drivers/gpu/drm/drm_atomic_helper.c   | 10 ++++------
>>   drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
>>   include/drm/drm_atomic_helper.h       |  3 +--
>>   3 files changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index 2444fc33dd7c..d69591381f00 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -795,8 +795,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>>   EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>>   
>>   /**
>> - * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
>> - * @encoder: encoder state to check
>> + * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
>>    * @conn_state: connector state to check
>>    *
>>    * Checks if the writeback connector state is valid, and returns an error if it
>> @@ -806,8 +805,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>>    * Zero for success or -errno
>>    */
>>   int
>> -drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>> -					 struct drm_connector_state *conn_state)
>> +drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state)
> 
> AFAIK, all the helpers take the object as first argument, so I'm fine
> with the name change but it should take a drm_connector too. And ideally
> a drm_atomic_state pointer instead of drm_connector_state too.

I think we then might take even further step and pass 
drm_writeback_connector to this function. I'll send this as a part of v2.

> 
>>   {
>>   	struct drm_writeback_job *wb_job = conn_state->writeback_job;
>>   	struct drm_property_blob *pixel_format_blob;
>> @@ -827,11 +825,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>>   		if (fb->format->format == formats[i])
>>   			return 0;
>>   
>> -	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
>> +	drm_dbg_kms(conn_state->connector->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
> 
> Which would also avoid the checkpatch warning there.
> 
> Maxime

-- 
With best wishes
Dmitry


