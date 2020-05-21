Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF42A1DD2F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 18:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgEUQTL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 12:19:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:51852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727030AbgEUQTK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 12:19:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2462C206B6;
        Thu, 21 May 2020 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590077950;
        bh=e15Z2IapC6iw7ufu+oWvOHRnnmIszpE2w1NHYkdpsqE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mk2mxBBXG/1tFL6UcGO9BKn6SB0/b891TqxCP1mfz/BEMdoCJuK7wqECaEN65kEHg
         FNvnc0ucqxaKPl0VUhiOFWUO6agHr/A1JFqjdKfqjdZJFBQ47s6da3yD7uQMBPSYQc
         1Ocnbqb40O003AyQecg9iEAaJhTvf65EZKv7/pTU=
Date:   Thu, 21 May 2020 18:19:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/14] MHI patches for v5.8
Message-ID: <20200521161908.GA3532418@kroah.com>
References: <20200521152540.17335-1-mani@kernel.org>
 <20200521152930.GA16101@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521152930.GA16101@Mani-XPS-13-9360>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 21, 2020 at 08:59:30PM +0530, Manivannan Sadhasivam wrote:
> On Thu, May 21, 2020 at 08:55:26PM +0530, mani@kernel.org wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Hi Greg,
> > 
> > Here is the set of MHI patches for v5.8. Most of the patches are cleanup and
> > refactoring ones. All of them are reviewed by myself and Jeff and also
> > verified on x86 and ARM64 architectures for functionality.
> > 
> 
> Greg,
> 
> Sorry, something wrong happened with my git config and these patches were sent
> from my korg ID. Please let me know if I have to resend from my linaro ID to
> match the signed-off-by tag.

Yes, please fix up and resend.

thanks,

greg k-h
