Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0B852C1A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 19:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240842AbiERRbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 13:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240893AbiERRbG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 13:31:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AECE6452
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 10:31:04 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id c24so4799965lfv.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 10:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=W0khqJIcojkvYp4i+6PmQHGcWlcA75m1iNcSn8ShT7U=;
        b=yTpK9RpaOCMTiTgGpMgZG8XdBWs1CywBpNqPNB29FH4LyQ4Q19n7ZDG+0p0yAbqn8r
         BLjY1LZQvtzo9mGDZ/nJIQGicjEwpVawGRAnTB+TCU8GKGz/8MXPtW9ZbELwHRbRomG7
         WOIH0dHRvGtarMRZNDeaXLjDXfk3TG+VyXheQA2lNSP+fNLwFM0vSsXRBEzz5AQdYH87
         z2enqN7WR88m4xNykkWTEbhRSfwlE/YaTbp0OJ+LcNCFY1f/9F6vNsPL3X+BCG+0DPgG
         Dr/m30YVoa5cq2h+I4NpsPojDin+LKAOeuLnNfeYfb4o/03GlxDTf0SXwTzkpDiVlFvZ
         yg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W0khqJIcojkvYp4i+6PmQHGcWlcA75m1iNcSn8ShT7U=;
        b=Pv0xh2G7Ycro9uL3MfSQnCRWGpdHb8A41LjhIJlhA9biakpEXim6keXoWI3jcWnpxl
         4pJ4wKC8rThSyoqcpOym1YqiId+1PyUSMC7LGxvh2oqP7HpT+vstbHWXcl9gJMOtkNl/
         DpqKyJyS5MvtVMggOtvgppjONWDdSgn3nKWs3TdSG0F/2fRTvpZ74AijfpZHf+qIjFms
         HIvpLuPCPS+0TbHmWpzYPeTlf3aZnCdT6lywKsk6yUBJmO5j7IUzGawPIsO4d0p0qdwq
         l1v/EebdS13l7d2r9hJEnzabtv0BLtQLUAGBpmezgTNh03GkRWJQJv1KvyitYU/br4oZ
         FEKg==
X-Gm-Message-State: AOAM533qybI5iw7ROJEKIuw8Q6BHpODzLqzwl34vysJFA1BvTXMDCxbC
        XASmbQ+OsG0ZhqKEZAMvqNdvmg==
X-Google-Smtp-Source: ABdhPJzfhQnOcGgqw+xluDL3RImpfpueTdknbybj82UpoiEHjdlbUY8XBYfPioSEHPNlaYbP/Hl7yg==
X-Received: by 2002:a05:6512:2622:b0:448:27b9:5299 with SMTP id bt34-20020a056512262200b0044827b95299mr399179lfb.86.1652895062363;
        Wed, 18 May 2022 10:31:02 -0700 (PDT)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id h7-20020a197007000000b0047255d211a1sm5568lfc.208.2022.05.18.10.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 10:31:01 -0700 (PDT)
Message-ID: <38e1f139-6814-db63-1f4b-5a76a1ab0eda@linaro.org>
Date:   Wed, 18 May 2022 20:31:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 0/2] eDP/DP Phy vdda realted function
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1652892186-22346-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqq4fxxgY0mj0JBans3GE-HAuad4Zsf7Ntwy1WW3bHbTQ@mail.gmail.com>
 <98295144-2e05-674b-4983-5f1738480c86@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <98295144-2e05-674b-4983-5f1738480c86@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2022 20:29, Kuogee Hsieh wrote:
> 
> On 5/18/2022 10:16 AM, Dmitry Baryshkov wrote:
>> On Wed, 18 May 2022 at 19:43, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>> wrote:
>>> 1) add regulator_set_load() to eDP/DP phy
>>> 2) remove vdda related function out of eDP/DP controller
>> These patches touch two subsystems and have a dependency between them.
>> How do we merge them?
> 
> currently, both phy and controller are vote for regulator. The last vote 
> will just increase count.
> 
> Therefore the dependency should be very loose.

So, do you propose to merge dp change a cycle after the phy changes go in?

> 
> 
>>> Kuogee Hsieh (2):
>>>    phy/qcom: add regulator_set_load to edp/dp phy
>>>    drm/msm/dp: delete vdda regulator related functions from eDP/DP
>>>      controller
>>>
>>>   drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ------
>>>   drivers/gpu/drm/msm/dp/dp_parser.h  |  6 ---
>>>   drivers/gpu/drm/msm/dp/dp_power.c   | 95 
>>> +------------------------------------
>>>   drivers/phy/qualcomm/phy-qcom-edp.c | 25 ++++++++--
>>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 13 +++++
>>>   5 files changed, 36 insertions(+), 117 deletions(-)
>>>
>>> -- 
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>>> Forum,
>>> a Linux Foundation Collaborative Project
>>>
>>


-- 
With best wishes
Dmitry
