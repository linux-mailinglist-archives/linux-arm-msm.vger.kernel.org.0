Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B932CB3EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 05:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387499AbgLBE0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 23:26:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:39050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387454AbgLBE0e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 23:26:34 -0500
Date:   Wed, 2 Dec 2020 09:55:48 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606883154;
        bh=51WEf+5cYxqffTJp+/Dq0ME65e1e6IUp0bzqv+ozA/E=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gpn4MRy8B2JhLQbiktCY8RadjOVMrsxkt/m6DFUN9Ry+WhBd/Y55zrEvhH5AySwtx
         K+NIFlOG0OOcT1qP6K+BHdJid+Cp3xt5F/9vjS4cW9PIXcb665y+eRgNw86NdGv/Ad
         pHyRKxHaa5cc0mmX4rR8gOI0tOgNbX2+sddClf7w=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: db845c: Enable gpi_dma0 node
Message-ID: <20201202042548.GE8403@vkoul-mobl>
References: <20201201042520.2116271-1-vkoul@kernel.org>
 <20201201042520.2116271-2-vkoul@kernel.org>
 <X8bopaei69fbdcSs@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8bopaei69fbdcSs@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-12-20, 19:06, Bjorn Andersson wrote:
> On Mon 30 Nov 22:25 CST 2020, Vinod Koul wrote:
> 
> > gpi_dma0 can be used for spi and i2c transfers on db845c, so enable it
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > index 7cc236575ee2..0653468f26ce 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > @@ -418,6 +418,10 @@ &gcc {
> >  			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
> >  };
> >  
> > +&gpi_dma0 {
> > +	status = "okay";
> > +};
> > +
> 
> But you're only enabling the gpi, you don't have anything wired to it,
> so why enable it?
> 
> I took a look downstream and they have all the i2c and spi nodes with
> their dmas filled out - and the two gpis enabled at all times
> (sdm845.dtsi). Can/should we do the same?

So dma is merged and in linux-next but support for spi/i2c is not as
that is dependent upon dmaengine interface introduced for this.

I was planning to post spi/i2c after rc1 and also the dts enabling them

-- 
~Vinod
