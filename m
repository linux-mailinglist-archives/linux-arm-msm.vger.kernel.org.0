Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B08B50C362
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 01:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbiDVXIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 19:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234946AbiDVXIR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 19:08:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1667D23D466
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 15:41:02 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y32so16660414lfa.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 15:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=9OGcVwu87n3nund5h+/ahM8cEAIF7XFZ15UqXk1Yef4=;
        b=CAbZr1b6SoLRrn/4p8RcK6MLkzVkZgvKehcD3ykk64L1/GQ5UmB431dmyJGGomJr5t
         dRPHBDtHDtmmCotIXNa3FMpfZrYi+pzKGLfCTdphzfy5ur+Hj4gdLnD9XHOrU2Ql1nPp
         JeLDHlxeu2zfMIxQj6Ir6A6i003s57R/ADVSBgIne7y4GpHjpuvtOzWcUUiOg2qIgrWK
         TZedyUdVBjOeQW9AspdDmo51QngzQnuez6hlfVK0RFZHmoeA5cuKYT57ag9lMEoDGKbW
         PYn1Psu3wJkuFyzBpeYMhGYKOUograhAi5d1twBLHe6Iv6Vvr3S1H9fK5uf5aXRdESbk
         DmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=9OGcVwu87n3nund5h+/ahM8cEAIF7XFZ15UqXk1Yef4=;
        b=JxlZW4uLROz6peRXV+ac9RsarNV8iH9nuBenNiloCmVktGCsvkiNnCqdhXOtb36SRc
         8Gdl+PDShJ7mPQwGDQvoarbqM3LMwKajAyMkPhbhgoV/RwQvquea3/i0CZR2PSyPEQjt
         yM1i/nNIccCATfmFNrYvYU/ZDSsgoTyvfc09vrT7hi4vkkDZi9UN1DBCM/VZLTvrzQGt
         nUgdPSlB36zZL//a1os4rOHRozMZ+BHSpOIhZHhzNitj8zJeKs3rZGL9Xr3qmi9398XU
         jkqjZc18XhoDtDkQKeFlhoFSSxyjze4UlLSslJ2WFmLC6Dnpl9LwHTRopRsBsk5k1X6n
         t73Q==
X-Gm-Message-State: AOAM532Mem2T+xXjxjRwh75E4bQsTgd58s5WeKEYwWexb8Iy1mHRnt8X
        4FRXfGPhfWSZ0xWn1hIvmCPFLA==
X-Google-Smtp-Source: ABdhPJzys8moEhv4YW8LsUgDZNfCdy9bUPFmjV3EvTn8K635yo6mVPcZHalEKkB0DlcYfz1pZkkM7g==
X-Received: by 2002:a05:6512:1193:b0:471:af88:2d74 with SMTP id g19-20020a056512119300b00471af882d74mr4515551lfr.531.1650667260391;
        Fri, 22 Apr 2022 15:41:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e1-20020a196741000000b0046bc4be1d60sm376636lfj.123.2022.04.22.15.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 15:41:00 -0700 (PDT)
Message-ID: <39b3828e-064c-6aa4-de77-35b201b1b40f@linaro.org>
Date:   Sat, 23 Apr 2022 01:40:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm: msm: fix error check return value of
 irq_of_parse_and_map()
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     cgel.zte@gmail.com
Cc:     robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com,
        airlied@linux.ie, daniel@ffwll.ch, swboyd@chromium.org,
        quic_mkrishn@quicinc.com, angelogioacchino.delregno@collabora.com,
        vulab@iscas.ac.cn, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20220422085211.2776419-1-lv.ruyi@zte.com.cn>
 <CAA8EJpoAeCp-=k2o+C4E4jHBAv7f3eKrV5FZiYjVZ8hcRGYLVA@mail.gmail.com>
In-Reply-To: <CAA8EJpoAeCp-=k2o+C4E4jHBAv7f3eKrV5FZiYjVZ8hcRGYLVA@mail.gmail.com>
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

On 22/04/2022 13:42, Dmitry Baryshkov wrote:
> On Fri, 22 Apr 2022 at 11:52, <cgel.zte@gmail.com> wrote:
>>
>> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>>
>> The irq_of_parse_and_map() function returns 0 on failure, and does not
>> return an negative value.
>>
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> index 3b92372e7bdf..1fb1ed9e95d9 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> @@ -570,7 +570,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>>          }
>>
>>          irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
>> -       if (irq < 0) {
>> +       if (!irq) {
>>                  ret = irq;

As noted by Stephen, this will cause the function to prematurely return 
0 (success).

>>                  DRM_DEV_ERROR(&pdev->dev, "failed to get irq: %d\n", ret);
>>                  goto fail;
>> --
>> 2.25.1
>>
> 
> 


-- 
With best wishes
Dmitry
