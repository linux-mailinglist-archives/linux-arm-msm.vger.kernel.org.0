Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45FDC6A3C55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 09:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjB0IWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 03:22:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjB0IWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 03:22:10 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE711C5BB
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 00:22:04 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id t15so5236447wrz.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 00:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i6PJHsvt6qb2PliqFVaIWE8tkWSZx+WyUqPoldm+Qzw=;
        b=dd6F585s/W5bPDiJhFWmlOoeTzESoOubMpxKRjNtipbSroWf44waoJBY5AuFa/FUXM
         b/iDRbre8mADxEAvAJLPXXar7fQ53ynow9TJxJF7q88xzSW9sCrqV1lFLvwOulbVwzU/
         TTKspVmyODWCkToNxYC/OjAmPf0zbibzEYzjMidGZhIvJrEd5vMZWflOjXJpcWG3xHOi
         mA7GQg3m9YCkiRZ36vRp5COZdHWVcHAopKauY735TFrI5d86T+rH49H8bE7YarseQQXd
         XObKNOmRtxi75RWpJuRa5o0KEWi8QROJl6yBMxIGN8aEG0q7Q0ijcelVmi4tlscuO5NB
         dwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6PJHsvt6qb2PliqFVaIWE8tkWSZx+WyUqPoldm+Qzw=;
        b=3ATk0c1KgSM9sg4bxl+mK9xVMKlQ5I8IGzjxBfVS5vPbsyy0Sb16sKSGoT6D/0vlHb
         mQZ8Spah0NgUIV1+SnpUOLPwsd0/q8u8jNUH5zfZZ9y/JY6nXM6oXI2s/Zj76vkCC0Kc
         qwJV77Yx78raUxuvP/rWXPBI3kafJKZbiBr7Kan3lZjA0wBUlwEwFiFhDbl1ttogCu4i
         2w6+FVRmQzXnZlHn9u3jFpb6fbemvylDCZGV7Rs02PPeeUlpsbzf3DM+9Ij0Nj3+lMl+
         CLtaXEmQZp4sR07hI3s0F/z2G2rSsZtO/YXchVFC3ch8XFTK+MSW1GEfel6ioPZq5MUV
         1rPQ==
X-Gm-Message-State: AO0yUKW7hlQQasRz/61hQ1Gsds5BuYBRUmHrA5IsiqBoERYstz1QflG9
        NOv6SzuaR1dOKhV/TT3IVcUtqA==
X-Google-Smtp-Source: AK7set/7vwjRkFb1Br1lmW2ygZlOcpMhiekGbKPQ3saKw5o0QAjuPHeFnhqT9AgI4O7XhCSuKlaGLw==
X-Received: by 2002:a5d:42c4:0:b0:2c7:1c44:5aae with SMTP id t4-20020a5d42c4000000b002c71c445aaemr8652206wrr.12.1677486123474;
        Mon, 27 Feb 2023 00:22:03 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d5947000000b002c5a07e940csm6428220wri.33.2023.02.27.00.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:22:03 -0800 (PST)
Message-ID: <45387999-a930-c03f-1acd-a02b9b4b3b3b@linaro.org>
Date:   Mon, 27 Feb 2023 09:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for DRM Panels
 drivers
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org>
 <Y+9awrqcQIOQNeaX@ravnborg.org>
Organization: Linaro Developer Services
In-Reply-To: <Y+9awrqcQIOQNeaX@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sam !

On 17/02/2023 11:45, Sam Ravnborg wrote:
> On Fri, Feb 17, 2023 at 10:58:15AM +0100, Neil Armstrong wrote:
>> Add myself as co-maintainer for DRM Panel Drivers in order to help
>> reviewing and getting new panels drivers merged.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thanks for stepping up!
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks for you trust!

Is there anybody else willing to ack ? Thierry ?

Neil

>> ---
>>   MAINTAINERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index be167c695c64..18fd7548a49b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7043,6 +7043,7 @@ F:	drivers/gpu/drm/xlnx/
>>   
>>   DRM PANEL DRIVERS
>>   M:	Thierry Reding <thierry.reding@gmail.com>
>> +M:	Neil Armstrong <neil.armstrong@linaro.org>
>>   R:	Sam Ravnborg <sam@ravnborg.org>
>>   L:	dri-devel@lists.freedesktop.org
>>   S:	Maintained
>>
>> ---
>> base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
>> change-id: 20230216-topic-drm-panel-upstream-maintainance-6d5cae28d184
>>
>> Best regards,
>> -- 
>> Neil Armstrong <neil.armstrong@linaro.org>

