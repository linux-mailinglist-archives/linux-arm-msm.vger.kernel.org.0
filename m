Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1228AB836E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 23:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391218AbfISVcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 17:32:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:33342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391073AbfISVcH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 17:32:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93992208C0;
        Thu, 19 Sep 2019 21:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568928726;
        bh=fyy4pGkypScQBRM9b52pi6ZBUVk2OvSUIYo4S6uxfhg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bLMaT8iGJC+IywrDUUTZxffTo79vi6uPPkqKNpMTgbzTqcGEWoT3e6CU3sDQN7PL5
         reqEcnIeu3XYtOoed0Tp6JKs+7O0nF45MgL8PP8t1w56IuBNI3PB4n1UR9e+bjDoWA
         7qlFISStacI3VRWSihLsJKUWehJhEE2B+lJGwkZg=
Date:   Thu, 19 Sep 2019 23:32:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Murali Nalajala <mnalajal@codeaurora.org>
Cc:     rafael@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH] base: soc: Export soc_device_to_device API
Message-ID: <20190919213203.GA395325@kroah.com>
References: <1568927624-13682-1-git-send-email-mnalajal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568927624-13682-1-git-send-email-mnalajal@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 19, 2019 at 02:13:44PM -0700, Murali Nalajala wrote:
> If the soc drivers want to add custom sysfs entries it needs to
> access "dev" field in "struct soc_device". This can be achieved
> by "soc_device_to_device" API. Soc drivers which are built as a
> module they need above API to be exported. Otherwise one can
> observe compilation issues.
> 
> Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> ---
>  drivers/base/soc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> index 7c0c5ca..4ad52f6 100644
> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
>  {
>  	return &soc_dev->dev;
>  }
> +EXPORT_SYMBOL_GPL(soc_device_to_device);
>  
>  static umode_t soc_attribute_mode(struct kobject *kobj,
>  				struct attribute *attr,

What in-kernel driver needs this?

Is linux-next breaking without this?

We don't export things unless we have a user of the export.

Also, adding "custom" sysfs attributes is almost always not the correct
thing to do at all.  The driver should be doing it, by setting up the
attribute group properly so that the driver core can do it automatically
for it.

No driver should be doing individual add/remove of sysfs files.  If it
does so, it is almost guaranteed to be doing it incorrectly and racing
userspace.

And yes, there's loads of in-kernel examples of doing this wrong, I've
been working on fixing that up, look at the patches now in Linus's tree
for platform and USB drivers that do this as examples of how to do it
right.

thanks,

greg k-h
