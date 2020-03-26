Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC2E21945B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 18:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgCZRmG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 13:42:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726359AbgCZRmG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 13:42:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 45AA520719;
        Thu, 26 Mar 2020 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585244525;
        bh=PR3fTXO4gmBg3C7y7WW919YmnVrJ51lYEcotjqu9Vsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GMDLXo4onAulUghoEQWp9U/bSWTkKfOlCi1SkbavkGGKRppB1Xm4tgWWLRKk5n2LG
         NwdqacWbX10ZfxcIjAsvKBMwKVre2C+it/YkucXDsMKDgMRczDa//5Enpj+agsUU3a
         z0JUAMEzRRrev07Q0m6qsrkUNXf3h01MavEz0BCI=
Date:   Thu, 26 Mar 2020 18:42:03 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     davem@davemloft.net, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Improvements to MHI Bus
Message-ID: <20200326174203.GA1558281@kroah.com>
References: <20200324061050.14845-1-manivannan.sadhasivam@linaro.org>
 <20200326145144.GA1484574@kroah.com>
 <20200326172514.GA8813@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326172514.GA8813@Mani-XPS-13-9360>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 26, 2020 at 10:55:14PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Mar 26, 2020 at 03:51:44PM +0100, Greg KH wrote:
> > On Tue, Mar 24, 2020 at 11:40:43AM +0530, Manivannan Sadhasivam wrote:
> > > Hi Greg,
> > > 
> > > Here is the patchset for improving the MHI bus support. One of the patch
> > > is suggested by you for adding the driver owner field and rest are additional
> > > improvements and some fixes.
> > 
> > I've taken the first 4 of these now, thanks.
> > 
> 
> Thanks Greg! For the future patches after v5.7, how do you want to pick them?
> I assume that you'll be the person picking all "bus" related patches, then
> do you want me to CC you for all patches or just send them as a pull request
> finally?

Sending me patch series like this is good to start with for now.  If it
gets too complex and too big, then we can worry about pull requests.

thanks,

greg k-h
