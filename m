Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32E3C2DDA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 15:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfE2NFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 09:05:12 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39974 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbfE2NFM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 09:05:12 -0400
Received: by mail-lj1-f196.google.com with SMTP id q62so2365540ljq.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2019 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=llu8Y5NHzHxxDDbTkC/AtBNhwsX33d/0JdDrLU3ydWI=;
        b=mlbpaSpyBzO+K4QOYeF8DBxVDrmFilPjP+gK5mEeJw1DXRgmXG2ra6KOfay/IlTTHU
         UmrgFp5xJ5LmadTPgN527a8XLY0khtGQd6+tAkAXwwero1copC/91HUbKjXvuTpSqxxM
         ZdIdws4BRpZhEBiRFQCmj4EIzDSKWu2USlEIUrFXW0dolVWxGy4HyhtUkWP2B2r8GFu4
         aiU9LkWKW1kv/0oqoNaRWq08QdHpf64nOQCBjyCMTIPEQkSwp4fvZZu1uEW87w6G3je/
         B+gxkcYmaH//4mI0GuBYq0903rw6NKK6Z4j9XsJjULdXEiv5nDl8VbluCLYiUYX4rS/T
         uafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=llu8Y5NHzHxxDDbTkC/AtBNhwsX33d/0JdDrLU3ydWI=;
        b=dfI68j9h+HWrQ99LPdTXRcwr5VxsS907Lrlpz9UAojkdAGyXyR6nr+ITyV2vaFU/KP
         Vo8lxi6DhT21JIJ9bPzt+3lSePPiVqxWa7tyUdL/tMpXdteuCQntbbWt6blX7DEZmN1y
         Tz7XQsAYNW82C11avQfkubS8VmuGuqWILgxJdChYY2LfBRjnrBEEWpXKagRgrIFA5FNX
         EjqZhSw68o76JioCrZT+kIe9Q0byywP3kyHObiZW+ekAOsvN07AMqw4Oss5gH7vF1J5w
         bTuGQMe2MXp7R0Uso8gNroIZNyysHogmBcnLfRQXzQxFGE4vmg0FcKjBzx2isysP3onf
         ochA==
X-Gm-Message-State: APjAAAWAN6h48SsafA1aay5OGe74olcWPlqWqZEVACIrnAecCwnRvMJE
        Jx6StEvQGd5ORlyA61dBICBHjQ==
X-Google-Smtp-Source: APXvYqxt2dwOYHIBbX5Z9cJdxphQnVjqpWdOeU/6e1nwgO2fpp1hBitzbQOfosdNNh2n4lUif4uuuQ==
X-Received: by 2002:a2e:1284:: with SMTP id 4mr36692793ljs.138.1559135108964;
        Wed, 29 May 2019 06:05:08 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id v12sm3482366ljv.49.2019.05.29.06.05.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 06:05:08 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm/msm/dpu: Integrate interconnect API in MDSS
To:     Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190508204219.31687-1-robdclark@gmail.com>
 <20190508204219.31687-3-robdclark@gmail.com>
 <20190513144722.GO17077@art_vandelay>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <2ac15174-09f5-7c7f-8ca8-226f8238a115@linaro.org>
Date:   Wed, 29 May 2019 16:05:05 +0300
MIME-Version: 1.0
In-Reply-To: <20190513144722.GO17077@art_vandelay>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/13/19 17:47, Sean Paul wrote:
> On Wed, May 08, 2019 at 01:42:12PM -0700, Rob Clark wrote:
>> From: Jayant Shekhar <jshekhar@codeaurora.org>
>>
>> The interconnect framework is designed to provide a
>> standard kernel interface to control the settings of
>> the interconnects on a SoC.
>>
>> The interconnect API uses a consumer/provider-based model,
>> where the providers are the interconnect buses and the
>> consumers could be various drivers.
>>
>> MDSS is one of the interconnect consumers which uses the
>> interconnect APIs to get the path between endpoints and
>> set its bandwidth requirement for the given interconnected
>> path.
>>
>> Changes in v2:
>> 	- Remove error log and unnecessary check (Jordan Crouse)
>>
>> Changes in v3:
>> 	- Code clean involving variable name change, removal
>> 	  of extra paranthesis and variables (Matthias Kaehlcke)
>>
>> Changes in v4:
>> 	- Add comments, spacings, tabs, proper port name
>> 	  and icc macro (Georgi Djakov)
>>
>> Changes in v5:
>> 	- Commit text and parenthesis alignment (Georgi Djakov)
>>
>> Changes in v6:
>> 	- Change to new icc_set API's (Doug Anderson)
>>
>> Changes in v7:
>> 	- Fixed a typo
>>
>> Signed-off-by: Sravanthi Kollukuduru <skolluku@codeaurora.org>
>> Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 49 ++++++++++++++++++++++--
>>  1 file changed, 45 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>> index 7316b4ab1b85..e3c56ccd7357 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>> @@ -4,11 +4,15 @@
>>   */
>>  
>>  #include "dpu_kms.h"
>> +#include <linux/interconnect.h>
>>  
>>  #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
>>  
>>  #define HW_INTR_STATUS			0x0010
>>  
>> +/* Max BW defined in KBps */
>> +#define MAX_BW				6800000
>> +
>>  struct dpu_irq_controller {
>>  	unsigned long enabled_mask;
>>  	struct irq_domain *domain;
>> @@ -21,8 +25,30 @@ struct dpu_mdss {
>>  	u32 hwversion;
>>  	struct dss_module_power mp;
>>  	struct dpu_irq_controller irq_controller;
>> +	struct icc_path *path[2];
>> +	u32 num_paths;
>>  };
>>  
>> +static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
>> +						struct dpu_mdss *dpu_mdss)
>> +{
>> +	struct icc_path *path0 = of_icc_get(dev->dev, "mdp0-mem");
>> +	struct icc_path *path1 = of_icc_get(dev->dev, "mdp1-mem");
>> +
>> +	if (IS_ERR(path0))
> 
> of_icc_get can also return NULL, it looks like we also want to guard against
> this case and keep num_paths == 0.

of_icc_get() returns NULL when the interconnect API is not enabled or the DT
properties are not present. In this case, passing a NULL path to the icc
functions is just a nop. So it should be fine either way.

Acked-by: Georgi Djakov <georgi.djakov@linaro.org>

Thanks,
Georgi
