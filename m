Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4B5F1D45FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 08:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgEOGhl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 02:37:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:50884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgEOGhl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 02:37:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 718992065F;
        Fri, 15 May 2020 06:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589524660;
        bh=/sejV8BirlA+9XJW7afKnpotS1fQXEqPb8/TeQ6TDYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xxppYZUv2kisbDZrnltv/c6K4fzrP9l7WQz1h1yifRH3No6IR1HFWaAEvQdB6QxOn
         Yo376PHcJjyyqnHjzp8yJ5swSubvROWSCeI4gp/Q3z0YET3LnSw8T8+nnlJxz3Qt7V
         +V7jy71pWwfHu+RtWWNHDBIB7V8aJJi57utGHspQ=
Date:   Fri, 15 May 2020 08:37:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     arnd@arndb.de, manivannan.sadhasivam@linaro.org,
        bjorn.andersson@linaro.org, wufan@codeaurora.org,
        pratanan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/8] qaic: Add skeleton driver
Message-ID: <20200515063738.GA1006524@kroah.com>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <1589465266-20056-2-git-send-email-jhugo@codeaurora.org>
 <bc74cb1d-cd97-819c-5e0d-e9cd1e01dbf4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc74cb1d-cd97-819c-5e0d-e9cd1e01dbf4@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 06:43:06PM -0600, Jeffrey Hugo wrote:
> On 5/14/2020 8:07 AM, Jeffrey Hugo wrote:
> > +#define QAIC_NAME			"Qualcomm Cloud AI 100"
> <snip>
> > +static struct pci_driver qaic_pci_driver = {
> > +	.name = QAIC_NAME,
> 
> A question about the community's preference here.
> 
> Our driver name is very verbose due to the desire to have the proper
> "branding".  However, I can see it being a bit obtuse, particularly in logs.
> 
> Would the community prefer something more succinct here, such as "qaic"?

Make it the same a KBUILD_MODNAME and then no one can complain :)

thanks,

greg k-h
