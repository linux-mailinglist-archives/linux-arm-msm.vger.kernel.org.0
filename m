Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0454966B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 22:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiAUVBH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jan 2022 16:01:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiAUVBF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jan 2022 16:01:05 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83EF6C06173B
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:01:05 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id v22so1924246ljg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/cvB4LBHX1iUJJ6pMjFmq8Rc+tQVwfrFHdlbMQKEsso=;
        b=BWC2Q+BfElXXHALjANaUBA//Ajbzl30dpQ/P9nJzurdRxwYJDtnXUcy/4Zqt0JKpZB
         LSKZQxlHftfN3y5zO5ybxEocTATbsQIcvzfAppBkDv/6nawtw+ekNLST++AX8f5ZxeN8
         lao9IqEHcGcDGVFNWaVB9pnSyBOgKgu2ed0zggce8tWwy7xEROaNjH01CcP7b9ZSybZT
         UkYHp9llW0in9CziOj8jEOXl4cgTxRADvGEAQ+8eFAXed9iSZn2EC1UYO/T1OtZDqNV9
         dKPMXZjcmUupPAp2igICm3uOEMSaazB38nhU6o6k/Z3Jrqfm+oNCo9f673TpO850J+gY
         NXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/cvB4LBHX1iUJJ6pMjFmq8Rc+tQVwfrFHdlbMQKEsso=;
        b=V28mPbpf1lpTbkS9vBrWOZFZPRGAM8Y4JWzDZeYobeUJaG4RYVb1OXFQbIogqdjOuL
         i7op+41PxoILsBrj1XkkGTEbazJEvlEVeNzJwbxkAr7DpdroRH6nadVlaVxh9ycq558B
         28zDIhvYgATOvQa766tF9Ca5JFjdl3dhvtk7Jb4FlobBVnbqrVlGDxfLkD1+8Wdb8YzE
         KUORPx/Ttkr0Hh6/yDlmlF6tJ1OlOjGz/iuzfCzJIyI8WmD5tRWAzTixdj5caxlG+k+e
         QAqpF5NTmwzVMNvpGVIjqOw84SSClsKQhKYp4lo54O8kAKM1jxrjliJYjrk+kLRX9igo
         Z9zw==
X-Gm-Message-State: AOAM533yYd4ytSRQsjR/9cuFEOSAAbT+74GHeO0yxvwAMrxRB9x5BK/K
        OYfPP7NJpmG01mt5mTJB590c5g==
X-Google-Smtp-Source: ABdhPJzefh4KvJdPjvl6eIx/C+c9ZTyTfgIk/ah3mCBoW0ccOQof0uRnH+MWsi0s4hff7v8bVPiz2A==
X-Received: by 2002:a2e:95cf:: with SMTP id y15mr4365824ljh.132.1642798863862;
        Fri, 21 Jan 2022 13:01:03 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m17sm364405lfc.130.2022.01.21.13.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 13:01:03 -0800 (PST)
Message-ID: <a6e5fb27-8a0f-44bf-c4d3-0619d8fc834f@linaro.org>
Date:   Sat, 22 Jan 2022 00:01:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 5/5] drm/msm/dpu: move VBIF blocks handling to dpu_rm
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-6-dmitry.baryshkov@linaro.org>
 <CAE-0n505KAiLvza2WTRfk8w9qcAH-Z2W6kLMtrOxTNRbUnSJig@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n505KAiLvza2WTRfk8w9qcAH-Z2W6kLMtrOxTNRbUnSJig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/01/2022 04:27, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-01-05 15:10:31)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index bf4d72356a12..2301ac114920 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -78,6 +78,10 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>>                  if (rm->hw_intf[i])
>>                          dpu_hw_intf_destroy(rm->hw_intf[i]);
>>          }
>> +       for (i = 0; i < ARRAY_SIZE(rm->hw_vbif); i++) {
>> +               if (rm->hw_vbif[i])
>> +                       dpu_hw_vbif_destroy(rm->hw_vbif[i]);
> 
> Maybe drop this check and pass NULL to dpu_hw_vbif_destroy() sometimes?
> Then the check can be omitted and the braces dropped

Nice idea. This also applies to dpu_hw_intf_destroy, so I'm going to 
apply it to the previous patch.

> 
>> +       }
>>
>>          return 0;
>>   }
>> @@ -212,6 +216,23 @@ int dpu_rm_init(struct dpu_rm *rm,
>>                  rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
>>          }
>>
>> +       for (i = 0; i < cat->vbif_count; i++) {
>> +               struct dpu_hw_vbif *hw;
>> +               const struct dpu_vbif_cfg *vbif = &cat->vbif[i];
>> +
>> +               if (vbif->id < VBIF_0 || vbif->id >= VBIF_MAX) {
>> +                       DPU_ERROR("skip vbif %d with invalid id\n", vbif->id);
>> +                       continue;
>> +               }
>> +               hw = dpu_hw_vbif_init(vbif->id, mmio, cat);
>> +               if (IS_ERR_OR_NULL(hw)) {
>> +                       rc = PTR_ERR(hw);
>> +                       DPU_ERROR("failed vbif object creation: err %d\n", rc);
>> +                       goto fail;
> 
> If it's NULL then rc will be 0 and fail will return 0. Is that
> intentional?

Actually no. And init functions can not return NULL. So let's fix it too.

> 
>> +               }
>> +               rm->hw_vbif[vbif->id - VBIF_0] = hw;
>> +       }
>> +
>>          return 0;
>>
>>   fail:


-- 
With best wishes
Dmitry
