Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7442D1FF7D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 17:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgFRPqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 11:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728027AbgFRPqA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 11:46:00 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031B9C0613EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 08:45:59 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 64so2946150pfv.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 08:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qupWaprfLr4lzKnkhWjV2SAcxhuEsrjPa2GnObdvpSE=;
        b=aKSPCnP9b2NTkaOyGcrTbKo3rY2wFLGG91oRV96liS8c16qb5KhllynE9aiwFxLNMW
         xDBaz8Ryfw1RDZye6DBc58F8ytYCk2Sg7eh6GlRn97eex80uA5NZMTRkYMVmmgpvLFou
         D1BDLZjc049E9Dtme4t2DDzjRLaqLsIN+PdA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qupWaprfLr4lzKnkhWjV2SAcxhuEsrjPa2GnObdvpSE=;
        b=aSyCYxeZT3mb4YthMACQguQyZw62hLQTNUXnGaxDc+fUwIKvpbzH9vHf/z0QWa4cAV
         o8hTy4099I2ugy2NifwPpGfwKB1xpTz4UW7ZNqB6/KMWg9g+cqWJcohSJGSJNTJ0jtfl
         sfhnTOCZTSrMv33sFzsdCLM52MQK88CyikZzq2+QIJh7hv60bbd9hvhqQarUQPrsxlLY
         OH9tAYuD77zSKBQ8pVKn3CbAcTphIcNKpune8ZyHZ7MUzuryLZvoyJJGnYbtgGApv40z
         iy+Dc240+56df/GdWxf5TSCDA+SVNlYfx8kf0+a3SeYtnN8xmVo8L64Iait5+eZU2WJA
         Jv+g==
X-Gm-Message-State: AOAM5317PXOCZybB9R6VQ5tZeZx/5+P3jFR//Vb2752pcXoidcuDX+D8
        lrrhxRbDWhhBadjC6pToLwOt2g==
X-Google-Smtp-Source: ABdhPJxnLLK0++ErXNmptr1FXVpVla5sak2tHgdgxR6PEcwdMlSdbcd9ahWQAclwOSlzARoOrSmIjg==
X-Received: by 2002:a63:5f8c:: with SMTP id t134mr1373770pgb.99.1592495159393;
        Thu, 18 Jun 2020 08:45:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id i7sm2947669pgr.86.2020.06.18.08.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 08:45:58 -0700 (PDT)
Date:   Thu, 18 Jun 2020 08:45:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH] driver core:Export the symbol device_is_bound
Message-ID: <20200618154555.GD4525@google.com>
References: <1591123192-565-1-git-send-email-sanm@codeaurora.org>
 <20200618081443.GA1043700@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200618081443.GA1043700@kroah.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On Thu, Jun 18, 2020 at 10:14:43AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jun 03, 2020 at 12:09:52AM +0530, Sandeep Maheswaram wrote:
> > Export the symbol device_is_bound so that it can be used by the modules.
> 
> What modules need this?

drivers/usb/dwc3/dwc3-qcom.c (and probably other dwc3 'wrappers').

Short summary: QCOM dwc3 support is split in two drivers, the core dwc3
driver and the QCOM specific parts. dwc3-qcom is probed first (through
a DT entry or ACPI), dwc3_qcom_probe() then calls of_platform_populate()
to probe the core part. After a successful return from _populate() the
driver assumes that the core device is fully initialized. However the
latter is not correct, the driver core doesn't propagate errors from
probe() to platform_populate(). The dwc3-qcom driver would use
device_is_bound() to make sure the core device was probed successfully.

Related patches:

"usb: dwc3: qcom: Make sure core device is fully initialized before it is used"
https://lore.kernel.org/patchwork/patch/1257279/

"usb: dwc3: qcom: Add interconnect support in dwc3 driver"
https://patchwork.kernel.org/patch/11468647/

> > This change was suggested to solve the allmodconfig build error on adding
> > the patch https://lore.kernel.org/patchwork/patch/1218628/
> > 
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > ---
> >  drivers/base/dd.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > index 9a1d940..65d16ce 100644
> > --- a/drivers/base/dd.c
> > +++ b/drivers/base/dd.c
> > @@ -337,6 +337,7 @@ bool device_is_bound(struct device *dev)
> >  {
> >  	return dev->p && klist_node_attached(&dev->p->knode_driver);
> >  }
> > +EXPORT_SYMBOL_GPL(device_is_bound);
> 
> If a driver needs to use this, something is really wrong with it.  What
> happens right after this, the state could have changed?
> 
> So, no, sorry, this is not a good idea.

Agreed that what some dwc3 'wrapper' drivers do is brittle, and that using
device_is_bound() is only a bandaid, that doesn't address the entire issue.

Do you have any suggestions on how this could be properly addressed?

Thanks

Matthias
