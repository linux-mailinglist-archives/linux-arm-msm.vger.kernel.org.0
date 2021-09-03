Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBEF34004E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 20:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235896AbhICScQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 14:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233315AbhICScP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 14:32:15 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8750AC061575
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Sep 2021 11:31:14 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id y6so237513lje.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Sep 2021 11:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kUpYrB6LA+X1EG7mZxbWQs5iImpyPUWVUxzm2ewn4VY=;
        b=z4ccfB5hb3hkvqLtFWhuflOfpiz8mo7jpdJ2jFD2SuzoME2QUD1YOlmAIMeZweGFnc
         GmqGEsWb4I06ZwK3Ecmc/L3QI3kD8jpbkXl/P+E/eDtu/fqcHSKnNd0KtIsiJyGLtkfu
         qzD9re9bSd2DVPTLnNxILBYeRMZ1wLTQFFJOzM3QED5PQCwhg9ua4MU397g/N70Dc+rZ
         RuusNtBT79ZAj8T09p1lGHunudIt+2pz9qY+W38ERNLWL7N59esF4sFq1dKpzZS8OuFg
         fnQh9VOzd5Ngodp36ogRU7wCMqjS5Q4T+snPD8MQK7YudtiXf0Cy7m5muLG5l9gojPEA
         YxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kUpYrB6LA+X1EG7mZxbWQs5iImpyPUWVUxzm2ewn4VY=;
        b=J7QOuf7lGPiLz8/bqfHKaTA5WFXJ15lp+bzmlW7oDfQSZMo7KZQgzlARV3GnlRnLBU
         npS8dx5Dm0EcuXodyRTnFek4yGF0oZ5PQ+BgBrx+lBA2BnxEEThKstelsbYLXFBnpkip
         BwWW9U8+K8nJO1ar4mJMjljB9e5YqjzmuET2anAGLm6BsUS5F7bYyHVCAP5dUbZO4nSI
         SC1Pu8Xcu1EnzQzzzQNZiqQDTl0ivMcWjFYi+Cab1vuB00wieG3H1ZhEXe1D2JkKpKPu
         vM6oab0cAWrvRrMSMQlV0NWW8Glyr6IgaCg4Nr4syWGIvHDP+jwJG2c625dXTWbflQLU
         XaFQ==
X-Gm-Message-State: AOAM531HhY8+uhqcC0K6szr99HW7Aa8aJNj4VQUzJhPYD3VSfIDBOMuj
        jPnP4A/WmMbtoqsmbnhnkZZPNw==
X-Google-Smtp-Source: ABdhPJzKLREu9lV2YGYPyO/peIQHRIZ9atO6bBDf5sKEpxHDJlUgqDVXsncsW/ACQqpKoCT/1TE8gg==
X-Received: by 2002:a2e:a903:: with SMTP id j3mr256630ljq.347.1630693872515;
        Fri, 03 Sep 2021 11:31:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h13sm18825lfv.62.2021.09.03.11.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 11:31:12 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: remove unneeded variable
To:     Lyude Paul <lyude@redhat.com>, cgel.zte@gmail.com,
        robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        airlied@redhat.com, laurent.pinchart@ideasonboard.com,
        chi.minghao@zte.com.cn, treding@nvidia.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
References: <20210831115127.18236-1-chi.minghao@zte.com.cn>
 <2d6784e3327cab7bfdc88ca1ef7c9c4c9cca113a.camel@redhat.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <52a6c92d-fe59-cdb8-23de-6fcda6ca2c68@linaro.org>
Date:   Fri, 3 Sep 2021 21:31:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2d6784e3327cab7bfdc88ca1ef7c9c4c9cca113a.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/09/2021 21:40, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Do you need me to push this?

We'd pick this up through the msm tree.

> 
> On Tue, 2021-08-31 at 04:51 -0700, cgel.zte@gmail.com wrote:
>> From: Chi Minghao <chi.minghao@zte.com.cn>
>>
>> Fix the following coccicheck REVIEW:
>> ./drivers/gpu/drm/msm/edp/edp_ctrl.c:1245:5-8 Unneeded variable
>>
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>
>> ---
>>   drivers/gpu/drm/msm/edp/edp_ctrl.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c
>> b/drivers/gpu/drm/msm/edp/edp_ctrl.c
>> index 4fb397ee7c84..3610e26e62fa 100644
>> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
>> @@ -1242,8 +1242,6 @@ bool msm_edp_ctrl_panel_connected(struct edp_ctrl
>> *ctrl)
>>   int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>>                  struct drm_connector *connector, struct edid **edid)
>>   {
>> -       int ret = 0;
>> -
>>          mutex_lock(&ctrl->dev_mutex);
>>   
>>          if (ctrl->edid) {
>> @@ -1278,7 +1276,7 @@ int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>>          }
>>   unlock_ret:
>>          mutex_unlock(&ctrl->dev_mutex);
>> -       return ret;
>> +       return 0;
>>   }
>>   
>>   int msm_edp_ctrl_timing_cfg(struct edp_ctrl *ctrl,
> 


-- 
With best wishes
Dmitry
