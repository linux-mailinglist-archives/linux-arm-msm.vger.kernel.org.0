Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E9A22605B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 15:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgGTNCi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 09:02:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58178 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728163AbgGTNCg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 09:02:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595250156; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+8B2VUGhaduI3uJTC0qKLOS8vpqrG5yTlP23NYTVMv4=;
 b=AosQ7VAD+XqygVsBRlzpBvApWnCdRwf8zbSUZ+xc4W2CB4yJ83qu2DVqVKrt6USn72dHJNLR
 52yiwM+vuSRPot2a3XP7TtEQQBunxRhWiUK7Cs6/u/8KV3hylD8OmXdF8KLJ7pQ9PLog09jZ
 +QkcWMDm5Uw+EKk4/JFBDw2eZnc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5f1594d00cb8533c3bcf5b09 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 12:57:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E6F32C433CB; Mon, 20 Jul 2020 12:57:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 01AF3C433C6;
        Mon, 20 Jul 2020 12:57:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 20 Jul 2020 18:27:50 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: dev_pm_opp_put_clkname() only when an
 opp_table exists
In-Reply-To: <1595247476-12968-1-git-send-email-rnayak@codeaurora.org>
References: <1595247476-12968-1-git-send-email-rnayak@codeaurora.org>
Message-ID: <d21e2fba7f1cb9bd61d6d3a6cc4feb8c@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-20 17:47, Rajendra Nayak wrote:
> Its possible that dpu_bind() fails early enough before
> dev_pm_opp_set_clkname() is called. In such cases, unconditionally
> calling dev_pm_opp_put_clkname() in dpu_unbind() can result in
> a crash. Put an additional check so that dev_pm_opp_put_clkname()
> is called only when an opp_table exists.
> 
> Fixes: aa3950767d05 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index f2bbce4..843a1c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1079,7 +1079,8 @@ static void dpu_unbind(struct device *dev,
> struct device *master, void *data)
> 
>  	if (dpu_kms->has_opp_table)
>  		dev_pm_opp_of_remove_table(dev);
> -	dev_pm_opp_put_clkname(dpu_kms->opp_table);
> +	if (dpu_kms->opp_table)
> +		dev_pm_opp_put_clkname(dpu_kms->opp_table);
>  }
> 
>  static const struct component_ops dpu_ops = {

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
