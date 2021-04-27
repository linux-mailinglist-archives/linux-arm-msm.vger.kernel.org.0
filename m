Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FEF36CB7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 21:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235563AbhD0TLw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 15:11:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34983 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230219AbhD0TLw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 15:11:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619550668; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=v6eUGz19oOlUzlO97WvNXlGdx655IYIHReGP61Hna/U=;
 b=DhFjYTDpfhjGk83ATcINGT4Y4lcw4GvhTWH9s6XqTRX3jVtYo+dJ8exvTBo6vbBU84BwZmxW
 q2AsIkSHQlpF8Wc7TxXmHDHHF4u2W4GUN/yjsa2EBApMiMpbm5wNkifFtki2+2nNTykps1cD
 lwo709yZynFqnd5xyIayNxwxDqE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 608861b7a817abd39a772594 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 19:10:47
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D1E00C43460; Tue, 27 Apr 2021 19:10:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DEC6C433D3;
        Tue, 27 Apr 2021 19:10:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Apr 2021 12:10:45 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] drm/msm: improve register snapshotting
In-Reply-To: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
Message-ID: <cffa1baab24ae7dd6f292726abfaf4d5@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-26 17:18, Dmitry Baryshkov wrote:
> Rework MSM coredump support: add DSI PHY registers, simplify
> snapshotting code.
> 
> Changes since v1:
>  - Readd mutex serializing register snapshot calls
> 
>  - Add DSI PHY register dumping support
> 
Need to mention the dependency here , got missed from the prev patchset
> ----------------------------------------------------------------
> Dmitry Baryshkov (4):
>       drm/msm: pass dump state as a function argument
>       drm/msm: make msm_disp_state transient data struct
>       drm/msm: get rid of msm_iomap_size
>       drm/msm/dsi: add DSI PHY registers to snapshot data
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  5 +-
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c      | 90 
> +++++++----------------
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 21 +-----
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 22 ++----
>  drivers/gpu/drm/msm/dp/dp_display.c               |  4 +-
>  drivers/gpu/drm/msm/dsi/dsi.c                     |  5 +-
>  drivers/gpu/drm/msm/dsi/dsi.h                     |  5 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c                | 11 +--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c             | 31 +++++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h             |  4 +
>  drivers/gpu/drm/msm/msm_drv.c                     | 27 +++----
>  drivers/gpu/drm/msm/msm_drv.h                     |  6 +-
>  drivers/gpu/drm/msm/msm_kms.h                     |  8 +-
>  13 files changed, 97 insertions(+), 142 deletions(-)
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
