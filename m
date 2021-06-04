Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC9839BD65
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 18:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhFDQls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 12:41:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31815 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229690AbhFDQls (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 12:41:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622824802; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HXpIdY2vbj0NojzSaJ7Uyrt36oUIaQcEBDyp08XuLIQ=;
 b=MN4g3/uVDTbXDaKhhp6jBxccizGrX4D775L3X5sWSN2Vgupx7zEsC/w9PBRrg88ctd7l4jRJ
 IDstxbb/GSkw3hTb2Mei4KZY/dqjlcGO+h/RjxNLyD+5aONhhItnxLAiQZwo3zwPcICrHsZt
 hC58G7sgBjc2c8PjfpWrVC35tkY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60ba575581efe91cda7b81c8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 16:39:49
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EED83C433F1; Fri,  4 Jun 2021 16:39:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B435CC433D3;
        Fri,  4 Jun 2021 16:39:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 04 Jun 2021 09:39:45 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: print error code when MIPI DSI
 host registration fails
In-Reply-To: <20210604104433.1442949-1-dmitry.baryshkov@linaro.org>
References: <20210604104433.1442949-1-dmitry.baryshkov@linaro.org>
Message-ID: <ed82ef06b4e751354fbc73815453aca4@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-04 03:44, Dmitry Baryshkov wrote:
> In order to ease debugging of DSI host registration issues, print 
> return
> code of dsi_mgr_setup_components().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index cd016576e8c5..4df5defdbf4c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -817,8 +817,8 @@ int msm_dsi_manager_register(struct msm_dsi 
> *msm_dsi)
> 
>  	ret = dsi_mgr_setup_components(id);
>  	if (ret) {
> -		pr_err("%s: failed to register mipi dsi host for DSI %d\n",
> -			__func__, id);
> +		pr_err("%s: failed to register mipi dsi host for DSI %d: %d\n",
> +			__func__, id, ret);
>  		goto fail;
>  	}
