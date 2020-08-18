Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363D6248728
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 16:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgHRORd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 10:17:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:53826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726681AbgHROR1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 10:17:27 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A9E420786;
        Tue, 18 Aug 2020 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597760246;
        bh=eSFoLxHwdLUVD42aGFcehpFNLZeM+rpJJpdSFzwbbd8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hOawlG2jnT0bXKUdagyBt6vUy7oIzfSBGUhVHLcBii7V5LVdlibE3qlleRC8DE+53
         pOwwII18PRbpUGcJOk+1mva66phcyNwSBMQ4eZdMk4ugGI9NYbs21Ron6ApZchtFP0
         CVB7irNMG8X5RKj+ihiqsnyuFEjCYcpnrRBbV4qY=
Date:   Tue, 18 Aug 2020 16:17:50 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linuxarm@huawei.com, Wei Xu <xuwei5@hisilicon.com>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, mauro.chehab@huawei.com,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/44] SPMI patches needed by Hikey 970
Message-ID: <20200818141750.GA608639@kroah.com>
References: <cover.1597647359.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1597647359.git.mchehab+huawei@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 17, 2020 at 09:10:19AM +0200, Mauro Carvalho Chehab wrote:
> Hi Greg,
> 
> This patch series is part of a work I'm doing in order to be able to support
> a HiKey 970 board that I recently got on my hands.

With this applied, I get the following build error:
ERROR: modpost: "__spmi_driver_register" [drivers/staging/hikey9xx/hi6421-spmi-pmic.ko] undefined!
ERROR: modpost: "spmi_ext_register_writel" [drivers/staging/hikey9xx/hi6421-spmi-pmic.ko] undefined!
ERROR: modpost: "spmi_ext_register_readl" [drivers/staging/hikey9xx/hi6421-spmi-pmic.ko] undefined!
ERROR: modpost: "spmi_controller_add" [drivers/staging/hikey9xx/hisi-spmi-controller.ko] undefined!
ERROR: modpost: "spmi_controller_alloc" [drivers/staging/hikey9xx/hisi-spmi-controller.ko] undefined!
ERROR: modpost: "spmi_controller_remove" [drivers/staging/hikey9xx/hisi-spmi-controller.ko] undefined!


I'll take this in my testing tree for now, can you send a follow-on
patch to fix this?

And I only took the first 41 patches in this series, see my comments on
the rest.

thanks,

greg k-h
