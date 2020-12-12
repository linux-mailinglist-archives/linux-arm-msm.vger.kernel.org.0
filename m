Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E6D2D8504
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Dec 2020 07:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436660AbgLLGJW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Dec 2020 01:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404022AbgLLGJK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Dec 2020 01:09:10 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27033C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 22:08:30 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q22so8411941pfk.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 22:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KrrfqCz8fMnvHaHUpeYSii56XdL30O9rReJj2B9MO5Y=;
        b=DH8VhTet2wSm66pWTT6sexa+GKrsgAa2RZ0lUe0rK0qB6wJxrl1bQr9rsi5lLJCzMP
         t4nZHGk77JTx4s6KVuGSWBp1sslP+rME+kYcDZ6jWZ4jOKUEExRCWSSqvoQd7DFmElKq
         L7aa3IubZ3zPnTuYWOMkG+DNfhzorJdgQ1LvqBmXTzDjBAODiZ4BBuPDRoNUoQw5mbew
         PHHFQhRsdAGvATgjKIiOpzwEaYg5Mxq9Z2FVhVbYpcuoWTVpttRHH7fJ6fskxfhSECwb
         hsbirvv+SPX74C9hR1ILC6yvK7KgeW60LUXWL3Cdq/dq1MMnTmn6VfgUenz//5bdoe64
         tibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KrrfqCz8fMnvHaHUpeYSii56XdL30O9rReJj2B9MO5Y=;
        b=uYf0PQ5kaOfKgfuxx//nTRjnTYriafid/12Y2RWJrqgoP9xjE/a4jAfimp8bh26UQG
         vw54MWbZwTByk6bRboiTOwwQqflqNaBVKqPGP4Ums+WFVK2e6bXOq/HpdapcCPf/zgtb
         Tf3obTUJxqbwFIJqYhj9vg1oVBjPzmAXpNX4O/mOcm4k/DJzjrpdgkELkvgKmGa2YN0B
         AJQOzKvwzKDWE42U1DAdO2Bkgac7ikKrfMGT9Mz/779Wj+knd01L5/1dyl0pmVmbszI+
         5hl54HyueZOOerB37DOzD/2xwW8i/+74N5kn2juQLDLYfyfUJAqN2tTcPpa+4XQQFoWD
         TrXA==
X-Gm-Message-State: AOAM532sKvBfBArMZniDmGY0wyqvXaF3gIZ7kjNQSVLNv8/5rlUwmcdw
        WIUadN+y/6tGHw7tuHZPhom/
X-Google-Smtp-Source: ABdhPJxwXDciFcLMkVrR5J7z51OStwNUkEuuN0hATLH7Py2x7sV4BQHTyoPurCogWeN5lfufW6Ht0Q==
X-Received: by 2002:a63:7982:: with SMTP id u124mr15124116pgc.259.1607753309565;
        Fri, 11 Dec 2020 22:08:29 -0800 (PST)
Received: from thinkpad ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id v19sm12299536pjg.50.2020.12.11.22.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 22:08:28 -0800 (PST)
Date:   Sat, 12 Dec 2020 11:38:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Dan Williams <dcbw@redhat.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, netdev@vger.kernel.org
Subject: Re: [PATCH v17 3/3] bus: mhi: Add userspace client interface driver
Message-ID: <20201212060818.GA10816@thinkpad>
References: <1607670251-31733-1-git-send-email-hemantk@codeaurora.org>
 <1607670251-31733-4-git-send-email-hemantk@codeaurora.org>
 <X9MjXWABgdJIpyIw@kroah.com>
 <81dfd08b90f841194237e074aaa3d57cada7afad.camel@redhat.com>
 <20201211200816.7062c3f9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211200816.7062c3f9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 11, 2020 at 08:08:16PM -0800, Jakub Kicinski wrote:
> On Fri, 11 Dec 2020 11:37:34 -0600 Dan Williams wrote:
> > Just to re-iterate: QMI ~= AT commands ~= MBIM (not quite, but same
> > level)
> > 
> > We already do QMI-over-USB, or AT-over-CDC-ACM. This is QMI-over-MHI.
> 
> Why do we need a different QMI-over-X for every X? If you say there 
> are already chardev interfaces to configure WWAN why not provide one 
> of those?
> 

Just because the underlying PHY is different and it offers more services than
just configuring the modem (downloading crash dump, firmware download etc...)

The existing chardev nodes are closely tied to the physical interfaces. For
instance, /dev/cdc_wdm is used by the USB based WWAN devices. So we really can't
reuse it for MHI/PCIe.

> > It's not networking data plane. It's WWAN device configuration.
> 
> Ack. Not that network config doesn't fall under networking, but eh.
> I wonder - did DaveM ever ack this, or was it just out of his sight
> enough, behind the cdev, to never trigger a nack?
> 
> > There are no current kernel APIs for this, and I really don't think we
> > want there to be. The API surface is *huge* and we definitely don't
> > want that in-kernel.
> 
> It is what it is today for WWAN. I don't think anyone in the
> development community or among users is particularly happy about
> the situation. Which makes it rather self evident why there is 
> so much apprehension about this patch set. It's going to be 
> a user space channel for everything Qualcomm - AI accelerator etc.
> Widening the WWAN status quo to more device types.

Well not everything Qualcomm but for just the subsystems where there is no
standardization right now. I think we went too far ahead for standardizing
the modems.

Thanks,
Mani

