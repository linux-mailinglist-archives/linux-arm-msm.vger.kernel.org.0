Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0054E35B212
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Apr 2021 08:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhDKG5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Apr 2021 02:57:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229792AbhDKG5y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Apr 2021 02:57:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DF3E611F2;
        Sun, 11 Apr 2021 06:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618124259;
        bh=bj8Bz2Gg1Fd/BSYFc/mDEOoV3wq3ncBYWmUhmOrBZow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CrpzVljWFNlZVw3wKmqU2/kgNwBPqrKLPAC2sei+7c287n+PmjsSpwTjGLkR0KnPj
         eMm1UHZrCaTHGkO6qkG/1b3mYHe2y6O9mI0R7FL5L/2Vf/kfe/NKspQmELzuJcWkhD
         Uhs83dwBGKVdQ+lmekUFdYgavA5P8vP2/hll7mgA=
Date:   Sun, 11 Apr 2021 08:57:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, jarvis.w.jiang@gmail.com,
        loic.poulain@linaro.org
Subject: Re: MHI changes for v5.13
Message-ID: <YHKdv3A2w0KHYcxx@kroah.com>
References: <20210411055559.GA2068@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210411055559.GA2068@thinkpad>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Apr 11, 2021 at 11:25:59AM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> Here is the MHI Pull request for the v5.13 cycle. I stayed with the PR as the
> number patches got increased.
> 
> Details are in the signed tag, please consider merging!

A suggestion, please put [GIT PULL] in your subject line, so that I know
what this is for, that's a semi-standard thing these days.

Also, you have a number of patches in this set that look like they
should be backported to stable kernels.  Any reason why you did not tag
them with a "Cc: stable@..." tag in the commit?  After they are merged
into Linus's tree, please send the git ids of the commits that should go
to stable kernels to stable@vger.kernel.org so that we can add them
properly.

Now pulled and pushed out, thanks.

thanks,

greg k-h
