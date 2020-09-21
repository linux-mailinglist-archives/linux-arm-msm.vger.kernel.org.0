Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A870B2726DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 16:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgIUOWj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 10:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgIUOWj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 10:22:39 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03D9C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 07:22:38 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id l191so9174588pgd.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xWVNeESskRe6aXb3s4jznlV1D1f6mrCoK3e+3dFwrmQ=;
        b=pbxOhI37VANeSKHsJLheMgN19V2S0pcisDG1SA7CStFtdSOk07zKyJmU7jgBcTBMWm
         ypwcWcDtyHLNVdRP28hk9TWsgQ63QbPDggX1S8kC8CoGPk59aB3mPZpgtUFox4ScqIZH
         ZSegn0cnUxTgP2O+1xlhj5S1QIyFUnGgJZf+rKb2Ffr+iOBSjSkgTYZeYPaXhQKiwTRU
         pcUfQ6VG4n5p+nj26ety05WBOhfjXVg+fkiRz1DSzSddBda55x0s4mTtNybdiLZ2Yl/T
         AzYg7fxliJituRFeX1mpGBbNtE1FxIv71vMgF4DGkaNn6JP/o+oizCB3L4ZcdM9JgGq8
         wW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xWVNeESskRe6aXb3s4jznlV1D1f6mrCoK3e+3dFwrmQ=;
        b=AwU49POTG9cehLFYDW07nrWa10DtAyC3cgTW19JCLxZYHA6Rn4YuVXqOMIA0+fzmMV
         95TNRLjVthm8zLUPyr9vvIvrwI1pKnf57AatBGKwAtnWM3x9QPFROerZMVcQ/KmBM9HM
         RGRWgVPjWDCTs8Qipq5tO8pQja5ZRZCiNJIjxVyFFYS5ZK5Eq63j350FJJSAUp2sBXNY
         ZWpz6Jdf9yAwoMEk0dAYGjCg8gT4TVuoiX7uKCcALYQjAlTQbH/nHUqgHPr7+z2H75H0
         TyvLLXeqDR/s1ciecLxXWUY/29kpg8BEUWMMookii3gDl3I/TcWc3vW3WbEl8uI4DwmP
         yR8A==
X-Gm-Message-State: AOAM533BPGXiPXIODtApLHmT00lZgyF9WkUQ31nHhSYEiuP9Wx6lS99I
        Gw334aJOSjBonpHWpeAuYv6c
X-Google-Smtp-Source: ABdhPJzTVRN8kCVYcvprwDykJWi89VRsbJEfnKEE0dBbzYgsD7SfBCK+Ial8mJEMCZHWDfA+09HZPA==
X-Received: by 2002:a17:902:76c4:b029:d1:bb1a:d31b with SMTP id j4-20020a17090276c4b02900d1bb1ad31bmr246325plt.6.1600698158396;
        Mon, 21 Sep 2020 07:22:38 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id m13sm12136215pfk.103.2020.09.21.07.22.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 07:22:37 -0700 (PDT)
Date:   Mon, 21 Sep 2020 19:52:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, clew@codeaurora.org
Subject: Re: [PATCH v2 2/2] bus: mhi: Remove unused nr_irqs_req variable
Message-ID: <20200921142232.GH3262@Mani-XPS-13-9360>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
