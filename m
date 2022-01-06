Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FD2485D23
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 01:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343712AbiAFA23 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 19:28:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343734AbiAFA1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 19:27:53 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E973AC061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 16:27:35 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id i187so1132844qkf.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 16:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=FZUZhQVoUQWqJzUA853fLdLBMkKWI3UHL+a5PMEO3LU=;
        b=MvTefVODGu+w2sWDHyFEDH7NACLiNHHk1g6h/M0jUBo0F1pu8G60Jweh9P390lmZXC
         NU493/fXP8+PYig01VXX2wSuNeSPo42fs6zdRznXWzOOxsfiOHSIWlF3A44LvAh5uRP9
         m5iroRx20d4hhac97bOnHzTR2UMTZyNTnyDi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=FZUZhQVoUQWqJzUA853fLdLBMkKWI3UHL+a5PMEO3LU=;
        b=jeewAKTfyIXBpL2Z9oF45teXJ7X1pWWCPVBfl7kEndTPtBW83rEmy64CUejMq+vzc6
         39EKKIPrywqRlx09INuaXJpqpRLgunq34b3u1OfFCC6qcJQRR4p+/aPuOb23H/CwjKa3
         SLDBFBTwsHHK5pDp4JFveDhR8RGOh6alJkAXGPOKGedKUFoSG3k60zqvohRfCS47VZ/k
         U9wJWYU03jAXzhYE2pUwX41RK5ds5/yXUw/TZ6uzVmjCYzW+tqLHCosM6+ApFLrWiZ3f
         j0IlECPaG12TwyPF20OVRr3IZNnTUkEot26+Zusd79l9aFPjAfF4y2Au7yVxlo23ooKr
         q4NA==
X-Gm-Message-State: AOAM5330KsknSkBmiHeo5MivzONO4kHr7BwJbVr9yDlUJSSMuY15R8QZ
        c6TooTwlQlfLT8ZdqoGmFZYaFQ==
X-Google-Smtp-Source: ABdhPJyMJf0pQajc6sDwDIES/0dgAYQBInmqZyBfpM5tz0/YpMpqQb+QhKex4yeyFXXX89opIckJiQ==
X-Received: by 2002:a05:620a:4244:: with SMTP id w4mr40028827qko.569.1641428855119;
        Wed, 05 Jan 2022 16:27:35 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id z14sm367261qtw.59.2022.01.05.16.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 16:27:34 -0800 (PST)
Message-ID: <06628c19-7839-2719-3263-7ab2b4410502@ieee.org>
Date:   Wed, 5 Jan 2022 18:27:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
From:   Alex Elder <elder@ieee.org>
Subject: Re: [PATCH 06/20] bus: mhi: ep: Add support for registering MHI
 endpoint client drivers
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mhi@lists.linux.dev
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        skananth@codeaurora.org, vpernami@codeaurora.org,
        vbadigan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
 <20211202113553.238011-7-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
In-Reply-To: <20211202113553.238011-7-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/2/21 5:35 AM, Manivannan Sadhasivam wrote:
> This commit adds support for registering MHI endpoint client drivers
> with the MHI endpoint stack. MHI endpoint client drivers binds to one
> or more MHI endpoint devices inorder to send and receive the upper-layer
> protocol packets like IP packets, modem control messages, and diagnostics
> messages over MHI bus.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/bus/mhi/ep/main.c | 85 +++++++++++++++++++++++++++++++++++++++
>   include/linux/mhi_ep.h    | 53 ++++++++++++++++++++++++
>   2 files changed, 138 insertions(+)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index db664360c8ab..ce0f99f22058 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -193,9 +193,88 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
>   }
>   EXPORT_SYMBOL_GPL(mhi_ep_unregister_controller);
>   
> +static int mhi_ep_driver_probe(struct device *dev)
> +{
> +	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
> +	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(dev->driver);
> +	struct mhi_ep_chan *ul_chan = mhi_dev->ul_chan;
> +	struct mhi_ep_chan *dl_chan = mhi_dev->dl_chan;
> +

Either ul_chan or dl_chan must be set, right?  Check this.
Otherwise I think this looks OK.

					-Alex

> +	if (ul_chan)
> +		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
> +
> +	if (dl_chan)
> +		dl_chan->xfer_cb = mhi_drv->dl_xfer_cb;
> +
> +	return mhi_drv->probe(mhi_dev, mhi_dev->id);
> +}

. . .
