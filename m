Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE26C1D34CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 17:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgENPRH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 11:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgENPRH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 11:17:07 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E0EC061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 08:17:06 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id b8so1266690plm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UOTOikrlMIdFP4aQmvMqbEPCvRUzwtRIl17AlTTVkFQ=;
        b=FAV0FiFG8pM97LoBhxQbtROvqf5AWxbcndRpllxsWkcIaHB91vOCGimVplMMreOEkU
         qmULzk7Z8/9dMEQh2GpPtXAgAVgIOrVijnr4Pnx8/0XJGCojoYh41JhId1eODIo/qiep
         xvk5ETm2APEaZqfxNLnXRh317kjcD6LCKsIRIi04YPhTYU4Gwy0Ow34pSlur7iyAjK5z
         MOf0RYaNnjUSa57Lmh+exTlxatlDaNGjkRGK+//LW74ckUsxdoEPLIK1K2KPWX1YDiP2
         iH6uIOx00Z31Nqm3522GqrSiroWfCfOR1cuzfqq4k8cuko9iWbJZyev7hiNAM69rGiYs
         705Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UOTOikrlMIdFP4aQmvMqbEPCvRUzwtRIl17AlTTVkFQ=;
        b=hHxEJLDLnsgcPZsThqVXtLX42bZ+JjnolGku0dgAy5ItIYpY61d70EMCniodCr9Zsz
         UxvXbHweTVGcYQDlwmdbWJr95cIxwO97JiEPOv75PVnzrjE+eUC+0kuJbSWcXcshTJAg
         Jlv5tlQyPrpXbAQsR1pOL27b3ctEm4lFWpwhy1mgKIbmlz/b6+xDXlZRPjrIWfsPhutk
         WbYnCRQgItgeGnhlzotkoO0basuksUGdlIUco36drwc2DxBah7Cni11OxHaaCXvcflmh
         Vlj+IgT7Z4rkOCBjkOEgbSKZzk64jOwdV6tY4ilPp/At+1f6neopEc63MKjdlnGQrcVP
         S84w==
X-Gm-Message-State: AGi0PuZEQTjJJ47D25p8egU/yKh3KpHEiuL0JR1TQirAgrgRIylBlkaS
        9pdzQCzT8sZaVJRUvS3t2k0h5A==
X-Google-Smtp-Source: APiQypIqLPWyOC5M9ILxiC3BfqbMDARmmWsJ8Dm25QhFLozp8vgxg4irNno8ImmwBQmFa6uK/83m+w==
X-Received: by 2002:a17:90a:de8d:: with SMTP id n13mr42417575pjv.173.1589469425327;
        Thu, 14 May 2020 08:17:05 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k7sm2346357pga.87.2020.05.14.08.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 08:17:04 -0700 (PDT)
Date:   Thu, 14 May 2020 08:15:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] iommu/qcom: add optional clock for TLB invalidate
Message-ID: <20200514151534.GV2165@builder.lan>
References: <20200509130825.28248-1-shawn.guo@linaro.org>
 <20200512055242.GJ1302550@yoga>
 <20200514143905.GA10507@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514143905.GA10507@dragon>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 14 May 07:39 PDT 2020, Shawn Guo wrote:

> Hi Bjorn,
> 
> On Mon, May 11, 2020 at 10:52:42PM -0700, Bjorn Andersson wrote:
> > On Sat 09 May 06:08 PDT 2020, Shawn Guo wrote:
> > 
> > > On some SoCs like MSM8939 with A405 adreno, there is a gfx_tbu clock
> > > needs to be on while doing TLB invalidate. Otherwise, TLBSYNC status
> > > will not be correctly reflected, causing the system to go into a bad
> > > state.  Add it as an optional clock, so that platforms that have this
> > > clock can pass it over DT.
> > > 
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > ---
> > >  drivers/iommu/qcom_iommu.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> > > index 0e2a96467767..2f6c6da7d540 100644
> > > --- a/drivers/iommu/qcom_iommu.c
> > > +++ b/drivers/iommu/qcom_iommu.c
> > > @@ -45,6 +45,7 @@ struct qcom_iommu_dev {
> > >  	struct device		*dev;
> > >  	struct clk		*iface_clk;
> > >  	struct clk		*bus_clk;
> > > +	struct clk		*tlb_clk;
> > >  	void __iomem		*local_base;
> > >  	u32			 sec_id;
> > >  	u8			 num_ctxs;
> > > @@ -643,11 +644,20 @@ static int qcom_iommu_enable_clocks(struct qcom_iommu_dev *qcom_iommu)
> > >  		return ret;
> > >  	}
> > >  
> > > +	ret = clk_prepare_enable(qcom_iommu->tlb_clk);
> > > +	if (ret) {
> > > +		dev_err(qcom_iommu->dev, "Couldn't enable tlb_clk\n");
> > > +		clk_disable_unprepare(qcom_iommu->bus_clk);
> > > +		clk_disable_unprepare(qcom_iommu->iface_clk);
> > > +		return ret;
> > > +	}
> > 
> > Seems this is an excellent opportunity to replace
> > qcom_iommu_enable_clocks() to clk_bulk_prepare_enable() and disable,
> > respectively.
> 
> So we have two required and one optional clocks.  I guess we don't want
> to use clk_bulk_get_optional() to get all of them as optional.  So we
> will end up with getting clock with individual call and enabling/disabling
> with bulk version.  I'm personally not fond of this mixed style.  But if
> you really like this, I can change.
> 

I share your dislike for mixing them, but I do prefer it over the nasty
error handling we end up with in qcom_iommu_enable_clocks().

Regards,
Bjorn

> > 
> > > +
> > >  	return 0;
> > >  }
> > >  
> > >  static void qcom_iommu_disable_clocks(struct qcom_iommu_dev *qcom_iommu)
> > >  {
> > > +	clk_disable_unprepare(qcom_iommu->tlb_clk);
> > >  	clk_disable_unprepare(qcom_iommu->bus_clk);
> > >  	clk_disable_unprepare(qcom_iommu->iface_clk);
> > >  }
> > > @@ -839,6 +849,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
> > >  		return PTR_ERR(qcom_iommu->bus_clk);
> > >  	}
> > >  
> > > +	qcom_iommu->tlb_clk = devm_clk_get(dev, "tlb");
> > 
> > Wouldn't "tbu" be a better name for this clock? Given that seems the
> > actually be the hardware block you're clocking.
> 
> I was trying to emphasize the function of this clock.  But I agree that
> 'tbu' is a better name now.  I will change it in v2.
> 
> Thanks for the comments.
> 
> Shawn
