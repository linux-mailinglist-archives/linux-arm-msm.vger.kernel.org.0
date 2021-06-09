Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337DA3A1C24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 19:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbhFIRq7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 13:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbhFIRq7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 13:46:59 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A75C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jun 2021 10:45:04 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id y12so8302533pgk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 10:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QzDssiVcaAs2iXBKln3HFvpPx/SdWnQa94m+zZpAne0=;
        b=YFOYwN9GYgjIuxKgHt+Y8crdfNkOHKAkE9WCtVDon+e2O+LTLGknuhCRA/sAXdz+0y
         LNc0f9hLnug/ElvX7efE6XaHk0Tbm2dlfrsb88vWfTls7q/ue6Kzcqr2tGs5KjFiHhA+
         MNiOIqFH7PO1bLnralyQhXZEtiPyAa7S6+szQm0NXL5UeUZScqIxKXHxgy4XLSIdSPbL
         /6Llu/OuHltkVzfn1ifnglBN/k4uAcWnpot311GuX092/vytUv5/OoJXvZ+NC8DYYDMt
         hV09eMbEz5Vdj8yNEAcK0AAl91N2/W8ZS6Av1WypD+ywbUAUQ4VU3n/pcpuS2ULitJ5n
         3J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QzDssiVcaAs2iXBKln3HFvpPx/SdWnQa94m+zZpAne0=;
        b=kf+eopXMLRs/Sdh+revHspMwNFt6IJ4QFNeFVxIyO0LhXnadHZKn1JFvc3NNydSmXB
         jRcmc/9/I7GrPbAIaKRY5hsduMu3D8YoNPG+y8OnSgHficXM3k3UD7ftJ5pv0jqVMQ9w
         aNp3MR85Lhmy9cjnYJGZoA2Y9gc59Jy8rrLaA1A3p0MX4LAMkYWhIP7wrJ9jcDsgnPVy
         uWqei4nLQ7H08xiYav6zzS7SHsV640TOS7+za2PrEsDTAMrIKP+0Az9yJ7XPhoqRrLT2
         CQZ/kc/9oz9RhaI0rjSLRu7575SaQ7c23EeOhTF0vhOaErwxotfmNqtzZEjbP/lY90oh
         MDhg==
X-Gm-Message-State: AOAM531HARUIjyeFC1/1bhkuWKhHqm89+DitsJ2fIr3/L6a7b0LT87qB
        1RBiyVWt8JfWaa3gxaC59/aV
X-Google-Smtp-Source: ABdhPJzhL0J6ruC8+rmiNMifbymiIEQoncR02iYqwVte5qnBfi1MqWgFHuxp2FhvJ+Ljr3p/bYKLQg==
X-Received: by 2002:a62:8fc8:0:b029:2ec:9b7a:f59e with SMTP id n191-20020a628fc80000b02902ec9b7af59emr825555pfd.39.1623260703751;
        Wed, 09 Jun 2021 10:45:03 -0700 (PDT)
Received: from thinkpad ([2409:4072:641d:2c11:58bd:bfee:2422:5dea])
        by smtp.gmail.com with ESMTPSA id 76sm215015pfy.82.2021.06.09.10.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 10:45:03 -0700 (PDT)
Date:   Wed, 9 Jun 2021 23:14:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jarvis.w.jiang@gmail.com, loic.poulain@linaro.org,
        Shujun Wang <wsj20369@163.com>
Subject: Re: [PATCH 3/3] bus: mhi: pci-generic: Fix hibernation
Message-ID: <20210609174456.GA59730@thinkpad>
References: <20210606153741.20725-1-manivannan.sadhasivam@linaro.org>
 <20210606153741.20725-4-manivannan.sadhasivam@linaro.org>
 <YMD0o26UzZ72mdDp@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMD0o26UzZ72mdDp@kroah.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 09, 2021 at 07:04:35PM +0200, Greg KH wrote:
> On Sun, Jun 06, 2021 at 09:07:41PM +0530, Manivannan Sadhasivam wrote:
> > From: Loic Poulain <loic.poulain@linaro.org>
> > 
> > This patch fixes crash after resuming from hibernation. The issue
> > occurs when mhi stack is builtin and so part of the 'restore-kernel',
> > causing the device to be resumed from 'restored kernel' with a no
> > more valid context (memory mappings etc...) and leading to spurious
> > crashes.
> > 
> > This patch fixes the issue by implementing proper freeze/restore
> > callbacks.
> > 
> > Reported-by: Shujun Wang <wsj20369@163.com>
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Link: https://lore.kernel.org/r/1622571445-4505-1-git-send-email-loic.poulain@linaro.org
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/bus/mhi/pci_generic.c | 36 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> Also needs a stable link, right?  I'll go add it by hand.  Please be
> more careful next time...
> 

Oops... yes, sorry.

Thanks,
Mani

> greg k-h
