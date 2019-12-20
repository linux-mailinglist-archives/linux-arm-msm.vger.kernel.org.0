Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7B3127480
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 05:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfLTEV3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 23:21:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:45010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726986AbfLTEV3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 23:21:29 -0500
Received: from localhost (unknown [106.201.107.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 788B921D7D;
        Fri, 20 Dec 2019 04:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576815688;
        bh=TEM0b/JaWXh5vC0Me0WpSth4fQG3Gksa+E3z056weGw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QmM0djdzoD5smoRw/7poKBsNkM4Wwhz9RSg2N67KXQsvEwKSUVNIsbuFSRxzS0UvA
         mCCDjztcD1+/uNHygFSGG1qvsqBhp1IiPunDdklJ/6BRC07aofviK6fi4dhQOPJUBs
         CnEF8p+fcgZtNjCIvvYhbqwy6O33MmCa8n7ABEGA=
Date:   Fri, 20 Dec 2019 09:51:23 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] phy: qcom-qmp: Increase the phy init timeout
Message-ID: <20191220042123.GC2536@vkoul-mobl>
References: <20191219150433.2785427-1-vkoul@kernel.org>
 <20191219150433.2785427-2-vkoul@kernel.org>
 <20191220020835.GK448416@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220020835.GK448416@yoga>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-12-19, 18:08, Bjorn Andersson wrote:
> On Thu 19 Dec 07:04 PST 2019, Vinod Koul wrote:
> 
> > If we do full reset of the phy, it seems to take a couple of ms to come
> > up on my system so increase the timeout to 10ms.
> > 
> > This was found by full reset addition by commit 870b1279c7a0
> > ("scsi: ufs-qcom: Add reset control support for host controller") and
> > fixes the regression to platforms by this commit.
> > 
> > Suggested-by: Can Guo <cang@codeaurora.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> This does look familiar...
> 
> https://lore.kernel.org/linux-arm-msm/20191107000917.1092409-3-bjorn.andersson@linaro.org/
> 
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > index 091e20303a14..c2e800a3825a 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > @@ -66,7 +66,7 @@
> >  /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
> >  #define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
> >  
> > -#define PHY_INIT_COMPLETE_TIMEOUT		1000
> > +#define PHY_INIT_COMPLETE_TIMEOUT		100000
> 
> 100ms seems a little bit excessive, and we do end up waiting this long
> when we have PCIe links without an attached device...
> 
> Do you need >10ms or could we just have my patch merged?

Yeah I quick tested 10ms as well and seems good for me, so either ways
if fine, but lets get it applied quickly :-)

-- 
~Vinod
