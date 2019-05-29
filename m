Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A132E74E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 23:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfE2VTI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 17:19:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48364 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbfE2VTI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 17:19:08 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3854360A44; Wed, 29 May 2019 21:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559164747;
        bh=JZCzZFiPCIsa7wae1cbLVZYKt6Ct56+YdloLzObbKL8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ewf6Ifhc8dKZ5jvRROzA+yb8Cjzj1e+ln9lY3ROQ7hyJ0cqv88md2cmoqtcQSi70/
         yxbrtOlak9rmUtkCXk2ICNKIqZ7XpSNna/AaskfFasVDjg/F/NJi4R+NJE0xAL/Cg7
         64TowcbRVD8FSHWeQI64T/AeHxHogCCT1vvuOUSk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 1796A60769;
        Wed, 29 May 2019 21:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559164746;
        bh=JZCzZFiPCIsa7wae1cbLVZYKt6Ct56+YdloLzObbKL8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RKpQzki1zcqhO4bg9uZcwrrb2TMhggb6ctXaG8Gz8ZSriTqkxjZhTn1W7JT++5Fp2
         PsTxERRAdL4HmquvctwrBdesWUg9KuiRya8JM+R/bA32xzSMI2TiAxGIBcXvBmhJdQ
         23UaZ7MI6Eh9PozFfhbhFzZ1TMS6vmz4oZUexn84=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 29 May 2019 14:19:05 -0700
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        jsanka@codeaurora.org, seanpaul@chromium.org,
        nganji@codeaurora.org, chandanu@codeaurora.org,
        hoegsberg@google.com
Subject: Re: [PATCH] drm/msm/dsi: add protection against NULL dsi device
In-Reply-To: <5ae613db-092c-f93d-dd96-a79a4e1eff3a@codeaurora.org>
References: <1551922134-22518-1-git-send-email-abhinavk@codeaurora.org>
 <20190307215947.GG114153@art_vandelay>
 <cd4c2e25f2785bc09da77e715a3d6c30@codeaurora.org>
 <5ae613db-092c-f93d-dd96-a79a4e1eff3a@codeaurora.org>
Message-ID: <455f4e431f1b984e53113d24701a4e05@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-05-29 13:43, Jeffrey Hugo wrote:
> On 3/7/2019 3:02 PM, Abhinav Kumar wrote:
>> On 2019-03-07 13:59, Sean Paul wrote:
>>> On Wed, Mar 06, 2019 at 05:28:54PM -0800, Abhinav Kumar wrote:
>>>> When panel probe happens after DSI probe, the DSI probe
>>>> is deferred as per current design. In the probe defer path
>>>> dsi device is destroyed. This NULL dsi device could be
>>>> deferenced by the panel probe in the mipi_dsi_attach path.
>>>> 
>>>> Check for NULL dsi device before accessing it.
>>> 
>>> It would be really nice to sort all of this out in a manner that's 
>>> not
>>> sprinkling NULL checks around the driver. I spent 5 minutes looking 
>>> around and
>>> couldn't really make sense of how all of these pieces interact, but 
>>> this seems
>>> like it might be an architectural problem (perhaps since dpu was 
>>> using its own
>>> panel stuff instead of drm_panel?).
>>> 
>>> Anyways, it'd be nice to fix that.
>>> 
>>> In the meantime, could you please add a big comment like the !dev 
>>> check in this
>>> function explaining how this situation can come to pass? That way the 
>>> knowledge
>>> isn't lost and whoever comes along to clean up all of these probe 
>>> checks will
>>> have some clue as to what's going on.
>>> 
>>> Sean
>> [Abhinav] Sure Sean, will add a detailed comment to explain the 
>> scenario
> 
> Abhinav, it looks like this may have dropped off your radar.  Do you
> know when you'll come back to it?
Hi Jeff, Yes i will upload a v2 with a detailed comment as sean 
requested within this week.
> 
>>> 
>>>> 
>>>> Reported-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>>> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>>>> ---
>>>>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>> 
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>>>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> index 80aa634..cc2569d 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> @@ -769,7 +769,7 @@ bool msm_dsi_manager_cmd_xfer_trigger(int id, 
>>>> u32 dma_base, u32 len)
>>>>  void msm_dsi_manager_attach_dsi_device(int id, u32 device_flags)
>>>>  {
>>>>      struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>> -    struct drm_device *dev = msm_dsi->dev;
>>>> +    struct drm_device *dev = msm_dsi ? msm_dsi->dev : NULL;
>>>>      struct msm_drm_private *priv;
>>>>      struct msm_kms *kms;
>>>>      struct drm_encoder *encoder;
>>>> -- The Qualcomm Innovation Center, Inc. is a member of the Code 
>>>> Aurora Forum,
>>>> a Linux Foundation Collaborative Project
>>>> 
