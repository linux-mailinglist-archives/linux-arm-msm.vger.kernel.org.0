Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73246270A1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 04:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgISCix (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 22:38:53 -0400
Received: from m42-11.mailgun.net ([69.72.42.11]:13781 "EHLO
        m42-11.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgISCit (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 22:38:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600483128; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Dg+IKLrMf7MCNkBGhSbK0GWFTh2zjW/UmnJw53wNH1M=;
 b=Xtei/iVIPQhwsQG0lw13T2yuhJ0oOW7Ih+sMkaHyFYyMELt8Q1kkcxcQVKVvxIQjWYPrm+fK
 rwTnqVBrJ8jP6fAXJJ0ZJYKbv0zEll9LepWNP0c/1zAZDfhb8kJdl1oUVI2xpH0E8HNrfvH+
 wrLjf17kZOVx/OZNvObcZLd7jhE=
X-Mailgun-Sending-Ip: 69.72.42.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f656f37f1e3eb89c720b2dc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Sep 2020 02:38:47
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11274C433F1; Sat, 19 Sep 2020 02:38:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A797C433C8;
        Sat, 19 Sep 2020 02:38:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Sep 2020 19:38:46 -0700
From:   bbhatt@codeaurora.org
To:     Loic Poulain <loic.poulain@linaro.org>, clew@codeaurora.org
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH] bus: mhi: Remove auto-start option
In-Reply-To: <1600424219-6674-1-git-send-email-loic.poulain@linaro.org>
References: <1600424219-6674-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <5baa5f331edb9feb5314b2d6e32b25e0@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-18 03:16, Loic Poulain wrote:
> There is really no point having an auto-start for channels.
> This is confusing for the device drivers, some have to enable the
> channels, others don't have... and waste resources (e.g. pre allocated
> buffers) that may never be used.
> 
> This is really up to the MHI device(channel) driver to manage the state
> of its channels.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c     | 9 ---------
>  drivers/bus/mhi/core/internal.h | 1 -
>  include/linux/mhi.h             | 2 --
>  net/qrtr/mhi.c                  | 5 +++++
>  4 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index ac19067..7aef6b7 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -727,7 +727,6 @@ static int parse_ch_cfg(struct mhi_controller 
> *mhi_cntrl,
>  		mhi_chan->offload_ch = ch_cfg->offload_channel;
>  		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
>  		mhi_chan->pre_alloc = ch_cfg->auto_queue;
> -		mhi_chan->auto_start = ch_cfg->auto_start;
> 
>  		/*
>  		 * If MHI host allocates buffers, then the channel direction
> @@ -1125,11 +1124,6 @@ static int mhi_driver_probe(struct device *dev)
>  			goto exit_probe;
> 
>  		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
> -		if (ul_chan->auto_start) {
> -			ret = mhi_prepare_channel(mhi_cntrl, ul_chan);
> -			if (ret)
> -				goto exit_probe;
> -		}
>  	}
> 
>  	ret = -EINVAL;
> @@ -1163,9 +1157,6 @@ static int mhi_driver_probe(struct device *dev)
>  	if (ret)
>  		goto exit_probe;
> 
> -	if (dl_chan && dl_chan->auto_start)
> -		mhi_prepare_channel(mhi_cntrl, dl_chan);
> -
>  	mhi_device_put(mhi_dev);
> 
>  	return ret;
> diff --git a/drivers/bus/mhi/core/internal.h 
> b/drivers/bus/mhi/core/internal.h
> index 5a81a42..73b52a0 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -563,7 +563,6 @@ struct mhi_chan {
>  	bool configured;
>  	bool offload_ch;
>  	bool pre_alloc;
> -	bool auto_start;
>  	bool wake_capable;
>  };
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 008b8f6..742dabe 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -214,7 +214,6 @@ enum mhi_db_brst_mode {
>   * @offload_channel: The client manages the channel completely
>   * @doorbell_mode_switch: Channel switches to doorbell mode on M0 
> transition
>   * @auto_queue: Framework will automatically queue buffers for DL 
> traffic
> - * @auto_start: Automatically start (open) this channel
>   * @wake-capable: Channel capable of waking up the system
>   */
>  struct mhi_channel_config {
> @@ -232,7 +231,6 @@ struct mhi_channel_config {
>  	bool offload_channel;
>  	bool doorbell_mode_switch;
>  	bool auto_queue;
> -	bool auto_start;
>  	bool wake_capable;
>  };
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index ff0c414..7100f0b 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -76,6 +76,11 @@ static int qcom_mhi_qrtr_probe(struct mhi_device 
> *mhi_dev,
>  	struct qrtr_mhi_dev *qdev;
>  	int rc;
> 
> +	/* start channels */
> +	rc = mhi_prepare_for_transfer(mhi_dev);
> +	if (rc)
> +		return rc;
> +
>  	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
>  	if (!qdev)
>  		return -ENOMEM;
Hi Loic,

Thank you for your patch. Hemant and I discussed and we are OK with this 
patch.

Adding Chris to ensure that QRTR changes are acceptable.

Thanks,
Bhaumik

The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project'
