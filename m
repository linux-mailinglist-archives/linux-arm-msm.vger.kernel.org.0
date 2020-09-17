Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C8F26E0EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 18:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbgIQQkT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 12:40:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:46886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728612AbgIQQkR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 12:40:17 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C59972078D;
        Thu, 17 Sep 2020 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600360816;
        bh=PfeDtz/OoPclm3bNfVIaaR8Nu/X3bxOlyimE6jLBMQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N7TgR4sCm108vbJnhxJwG8nd4acMcrZNiVB55Cs/+87LYapRXQL2mJZz8uuhr+HHH
         miRYpE207BTGZZnA0ul12QSG0oU3721WDIJngTYjaKCGbYZTTKHLQaiT56pFO67GsK
         sUgeIdccpwIEuZFAWWgusoBx/CMUoFl9d2Wn8Nxg=
Date:   Thu, 17 Sep 2020 18:40:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v6 4/4] bus: mhi: Add userspace client interface driver
Message-ID: <20200917164047.GB721081@kroah.com>
References: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
 <1600286167-4432-5-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600286167-4432-5-git-send-email-hemantk@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 16, 2020 at 12:56:07PM -0700, Hemant Kumar wrote:
> +/**
> + * struct uci_dev - MHI uci device
> + * @minor: uci device node minor number
> + * @mhi_dev: associated mhi device object
> + * @chan: MHI channel name
> + * @lock: mutex lock
> + * @ul_chan: uplink uci channel object
> + * @dl_chan: downlink uci channel object
> + * @mtu: max tx buffer length
> + * @actual_mtu: maximum size of incoming buffer
> + * @open: open called for device node
> + * @enabled: uci device probed
> + * @ref_count: uci_dev reference count
> + */
> +struct uci_dev {
> +	unsigned int minor;
> +	struct mhi_device *mhi_dev;
> +	const char *chan;
> +
> +	/* protects uci_dev struct members */
> +	struct mutex lock;
> +
> +	struct uci_chan ul_chan;
> +	struct uci_chan dl_chan;
> +	size_t mtu;
> +	size_t actual_mtu;
> +	bool enabled;
> +	struct kref ref_count;
> +};

I don't think you actually made the kernel documentation based on these
lines.

Or if you did, you ignored the warnings :(

Please test build your patches before sending them out...

thanks,

greg k-h
