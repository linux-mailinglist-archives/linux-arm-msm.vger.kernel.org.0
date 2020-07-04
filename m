Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC9C2146D5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2020 17:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgGDPNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jul 2020 11:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgGDPNt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jul 2020 11:13:49 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4EB7C08C5DE
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2020 08:13:49 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x8so12774248plm.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2020 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HbZdRnsAxwYdOz809qGptNVNk8B5QrenW1TDYThqvQw=;
        b=QTl2NW4TN72B5TVbNJnaqs2ZelDsWjHj65qyyhOjhqL+Yv4iP2bNCLEHcSI2+cXXV2
         mAQy4t4oihRC9ALkHLHjHCVm4tAoYXQB23rBPp1wYMboBDEVTmDUTmG43P4/C5gSbFRm
         g3cQ3f1yRHO1FbWwCPq0WQ9xPI/kPt9YxPJWQqi4mFbnKYuvQIO6a3n2uIjvAbl9A4qt
         UiaJG620EolePNS3k+QoT3sf71e2CC+BUC/71+lhpe1WyPZcbVlJWr4loAhOiFNxqqUL
         kqU+8iJOie/mV5Y/e96cHuA7AbjHE/waWp0cdUjuk4wRQLfPh4qY4kkQctXkRbV/+z75
         dCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HbZdRnsAxwYdOz809qGptNVNk8B5QrenW1TDYThqvQw=;
        b=OTO8VsClpcsdVGYdqZKwwbKPk463JTj3XjnVufwDRcytfej0TFf4ydYDxXuKRiziXV
         TptjNb1Y/l9H3N6BoCIoqquc8jEjBPSfzSpUWfWvN/qNxkqnWbuTRR6gCN3IXLFeKDmd
         K0EMSvMl3RQtAws2YDtSNd4ZBNs5GAYBsn8Cg93/0wEy5gUh7M027znJKSOO/LFuEExS
         wVJKeWZy47THilinO4W4BXZLEephaWUa9MphV02b3HsEd6tCZhFKYTxJvxX7q0l49sSY
         h7SrAtZnFUlBZ0UBCc7UsImlp/Nl3O4MvQmjTMx0KuKGVe7JZ82ByCD2a8ftTCIOquyN
         ETng==
X-Gm-Message-State: AOAM533ETPEZw7hkxlgGHbkpGQ8j55oJ4ViEF/ovkouMMOUgpv9zQiyL
        w9Ldlbf42V5pxnEcuBOzzRF0
X-Google-Smtp-Source: ABdhPJwwVixniwAjtp/KSRFDFbiQtSK46HISE5B2H00Ln8/wvh40ZXSXSeXH0Ju3gYtLmNyVR7+dpg==
X-Received: by 2002:a17:902:a9c5:: with SMTP id b5mr35024162plr.239.1593875629139;
        Sat, 04 Jul 2020 08:13:49 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:680:29c6:d74:dc5c:e13f:c458])
        by smtp.gmail.com with ESMTPSA id w18sm12984347pfi.89.2020.07.04.08.13.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:13:48 -0700 (PDT)
Date:   Sat, 4 Jul 2020 20:43:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/9] bus: mhi: core: Introduce helper function to
 check device state
Message-ID: <20200704151342.GF3066@Mani-XPS-13-9360>
References: <1593448782-8385-1-git-send-email-bbhatt@codeaurora.org>
 <1593448782-8385-7-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593448782-8385-7-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 09:39:39AM -0700, Bhaumik Bhatt wrote:
> Introduce a helper function to determine whether the device is in a
> powered ON state and resides in one of the active MHI states. This will
> allow for some use cases where access can be pre-determined.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/internal.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index cb32eaf..997c6e9 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -598,6 +598,11 @@ int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
>  int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl);
>  int mhi_send_cmd(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  		 enum mhi_cmd_type cmd);
> +static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
> +{
> +	return (mhi_cntrl->dev_state >= MHI_STATE_M0 &&
> +		mhi_cntrl->dev_state <= MHI_STATE_M3_FAST);
> +}
>  
>  static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl,
>  				      bool hard_wakeup)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
