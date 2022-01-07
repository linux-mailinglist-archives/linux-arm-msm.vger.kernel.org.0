Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF70487244
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 06:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiAGF0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jan 2022 00:26:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229474AbiAGF0e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jan 2022 00:26:34 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26C1C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 21:26:33 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id x7so11616538lfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 21:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a74v7f2Hv+IdP7z/eazwaJeILmDVIwPUMnvFevEv50o=;
        b=h/3VkUo9knDx+Rc/FxFMShrZTCS4vYa/9S1YN3FvnyogzeWCn9b/X4/RRr6UyHZ3LD
         YB7yaCkQoFw+/zg0cTpEqRro8Yr9i+9CoZEAp9yyYuobFi5/gTJ/y84mJyJ2lDtp9xfS
         y5FwyGMqQJkvrjCRqngOxvZr86JUgFVwHHcVbYNWoxZd+MUIUsF1AC1aXe/J0NW0OVpQ
         8u/XncJbdsgaLZTCRwFCKjJ6KKAWx9WYZJmRJnJGv9vIpewSDojvcw9QYtlH7Zc6D+ZA
         pgsusL51TOgIXaI7WVjYzD7kkPgLLrTitybrBffGfZke9rnwCpn7koF9GbL+AZezAT4U
         s6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a74v7f2Hv+IdP7z/eazwaJeILmDVIwPUMnvFevEv50o=;
        b=aiFmFPMxMK9j0xQK9o/bYyhqH6VD1VEocsMnJ31TECqYVxApqRdBcXC0+jUqp4idJn
         Yj00FdPmVHJtSOdDpZONFmalyiXZEq17MpJvIhsovqNJjA8sx25Lro/4dguTA6G9PmkD
         2sYzfv6T8vmxY9X7rgfeKxtRfaE6kyjwEFEYDd/fUMvGxGwVhHSVLp13Bz/596CzvSft
         OQLcrzGs+TvqzMUBXq6of1AqXHa6ehlTYa/DyYN5IF8mjDZIIg86jgOpF74nL25xJ4qP
         N3UY+Aje7yb0UCPwGt2/LIrwHL39WjxjYylpx3Gajes2w3br16H4tWZlm+LA126Njlmz
         RVaA==
X-Gm-Message-State: AOAM531+4cg/JsOk9gITQnET5NUZolJbsKtDVS2zWvd+yXgeYba7OgvN
        7CLErKMVUZTczPlOOR99GIoyYA==
X-Google-Smtp-Source: ABdhPJzZ8pnVj1Q3UCYFQ8g4E+bQPTlPKB7qjdHEzzD5Cp6cloL6Q6CSqnGQB4vIirxvKUvj4pym7g==
X-Received: by 2002:a05:6512:33ca:: with SMTP id d10mr53900180lfg.431.1641533191684;
        Thu, 06 Jan 2022 21:26:31 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g5sm439133lfj.33.2022.01.06.21.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 21:26:31 -0800 (PST)
Message-ID: <a97cec56-5a8d-2b92-2850-af2a6d3fbf09@linaro.org>
Date:   Fri, 7 Jan 2022 08:26:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC PATCH 2/7] drm/msm/dp: support attaching bridges to the DP
 encoder
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-3-dmitry.baryshkov@linaro.org>
 <CAE-0n51XaV1+rh4CZKz7gMZBPkpq+wHcbNbgHFxoC1ikoDLkhQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51XaV1+rh4CZKz7gMZBPkpq+wHcbNbgHFxoC1ikoDLkhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/01/2022 06:42, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-01-06 18:01:27)
>> Currently DP driver will allocate panel bridge for eDP panels.
>> Simplify this code to just check if there is any next bridge in the
>> chain (be it a panel bridge or regular bridge). Rename panel_bridge
>> field to next_bridge accordingly.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
>>   drivers/gpu/drm/msm/dp/dp_parser.c  | 26 ++++++++------------------
>>   drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
>>   5 files changed, 13 insertions(+), 23 deletions(-)
> 
> I like this one, it certainly makes it easier to understand.
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
>> index a7acc23f742b..5de21f3d0812 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
>> @@ -307,11 +299,9 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
>>          if (rc)
>>                  return rc;
>>
>> -       if (connector_type == DRM_MODE_CONNECTOR_eDP) {
> 
> It feels like this is on purpose, but I don't see any comment so I have
> no idea. I think qcom folks are concerned about changing how not eDP
> works. I'll have to test it out locally.

Ah, another thing that should go into the commit message.

Current situation:
- DP: no external bridges supported.
- eDP: only a drm_panel wrapped into the panel bridge

After this patch:
- both DP and eDP support any chain of bridges attached.


While the change means nothing for the DP (IIUC, it will not have any 
bridges), it simplifies the code path, lowering the amount of checks.

And for eDP this means that we can attach any eDP-to-something bridges 
(e.g. NXP PTN3460).


Well... After re-checking the source code for 
devm_drm_of_get_bridge/drm_of_find_panel_or_bridge I should probably 
revert removal of the check. The function will return -ENODEV if neither 
bridge nor panel are specified.

> 
>> -               rc = dp_parser_find_panel(parser);
>> -               if (rc)
>> -                       return rc;
>> -       }
>> +       rc = dp_parser_find_next_bridge(parser);
>> +       if (rc)
>> +               return rc;
>>
>>          /* Map the corresponding regulator information according to
>>           * version. Currently, since we only have one supported platform,


-- 
With best wishes
Dmitry
