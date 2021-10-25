Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FA7439019
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 09:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbhJYHNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 03:13:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:59876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229727AbhJYHNU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 03:13:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12B6860F9C;
        Mon, 25 Oct 2021 07:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635145858;
        bh=wHlKRt1QrjCcx+YMoChVXSYiCfVO9OSjhXh60NOXWK8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ETX5aTw5UkAaQv5un4FxUBu/HcCp/zrkxsNdvOPFNy0lueoBk1foSCXRqsW5+ny64
         3UfHmFBZCPVqX99RHxQzRZ0gvweVig7NnkR9pSh5uZaFOykb9S5Nm+1nUN5mSEU4SO
         9ZqqEqhcWYEz29jeUqQUwkcXTUE97h0Kv7l/yU7DAgXjBo7FMqJ1HrT5nW0pGV9W4J
         QrvT1M3rNlgSXlDBeRNJ7XrsaWh8bQzTLgGyDBc3y1xXmGjtkSvdRjZQjAsE0xQQe8
         ESOTCsQbChee3GQtzlGFzKE0Z2zIZDdMboPld6SZ8Q8M7ULBfm4SQGmNpjE+FeSatm
         aFJjnvBIdD5lw==
Date:   Mon, 25 Oct 2021 12:40:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        abhinavk@codeaurora.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 2/2] phy: qcom: Introduce new eDP PHY driver
Message-ID: <YXZYfh+yfNFkqY0a@matsya>
References: <20211016232128.2341395-1-bjorn.andersson@linaro.org>
 <20211016232128.2341395-2-bjorn.andersson@linaro.org>
 <YXGmJFoeXwtTvl7p@matsya>
 <YXLx7EV7ZiMIxauO@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXLx7EV7ZiMIxauO@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-10-21, 10:16, Bjorn Andersson wrote:
> On Thu 21 Oct 10:40 PDT 2021, Vinod Koul wrote:
> 
> > On 16-10-21, 16:21, Bjorn Andersson wrote:
> > > Many recent Qualcomm platforms comes with native DP and eDP support.
> > > This consists of a controller in the MDSS and a QMP-like PHY.
> > > 
> > > While similar to the well known QMP block, the eDP PHY only has TX lanes
> > > and the programming sequences are slightly different. Rather than
> > > continuing the trend of parameterize the QMP driver to pieces, this
> > > introduces the support as a new driver.
> > > 
> > > The registration of link and pixel clocks are borrowed from the QMP
> > > driver. The non-DP link frequencies are omitted for now.
> > > 
> > > The eDP PHY is very similar to the dedicated (non-USB) DP PHY, but only
> > > the prior is supported for now.
> > 
> > since this is QMP phy, pls add an explanation why common QMP driver
> > is not used here?
> 
> Looked at this again, doesn't the second paragraph answer that?

Hmmm, somehow this got missed by me! Yes sounds okay

> > > +static int qcom_edp_phy_init(struct phy *phy)
> > > +{
> [..]
> > > +	writel(0x00, edp->edp + DP_PHY_AUX_CFG0);
> > > +	writel(0x13, edp->edp + DP_PHY_AUX_CFG1);
> > > +	writel(0x24, edp->edp + DP_PHY_AUX_CFG2);
> > > +	writel(0x00, edp->edp + DP_PHY_AUX_CFG3);
> > > +	writel(0x0a, edp->edp + DP_PHY_AUX_CFG4);
> > > +	writel(0x26, edp->edp + DP_PHY_AUX_CFG5);
> > > +	writel(0x0a, edp->edp + DP_PHY_AUX_CFG6);
> > > +	writel(0x03, edp->edp + DP_PHY_AUX_CFG7);
> > > +	writel(0x37, edp->edp + DP_PHY_AUX_CFG8);
> > > +	writel(0x03, edp->edp + DP_PHY_AUX_CFG9);
> > 
> > In qmp phy we use a table for this, that looks very elegant and I am
> > sure next rev will have different magic numbers, so should we go the
> > table approach here on as well..?
> > 
> 
> Comparing the v3 and v4 USB/DP combo phy and this, the only number that
> differs is CFG_AUX2 and CFG_AUX8.
> 
> CFG_AUX8 is 0x37 for eDP and 0xb7 for DP and AUX_CFG2 seems better to
> mask together, but I don't fully understand the content yet.
> 
> I did check two other platforms and they have the same sequence, except
> one additional bit in AUX_CFG2. There also seem to be a few additional
> permutations of this value, so I don't think tables are the solution.
> 
> 
> So I think it's better if we leave this as proposed and then
> parameterize the two individual entries as needed when we go forward -
> or determine that I missed something.

okay sounds good to me

-- 
~Vinod
