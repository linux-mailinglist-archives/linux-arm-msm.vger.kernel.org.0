Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E297B1D3335
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgENOjR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgENOjQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:39:16 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5319C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:39:16 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y18so1386491pfl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p8VAiP+wdh9S4iV1FPgA8cT+xg80zpJkzOLZcJit37g=;
        b=WWrEtcLTe/AtT4EbCTYzam79Ra7lhJKHBrZL/Tnu4TCAtBVxGBCahYXo5PmodAwuHh
         8k5LBghwsSy0kYyntrskTV8bDhmljrbaE6//K4X2W9Ot/g0R5TTgBIg56t8itWZj89hr
         nPaDDCjBdxDd6mx+299GW+PRdF14eFvxTpSJxuYU/JmR4UbDo0HVrLx7QyBxJ8YTnO4G
         rIqP7oByZMLPnJX1t4ZR/qEZKMRC8L0ueJO1VIRbDk2MDbOeBMa8QUWWfNAuB4/bFH9M
         EE6DDOJDgsV3sBGvA0Q8upX3C4Rw0k5RbHomhw98bQc2fwhLd79Crd2THuaQRgP3sABC
         Kyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p8VAiP+wdh9S4iV1FPgA8cT+xg80zpJkzOLZcJit37g=;
        b=U0RXZngum89paQs172PRDqY6DzZfezXE6ZXVRifK2M2pomB2pvBFTiXb4pgRICRdcm
         yZUdEdUs5cpXr1v+9+vLqrSfn3MWnOvMEprWtDWa1b4/vQ1mN4UwLaO4ixOsudlR3fMh
         jXLT3AsU42+xp7dDyyPR2yfyEJnE0Rn62nS240P7iED4ZAeSnuupIWDALeHYpySS04vk
         FT6jk28DdTXgr9jfz1t27FJ3wbBLTMMuaOUqakao6lQ5r09tg8mcNr1lk49I+atjYL6q
         r/7XeBasYBbuVNgOFTylk1OhT+/l1S5ihXL2dd3CAYECj+OhOdGEaoaYwJJGUk6l2PTw
         WPLw==
X-Gm-Message-State: AOAM531Y5cQ9jJBMhOUxxlrkav1Ci/Zw1ChUqkayepztFVzLjIRq92x9
        uwI8bw3UifF5CQGMybeaIK6wng==
X-Google-Smtp-Source: ABdhPJwJa3DynaOxyMoDTqqBxRvRIuQK5Syy/Akad8KVEGe6nuQZzUaCDK13UTkPlphhIeVlYqQ46w==
X-Received: by 2002:aa7:8658:: with SMTP id a24mr4867093pfo.135.1589467156158;
        Thu, 14 May 2020 07:39:16 -0700 (PDT)
Received: from dragon ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id w2sm18702332pja.53.2020.05.14.07.39.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 07:39:15 -0700 (PDT)
Date:   Thu, 14 May 2020 22:39:06 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] iommu/qcom: add optional clock for TLB invalidate
Message-ID: <20200514143905.GA10507@dragon>
References: <20200509130825.28248-1-shawn.guo@linaro.org>
 <20200512055242.GJ1302550@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512055242.GJ1302550@yoga>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Mon, May 11, 2020 at 10:52:42PM -0700, Bjorn Andersson wrote:
> On Sat 09 May 06:08 PDT 2020, Shawn Guo wrote:
> 
> > On some SoCs like MSM8939 with A405 adreno, there is a gfx_tbu clock
> > needs to be on while doing TLB invalidate. Otherwise, TLBSYNC status
> > will not be correctly reflected, causing the system to go into a bad
> > state.  Add it as an optional clock, so that platforms that have this
> > clock can pass it over DT.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/iommu/qcom_iommu.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> > index 0e2a96467767..2f6c6da7d540 100644
> > --- a/drivers/iommu/qcom_iommu.c
> > +++ b/drivers/iommu/qcom_iommu.c
> > @@ -45,6 +45,7 @@ struct qcom_iommu_dev {
> >  	struct device		*dev;
> >  	struct clk		*iface_clk;
> >  	struct clk		*bus_clk;
> > +	struct clk		*tlb_clk;
> >  	void __iomem		*local_base;
> >  	u32			 sec_id;
> >  	u8			 num_ctxs;
> > @@ -643,11 +644,20 @@ static int qcom_iommu_enable_clocks(struct qcom_iommu_dev *qcom_iommu)
> >  		return ret;
> >  	}
> >  
> > +	ret = clk_prepare_enable(qcom_iommu->tlb_clk);
> > +	if (ret) {
> > +		dev_err(qcom_iommu->dev, "Couldn't enable tlb_clk\n");
> > +		clk_disable_unprepare(qcom_iommu->bus_clk);
> > +		clk_disable_unprepare(qcom_iommu->iface_clk);
> > +		return ret;
> > +	}
> 
> Seems this is an excellent opportunity to replace
> qcom_iommu_enable_clocks() to clk_bulk_prepare_enable() and disable,
> respectively.

So we have two required and one optional clocks.  I guess we don't want
to use clk_bulk_get_optional() to get all of them as optional.  So we
will end up with getting clock with individual call and enabling/disabling
with bulk version.  I'm personally not fond of this mixed style.  But if
you really like this, I can change.

> 
> > +
> >  	return 0;
> >  }
> >  
> >  static void qcom_iommu_disable_clocks(struct qcom_iommu_dev *qcom_iommu)
> >  {
> > +	clk_disable_unprepare(qcom_iommu->tlb_clk);
> >  	clk_disable_unprepare(qcom_iommu->bus_clk);
> >  	clk_disable_unprepare(qcom_iommu->iface_clk);
> >  }
> > @@ -839,6 +849,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
> >  		return PTR_ERR(qcom_iommu->bus_clk);
> >  	}
> >  
> > +	qcom_iommu->tlb_clk = devm_clk_get(dev, "tlb");
> 
> Wouldn't "tbu" be a better name for this clock? Given that seems the
> actually be the hardware block you're clocking.

I was trying to emphasize the function of this clock.  But I agree that
'tbu' is a better name now.  I will change it in v2.

Thanks for the comments.

Shawn
