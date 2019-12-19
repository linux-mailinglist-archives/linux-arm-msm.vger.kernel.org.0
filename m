Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34B341263F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 14:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfLSNsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 08:48:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:43034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726712AbfLSNsy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 08:48:54 -0500
Received: from localhost (unknown [106.51.106.0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BFBC24676;
        Thu, 19 Dec 2019 13:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576763333;
        bh=nieQECrlbQOHYL4UGnniWBmxRE66t7W1QJA6+V0rOUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i7zFEOUkheLrKiunLa1e7znmAOoGjE9uN/lv5Y0Bykc1QhQ5sUHxb6p+LQ69CHLHO
         N0CcAf1C8fzei3sNazh94Q0LaVYeRkMdSGG4cVDwkUGlmVdy2KFEgb8OpzRWPZRmQl
         NU4YA9fhumbqsdvi6JE3aNBqLBs2U6140GQogLrY=
Date:   Thu, 19 Dec 2019 19:18:45 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: qcom-qmp: Add MSM8996 UFS QMP support
Message-ID: <20191219134845.GU2536@vkoul-mobl>
References: <20191207202147.2314248-1-bjorn.andersson@linaro.org>
 <20191207202147.2314248-2-bjorn.andersson@linaro.org>
 <20191219042047.GT2536@vkoul-mobl>
 <20191219070658.GG448416@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219070658.GG448416@yoga>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-12-19, 23:06, Bjorn Andersson wrote:
> On Wed 18 Dec 20:20 PST 2019, Vinod Koul wrote:
> 
> > On 07-12-19, 12:21, Bjorn Andersson wrote:

> > >  static const unsigned int pciephy_regs_layout[] = {
> > >  	[QPHY_COM_SW_RESET]		= 0x400,
> > >  	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
> > > @@ -330,6 +335,75 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
> > >  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
> > >  };
> > >  
> > > +static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
> > > +	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
> > 
> > Can you check this after adding the reset for ufs, I suspect you might
> > run into same issue as I am seeing on 8150, power down here does not
> > seem correct.
> > 
> 
> I'm not sure why we need to tickle POWER_DOWN here, but it's documented
> as such, done in the old driver and without it the PHY does not come up.

I checked and you *may* leave this as is. The register write preceding this
is same, so we are writing twice, but does not seem have any side effect
so we can keep it here :)

-- 
~Vinod
