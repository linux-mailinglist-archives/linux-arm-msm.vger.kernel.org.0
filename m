Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4916931ED96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 18:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbhBRRrQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 12:47:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:46346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232434AbhBRPdv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 10:33:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A639F64E85;
        Thu, 18 Feb 2021 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613662352;
        bh=66QYvq0KRn8/lG526DUC0jailTAnnvCUYzNVwBagv4c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yPI6IzlCh2OwPhIyhKcDEfnabMJNyG1aeyC/P062fvFzHTcsOdcR8dtFQpHKQJaE0
         1pz/JB5CCJTysKPjlOHP9OpKxVOYRCU7fKqCjeUAScjzdM5GEEyBDKQ5cr8pP4mwN8
         Y0Kb6lNp3x5DwF1E//97SM+uBotthkpOc6PsQVvk=
Date:   Thu, 18 Feb 2021 16:32:29 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] usb: dwc3: qcom: Add missing DWC3 OF node
 refcount decrement
Message-ID: <YC6IjYlDXWJMyZIP@kroah.com>
References: <20210212205521.14280-1-Sergey.Semin@baikalelectronics.ru>
 <20210218152904.75bg2v6uh5ool5h3@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218152904.75bg2v6uh5ool5h3@mobilestation>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 18, 2021 at 06:29:04PM +0300, Serge Semin wrote:
> Bjorn, Greg, Felippe, Andy,
> Any comments on this series? Bjorn, Greg you asked me to resend the
> patches related with the DW USB3 node name change. I did as you said,
> but no news since then. I'd be glad to have this patch accepted in
> some -next repo and forget about it.

Sorry, but it's the merge window right now and I can't add anything new
until 5.12-rc1 is out.  So can you wait until then?

thanks,

greg k-h
