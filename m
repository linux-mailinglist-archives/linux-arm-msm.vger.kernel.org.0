Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E415D3057E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 11:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233597AbhA0KLQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 05:11:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbhA0KJN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 05:09:13 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE99C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 02:08:20 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id i9so1098415wmq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 02:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2WndoVJoechlesOP2uW9G5Dn7tzK4MkFx2WMsweb0HA=;
        b=UpH17eq02fjfb4twcUSs1kzVLGwnfViW+xXxsIpep3kj4mMwpmbQwEd3udpeUvscAJ
         Bg7m1KlikJ7nYe5NuPDDLi54HdO6mAbCbhQ/pdxtSIyAywSu6U/bPrihOD4hrHLSyd+P
         89ly7Y0yHSE/Ial1sv+bDkoilOd4MF8/RKh+tSZrCCMcn3iQPBf5JwsOqC6ZDpAP/Wa+
         4TDpW6E6EVFbbTdnei+0+oqjY/VKJs/A/+/xEXzN2yXgfVmuOwl9jvMTYGUqXhvolaoA
         jWuTqGAT44a4of40CpPq48iJ+jpbsX7b+3x8WlzoJTSGuIaxKsbvlDZh1k3MF9X3gyv2
         1xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2WndoVJoechlesOP2uW9G5Dn7tzK4MkFx2WMsweb0HA=;
        b=fumDqgSrsSY7ODxcStvPGgSqu6Bbi13c+DvIU/msqbzqP7AzYZemoW98kyLPMGb7SF
         xk0Y3xcoo2zxoaWj8VRek9moQWFrx51pjC9NLJNtMqYU8S+xvAcR4/ZnvwITHsW6fPTn
         Mb2RUSImcEOYdrXOMgq8EEathVklfiAFBjd/huHyDhlN1hyRTh5mRoXtADeVVLzTHxSw
         DygHKOTPBauKDl1VGooAhubB7QAOLRwesJWZJ6OIjIVaPJSO+qmNOlEbcE8FdXh7kf2A
         sQP+9tSHpQzevohjtq2JOW2RbUgk0r2CsKrBXHpXvyOn+G30qtAdfP0qnZOiKv0pO2m1
         5quQ==
X-Gm-Message-State: AOAM530j355Ax2Yh9CTw6dB8xJekzgA2YsQhQwv3cYYPQTxxDjXUJq+6
        jbc+OOxlCDczlz0q7hO3DxdIDg==
X-Google-Smtp-Source: ABdhPJzKk7QEfIsVAuxkRlFKl+4OqrXBwYa149X8CairnOU8B6TmtO66T64zZBYBt2QVi/VcyNwmyQ==
X-Received: by 2002:a1c:4e05:: with SMTP id g5mr3552331wmh.105.1611742099265;
        Wed, 27 Jan 2021 02:08:19 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id g192sm2137417wmg.18.2021.01.27.02.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 02:08:18 -0800 (PST)
Date:   Wed, 27 Jan 2021 10:08:16 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mark Brown <broonie@kernel.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, Mayulong <mayulong1@huawei.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-arm-msm@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 00/21] Move Hisilicon 6421v600 SPMI driver set out of
 staging
Message-ID: <20210127100816.GH4903@dell>
References: <cover.1611212783.git.mchehab+huawei@kernel.org>
 <YBBXcdLbj92yMJhw@kroah.com>
 <20210126175752.GF4839@sirena.org.uk>
 <YBBZP9LjXPi/rzfP@kroah.com>
 <20210126181124.GG4839@sirena.org.uk>
 <YBErBByYD8lNIWAX@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YBErBByYD8lNIWAX@kroah.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Jan 2021, Greg Kroah-Hartman wrote:

> On Tue, Jan 26, 2021 at 06:11:24PM +0000, Mark Brown wrote:
> > On Tue, Jan 26, 2021 at 07:02:39PM +0100, Greg Kroah-Hartman wrote:
> > > On Tue, Jan 26, 2021 at 05:57:52PM +0000, Mark Brown wrote:
> > 
> > > > Is there a branch we can pull from?
> > 
> > > Once 0-day passes, you can pull from my staging-testing branch from
> > > staging.git on git.kernel.org if you want.  Give it 24 hours to pass
> > > before it hits that location.
> > 
> > Thanks.
> 
> Should be out there now if you want to pull.
> 
> > > Do you need a tag to pull from?
> > 
> > It'd be nice but not essential.
> 
> Why do you want/need this?  Having these changes in your tree is good,
> but what about other coding style cleanups that I will end up applying
> over time before the 5.12-rc1 merge window opens?  Are you wanting to
> take the moved driver in your tree, or something else?
> 
> Traditionally moving drivers out of staging can be done 2 ways:
> 	- all happens in the staging tree, I take an ack from the
> 	  subsystem maintainer that this is ok to do.
> 	- A new driver enters the "real" subsystem tree, and then I
> 	  delete the driver in the staging tree.  This doesn't preserve
> 	  history as well (not at all), but can be easier for trees that
> 	  move quickly (like networking.)
> 
> Which ever works for you is fine with me, but relying on the code to
> stay "not touched" in my tree after you pull it almost never happens due
> to the number of drive-by coding style cleanups that end up in the
> staging tree every week.

I would have expected the whole set to be merged as a set into a
single tree, placed on an immutable branch and a pull-request to be
sent out for the other maintainers to pull from (if they so wished).

This would ensure development could continue on any/all of the
affected drivers/files.

If it's not too late, I'd be more than happy to facilitate.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
