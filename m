Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6C84335DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 14:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhJSM0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 08:26:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:55402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230513AbhJSM0q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 08:26:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0B486137B;
        Tue, 19 Oct 2021 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634646274;
        bh=4IrO+sXfnK8xpkI3TCB8EnCCEAY7jnrvePIPQfW4Juo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jx5N/lB97Eleqd/09I9fldRnoVPLx9Xpba9Jtaagtq17H0V9re10EGEueul3r1YUC
         7R4UVAEnjUuPh7W1lG4gfSIIkf9p7CA22wmYfYIX7j277r9dH3IL7eghXyFAJB1lYS
         jdFdLgyFWOi/tU9yuiQbMGgLrXZi3nnysOMFGxfs=
Date:   Tue, 19 Oct 2021 14:24:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        bbhatt@codeaurora.org, loic.poulain@linaro.org, wangqing@vivo.com,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] MAINTAINERS: Update the entry for MHI bus
Message-ID: <YW64/hzKom7MiVDV@kroah.com>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-2-manivannan.sadhasivam@linaro.org>
 <661c564c-e6cd-cbd4-0b17-a7c230d911b2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <661c564c-e6cd-cbd4-0b17-a7c230d911b2@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 18, 2021 at 09:19:16PM -0700, Hemant Kumar wrote:
> 
> 
> On 10/15/2021 11:57 PM, Manivannan Sadhasivam wrote:
> > Since Hemant is not carrying out any maintainership duties let's make
> > him as a dedicated reviewer. Also add the new mailing lists dedicated
> > for MHI in subspace mailing list server.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Great, Manivannan, can you resend just this patch with this reviewed-by
so that I can apply it?

thanks,

greg k-h
