Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871D44132D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 13:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbhIULvp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 07:51:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:54252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231778AbhIULvp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 07:51:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A16D46115A;
        Tue, 21 Sep 2021 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632225017;
        bh=SUUzzZ1b9/I/M7g0g+bLOiG6dvAdzKliqUk5FMO7Eo8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qvMY2H7lItP+h8EC2yvlmd4l41XjN2GdTE6gw2yWSHta/2bcwThj92wgMwxqBHArf
         84ARdd7Mx3nW9O6MsYbl6feNSuINe2D6xUCgidFVU5Vq3ild2zg5ynfOCORpXufi+X
         mB3l8VhFKKz3MrNAfnFlKb257grcVPZkHE8EL8hY=
Date:   Tue, 21 Sep 2021 13:50:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeya R <jeyr@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [RESEND PATCH v2] misc: fastrpc: fix improper packet size
 calculation
Message-ID: <YUnG9j1j9EmcocJ1@kroah.com>
References: <1632223981-30356-1-git-send-email-jeyr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632223981-30356-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 21, 2021 at 05:03:01PM +0530, Jeya R wrote:
> The buffer list is sorted and this is not being considered while
> calculating packet size. This would lead to improper copy length
> calculation for non-dmaheap buffers which would eventually cause
> sending improper buffers to DSP.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Changes in v2:
> - updated commit message to proper format
> - added fixes tag to commit message
> - removed unnecessary variable initialization
> - removed length check during payload calculation
> ---
>  drivers/misc/fastrpc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Again, please read the documentation, changes go below the --- line.

I am _SURE_ there is a guide somewhere at your employer for how to do
all of this properly, right?

thanks,

greg k-h
