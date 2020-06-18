Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE4F1FED4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 10:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgFRIOv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 04:14:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:48384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728391AbgFRIOu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 04:14:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F82020706;
        Thu, 18 Jun 2020 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592468089;
        bh=S0yMzvwlphJsPCnFlT6M40GRcHuDNlNGMO8t844ohEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZrLGpyEKYSoYHImSVslXfLRhce0ry5HObRYn2HYcTB6VbFWZTrRaJQKEQPepdockm
         mKVc8smkfjKpewzvpBI8C9JRLRHN8+f4XxDGT3Llk+tShX15IYhkAuccTgKHYqLTdN
         OfujyfQ3aBD19qsW+C3gUgBjvQ2ZdbrervzZpcpA=
Date:   Thu, 18 Jun 2020 10:14:43 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH] driver core:Export the symbol device_is_bound
Message-ID: <20200618081443.GA1043700@kroah.com>
References: <1591123192-565-1-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591123192-565-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 03, 2020 at 12:09:52AM +0530, Sandeep Maheswaram wrote:
> Export the symbol device_is_bound so that it can be used by the modules.

What modules need this?

> This change was suggested to solve the allmodconfig build error on adding
> the patch https://lore.kernel.org/patchwork/patch/1218628/
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/base/dd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 9a1d940..65d16ce 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -337,6 +337,7 @@ bool device_is_bound(struct device *dev)
>  {
>  	return dev->p && klist_node_attached(&dev->p->knode_driver);
>  }
> +EXPORT_SYMBOL_GPL(device_is_bound);

If a driver needs to use this, something is really wrong with it.  What
happens right after this, the state could have changed?

So, no, sorry, this is not a good idea.

thanks,

greg k-h
