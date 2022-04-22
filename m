Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1E4D50C2A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 01:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233875AbiDVXIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 19:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234818AbiDVXIF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 19:08:05 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53BE01102AD
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 15:40:30 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bj36so11236677ljb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HvxDIQ2uq+rfPe3vdXkNorQHesxhLFFbSAwqENnsprI=;
        b=EcYGv4cJ3+9PBsxDfPWAktdyyCXUMJwCTMckKxnjKPJHFCEcZim9r6fgEtGBOMg+zY
         nMz59RE1LYCSK3PftFl9aBNWikmXpKbImTLHoBlvD3fhtikViNmAhE8aqZgrVLRrLzDv
         v9oz0hjb0n1KmKa3mxAwkOZtoeD1L96+0MobUSHlzgrDjCyMMpzR3PKGWfqZIln/N9pN
         LKXqhQMkiPqhzeiLAgW36rCWfSOfMB7fXw52SzUnErkulRDrcfF5GQz4AYBsDmI1d9gt
         n5KSfZxG/QImkue7an2ZILbiAl06mpT5DxALUhCl7sRu0rz5zHoTvnHwDPTHWxex6X8r
         hjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HvxDIQ2uq+rfPe3vdXkNorQHesxhLFFbSAwqENnsprI=;
        b=6DPAV0zB/414kcroFbxE5BpTt5SkeWhFRTBrtMdUUgicNlInaclsi8ais6N5D/7oKc
         3JEA4iK3k025A28Lx7ACjYKF39emVzPPNQ+FzvwxbkLcEbMu5Go7AFL6yCP0YQ97T8B2
         LDmzyZP7ebMALjQKlpu0ybHX5uPklaU1pDrGDEsS3894qsRqeSq9oS81psJZ9eG1Kz5Q
         TBG1FKDQZIpm0vmBqRV63A6YbhKvwBHANUaQD6E9NpmazbEyTM885+MbltAOg+alWHfI
         XHu9J8HPV98BbYH87tO7hevTcj10r8l2fExsGc+Orah2vqIkOPnACKPjA2HCSEWeJe5l
         g3+w==
X-Gm-Message-State: AOAM532beCGg/MDf+dqPoFZadp5BGWxQUdA2LYfQuPOIfrTfZAiIynPG
        5qkDZyDU+xTy1mzel7qblPsGdA==
X-Google-Smtp-Source: ABdhPJw+B55Dwhesz0KUzHe9Np0IKGcNMaxy5vFC7fBDXVRCJooP1dRI9IlXic6E+/snpQNGxHt8IA==
X-Received: by 2002:a2e:a4c5:0:b0:24e:f7cb:b704 with SMTP id p5-20020a2ea4c5000000b0024ef7cbb704mr2203019ljm.88.1650667228619;
        Fri, 22 Apr 2022 15:40:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k22-20020a056512331600b0046bbeacbd98sm374194lfe.138.2022.04.22.15.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 15:40:28 -0700 (PDT)
Message-ID: <0e6028f6-3fc1-2a27-0a45-0e024c632248@linaro.org>
Date:   Sat, 23 Apr 2022 01:40:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm/dp: fix error check return value of
 irq_of_parse_and_map()
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>, cgel.zte@gmail.com,
        quic_abhinavk@quicinc.com, robdclark@gmail.com, sean@poorly.run
Cc:     airlied@linux.ie, daniel@ffwll.ch, quic_khsieh@quicinc.com,
        bjorn.andersson@linaro.org, linux@roeck-us.net,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Lv Ruyi <lv.ruyi@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
References: <20220422084951.2776123-1-lv.ruyi@zte.com.cn>
 <CAE-0n52nFSUA-3CWa81mE-WUFW8pjOwYsFp-eGOkzupg2cZ9Yg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n52nFSUA-3CWa81mE-WUFW8pjOwYsFp-eGOkzupg2cZ9Yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/04/2022 21:39, Stephen Boyd wrote:
> Quoting cgel.zte@gmail.com (2022-04-22 01:49:51)
>> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>>
>> The irq_of_parse_and_map() function returns 0 on failure, and does not
>> return an negative value.
>>
>> Fixes:  8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index a42732b67349..3926d2ac107d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1239,7 +1239,7 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>>          dp = container_of(dp_display, struct dp_display_private, dp_display);
>>
>>          dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
> 
> Why can't platform_get_irq() be used?
> 
>> -       if (dp->irq < 0) {
>> +       if (!dp->irq) {
>>                  rc = dp->irq;
> 
> zero as an error return value is an error?

Hmm, nice catch. Please fix it. And the other patch too.

> 
>>                  DRM_ERROR("failed to get irq: %d\n", rc);
>>                  return rc;


-- 
With best wishes
Dmitry
