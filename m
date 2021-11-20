Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DB1457BE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 07:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234391AbhKTGDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 01:03:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:55662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234360AbhKTGDb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 01:03:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8F0860E9B;
        Sat, 20 Nov 2021 06:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637388028;
        bh=F9WH0Q3dMb+WLsf5ldP5Y9VErnRq9PFjOeJVodW8nho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RwEGGDTbkVnWS46oSb5M+InyHyzjk3b/ZcmQbX55YGZ71AUABlDTYa1vaw/UyD0hO
         OOYSgWyr/DoiXi/8UkjeC4bjPIwUvc8Cbc8XjdpGebA3axQsZo6jcejXWH47ymdwPN
         OSi5PkxfEioyBNDFrBWW0foWzW/2ag3sG6Pqt9Fi6nj/G8oYgcedWYXJZtn/vwo0T1
         EkqmPzM9wGOdy7lMONR1EdU+St9kHEvJb8T0eT1ag+RfzgFhF1DnXXTduNfJYx5Lp0
         xs06hcYRNHc0PcWjvihxrt1NUjR4TP2HG5dGDw93AWd/8EX3dSgH9FrDJcrXmMk9OV
         rEBtvGHR7wWYQ==
Date:   Sat, 20 Nov 2021 11:30:23 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] phy: qualcomm: ipq806x-usb: Fix kernel-doc style
Message-ID: <YZiO92inoiTapw0o@matsya>
References: <20211116103951.34482-1-vkoul@kernel.org>
 <20211116103951.34482-2-vkoul@kernel.org>
 <YZWbxdnfHKdCI/hz@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZWbxdnfHKdCI/hz@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-11-21, 18:18, Bjorn Andersson wrote:
> On Tue 16 Nov 04:39 CST 2021, Vinod Koul wrote:
> 
> > The functions are documented but there were style issues, so fix
> > the style and add missing description for phy_dwc3
> > 
> > drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:130:
> > drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:174:
> > drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:212: warning:
> > This comment starts with '/**', but isn't a kernel-doc comment.
> > Refer Documentation/doc-guide/kernel-doc.rst
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 26 +++++++++++----------
> >  1 file changed, 14 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> > index bfff0c8c9130..e1b8fa911416 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> > @@ -127,12 +127,13 @@ struct phy_drvdata {
> >  };
> >  
> >  /**
> > - * Write register and read back masked value to confirm it is written
> > + * usb_phy_write_readback - Write register and read back masked value to
> 
> "Writing kernel-doc" indicates that you should have some parenthesis
> after that function.

Heh, it does not warn :(, will update this
> 
> > + * confirm it is written
> >   *
> > - * @base - QCOM DWC3 PHY base virtual address.
> > - * @offset - register offset.
> > - * @mask - register bitmask specifying what should be updated
> > - * @val - value to write.
> > + * @phy_dwc3: QCOM DWC3 PHY base virtual address.
> 
> I guess this was "base" at some point? As you're fixing up the
> kerneldoc, it would be nice to correct this to say something like
> "usb_phy context".

Why did I miss this one :(, yeah will update this

-- 
~Vinod
