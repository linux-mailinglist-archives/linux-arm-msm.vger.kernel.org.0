Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5A6248332
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 12:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgHRKhe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 06:37:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:47042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726862AbgHRKhb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 06:37:31 -0400
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 796D9204EA;
        Tue, 18 Aug 2020 10:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597747050;
        bh=xcEDk+m+glN3qf3EHS7yRPVEgKV2+j6JUm4tvbC33dI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rrqjEXVyogXgFmEPm0UJiwXSLh0Ydlb3WnZ756K7M/o4ayb1HRItIPvnJF9Bhc9OL
         M80o73E0cGR95LFp6oLgJ1OovCWUk74dTPYEc33FjHWUgq3dBb6eODn7qhtM8+ycmN
         SFPcmIgKgUmfvsKzhij8xn6jPPxWCoiVgDoFe3Yg=
Date:   Tue, 18 Aug 2020 12:37:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 43/44] dt: document HiSilicon SPMI controller and
 mfd/regulator properties
Message-ID: <20200818123725.5b70af9b@coco.lan>
In-Reply-To: <20200818111351.7e3fc780@coco.lan>
References: <cover.1597647359.git.mchehab+huawei@kernel.org>
        <2f88fed96d67b05fc033356fdbb7e3227955ab34.1597647359.git.mchehab+huawei@kernel.org>
        <20200817201211.GA1437827@bogus>
        <20200818111351.7e3fc780@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Tue, 18 Aug 2020 11:13:51 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Mon, 17 Aug 2020 14:12:11 -0600
> Rob Herring <robh@kernel.org> escreveu:
> 

> > > +  'irq-mask-addr':
> > > +    description: Address for the interrupt request mask
> > > +
> > > +  'irq-addr':
> > > +    description: Address for the interrupt request  
> 
> Those two seems more standard to me: irq-mask-addr is the address to
> enable/disable IRQs, while irq-addr is where the pending IRQs are
> stored.
> 
> What would be the standard way to specify them both?

After another look at the driver, both seems to be fixed
address. There are even some comments that implies that:

	/* SOC_PMIC_IRQ_MASK_0_ADDR */
	ret = of_property_read_u32(np, "irq-mask-addr", &pmic->irq_mask_addr);

	/* SOC_PMIC_IRQ0_ADDR */
	ret = of_property_read_u32(np, "irq-addr", &pmic->irq_addr);

So, I'll just drop the entire set of irq-* properties. The PMIC part
should be just this:

	#include <dt-bindings/spmi/spmi.h>
...
		pmic: pmic@0 {
			compatible = "hisilicon,hi6421v600-spmi";
			reg = <0 SPMI_USID>;

			#interrupt-cells = <2>;
			interrupt-controller;
			gpios = <&gpio28 0 0>;
...
		};



Thanks,
Mauro
