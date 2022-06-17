Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C94154FE5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 22:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbiFQU3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiFQU3v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:29:51 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5133A5C667
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:29:50 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id c2so8564698lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=W20snk6cSE70N48P0RMhJnXFzqgLSe22yxQ6mQfYe0c=;
        b=DX0iJQCBN7BFYUuCZ5S6I0VMPrwnQVjem4QEuF8tknynjGu5bC/qHybU7IbLnurCxp
         dvd7bEHZhZZGgB2ESsqdzEVeWNZA/Wjzvof3WuKAzqkqaVwT6HICbdPR6AZaG49TGVTQ
         vyK0jPvychmEQkv2NzeQQsgsw+DRM9H/uBPUrf/yTjaWIghnyYplfQkh/6GnFXaN1cvN
         LorTmqFVwNpyRXQYmhEZYUIsxZfv8iDDqZNtjhsLpdqeuzXfYkEqgckoMG6BHHsqoiM+
         tDgplbtRyd3XkuzhqmDjVhUj/aaErSwKx7ufPI7osS6dQdVtkMGkcboWSKd+Sc+qvrjb
         jwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W20snk6cSE70N48P0RMhJnXFzqgLSe22yxQ6mQfYe0c=;
        b=O+Qm5YzKQWYbf5S6/9bbBTcQzk7JbOXX2uZPE7B8xO3QNflYgMN90IiyxFVojKi+pJ
         A+LtZb36EYNLFlTb7TxFrUo4qJtb+nrGX+YUu6s+NHFGxHOJANR2cZp49xqub9ZcM5UI
         1JJ5D1/nfm+HVF53b8PgLeyz/453uxxRVft3SluHl1TeAURrV1argBksDQs+ZPKpkLKN
         wzLx5YN7e/C9TWHIH7BHNtaKnJccGgs8Nf0eipVj5s0HAn6LBTPXkAj1t9sSMER48LjQ
         tNwW0hOZ5TOTj93JtSbJqvbFyz80E7+E5si238w0XMdSRJdHQrMbpUNNaVUbLKFNI9+2
         I+vA==
X-Gm-Message-State: AJIora+VyWwNGvQeQNCOIYJ9OLxBId7Kj3WbXhiZTXSWKpdiLoErPFGT
        TvykiTcIzmbNx6HdjvmlAKZXSQ==
X-Google-Smtp-Source: AGRyM1ua5Z8fyTHi1ZXhgSTwnaNoFg5anxheS6A36/vI+0AGDM0Xh1yxQkxdC2GCE584TGcXIFWYvg==
X-Received: by 2002:a19:4f1e:0:b0:479:278:8d24 with SMTP id d30-20020a194f1e000000b0047902788d24mr6480406lfb.370.1655497788691;
        Fri, 17 Jun 2022 13:29:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d14-20020a19f24e000000b00478f3bb79d6sm752104lfk.194.2022.06.17.13.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 13:29:48 -0700 (PDT)
Message-ID: <5a86e9bf-2447-8175-4d9a-2d644c939841@linaro.org>
Date:   Fri, 17 Jun 2022 23:29:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] drm/msm/dp: remove dp_display_en/disable prototypes
 and data argument
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
 <20220617194921.1098725-2-dmitry.baryshkov@linaro.org>
 <CAE-0n51vDC-a=87hbM_rvxhNNV7KNpCHy3=wH0N5VCEvdrjyuw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51vDC-a=87hbM_rvxhNNV7KNpCHy3=wH0N5VCEvdrjyuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/06/2022 23:15, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-06-17 12:49:21)
>> Remove unused dp_display_en/disable prototypes. While we are at it,
>> remove extra 'data' argument that is unused.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 1e34ac2126f6..42ceb4c5796c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -607,9 +607,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>>          return 0;
>>   };
>>
>> -static int dp_display_enable(struct dp_display_private *dp, u32 data);
>> -static int dp_display_disable(struct dp_display_private *dp, u32 data);
>> -
> 
> This part looks good.
> 
>>   static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
>>                  bool plugged)
>>   {
>> @@ -856,7 +853,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
>>          return 0;
>>   }
>>
>> -static int dp_display_enable(struct dp_display_private *dp, u32 data)
>> +static int dp_display_enable(struct dp_display_private *dp)
> 
> This will conflict with Kuogee's patch[1]

Ack, missed that. I'll rebase it on top of Kuogee's patch and send v2.

> 
>>   {
>>          int rc = 0;
>>          struct msm_dp *dp_display = &dp->dp_display;
> 
> [1] https://lore.kernel.org/r/1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com


-- 
With best wishes
Dmitry
