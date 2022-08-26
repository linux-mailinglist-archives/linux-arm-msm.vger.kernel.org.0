Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D7C5A2408
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 11:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343534AbiHZJST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 05:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343601AbiHZJSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 05:18:15 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366BDD75A6
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:18:09 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l23so1014237lji.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=4tus8epaMHUbmcArRBTPpFlbWX4EVf9W5eBIrU+kqkY=;
        b=qVu8Xb5EIg2/CvU9f9gAfM8LglPh5MxjjdfkYzxqCxO+1yUyAxXS+TqhDivybxTyDk
         RH5EkqCw/3NpMfD+MynhyVqcIoNZ8N4UWQyB6+8BKIft6xChpFmMFJx/5Mx/AeQfCOuK
         taxIcgTW7O96R3cGw/pJFpd5LG8KrsLD7ccspqCCYb3C+yqOiu60J5JFhqr14+HARQKN
         lOXdlO0xPhw+Bib17QapPeYTXIiIrAu9sVAhOFDIpbJslb0J26Hg5Cwya8wehHPQWRp4
         5C1bUMdEwBz16gAAvxF8cUKMbHaoNaNczvdCt+HkUduY8wmCk40rDEsbOtSK2oEwDVds
         eQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=4tus8epaMHUbmcArRBTPpFlbWX4EVf9W5eBIrU+kqkY=;
        b=L0NiZO4ZifK9Fx1dBm2fAEYDB4CtuiZBYg1txghw9QuBOioiLKXdfjpv0m7+geQT0Z
         naVytAeXIG4VO4nbgb+59m0xCI58nBBq35HcOSJRONdbpR+TzndwG3gH9xT2dV71/A7O
         LI6mlymSM9FQZrGBLP+niXiCptPQFc4rAo2DFgYGKVcqCL7H9VptAgjw8cv7CzapeA7J
         nvANlHrCRx6rRZ27NEbLrKx766s+jeQjm7ctbRqTUoIWifx5Ki4JKpAXsuVPXrEM1M4B
         gU8aj0o14JL2DvweEVor8qzqNtwdGqVOIf1L5HoaZe43OzR0zffAMKTVhD99GB9EfpTM
         JTRA==
X-Gm-Message-State: ACgBeo085OndlaTmKM3Ej0ICnIa4etYZIhYM/L3v+73MPsaMJfvOe+TD
        rRIH95q5Rvm3c80ugIylPdGWZA==
X-Google-Smtp-Source: AA6agR6P92JvdVZk+ayg/PXxM10IDYQD7T2TrNgNAYeJOPy+CUj9fLqkhSoLoba1Lj8tOJ3oQJ9TfQ==
X-Received: by 2002:a05:651c:17a0:b0:261:ac0d:6c45 with SMTP id bn32-20020a05651c17a000b00261ac0d6c45mr2042434ljb.225.1661505487989;
        Fri, 26 Aug 2022 02:18:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n8-20020a05651203e800b0048b3a92a2dbsm309954lfq.215.2022.08.26.02.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:18:07 -0700 (PDT)
Message-ID: <1a415bc7-d521-3c13-e61d-26211c00a165@linaro.org>
Date:   Fri, 26 Aug 2022 12:18:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC PATCH] drm/msm: lookup the ICC paths in both mdp5/dpu and
 mdss devices
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
 <CAE-0n51XQEoi-+6njQaz3oR=wMwe+WVnqA1PApmZDuQ3-gjMqg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51XQEoi-+6njQaz3oR=wMwe+WVnqA1PApmZDuQ3-gjMqg@mail.gmail.com>
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

On 24/08/2022 00:31, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-08-05 04:56:30)
>> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
>> index 7b504617833a..d02cd29ce829 100644
>> --- a/drivers/gpu/drm/msm/msm_io_utils.c
>> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
>> @@ -124,3 +126,23 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
>>          work->worker = worker;
>>          kthread_init_work(&work->work, fn);
>>   }
>> +
>> +struct icc_path *msm_icc_get(struct device *dev, const char *name)
>> +{
>> +       struct device *mdss_dev = dev->parent;
>> +       struct icc_path *path;
>> +
>> +       path = of_icc_get(dev, name);
>> +       if (path)
>> +               return path;
>> +
>> +       /*
>> +        * If there are no interconnects attached to the corresponding device
>> +        * node, of_icc_get() will return NULL.
>> +        *
>> +        * If the MDP5/DPU device node doesn't have interconnects, lookup the
>> +        * path in the parent (MDSS) device.
>> +        */
>> +       return of_icc_get(mdss_dev, name);
> 
> Perhaps this would be better served by having another icc_get() API that
> looks in the device and also the parent? Or maybe there should be
> interconnect-ranges (similar to clock-ranges) so that interconnects can
> be mapped to child nodes in DT.

I was not sure how common this situation is, so I did not add the 
helper/API. Typically the driver knows exactly, which node has the 
interconnects. In our case this is complicated because we are 
effectively merging two different driver generations and two different 
bindings. Thus I suppose this situation is quite unique.


-- 
With best wishes
Dmitry

