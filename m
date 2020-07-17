Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEED52232B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 07:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgGQFBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 01:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgGQFBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 01:01:38 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E3CC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 22:01:38 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a23so3223119pfk.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 22:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UALKXRClGC02xeHs0JTsgRKavWOIIxxwQql983MMEeQ=;
        b=thMCfFZa6VahKZcXKD8fOm9YgjfwI81/rqn1MvJFwr1T7g0UgHj0QWuvSIddHULuAf
         kZ0mb5O9xRD3mjdEbmb9OZ8/14zoNMQOxxwznF+Rc8a4VzrF1gWZifaY8NXnuspXdUaY
         4AYVEu/6wpsHlZRGokYRIO/XCMSVik0TjzWwanX1vH8k5MdIxuVtat4wLGBOA68DC5P8
         yppMRQ2OJLhnu+jmwtpoTlZA3MIBvGoKdIHTZo/llkDHd1gITv2UDrO83sLoDMtS+02K
         Sh5Dtg+cQKXBYkRPI+7ymyy517kIIqHkpxAK/HM6bP3T8u5EVvFNMBo3V088XaFvAIdc
         y4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UALKXRClGC02xeHs0JTsgRKavWOIIxxwQql983MMEeQ=;
        b=kmR7ku6XmQe1UhW54zV3J4UzaPdU2m7YdTIvK6yDtW4QBY2CC6MNTw/9pMRbskFLjL
         0NW8Y59gp1pxkL7JPe8dLYoHBq3z8AdSaifvbdZTxNT1YeCqQbtFMUJOjoVSN0Amt5Lk
         Ro9+OA1IG5S8rTswPRERCsGVbxuWYiMDpRH2liE/DU9UsbZxjitwoK+E1VqcRU0DMoAV
         rggBdDhq+zIdMnXKFsxj1SaiLubSQfB19+kQUoctB2eflekRoHTTuybUyMbhbb8nLs+g
         7eSmcSc+kq3DqNwJVzwNrD54fQK+l4Ukz9wPUWjBMVGrulejpXMdI3cI1YsQdstQE5g4
         fP7g==
X-Gm-Message-State: AOAM532cUR3eUwiIuEahKSUKkqBI52bsRJd0EDbol004R6Y/6/ZDpg0Z
        l9VJGtGXmyMHiYev7nMFrl8/Ug==
X-Google-Smtp-Source: ABdhPJwbcX4n9SrZUABWNa8AmL/mEbl72lWmD3IizIGtVrJP9t1vlVAuCU3yDdM58QIjra0C7IIJJQ==
X-Received: by 2002:a63:475c:: with SMTP id w28mr7449824pgk.222.1594962098177;
        Thu, 16 Jul 2020 22:01:38 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id nl11sm1403110pjb.0.2020.07.16.22.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 22:01:37 -0700 (PDT)
Date:   Thu, 16 Jul 2020 21:59:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_mss: Update MBA log info
Message-ID: <20200717045935.GD2922385@builder.lan>
References: <20200716123630.21892-1-sibis@codeaurora.org>
 <20200716123630.21892-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716123630.21892-4-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Jul 05:36 PDT 2020, Sibi Sankar wrote:

> Update MBA text logs location/size in IMEM to aid tools extract
> them after ramdump collection.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 4ddf084b2c6fc..539594ab955f1 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -932,6 +932,9 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	if (ret)
>  		goto reclaim_mba;
>  
> +	if (qproc->has_mba_logs)
> +		qcom_pil_info_store("mba", qproc->mba_phys, MBA_LOG_SIZE);

Is there a reason why we don't unconditionally write this to the PIL
info? And why it shouldn't be mba_size?

Regards,
Bjorn

> +
>  	ret = q6v5_rmb_mba_wait(qproc, 0, 5000);
>  	if (ret == -ETIMEDOUT) {
>  		dev_err(qproc->dev, "MBA boot timed out\n");
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
