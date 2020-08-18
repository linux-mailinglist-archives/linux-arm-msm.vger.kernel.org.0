Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645EB248780
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 16:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgHRO22 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 10:28:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:44032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726660AbgHRO21 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 10:28:27 -0400
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A1CD207D3;
        Tue, 18 Aug 2020 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597760906;
        bh=TyjAOtFLUcdkHJqVznsWOj1rsY2m5SGYugIkegCaavY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bxizRbar0YqT2TrzigWWLFiyjHd8OrzPxdbiHrSL99ATPBIiho1ScQAO7glgsBm1d
         CbqL8TXLmE9kPn/MY2ElMs8rz7fnLBvYK+P6j8yH2z/fv3Q506iLRcxsBsCOKM8oYr
         TVBv9HaIJ85o0Un2VIykpVXUobCuAXfcoKVL/ss4=
Date:   Tue, 18 Aug 2020 16:28:20 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linuxarm@huawei.com, Wei Xu <xuwei5@hisilicon.com>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, mauro.chehab@huawei.com,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/44] SPMI patches needed by Hikey 970
Message-ID: <20200818162820.3c78c33c@coco.lan>
In-Reply-To: <20200818141750.GA608639@kroah.com>
References: <cover.1597647359.git.mchehab+huawei@kernel.org>
        <20200818141750.GA608639@kroah.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Tue, 18 Aug 2020 16:17:50 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:

> On Mon, Aug 17, 2020 at 09:10:19AM +0200, Mauro Carvalho Chehab wrote:
> > Hi Greg,
> > 
> > This patch series is part of a work I'm doing in order to be able to support
> > a HiKey 970 board that I recently got on my hands.  
> 
> With this applied, I get the following build error:
> ERROR: modpost: "__spmi_driver_register" [drivers/staging/hikey9xx/hi6421-spmi-pmic.ko] undefined!
> ERROR: modpost: "spmi_ext_register_writel" [drivers/staging/hikey9xx/hi6421-spmi-pmic.ko] undefined!
> ERROR: modpost: "spmi_ext_register_readl" [drivers/staging/hikey9xx/hi6421-spmi-pmic.ko] undefined!
> ERROR: modpost: "spmi_controller_add" [drivers/staging/hikey9xx/hisi-spmi-controller.ko] undefined!
> ERROR: modpost: "spmi_controller_alloc" [drivers/staging/hikey9xx/hisi-spmi-controller.ko] undefined!
> ERROR: modpost: "spmi_controller_remove" [drivers/staging/hikey9xx/hisi-spmi-controller.ko] undefined!
> 
> 
> I'll take this in my testing tree for now, can you send a follow-on
> patch to fix this?

Surely. That's because it got moved from drivers/spmi/Kconfig.
The Kconfig var was inside a:

if SPMI
...
endif

This driver should "depends on SPMI". I'll send you a patch in a few.

Thanks,
Mauro
