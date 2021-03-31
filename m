Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17B303500DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 15:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235639AbhCaNDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 09:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235711AbhCaNDw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 09:03:52 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4630C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 06:03:52 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id x26so14554214pfn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 06:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u9XdrGG+Ss98tX0l+FbEmlYxAR7jNzWL0u/3NXi/FBI=;
        b=WX58qYBBBOl7TA/HiAyQhDJ/8PIgS25qmAWus5LHysedw+51JR39iJ9vqrIIOS9EIY
         WXwsmUJCKMQ3k38Z33k9KjjcNW2SSy0F/VXbF185gtr/YOOZEPMJjvpWQYPKqqoFHA+s
         7/B5PdbbZAaDgvI12fyF4jfxxUf/k6pzQGr2tQqfRTOmawIjARL1KuDcKa6euA/+eg4M
         FK6w2ykN12/qPTCmbJJ+ePzIK3C++3+DF7rM9NloxQrXyH1CLa7ObfwVVZuZW+tFcNTJ
         ZneJqFCGJ/x1/tEyJCtl1khllFLO1VQldUjpktfHD3oRlWKWuaLf2EEtGK2Hrbla5dsn
         8Heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u9XdrGG+Ss98tX0l+FbEmlYxAR7jNzWL0u/3NXi/FBI=;
        b=q0MaX5MA8MbJr3nCA6EP+XIebi/GiviSs5EbBSHLHiw+GxUh0O3Lk51vOH0fmJ4GJs
         KEGqtFGmIxSkgVV6o72+o4xjgVVEgyqyz6OyCWHaRHxJkrXaBEADUA/FWUAxxj75u8Ll
         g/GOfKm7ws/0EkJZDssoad9lnN5mG//hl5Yy9gG9AciAfP4ey0KkZauIVobTkQArYz9a
         68RbZ/CNV2IPHD5lUwbyhGgku+YMf6pq1gYApTf3F/oIxZ9/QPo15Mgu3jQgv1PxYJS1
         MsQaumPy5q/8H6CfWhEy7bbwYHwqeyM9BKprqzayLahdXj9OmVsd2wP4XOUrXZ9VQDoL
         ra7Q==
X-Gm-Message-State: AOAM530ObYtlhajMEcPAF/FlWSw7sHGEEVFvTEBBKCwcyo8v41BKDpt7
        TP16bHuV2FnjlOdEXfsFzYi2
X-Google-Smtp-Source: ABdhPJxMYQtlgM51wPSpYjrVhGTFwWwSDGNm1NXZYpFnj9IOiNgKNpx71oc4wiCYmvXz5P3ItqlAYw==
X-Received: by 2002:a62:e119:0:b029:1f8:9345:a099 with SMTP id q25-20020a62e1190000b02901f89345a099mr2976900pfh.21.1617195832196;
        Wed, 31 Mar 2021 06:03:52 -0700 (PDT)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id b17sm2284518pfp.136.2021.03.31.06.03.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 06:03:51 -0700 (PDT)
Date:   Wed, 31 Mar 2021 18:33:47 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v5 1/2] bus: mhi: core: Introduce internal register poll
 helper function
Message-ID: <20210331130347.GI15610@work>
References: <1617047583-12104-1-git-send-email-bbhatt@codeaurora.org>
 <1617047583-12104-2-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617047583-12104-2-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 29, 2021 at 12:53:02PM -0700, Bhaumik Bhatt wrote:
> Introduce helper function to allow MHI core driver to poll for
> a value in a register field. This helps reach a common path to
> read and poll register values along with a retry time interval.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/internal.h |  3 +++
>  drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 6f80ec3..005286b 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -643,6 +643,9 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
>  int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>  				    void __iomem *base, u32 offset, u32 mask,
>  				    u32 shift, u32 *out);
> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
> +				    void __iomem *base, u32 offset, u32 mask,
> +				    u32 shift, u32 val, u32 delayus);
>  void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
>  		   u32 offset, u32 val);
>  void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 4e0131b..6f4b630 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -4,6 +4,7 @@
>   *
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-direction.h>
>  #include <linux/dma-mapping.h>
> @@ -37,6 +38,28 @@ int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>  	return 0;
>  }
>  
> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
> +				    void __iomem *base, u32 offset,
> +				    u32 mask, u32 shift, u32 val, u32 delayus)
> +{
> +	int ret;
> +	u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
> +
> +	while (retry--) {
> +		ret = mhi_read_reg_field(mhi_cntrl, base, offset, mask, shift,
> +					 &out);
> +		if (ret)
> +			return ret;
> +
> +		if (out == val)
> +			return 0;
> +
> +		fsleep(delayus);
> +	}
> +
> +	return -ENOENT;

Maybe I'm too late on this one, but I don't think -ENOENT is the correct
error code here. The error code will be returned only when the reg field
value didn't change as expected, so in that case it should be -EINVAL or
-ETIMEDOUT, no?

Thanks,
Mani

> +}
> +
>  void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
>  		   u32 offset, u32 val)
>  {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
