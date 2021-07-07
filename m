Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F263C3BE884
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 15:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhGGNIL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 09:08:11 -0400
Received: from ixit.cz ([94.230.151.217]:41752 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229709AbhGGNIL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 09:08:11 -0400
Received: from [192.168.1.138] (unknown [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 5BA6323B1D;
        Wed,  7 Jul 2021 15:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625663128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zWSz+1KCCe+64ggwoJhKAp3V4eKKh3g0JFCc23En994=;
        b=m3UIverCMCrJRwWf+2a9xNu/WI9pZXXjXSwVBKYJy3McNTmmzNkIn6QskQ8kNvnv3/3kC9
        +kbydd/0Pgs32JYwlUI6VEs4CyTmnO8x5yZXhGLv9D2gyrTOlsC0ZOfy8xCuq4+G+vAKHY
        f8R5AdFZCxzw0Pu7x6wRbaquTjWaFr8=
Date:   Wed, 07 Jul 2021 15:04:39 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v2] drm/msm/dsi: do not use uninitialized kms
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <seanpaul@chromium.org>, robdclark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org
Message-Id: <RNLVVQ.PJPJRVYNANTG1@ixit.cz>
In-Reply-To: <4df2c14e-5e59-0faa-48f8-5425f2c26a8f@linaro.org>
References: <20210705233639.335951-1-david@ixit.cz>
        <4df2c14e-5e59-0faa-48f8-5425f2c26a8f@linaro.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thank you,

tried your proposed solution, works for me (also seems better).

Sending another patch.
Best regards
David Heidelberg

On Wed, Jul 7 2021 at 02:17:14 +0300, Dmitry Baryshkov 
<dmitry.baryshkov@linaro.org> wrote:
> On 06/07/2021 02:36, David Heidelberg wrote:
>> Without this patch boot ends at NULL ptr exception at 
>> msm_dsi_manager_setup_encoder
>> on devices like Nexus 7 with MDP4 version 4.4.
>> 
>> Fixes: 03436e3ec69c ("drm/msm/dsi: Move setup_encoder to 
>> modeset_init")
>> 
>> Signed-off-by: David Heidelberg <david@ixit.cz>
> 
> Being not an expert in the mdp4 sources, I suspect that the fix is 
> not quite correct. I'd suggest setting priv->kms in the 
> mdp4_kms_init() before calling modeset_init().
> 
>> ---
>> 
>> v2: typo in Fixes commit reference
>> 
>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> index 4ebfedc4a9ac..8114612b34b0 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> @@ -230,7 +230,7 @@ void msm_dsi_manager_setup_encoder(int id)
>>   	struct msm_kms *kms = priv->kms;
>>   	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
>>   -	if (encoder && kms->funcs->set_encoder_mode)
>> +	if (encoder && kms && kms->funcs->set_encoder_mode)
>>   		kms->funcs->set_encoder_mode(kms, encoder,
>>   					     dsi_mgr_is_cmd_mode(msm_dsi));
>>   }
>> 
> 
> 
> --
> With best wishes
> Dmitry


