Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE2E2E65C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 22:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfE2Uni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 16:43:38 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47196 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfE2Uni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 16:43:38 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2388460769; Wed, 29 May 2019 20:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559162617;
        bh=qBy4lmW9DGF9/YaBsWNd/qvMetf/baE4+9e9TucgeSs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PQIVOfZ18XZPxTjlgze5ceTwVT8YtzJN3LQdV41i6SPxLOPyInVk5CSQEfL7zDMAX
         TfKg3OU/2mh3yzCSNvxS5bvQiRLLxYpg1IYD6NzLF5Nn784/aneKzwyBsjgKR4Odxs
         URUZFt/MIlEJE8c7ZGKXR+848PC57ojR2OKLhc6U=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 77B97606DB;
        Wed, 29 May 2019 20:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559162616;
        bh=qBy4lmW9DGF9/YaBsWNd/qvMetf/baE4+9e9TucgeSs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=C967cVxnpJt/5AFVP1nto9BFxVfh0EFMGqw07CZTR4Gs6alujtc7WQ0OopW+80NIq
         TjmCHRUFZKJAqJZLhQo4iBRlFYB6ciJ3oXU+e0AvBYZ4hS8RsS7ovR2AejIsO9tlm5
         OtCnuloyXru/kMhcS9IvaCnTve77NnWJgrstcYTk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77B97606DB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] drm/msm/dsi: add protection against NULL dsi device
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        robdclark@gmail.com, jsanka@codeaurora.org, seanpaul@chromium.org,
        nganji@codeaurora.org, chandanu@codeaurora.org,
        hoegsberg@google.com
References: <1551922134-22518-1-git-send-email-abhinavk@codeaurora.org>
 <20190307215947.GG114153@art_vandelay>
 <cd4c2e25f2785bc09da77e715a3d6c30@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <5ae613db-092c-f93d-dd96-a79a4e1eff3a@codeaurora.org>
Date:   Wed, 29 May 2019 14:43:32 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cd4c2e25f2785bc09da77e715a3d6c30@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/7/2019 3:02 PM, Abhinav Kumar wrote:
> On 2019-03-07 13:59, Sean Paul wrote:
>> On Wed, Mar 06, 2019 at 05:28:54PM -0800, Abhinav Kumar wrote:
>>> When panel probe happens after DSI probe, the DSI probe
>>> is deferred as per current design. In the probe defer path
>>> dsi device is destroyed. This NULL dsi device could be
>>> deferenced by the panel probe in the mipi_dsi_attach path.
>>>
>>> Check for NULL dsi device before accessing it.
>>
>> It would be really nice to sort all of this out in a manner that's not
>> sprinkling NULL checks around the driver. I spent 5 minutes looking 
>> around and
>> couldn't really make sense of how all of these pieces interact, but 
>> this seems
>> like it might be an architectural problem (perhaps since dpu was using 
>> its own
>> panel stuff instead of drm_panel?).
>>
>> Anyways, it'd be nice to fix that.
>>
>> In the meantime, could you please add a big comment like the !dev 
>> check in this
>> function explaining how this situation can come to pass? That way the 
>> knowledge
>> isn't lost and whoever comes along to clean up all of these probe 
>> checks will
>> have some clue as to what's going on.
>>
>> Sean
> [Abhinav] Sure Sean, will add a detailed comment to explain the scenario

Abhinav, it looks like this may have dropped off your radar.  Do you 
know when you'll come back to it?

>>
>>>
>>> Reported-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>>> ---
>>>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> index 80aa634..cc2569d 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> @@ -769,7 +769,7 @@ bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 
>>> dma_base, u32 len)
>>>  void msm_dsi_manager_attach_dsi_device(int id, u32 device_flags)
>>>  {
>>>      struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -    struct drm_device *dev = msm_dsi->dev;
>>> +    struct drm_device *dev = msm_dsi ? msm_dsi->dev : NULL;
>>>      struct msm_drm_private *priv;
>>>      struct msm_kms *kms;
>>>      struct drm_encoder *encoder;
>>> -- 
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>>> Forum,
>>> a Linux Foundation Collaborative Project
>>>


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
