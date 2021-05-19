Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411F238859D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 05:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237776AbhESDnD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 23:43:03 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:39007 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbhESDnD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 23:43:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621395704; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WqoS9E4WNEnuTzuu8mBefr5gA3kuqZaXEvJiKfOXllI=;
 b=W/jlcN3KTQStc44Xatp1XOvyPSgoVAIO9NG6IMOI/8xZukPYljAWdaJwaMYQNR3UVokpv1vy
 rESJxVtwHf1badhwKELNoMFk3wYN4mIOZTJYKKLbkbU80UCBja0sCISg/eErYDMtbAbkLIW0
 oaBW7KhLVJCRuA+TF5VF2W9aALg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60a488f65f788b52a5821880 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 May 2021 03:41:42
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B9D5AC4360C; Wed, 19 May 2021 03:41:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EA3C2C433F1;
        Wed, 19 May 2021 03:41:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 18 May 2021 20:41:41 -0700
From:   abhinavk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org,
        Tanmay Shah <tanmay@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 0/4] drm/msm/dp: Add support for SC8180x eDP
 controller
In-Reply-To: <20210511042043.592802-1-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
Message-ID: <40f6aefd3fa341e2bec2060106389be7@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn

I had a quick glance on the series and before getting to other things 
wanted to know how you are initializing two different connectors for
DP & EDP resp.

The connector type for DP should be DRM_MODE_CONNECTOR_DisplayPort and 
eDP should be DRM_MODE_CONNECTOR_eDP.
We need both to be created so that both EDP and DP can be supported 
concurrently.

Will these changes work for concurrent eDP and DP case?

Thanks

Abhinav

On 2021-05-10 21:20, Bjorn Andersson wrote:
> The first patch in the series is somewhat unrelated to the support, but
> simplifies reasoning and debugging of timing related issues.
> 
> The second patch introduces support for dealing with different register 
> block
> layouts, which is used in the forth patch to describe the hardware 
> blocks found
> in the SC8180x eDP block.
> 
> The third patch configures the INTF_CONFIG register, which carries the
> configuration for widebus handling. As with the DPU the bootloader 
> enables
> widebus and we need to disable it, or implement support for adjusting 
> the
> timing.
> 
> Bjorn Andersson (4):
>   drm/msm/dp: Simplify the mvid/nvid calculation
>   drm/msm/dp: Store each subblock in the io region
>   drm/msm/dp: Initialize the INTF_CONFIG register
>   drm/msm/dp: Add support for SC8180x eDP
> 
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 99 +++++++----------------------
>  drivers/gpu/drm/msm/dp/dp_display.c |  1 +
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 22 +++++++
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  8 +++
>  4 files changed, 53 insertions(+), 77 deletions(-)
