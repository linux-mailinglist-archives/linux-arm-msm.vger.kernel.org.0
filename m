Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A265A14B060
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 08:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgA1HY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 02:24:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:47532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgA1HY4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 02:24:56 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17B0922522;
        Tue, 28 Jan 2020 07:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580196295;
        bh=8d5KEtA0MtcFX/tvwSkP8O3V1B24nyrvW4j3Lhxmx8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AdBCn46c9rWfUGBVe74/2h7HyNSwDIb9KMdgcK5TSNpwJqLOWZ/GpnRcUJn4u+5km
         lVJTFZnzh+DQAfVMErBZ7OoB7lxh5SKMtPGEn/0vTfYRmasHZkuS96dtC6PlLiaQrd
         CWgp18z7JGgWPa+nRAwGWCcglj3ZIdCz0thahZ3A=
Date:   Tue, 28 Jan 2020 08:24:53 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, arnd@arndb.de,
        smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200128072453.GA2103724@kroah.com>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
 <c8fdf0b0-eaec-9672-4f43-f0254d6dbf0e@codeaurora.org>
 <20200127115627.GA16569@mani>
 <c542b098-3c68-2730-87fb-1b679379f9b9@codeaurora.org>
 <20200128063757.GA27811@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200128063757.GA27811@Mani-XPS-13-9360>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 28, 2020 at 12:07:57PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Jan 27, 2020 at 07:52:13AM -0700, Jeffrey Hugo wrote:
> > > > MHI_EE_PBL does not appear to be defined.  Are you perhaps missing an
> > > > include?
> > > > 
> > > 
> > > It is defined in mhi.h as mhi_ee_type.
> > 
> > mhi.h isn't included here.  You are relying on the users of this file to
> > have included that, in particular to have included it before this file. That
> > tends to result in really weird errors later on.  It would be best to
> > include mhi.h here if you need these definitions.
> > 
> > Although, I suspect this struct should be moved out of internal.h and into
> > mhi.h since clients need to know this, so perhaps this issue is moot.
> > 
> 
> Yep. I've moved this enum to mhi.h since it will be used by controller drivers.
> You can find this change in next iteration.

Both of you please learn to properly trim emails, digging through 1200
lines to try to find 2 new lines in the middle is unworkable.

greg k-h
