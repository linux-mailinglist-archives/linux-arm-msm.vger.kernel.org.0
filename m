Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E0529FA5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 02:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgJ3BMj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 21:12:39 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:18135 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgJ3BMj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 21:12:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604020358; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rLqH04x7OKfH7f79UZd2BGTmUAb1ZvVeFCX4tIl5CAU=;
 b=POeiCGsnlyBv/e3vE+GKPxbcymEKn7lQYeQA+byOfMnLNcZSmdUnkBmx6b/sFHob46bVl+iB
 xyh6uvjBx8gsim6syA+gb0hfGaTX8DSheg2ZZK38jk3fRSYN6Da4kJ1b3EKKK+JDx/IC62+9
 9/f6t6bTdrjL3jmBcTxV/mKFQxY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f9b6886b01cad7dbf3fee1a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 01:12:38
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3FE0EC433C6; Fri, 30 Oct 2020 01:12:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D526BC433C6;
        Fri, 30 Oct 2020 01:12:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 29 Oct 2020 18:12:36 -0700
From:   abhinavk@codeaurora.org
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
        tanmay@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm: allow drm_atomic_print_state() to accept any
 drm_printer
In-Reply-To: <20201022103843.GW401619@phenom.ffwll.local>
References: <20201022050148.27105-1-abhinavk@codeaurora.org>
 <20201022050148.27105-2-abhinavk@codeaurora.org>
 <20201022103843.GW401619@phenom.ffwll.local>
Message-ID: <a932084d3eaa3f7b12e3010e40379c16@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Daniel

On 2020-10-22 03:38, Daniel Vetter wrote:
> On Wed, Oct 21, 2020 at 10:01:45PM -0700, Abhinav Kumar wrote:
>> Currently drm_atomic_print_state() internally allocates and uses a
>> drm_info printer. Allow it to accept any drm_printer type so that
>> the API can be leveraged even for taking drm snapshot.
>> 
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> ---
>>  drivers/gpu/drm/drm_atomic.c        | 17 ++++++++++++-----
>>  drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++-
>>  drivers/gpu/drm/drm_crtc_internal.h |  4 +++-
>>  3 files changed, 18 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_atomic.c 
>> b/drivers/gpu/drm/drm_atomic.c
>> index 58527f151984..e7079a5f439c 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -1,6 +1,7 @@
>>  /*
>>   * Copyright (C) 2014 Red Hat
>>   * Copyright (C) 2014 Intel Corp.
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>   *
>>   * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>>   * copy of this software and associated documentation files (the 
>> "Software"),
>> @@ -1543,9 +1544,9 @@ int __drm_atomic_helper_set_config(struct 
>> drm_mode_set *set,
>>  }
>>  EXPORT_SYMBOL(__drm_atomic_helper_set_config);
>> 
>> -void drm_atomic_print_state(const struct drm_atomic_state *state)
>> +void drm_atomic_print_state(const struct drm_atomic_state *state,
>> +		struct drm_printer *p)
> 
> Please add a nice kerneldoc for this newly exported function. 
> Specifically
> this kerneldoc needs to include a warning that state updates after call
> drm_atomic_state_helper_commit_hw_done() is unsafe to print using this
> function, because it looks at the new state objects. Only the old state
> structures will stay like this.
> 
> So maybe rename the function to say print_new_state() to make this
> completely clear. That way we can eventually add a print_old_state() 
> when
> needed.
> 
> Otherwise I think this makes sense, and nicely avoids the locking issue 
> of
> looking at ->state pointers without the right locking.
> -Daniel
> 

Thanks for the review, I have addressed these comments and posted a V2.
-Abhinav

>>  {
>> -	struct drm_printer p = drm_info_printer(state->dev->dev);
>>  	struct drm_plane *plane;
>>  	struct drm_plane_state *plane_state;
>>  	struct drm_crtc *crtc;
>> @@ -1554,17 +1555,23 @@ void drm_atomic_print_state(const struct 
>> drm_atomic_state *state)
>>  	struct drm_connector_state *connector_state;
>>  	int i;
>> 
>> +	if (!p) {
>> +		DRM_ERROR("invalid drm printer\n");
>> +		return;
>> +	}
>> +
>>  	DRM_DEBUG_ATOMIC("checking %p\n", state);
>> 
>>  	for_each_new_plane_in_state(state, plane, plane_state, i)
>> -		drm_atomic_plane_print_state(&p, plane_state);
>> +		drm_atomic_plane_print_state(p, plane_state);
>> 
>>  	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
>> -		drm_atomic_crtc_print_state(&p, crtc_state);
>> +		drm_atomic_crtc_print_state(p, crtc_state);
>> 
>>  	for_each_new_connector_in_state(state, connector, connector_state, 
>> i)
>> -		drm_atomic_connector_print_state(&p, connector_state);
>> +		drm_atomic_connector_print_state(p, connector_state);
>>  }
>> +EXPORT_SYMBOL(drm_atomic_print_state);
>> 
>>  static void __drm_state_dump(struct drm_device *dev, struct 
>> drm_printer *p,
>>  			     bool take_locks)
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
>> b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 25c269bc4681..d9ae86c92608 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -2,6 +2,7 @@
>>   * Copyright (C) 2014 Red Hat
>>   * Copyright (C) 2014 Intel Corp.
>>   * Copyright (C) 2018 Intel Corp.
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>   *
>>   * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>>   * copy of this software and associated documentation files (the 
>> "Software"),
>> @@ -1294,6 +1295,7 @@ int drm_mode_atomic_ioctl(struct drm_device 
>> *dev,
>>  	struct drm_out_fence_state *fence_state;
>>  	int ret = 0;
>>  	unsigned int i, j, num_fences;
>> +	struct drm_printer p = drm_info_printer(dev->dev);
>> 
>>  	/* disallow for drivers not supporting atomic: */
>>  	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>> @@ -1413,7 +1415,7 @@ int drm_mode_atomic_ioctl(struct drm_device 
>> *dev,
>>  		ret = drm_atomic_nonblocking_commit(state);
>>  	} else {
>>  		if (drm_debug_enabled(DRM_UT_STATE))
>> -			drm_atomic_print_state(state);
>> +			drm_atomic_print_state(state, &p);
>> 
>>  		ret = drm_atomic_commit(state);
>>  	}
>> diff --git a/drivers/gpu/drm/drm_crtc_internal.h 
>> b/drivers/gpu/drm/drm_crtc_internal.h
>> index da96b2f64d7e..d34215366936 100644
>> --- a/drivers/gpu/drm/drm_crtc_internal.h
>> +++ b/drivers/gpu/drm/drm_crtc_internal.h
>> @@ -5,6 +5,7 @@
>>   *   Jesse Barnes <jesse.barnes@intel.com>
>>   * Copyright © 2014 Intel Corporation
>>   *   Daniel Vetter <daniel.vetter@ffwll.ch>
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>   *
>>   * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>>   * copy of this software and associated documentation files (the 
>> "Software"),
>> @@ -233,7 +234,8 @@ int __drm_atomic_helper_disable_plane(struct 
>> drm_plane *plane,
>>  int __drm_atomic_helper_set_config(struct drm_mode_set *set,
>>  				   struct drm_atomic_state *state);
>> 
>> -void drm_atomic_print_state(const struct drm_atomic_state *state);
>> +void drm_atomic_print_state(const struct drm_atomic_state *state,
>> +		struct drm_printer *p);
>> 
>>  /* drm_atomic_uapi.c */
>>  int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
