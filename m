Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4601CBDE9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 07:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbgEIFtT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 01:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728952AbgEIFtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 01:49:19 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1D3C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 22:49:18 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id fu13so5243853pjb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 22:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UTsYNNg6/ImkBFmD+Mx+o8hefWjZHqjjHqjvwNd6AaI=;
        b=KWpBbfDNThXu0samEeWM29vOiWvpu8bLxOq8vtogPK4chc1jyMzdaIKh2bH3uXnPOJ
         O1/Z9EivVp8xAYBnw92K8gKiR9Jx97wf7m86eWMtdj91DMsdiV41QkFXwkfpzmaoG0iL
         ox+ZjcuLM4UJegbJ67vEC8n/GIV3Ilkq5ptfOAnRptAjC94Wk5ATFS0VzKiNz2PtaRtw
         XNtQt0bVmYUaeVm7KvwzHY3xEzVrCgHVK5xxmk1QlkhLJt7+5XwK9+JfT3BsRoEet2H4
         zPYFvlGMT73gmKk7Udha74SQogviTkysjoKmNK9EtzzRumTgUD0oWPr+84HkXuIPLPVr
         r7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UTsYNNg6/ImkBFmD+Mx+o8hefWjZHqjjHqjvwNd6AaI=;
        b=ciVMTpPR9BJiy2zOkEREQp8uMhNKbtH795rFJYYEK+qaKfABQWJhpmpf3fzpp7v8Vb
         bFerpMAhQn3GCuibPwP52QY0rg1wgTUeKtkweHNZLlwLda7OKb+mWW7ebghT0XrVPl3p
         +dluIUFRh4FT+1ZoeK2HAMTNYpFzFuDwIbdlHFPUVfuVSV6P4mkggojNmzbkeQoGG4H/
         XV/Swi5NsL61iccRgumqHaCzowswuMEitI3RA/hzfGng6vIEdmMfooYTJPh1OLPLeLQi
         3WHbf/5WyWEQdy1jUnX+sg0x6NJAFMkBgpIQXFmnemVXKxTGFWZP5nj8Lz/Mg89iow5N
         yqKQ==
X-Gm-Message-State: AGi0PuYWXbZYlZfpYeeLH4msCljl+IAk4sRmvl21EP82mpY+ZN1uT2XH
        Ry/1JSl4C5TT1DLyP5qZ90eQ
X-Google-Smtp-Source: APiQypLLc1C6DFA08CoY4IdmL7MfLAuWYGg5shRu8jEKGB2/9SEa/nFSEdsrrOtjaYE1m/feRk2kzA==
X-Received: by 2002:a17:90a:8c9:: with SMTP id 9mr9910633pjn.183.1589003358252;
        Fri, 08 May 2020 22:49:18 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e0c:55d2:2cb4:da01:ad1e:6ad9])
        by smtp.gmail.com with ESMTPSA id gv7sm3824144pjb.16.2020.05.08.22.49.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 22:49:17 -0700 (PDT)
Date:   Sat, 9 May 2020 11:19:11 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v7 4/8] bus: mhi: core: Read transfer length from an
 event properly
Message-ID: <20200509054911.GD5845@Mani-XPS-13-9360>
References: <1588991208-26928-1-git-send-email-bbhatt@codeaurora.org>
 <1588991208-26928-5-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588991208-26928-5-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 08, 2020 at 07:26:44PM -0700, Bhaumik Bhatt wrote:
> From: Hemant Kumar <hemantk@codeaurora.org>
> 
> When MHI Driver receives an EOT event, it reads xfer_len from the
> event in the last TRE. The value is under control of the MHI device
> and never validated by Host MHI driver. The value should never be
> larger than the real size of the buffer but a malicious device can
> set the value 0xFFFF as maximum. This causes driver to memory
> overflow (both read or write). Fix this issue by reading minimum of
> transfer length from event and the buffer length provided.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 30798ec..6a80666 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -514,7 +514,10 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  				mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
>  
>  			result.buf_addr = buf_info->cb_buf;
> -			result.bytes_xferd = xfer_len;
> +
> +			/* truncate to buf len if xfer_len is larger */
> +			result.bytes_xferd =
> +				min_t(u16, xfer_len, buf_info->len);
>  			mhi_del_ring_element(mhi_cntrl, buf_ring);
>  			mhi_del_ring_element(mhi_cntrl, tre_ring);
>  			local_rp = tre_ring->rp;
> @@ -598,7 +601,9 @@ static int parse_rsc_event(struct mhi_controller *mhi_cntrl,
>  
>  	result.transaction_status = (ev_code == MHI_EV_CC_OVERFLOW) ?
>  		-EOVERFLOW : 0;
> -	result.bytes_xferd = xfer_len;
> +
> +	/* truncate to buf len if xfer_len is larger */
> +	result.bytes_xferd = min_t(u16, xfer_len, buf_info->len);
>  	result.buf_addr = buf_info->cb_buf;
>  	result.dir = mhi_chan->dir;
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
