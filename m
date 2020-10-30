Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FCD2A0170
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 10:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgJ3Jcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 05:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3Jcv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 05:32:51 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84F1C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 02:31:50 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id z24so4725347pgk.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0mBERVLDtSHcobV5rXzV1VXCz/lMoV3S8wOBLlyQgfc=;
        b=P0SUtkBJFHQUGOGWUtZTD15ev+XBR0Yx/F0fFBr2tcMzU/n39ApnJ5+0XxnQtyr1Zb
         cs9I5U2L9qnIsB+nn6IeXumKjQZsHPd506yICOeNJIH+YopgrTp8hlgYpGCLubkDvmrl
         HJQqjLW05i1fpYquRfIKwueTqqNxmupMrTCEapuYmNSB/rDOnyB9TCSdEd0VKOvLpIQK
         5mDCfUVnAj/UNgOhPf7sGypmfUPdP3u6hx7AXxrvlNN6FnBLjbTCYI3fZ0rbgHHqLj/r
         ecSEMXJBa/rmuLIA4C2mrIMKLMtXc6mQdWmO+EgX8H5NwvwloaBqzdgZkGAUpQSIBDtt
         S61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0mBERVLDtSHcobV5rXzV1VXCz/lMoV3S8wOBLlyQgfc=;
        b=Y4/SgYmmMExqA8lJXBwSGOupOXlcU0i8QbewQFdQvg8D8ffD1craIY+axYpIvW1uVX
         pxB2FYpLh5i0fUXhCXOECcBm6Qsp6FqUzJNki3gvxo4+/Pd8WMbs9xuhRXU5vLV13uEQ
         cwJjepk7vjse3OuM3w4AYBqHoSRdxFgKxHanjQac1fxqpBG/8YGGYyE5BAmMdJxzVUbO
         wDLCsU2svE9OiEZc+WmFHdwuPrM0rrm+KD3S4+/zSlmdr5LI7aRVNGmEb+eZCJmgO9WK
         d9Ing9Pp0u311ubDur/0ueg/du4Thv7RGkRUntzAE2J2rW7PESFPUb1YRR+a7om+FcNy
         g3IQ==
X-Gm-Message-State: AOAM532HXAx65YJGBz/92XuWRxamQlhaTBip4wvTe1a+fs1b4HLsdaYg
        jk8L+/9TPdzAQcyW7vWWMZMQ
X-Google-Smtp-Source: ABdhPJzmHTFiUpj8fRe7j2dtUEk4YAeeI/cp4Q/pOnA4XE6X2U494ENjRMpm0dAsPXx9q0pZjgTG3w==
X-Received: by 2002:a17:90a:4b87:: with SMTP id i7mr1826436pjh.68.1604050310001;
        Fri, 30 Oct 2020 02:31:50 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:918:28fe:10d5:aaf5:e319:ec72])
        by smtp.gmail.com with ESMTPSA id n19sm5294222pfu.24.2020.10.30.02.31.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 02:31:49 -0700 (PDT)
Date:   Fri, 30 Oct 2020 15:01:41 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     kuba@kernel.org, davem@davemloft.net, hemantk@codeaurora.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org, willemdebruijn.kernel@gmail.com,
        jhugo@codeaurora.org
Subject: Re: [PATCH v8 2/2] net: Add mhi-net driver
Message-ID: <20201030093141.GC3818@Mani-XPS-13-9360>
References: <1603902898-25233-1-git-send-email-loic.poulain@linaro.org>
 <1603902898-25233-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603902898-25233-2-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 28, 2020 at 05:34:58PM +0100, Loic Poulain wrote:
> This patch adds a new network driver implementing MHI transport for
> network packets. Packets can be in any format, though QMAP (rmnet)
> is the usual protocol (flow control + PDN mux).
> 
> It support two MHI devices, IP_HW0 which is, the path to the IPA
> (IP accelerator) on qcom modem, And IP_SW0 which is the software
> driven IP path (to modem CPU).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   v2: - rebase on net-next
>       - remove useless skb_linearize
>       - check error type on mhi_queue return
>       - rate limited errors
>       - Schedule RX refill only on 'low' buf level
>       - SET_NETDEV_DEV in probe
>       - reorder device remove sequence
>   v3: - Stop channels on net_register error
>       - Remove useles parentheses
>       - Add driver .owner
>   v4: - prevent potential cpu hog in rx-refill loop
>       - Access mtu via READ_ONCE
>   v5: - Fix access to u64 stats
>   v6: - Stop TX queue earlier if queue is full
>       - Preventing 'abnormal' NETDEV_TX_BUSY path
>   v7: - Stop dl/ul cb operations on channel resetting
>   v8: - remove premature comment about TX threading gain
>       - check rx_queued to determine queuing limits
>       - fix probe error path (unified goto usage)
> 
>  drivers/net/Kconfig   |   7 ++
>  drivers/net/Makefile  |   1 +
>  drivers/net/mhi_net.c | 313 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 321 insertions(+)
>  create mode 100644 drivers/net/mhi_net.c
> 

[...]

> +static int mhi_net_probe(struct mhi_device *mhi_dev,
> +			 const struct mhi_device_id *id)
> +{
> +	const char *netname = (char *)id->driver_data;
> +	struct mhi_net_dev *mhi_netdev;
> +	struct net_device *ndev;
> +	struct device *dev = &mhi_dev->dev;
> +	int err;
> +
> +	ndev = alloc_netdev(sizeof(*mhi_netdev), netname, NET_NAME_PREDICTABLE,
> +			    mhi_net_setup);
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	mhi_netdev = netdev_priv(ndev);
> +	dev_set_drvdata(dev, mhi_netdev);
> +	mhi_netdev->ndev = ndev;
> +	mhi_netdev->mdev = mhi_dev;
> +	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
> +
> +	/* All MHI net channels have 128 ring elements (at least for now) */
> +	mhi_netdev->rx_queue_sz = 128;
> +
> +	INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work);
> +	u64_stats_init(&mhi_netdev->stats.rx_syncp);
> +	u64_stats_init(&mhi_netdev->stats.tx_syncp);
> +
> +	/* Start MHI channels */
> +	err = mhi_prepare_for_transfer(mhi_dev);
> +	if (err)
> +		goto out_prep_err;
> +
> +	err = register_netdev(ndev);
> +	if (err)
> +		goto out_register_err;
> +
> +	return 0;
> +
> +out_register_err:
> +	mhi_unprepare_from_transfer(mhi_dev);

Missed this one. MHI stack will do this for you incase of failure.

Thanks,
Mani
