Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB52364EAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 01:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbhDSXem (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 19:34:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:24365 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232027AbhDSXem (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 19:34:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618875252; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hwl8nTT6dKh8EOZQFTZAs2Ja7Ea2F/l23GZj2lQn8hY=;
 b=YEF1yIP5VrcT0eJYokbAe5t4D2BpcGJ6w0js/e3SMWE5vzgooVAOmMjBNgrvykdeSPjz54Nb
 KLdHXPTyK8zHLiUkGwS8FRMuw/zlUfNvikD4/KdhK0rFv+XgbKHK5H2PwhsS/SoxR4kXjmHW
 03W88c13xU9Bq/ymPOrBtuxzHlk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 607e13612cbba88980c32f63 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Apr 2021 23:33:53
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CD275C43217; Mon, 19 Apr 2021 23:33:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CEDD0C433D3;
        Mon, 19 Apr 2021 23:33:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 19 Apr 2021 16:33:51 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        kernel test robot <lkp@intel.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dsi: dsi_phy_28nm_8960: fix uninitialized
 variable access
In-Reply-To: <20210410011901.1735866-1-dmitry.baryshkov@linaro.org>
References: <20210410011901.1735866-1-dmitry.baryshkov@linaro.org>
Message-ID: <ea0542f776687bbd6075c7e923822e0e@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-09 18:19, Dmitry Baryshkov wrote:
> The parent_name initialization was lost in refactoring, restore it now.
> 
> Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into
> a generic code")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 582b1428f971..86e40a0d41a3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -405,6 +405,10 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  	if (!vco_name)
>  		return -ENOMEM;
> 
> +	parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> +	if (!parent_name)
> +		return -ENOMEM;
> +
>  	clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
>  	if (!clk_name)
>  		return -ENOMEM;
