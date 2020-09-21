Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F8D272A5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 17:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgIUPkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 11:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgIUPkQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 11:40:16 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4789BC061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 08:40:16 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t7so7685824pjd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 08:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YtjtPIEZsoinaFAVxDgpk1B3NYZkPmkWj38acl7FH1U=;
        b=t+XY2b0eKj3jwA4t69q6LtuuOxwHxnBTppkN2KdnnN+PrgUG5Zt+cxuhu3SiZ+r4R3
         7Gn0gi5L3618H1NR+XkSzahNOSXXaONv9ACCpLqiaQk6UZ35C0QDIWQpt9ZtDa6NFD95
         wmLARU6AGehfnPP6cPZ49Vk4ho8ooLzc+frnJ3jJ8KbCB1kCfmEBpYM0enHLHkgMNZyA
         +lMtpuPQaf9KiOIoLkq3AmWq0kVcQlwv6bsvEZdhQ+RTJseydSanEDuBYQ2UR9uzoj5S
         kqTuYM5fih9aGTvlZ86JuNKUyLeH0JTLgsoQnQqqDQ0hGuI9oHR2De3ulZan1k/P8rc2
         wGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YtjtPIEZsoinaFAVxDgpk1B3NYZkPmkWj38acl7FH1U=;
        b=aGzTlbacXag3jKqyaWy/n5pIukT+dPZeydbzdj/KXZ4XQxM+cL4VVq2sASNa77e18o
         c4TcLZlUIvfElBdTlDjcwBn994toajtjLJbVUhvbUbbF72s0Errq1TFtE1Nhu/7ZqTOz
         TtKABckX5A+uKYyUzP12YvntHwsG37IadZCPGaIucMqCgZuc6lpyqGndcpCtOgaJdaqi
         fnb+VvCT0RO2DzTwntQnGUyOv+6xB27WtJ9YubM+C8MK0buZtzK7ItBrX7aRXcs6lr6I
         XLbAGFnHIIrXGxv50onEwHpNg793+bj6EvarhZhpscaaxtypxGBk9+aKBo59E3O4oupz
         Y3NQ==
X-Gm-Message-State: AOAM533WZJQf1q6hFNJPos7KkrSgvuMC58OFZwODFtJ6cli5Omf1oSXM
        CL3HQ8od62+a4jukoitrj7Ju
X-Google-Smtp-Source: ABdhPJzy/qQ+vhrgRFDotpMXKNx+AkY1PCdAjx5hPd0b2y7Q9NGP4CrL/S4yYDXVBUW+MNI5H8ViXA==
X-Received: by 2002:a17:90a:fb53:: with SMTP id iq19mr16373pjb.122.1600702815634;
        Mon, 21 Sep 2020 08:40:15 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id c4sm11000557pjq.7.2020.09.21.08.40.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 08:40:14 -0700 (PDT)
Date:   Mon, 21 Sep 2020 21:10:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, clew@codeaurora.org
Subject: Re: [PATCH v2 2/2] bus: mhi: Remove unused nr_irqs_req variable
Message-ID: <20200921154009.GI3262@Mani-XPS-13-9360>
References: <1600673819-1698-1-git-send-email-loic.poulain@linaro.org>
 <1600673819-1698-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600673819-1698-2-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 09:36:59AM +0200, Loic Poulain wrote:
> nr_irqs_req is unused in MHI stack.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: add this patch to the series
> 
>  drivers/bus/mhi/core/init.c | 3 ---
>  include/linux/mhi.h         | 2 --
>  2 files changed, 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 31961af..8798deb 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -643,9 +643,6 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
>  		mhi_event++;
>  	}
>  
> -	/* We need IRQ for each event ring + additional one for BHI */
> -	mhi_cntrl->nr_irqs_req = mhi_cntrl->total_ev_rings + 1;
> -
>  	return 0;
>  
>  error_ev_cfg:
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 742dabe..0d277c7 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -309,7 +309,6 @@ struct mhi_controller_config {
>   * @total_ev_rings: Total # of event rings allocated
>   * @hw_ev_rings: Number of hardware event rings
>   * @sw_ev_rings: Number of software event rings
> - * @nr_irqs_req: Number of IRQs required to operate (optional)
>   * @nr_irqs: Number of IRQ allocated by bus master (required)
>   * @family_number: MHI controller family number
>   * @device_number: MHI controller device number
> @@ -389,7 +388,6 @@ struct mhi_controller {
>  	u32 total_ev_rings;
>  	u32 hw_ev_rings;
>  	u32 sw_ev_rings;
> -	u32 nr_irqs_req;
>  	u32 nr_irqs;
>  	u32 family_number;
>  	u32 device_number;
> -- 
> 2.7.4
> 
