Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943114BC4D7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 03:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239697AbiBSC1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 21:27:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239006AbiBSC1U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 21:27:20 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97011B32
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:27:01 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id c15so6742507ljf.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IdQuvPdE/S4qlv5lMX2CTY4ZIw7BaXOuiozopHqRT6w=;
        b=YJkgom0cuyDGDmZTKqx1EYQnaQXBwCUG6RIxkTqqcqRR4mqqViZ0Gk9vT9xoJzwmbJ
         ge5QVQZWhopZrG5enB+6V7MKeApWlo/j+xSK649dXbN3hOnUiRKNSX8K6Td8HwlrUwOx
         ez4U6NPuWOOC+jvfleTf1pZhfoJtD9WgByZzFcYHXUJt1OJYx8YvVQm/WaSSdcUNTKZj
         QY/wAe+tOyj7T0BYXBoROG7VPTQxrtMBCL2gCEIPpYNBCDP1HxDouBzSmxRQafagdT6e
         fagasOfUQilhxwSjYBACsAEv5UZdfklkIZLDMQGzK76ZMD+NZoxPUCEjbibnQIuE5Rqo
         qlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IdQuvPdE/S4qlv5lMX2CTY4ZIw7BaXOuiozopHqRT6w=;
        b=10f26pguqBfyEcKf0PX3X7y0ds7znISr7MwVSMdlRRaNRuVgZdGRtycgC93+m2T4PQ
         VZCT3bhNyIasUnYauluYgB64ZW9+rq4rXsMQTO/Hx+t1ZTRNZYO77FoJ/6VXAPo7LJc2
         VgLqwpFDf2MYk9TdYnoAh2r2+YBE6N3IYWqg6UMVW8O4PxTl2ZbFdhI9z7gt+2Wxtnwy
         IGznEUmSsusAkCnxAjr+e2HKzQU9Sayb7vmD+o9STp3+nCYEZbY/w8y1PSHMHH++xvD5
         /2J3+HGF3BXoa3c1V8HPhWcthFwekwq3OZmZPh6TDjK2KhkC0hFdz8GMgCp4hoUVrzUJ
         JcHQ==
X-Gm-Message-State: AOAM533xqE/Wg+o8tKenxB0/tz5B+UO0XQfOonOsfpedZDVxy9IEnMYn
        YHz+VVSpx5ucqrJjH5nb6kBOWw==
X-Google-Smtp-Source: ABdhPJzfnCK14YHvzUMUBrZak0qwu6CAvdKuc4cafh2DrzArUw7pQPwvTREIpejvLUZftorefoKmXQ==
X-Received: by 2002:a2e:960e:0:b0:246:8fd:7cd5 with SMTP id v14-20020a2e960e000000b0024608fd7cd5mr7545520ljh.13.1645237619860;
        Fri, 18 Feb 2022 18:26:59 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s2sm434456lfr.126.2022.02.18.18.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 18:26:59 -0800 (PST)
Message-ID: <a1b1d3ef-4131-b8a9-5300-89092bce271b@linaro.org>
Date:   Sat, 19 Feb 2022 05:26:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge attachment
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
 <CAE-0n52iHFtHppZj-g0V1UP5oWzXjbNDjpOd-hgR+F=TqFzjVg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n52iHFtHppZj-g0V1UP5oWzXjbNDjpOd-hgR+F=TqFzjVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/02/2022 02:56, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-02-11 14:40:02)
>> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
>> enable and disable") the DP driver received a drm_bridge instance, which
>> is always attached to the encoder as a root bridge. However it conflicts
>> with the panel_bridge support for eDP panels. The panel bridge attaches
>> to the encoder before the "dp" bridge has a chace to do so. Change
> 
> s/chace/chance/
> 
>> panel_bridge attachment to come after dp_bridge attachment.
> 
> s/panel_bridge/panel bridge/ possibly? And maybe clarify that dp_bridge
> is the "DP driver's drm_bridge instance created in
> msm_dp_bridge_init()"?
> 
> My understanding is that we want to pass the bridge created in
> msm_dp_bridge_init() as the 'previous' bridge so that it attaches the
> panel bridge to the output of the DP bridge that's attached to the
> encoder.

Thanks! I'll update the commit log when pushing the patches.

> 
>>
>> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
>> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
>>   drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
>> index d4d360d19eba..26ef41a4c1b6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>> @@ -169,16 +169,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>>
>>          drm_connector_attach_encoder(connector, dp_display->encoder);
>>
>> -       if (dp_display->panel_bridge) {
>> -               ret = drm_bridge_attach(dp_display->encoder,
>> -                                       dp_display->panel_bridge, NULL,
>> -                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> -               if (ret < 0) {
>> -                       DRM_ERROR("failed to attach panel bridge: %d\n", ret);
>> -                       return ERR_PTR(ret);
>> -               }
>> -       }
>> -
>>          return connector;
>>   }
>>
>> @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>>                  return ERR_PTR(rc);
>>          }
>>
>> +       if (dp_display->panel_bridge) {
>> +               rc = drm_bridge_attach(dp_display->encoder,
>> +                                       dp_display->panel_bridge, bridge,
>> +                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> +               if (rc < 0) {
>> +                       DRM_ERROR("failed to attach panel bridge: %d\n", rc);
>> +                       drm_bridge_remove(bridge);
>> +                       return ERR_PTR(rc);
>> +               }
>> +       }
>> +
>>          return bridge;
> 
> Not a problem with this patch, but what is this pointer used for? I see
> it's assigned to priv->bridges and num_bridges is incremented but nobody
> seems to look at that.


That's on my todo list. to remove connectors array and to destroy 
created bridges during drm device destruction.

-- 
With best wishes
Dmitry
