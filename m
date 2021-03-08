Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61F8331674
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 19:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhCHSpg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 13:45:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:57884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229646AbhCHSpE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 13:45:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5A2765224;
        Mon,  8 Mar 2021 18:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615229104;
        bh=kyKIBXt8+A9C4eKZrQefQXiFzGl3EwBoYE+uRsXOb3c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hHD5mMxfxxk3Da2bEnZ82kGKg8CDTnwU07bNP3DZuqL8SirbIiKX227e4h19dKgOC
         DOrSDmmrwMfCYzRIE/AD9tAJNWPXzd336Fgv1Y+IOU5GQ3Kx3LtJd94M4OveFmQAr8
         r+r8M4seUnE2k/WC8jDNak/AMkVQIEZZfYYwZwKw=
Date:   Mon, 8 Mar 2021 19:45:01 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, aleksander@aleksander.es,
        linux-kernel@vger.kernel.org, kuba@kernel.org
Subject: Re: [PATCH] bus: mhi: Add Qcom WWAN control driver
Message-ID: <YEZwrQg5ZU61XVsj@kroah.com>
References: <1615228851-17783-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615228851-17783-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 08, 2021 at 07:40:51PM +0100, Loic Poulain wrote:
> --- /dev/null
> +++ b/drivers/bus/mhi/wwan_ctrl.c
> @@ -0,0 +1,559 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.*/

It's 2021 now :)

