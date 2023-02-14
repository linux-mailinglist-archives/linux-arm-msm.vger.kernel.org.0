Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0600069551E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 01:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjBNACQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 19:02:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjBNACF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 19:02:05 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6054214236
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 16:02:04 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id k16so4540992ejv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 16:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GwxUMyhcUkJOiEorsMtvT9Ot73fs4DVHuCKy2ae0LY=;
        b=r3ccNo6x99wERibYLaLh8KMX4VXb/ZZBnUZE7LUZDRU1a/M/w5NxRJER/CBnlDnp7y
         2pYRR2Bvyq2Pfmb2m0eMcyaNy25SsVt2GHLu336RnSfp5R8KeWhHT9bdxVqHg7SZtwI2
         BHHXJtaHgTsnwcW6WSLJxVDgvWp/oO00DUnECWcZWYRjEBqU1OQFlvyeBF14nkcEUDYt
         +2blSe2DfP8f1z9b2/SUgbn1a9bqYerhVVoz87bdxvz3+1bEpSeB+dHLDd0K0UfQDDo1
         7V/QvL8eVTFb1Z2QKtXcHn/zQrTM+kq1LhXtJ3BHogFDMfuwFOQKUo38UbUzdhikjKyM
         ukiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GwxUMyhcUkJOiEorsMtvT9Ot73fs4DVHuCKy2ae0LY=;
        b=sFhIIu42bk1wolN9fagdHk/+EXpQyES0rr/Yxa2hVqu0OQvOzo0IWPqUQJiY82ast7
         9PATWyBOgqOv/jB4hfu/q2wtW/KdNWehg9xW6+a6p9JqzJmo0qF3uewhoSSszlvEvCKQ
         zZH0wor2saQYWBw1R5mgZRhrVKItqD/ogEXJGvYpZyA++SrMSJJ88yGQ/RR7mDeHhTBD
         IG8A81GFGNMy+wF9jOe32V5S8EuKYUNO7TiAlQHy7UIAa1+O9LKMSC89UJOqEEI4zZQt
         ynbVTMFKzDpILSgRiAl4XZ8wg+2uwkBIXIbWH7tTadUyn/CVbP0eCZAaTnmnF0cE5R+V
         AZEA==
X-Gm-Message-State: AO0yUKXttu4o/E7SUmRJnxEQI9DeVleBxA6j2vPVf/8y45E6XzlOrUl3
        cfWJJ/jyjqbB1mDlB/d4XWtrXw==
X-Google-Smtp-Source: AK7set+371Z/D13l7sLxPSFeRr5/XAP+3WH8iylALqE6KobEx9r/yJQflQy7b77mflN5NZEguX7k5A==
X-Received: by 2002:a17:906:8248:b0:8b1:264d:6187 with SMTP id f8-20020a170906824800b008b1264d6187mr821891ejx.46.1676332922931;
        Mon, 13 Feb 2023 16:02:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id mf6-20020a170906cb8600b00878803d4049sm7548982ejb.93.2023.02.13.16.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 16:02:02 -0800 (PST)
Message-ID: <c5c22875-29c6-971c-da61-bd70db3c3880@linaro.org>
Date:   Tue, 14 Feb 2023 02:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v3 0/4] Move TE setup to prepare_for_kickoff()
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        marijn.suijten@somainline.org
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
 <af5679a4-93b9-fb9b-cc5f-8669da57b7cf@linaro.org>
 <4c23d2d5-fa6b-7548-d189-5b7a1913e266@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4c23d2d5-fa6b-7548-d189-5b7a1913e266@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/02/2023 02:01, Abhinav Kumar wrote:
> 
> 
> On 2/13/2023 1:51 PM, Dmitry Baryshkov wrote:
>> On 13/02/2023 21:48, Jessica Zhang wrote:
>>> Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
>>> functions in both MDP4 and DPU drivers.
>>>
>>> Changes in V2:
>>> - Added changes to remove empty prepare_commit() functions
>>>
>>> Changes in V3:
>>> - Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for
>>>    clarity
>>> - Fixed spelling mistakes and wording issues
>>> - Picked up "Reviewed-by" tags for patches [2/4] and [4/4]
>>
>> Is it just me or patch 4/4 is missing? Patchwork also hasn't seen it:
>> https://patchwork.freedesktop.org/series/113967/
>>
> 
> Yes, not sure what happened there. Even i couldnt see it.
> 
> We have posted in-reply-to now.

It was received properly now, thank you!.

> 
>> If you can send it with the proper in-reply-to (set to 
>> 20230213194819.608-1-quic_jesszhan@quicinc.com), that would be great.
>>
>>>
>>> Jessica Zhang (4):
>>>    drm/msm/dpu: Move TE setup to prepare_for_kickoff()
>>>    drm/msm: Check for NULL before calling prepare_commit()
>>>    drm/msm/dpu: Remove empty prepare_commit() function
>>>    drm/msm/mdp4: Remove empty prepare_commit() function
>>>
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -----------------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  7 -------
>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 ++++++---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 21 -------------------
>>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  5 -----
>>>   drivers/gpu/drm/msm/msm_atomic.c              |  3 ++-
>>>   6 files changed, 9 insertions(+), 56 deletions(-)
>>>
>>

-- 
With best wishes
Dmitry

