Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184754300E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 09:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243791AbhJPHmG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 03:42:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:48356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243775AbhJPHmF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 03:42:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD39D6109E;
        Sat, 16 Oct 2021 07:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634369998;
        bh=qcbHl1fGWWDXojY7bO3fExrjfefb6KGpVys1Le3UPE4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eKtHFpQ+BVSHYBWiFbGuJIU2bhm34CCXN6dNVBAOIokayRt6n/7DYEXV5y+yYV+zN
         tKmm0TxnFVNnWJvmB8mHQhe0yCQNwfwmcXCamWyBp5rWV2oLmIyL7h1LsCgoL3qHrL
         mFOumcJalT1KMxABt2Gf4+8C7qZurjMPGc0/wydM=
Date:   Sat, 16 Oct 2021 09:39:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 2/3] bus: mhi: Add inbound buffers allocation flag
Message-ID: <YWqByX6rdfuA1h1F@kroah.com>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016065734.28802-3-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 16, 2021 at 12:27:33PM +0530, Manivannan Sadhasivam wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> Currently, the MHI controller driver defines which channels should
> have their inbound buffers allocated and queued. But ideally, this is
> something that should be decided by the MHI device driver instead,
> which actually deals with that buffers.
> 
> Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> if buffers have to be allocated and queued by the MHI stack.

This is a horrible api.  Now one has to go and look up why "0" was added
to a function as a parameter.

If you don't want to allocate the buffer, then make a function of that
name and call that.  As you only have one "flag", don't try to make
something generic here that is obviously not generic at all.

You all can do better than this.

thanks,

greg k-h
