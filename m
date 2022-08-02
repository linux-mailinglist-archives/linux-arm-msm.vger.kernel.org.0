Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56FE9587731
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 08:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbiHBGoF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 02:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235237AbiHBGoD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 02:44:03 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3D148EA2
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Aug 2022 23:44:02 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id e15so10555740lfs.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Aug 2022 23:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ZOIv/vib2AyO0KkqSUf/4LiDcnhQnMzPWNm6fTpfwe4=;
        b=zRsdTe2s2ok+tSA85hlsvI3Tp6wFqiwLQLGt0x5DWPDzHm3bXY1/ITRMp6N3Jo+x7p
         4pKD7OIvDedM5gi0YEQ4Z4v1ftVyjzsl1wFe4zma6Pv7sNCLToGtd08gqYlI39sN8fRW
         KGTHJ0N71mA6p05A4zRR3+2FK7Kb5EhYSz14PVS0G3m/XUv7I1zeRs2w3kdiZBMNeUPG
         tIuDT4HQ3L5BPCoqRAzEQjHb3xwZhw6DpC3aqUsjyyg864A1PpQQK/Z1VZV9gJ38kDfg
         z2OUYd22s9uATlIViBwdaZvCRIfF/YEcGqUdrh+pv9Pz/BsqaazOGmGEF24DHdlLpt3r
         pPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ZOIv/vib2AyO0KkqSUf/4LiDcnhQnMzPWNm6fTpfwe4=;
        b=znSZuvTMWGSj/uhCRZpS8QJhXdNY2KKVUmDbYTW4ASXJwLjr1zyoQoAleLwKbj6Snf
         nDPlQRlmZUsxL6Cu0NW0PpgHX+w4PoioLk8VYr3fmwvR6JW738SpsN6+7gX3eU1PncEN
         y03FAPCuAY9GbZa1jOgkSP04WzYWZpmeyUnX2ILe5UtEhh6letrG3OjeCmJnwUsroXKz
         FGcMhIiJ8tMzWJFN3wO4j0Ob23G9MuX1oxxcnF33YCc7LRGgOVeAqxIJnFJN/h3b/hxk
         8bZRkner2er4Zmbj/47ZzmG8Wzpumk6/uL35rtuNQ6uVZu1wVmFDQ+bvxd120/YJ0QRQ
         v8Kw==
X-Gm-Message-State: AJIora8O/rwot/uzTmtPzzBreZZcCLYOdwqQJCKlWjPo0cr0sj4CtitH
        9Ob0k81m2Lhp7L17i2XXe1sQeg==
X-Google-Smtp-Source: AGRyM1tb/aedcmiebbe1NUyI4UkGBdIxQqcLT2KKnD0mSMr6dbKmSZ1Ja9uT9FYb+wh62/LMA5bbWA==
X-Received: by 2002:a05:6512:3f1e:b0:48a:74cb:1409 with SMTP id y30-20020a0565123f1e00b0048a74cb1409mr6807833lfa.546.1659422640532;
        Mon, 01 Aug 2022 23:44:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b14-20020a05651c032e00b0025d5eb5dde7sm704460ljp.104.2022.08.01.23.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 23:44:00 -0700 (PDT)
Message-ID: <1948d519-9ec0-e874-d51a-6d9f2f5ca3f6@linaro.org>
Date:   Tue, 2 Aug 2022 09:43:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/gpu: Drop qos request if
 devm_devfreq_add_device() fails
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20220708162632.3529864-1-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220708162632.3529864-1-bjorn.andersson@linaro.org>
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

On 08/07/2022 19:26, Bjorn Andersson wrote:
> In the event that devm_devfreq_add_device() fails the device's qos freq
> list is left referencing df->idle_freq and df->boost_freq. Attempting to
> initialize devfreq again after a probe deferral will then cause invalid
> memory accesses in dev_pm_qos_add_request().
> 
> Fix this by dropping the requests in the error path.
> 
> Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 ++
>   1 file changed, 2 insertions(+)


-- 
With best wishes
Dmitry
