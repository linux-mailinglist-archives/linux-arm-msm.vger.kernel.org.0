Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085521CB625
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 19:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgEHRit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 13:38:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:38154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726746AbgEHRit (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 13:38:49 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4661D20731;
        Fri,  8 May 2020 17:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588959528;
        bh=LcXhc6cMcXbwsVbwFfMjNO5c3oOcytqTO2+5PJMjDy4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zk2H+BDOKKror3XONma5AU4Qvh50cl0TMVdYJF4BClLA2hsYgpnU2UJ9jUUHdgYmf
         wMKQlePwRsk+Gl200iJcrCtpVCa61VZgMfWPUf/ic6tNGVr4boMaQ0NcT5PWDW2QI6
         OrL9WHxg9I3TJT7tj9u3UrV7B9jAb1NIqiILy/ww=
Date:   Fri, 8 May 2020 12:43:16 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Replace zero-length array with
 flexible-array
Message-ID: <20200508174315.GC23375@embeddedor>
References: <20200507185016.GA13883@embeddedor>
 <1b3cda25-5f3a-5359-4bf7-d16a8364f545@codeaurora.org>
 <20200508170233.GB23375@embeddedor>
 <c4f4fc47-6add-1ba1-9f06-978003e47c4f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4f4fc47-6add-1ba1-9f06-978003e47c4f@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 08, 2020 at 11:20:16AM -0600, Jeffrey Hugo wrote:
> On 5/8/2020 11:02 AM, Gustavo A. R. Silva wrote:
> > On Thu, May 07, 2020 at 01:24:57PM -0600, Jeffrey Hugo wrote:
> > > >    drivers/dma/qcom/bam_dma.c         |    2 +-
> > > >    drivers/firmware/qcom_scm-legacy.c |    2 +-
> > > >    2 files changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > 
> > > Shouldn't these two files be two different patches?
> > > 
> > 
> > I believe so... I'll split this patch up into two patches.
> > 
> > Thanks
> > --
> > Gustavo
> > 
> 
> Sounds good to me.  When you do, you can add the following if you like
> 
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 

Awesome. :)

Thanks
--
Gustavo
