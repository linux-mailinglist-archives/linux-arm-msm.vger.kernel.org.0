Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35B951466C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgAWLdr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:33:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:46880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgAWLdr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:33:47 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1AC5E24125;
        Thu, 23 Jan 2020 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579779226;
        bh=jsDVEn6ja5NJVeYqNpNLIyqtb6IGfpbR451Zikql3UY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S9EWzw3aXLey1uX5iJEdFJaR2r8QCth1t+AU0vJODB0w8rMtaVdGCpgNeJNfwtt76
         tZ6VcDHztBxLjlUCtX2/RNcrAA64Nqu8kRm/xQbIL1Y9eIfnR+Tcz7wdZ4dmdHUUq4
         jN1KKXQAkHURxAeK1ba7aqzgAKkGFq1TCmLr4qkA=
Date:   Thu, 23 Jan 2020 12:33:42 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200123113342.GA976687@kroah.com>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 04:48:22PM +0530, Manivannan Sadhasivam wrote:
> +static inline void mhi_dealloc_device(struct mhi_controller *mhi_cntrl,
> +				      struct mhi_device *mhi_dev)
> +{
> +	kfree(mhi_dev);
> +}

You just leaked memory, please read the documentation for
device_initialize().

:(
