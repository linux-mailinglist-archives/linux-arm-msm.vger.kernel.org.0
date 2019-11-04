Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD78EDB9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 10:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbfKDJW7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 04:22:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:37720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728332AbfKDJW7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 04:22:59 -0500
Received: from localhost (unknown [106.201.55.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E30420842;
        Mon,  4 Nov 2019 09:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572859379;
        bh=fDwWHQXokQ6+yeSBLlhubET0rNESSzXyJpE1F6jX8DI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sQoqsNrRtMsmT8OLj51A7PYWqpJmqtK9RUp22OzFl6h1iWU9cMvCVKSiefUAzTtgB
         P1vOVAsdRkqQAjtVOpMnz1tHXJ3SvVSP7yE4UlTHqMYpHtXwPp4QG6pW02UoPZIdyp
         6/TRC/U+/wQbIJMtPixaB8Lx2EOAyLoRW87UVbK8=
Date:   Mon, 4 Nov 2019 14:52:52 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] phy: qcom: qmp: Add SDM845 QHP PCIe PHY
Message-ID: <20191104092252.GS2695@vkoul-mobl.Dlink>
References: <20191102001628.4090861-1-bjorn.andersson@linaro.org>
 <20191102001628.4090861-6-bjorn.andersson@linaro.org>
 <20191103082147.GO2695@vkoul-mobl.Dlink>
 <20191104044703.GQ1929@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104044703.GQ1929@tuxbook-pro>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-11-19, 20:47, Bjorn Andersson wrote:
> On Sun 03 Nov 01:21 PDT 2019, Vinod Koul wrote:
> > On 01-11-19, 17:16, Bjorn Andersson wrote:
> [..]
> > > +/* PCIE GEN3 COM registers */
> > > +#define PCIE_GEN3_QHP_COM_SYSCLK_EN_SEL			0xdc
> > 
> > No QPHY_ tag with these?
> 
> These are the actual register names from the hardware specification, do
> you foresee any issues with naming them like this?

It would make them consistent, rest of the registers do have that.
> 
> > > +#define PCIE_GEN3_QHP_COM_SSC_EN_CENTER			0x14
> > 
> > Can we sort these please!
> > 
> 
> Yes, that sounds reasonable. I'll respin with these sorted by address.

Great, thanks

-- 
~Vinod
