Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1101D3257
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgENOMQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:12:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgENOMQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:12:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0031820671;
        Thu, 14 May 2020 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589465534;
        bh=2pWfYmuh60ybLPSPHiIHqd8LDGUDwAyckGQXj4IrKsU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nDNs0fajv5NQ+LzJ7Gd8+iuVGp2crcqoqHo/5flRj7Sn9A0Yufzltxzpl4pIqWznO
         5Fu3gmMFgaOYSzDDULaPz/uUJRrMwuoMZ7cVD3N1Wh6vWPcYBWuP1+6KwPLRV+Ohgm
         I4RdCm7bDbpOYOIAsA6xJK2UhHmG4VnWaBmwAscE=
Date:   Thu, 14 May 2020 16:12:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     arnd@arndb.de, manivannan.sadhasivam@linaro.org,
        bjorn.andersson@linaro.org, wufan@codeaurora.org,
        pratanan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/8] qaic: Create char dev
Message-ID: <20200514141211.GA2643665@kroah.com>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <1589465266-20056-4-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589465266-20056-4-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 08:07:41AM -0600, Jeffrey Hugo wrote:
>  /* Copyright (c) 2019-2020, The Linux Foundation. All rights reserved. */
>  
> +#include <linux/cdev.h>
> +#include <linux/idr.h>
> +#include <linux/list.h>
> +#include <linux/kref.h>
> +#include <linux/mhi.h>
>  #include <linux/module.h>
>  #include <linux/msi.h>
> +#include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/pci_ids.h>
>  
> @@ -13,9 +19,242 @@
>  #define PCI_DEV_AIC100			0xa100
>  
>  #define QAIC_NAME			"Qualcomm Cloud AI 100"
> +#define QAIC_MAX_MINORS			256

Why have a max?

Why not just use a misc device so you make the logic a lot simple, no
class or chardev logic to mess with at all.

thanks,

greg k-h
