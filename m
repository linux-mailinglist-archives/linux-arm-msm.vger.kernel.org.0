Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6C922619D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 16:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbgGTOIn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 10:08:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38642 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbgGTOIn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 10:08:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595254122; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=u84s0Oh8TMQ1rIjjsEb2S8vXqRDL0j7r71i7Aou5Cjw=;
 b=gbQDoGph16sTV3Hmm0ZG/ry3N9pizSssXim+2wc8N4VcE7+prbF6paS+xWM/PYfLyx2lAD94
 oCFvqa7n6ORMBXrQXzE9YIoWnvgjePt0KNYMlzkFkfI4T+aInwsLEb+pJpA4s28yT9Sc/Mej
 JR2nR8/VPqF1L/Ii7khPBFZ/VJY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f15a55be3bee12510a03fb9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 14:08:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65DDEC43395; Mon, 20 Jul 2020 14:08:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C4C77C433C9;
        Mon, 20 Jul 2020 14:08:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 20 Jul 2020 19:38:25 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] drm/msm: dsi: dev_pm_opp_put_clkname() only when an
 opp_table exists
In-Reply-To: <1595246509-6584-1-git-send-email-rnayak@codeaurora.org>
References: <1595246509-6584-1-git-send-email-rnayak@codeaurora.org>
Message-ID: <9a03714af98ea8fefa491d049f142789@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-20 17:31, Rajendra Nayak wrote:
> Its possible for msm_dsi_host_init() to fail early, before
> dev_pm_opp_set_clkname() is called. In such cases, unconditionally
> calling dev_pm_opp_put_clkname() in msm_dsi_host_destroy() results
> in a crash. Put an additional check so that dev_pm_opp_put_clkname()
> is called only when an opp_table exists.
> 
> Fixes: f99131fa7a23 ("drm/msm: dsi: Use OPP API to set clk/perf state")
> Reported-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 0a14c4a..4f580f7 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1936,7 +1936,8 @@ void msm_dsi_host_destroy(struct mipi_dsi_host 
> *host)
> 
>  	if (msm_host->has_opp_table)
>  		dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
> -	dev_pm_opp_put_clkname(msm_host->opp_table);
> +	if (msm_host->opp_table)
> +		dev_pm_opp_put_clkname(msm_host->opp_table);
>  	pm_runtime_disable(&msm_host->pdev->dev);
>  }

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
