Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D495413F65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 04:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhIVC1s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 22:27:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:24196 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229465AbhIVC1r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 22:27:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632277578; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HBIj9y/dOEV38bF8oglc0yFL8IUbDQo6kKXrXgkmOzk=;
 b=Gp/jir53mXJJcHRaC8GOorZ/omA8ozEuroHzDby40AdnWHwiTJ+Fowp5RlujGGUnog574y+5
 qwTNRNMB3ZEhK6QR+OEy6YtnQkiY9xkJZ4s26+JQCcjz0ijnzPaeo+4kM84crXvxWTaqZ/xS
 hQAmAdx5YRhApV42xqprEWoYMQw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 614a944a507800c8804bf9ae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 02:26:18
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B6487C43619; Wed, 22 Sep 2021 02:26:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CA0D0C4338F;
        Wed, 22 Sep 2021 02:26:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Sep 2021 19:26:16 -0700
From:   abhinavk@codeaurora.org
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, swboyd@chromium.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v2 08/13] drm/msm/dpu_kms: Re-order dpu
 includes
In-Reply-To: <20210915203834.1439-9-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-9-sean@poorly.run>
Message-ID: <f032fea59dcbae853333a6b25e5146b7@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-15 13:38, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Make includes alphabetical in dpu_kms.c
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run
> #v1
> 
> Changes in v2:
> -None
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ae48f41821cf..fb0d9f781c66 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -21,14 +21,14 @@
>  #include "msm_gem.h"
>  #include "disp/msm_disp_snapshot.h"
> 
> -#include "dpu_kms.h"
>  #include "dpu_core_irq.h"
> +#include "dpu_crtc.h"
> +#include "dpu_encoder.h"
>  #include "dpu_formats.h"
>  #include "dpu_hw_vbif.h"
> -#include "dpu_vbif.h"
> -#include "dpu_encoder.h"
> +#include "dpu_kms.h"
>  #include "dpu_plane.h"
> -#include "dpu_crtc.h"
> +#include "dpu_vbif.h"
> 
>  #define CREATE_TRACE_POINTS
>  #include "dpu_trace.h"
