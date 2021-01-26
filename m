Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0DA304D10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 00:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730696AbhAZXCC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 18:02:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:42172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393622AbhAZRzk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 12:55:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7EE222210;
        Tue, 26 Jan 2021 17:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611683699;
        bh=sWdJkC0XV13qzG3cgYLFyf1qRUk6OlIgEZOFy1MdMrs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YPgYpVMXj6hKPm4YzKQvuYAr3i+s5n8xqAxzJjpH8Hs0NDADyx3v4tMhoi82ajkWo
         ILg7eNmfjEzCSlHo6DSL3j5tX0omyvqQdRTIhen1MbywJ0F7fFc+cFaQJEiAx+jG13
         dOFjyNNANY3dxyB6XqprCEnCS62KeqbiDwEO7fWg=
Date:   Tue, 26 Jan 2021 18:54:57 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        Mayulong <mayulong1@huawei.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 00/21] Move Hisilicon 6421v600 SPMI driver set out of
 staging
Message-ID: <YBBXcdLbj92yMJhw@kroah.com>
References: <cover.1611212783.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611212783.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 21, 2021 at 08:18:02AM +0100, Mauro Carvalho Chehab wrote:
> Hi Mark/Lee,
> 
> This patch series finish addressing support for Hikey 970
> SPMI controller, PMIC and regulators.
> 
> This version was generated with -M, in order to make easier
> to merge upstream.  Also, rebased on the top of v5.10,
> without any dependencies from the other patch series
> I'm submitting for this board.
> 
> Yet,  patch 18 to 20 modifies drivers/staging/hikey9xx/Kconfig
> and drivers/staging/hikey9xx/Makefile. So, trivial conflicts
> will rise if they're applied via different trees, as they all
> remove some lines from such files. 

I've applied the first 13 patches, except for patch 3, as that did not
apply, to my tree, thanks.

greg k-h
