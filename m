Return-Path: <linux-arm-msm+bounces-68979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F58B24920
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 14:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F59A727D63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE282F8BDF;
	Wed, 13 Aug 2025 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XqWy8mou"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1D02FDC5C
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755086646; cv=none; b=jD+LyvQtqUH/2kIjTV8ReAWwSqSQCMa+3yI0JhK5i5u0yoZTNbLPMNomdCGFypW+8vjqJPTTmKFqEtwaHsvQmSZdjjf+fz0RwuZbYhB24x7IEpBfGgWSgYFvJgEAo5Bmo/3fGhTR4P05ynbzdjmpca0UvBKyZXHL+53XB25o8pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755086646; c=relaxed/simple;
	bh=E1zf7JRhuUmQmJ5aAtAXCyObx6AGyK+Lp83DOnB+owY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouq/CJXy9sbMa178ym4OCfOP8GoM0o9h+x/CllT+O79YOSm4HKPaG18Bl2ksX860os7CrMFWSy9ckgTnaqoU0Nai4bdymUMTIuNNhMi7Hze540QMkJXEvlSOa7+1ObGD/noq6Z9PLvDpscqALUMeehH+nnwu7XffVwi4LJ6IgDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XqWy8mou; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-459ebb6bbdfso40521025e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755086643; x=1755691443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jFJEM6gKLS8APrjgYw576J/ohlNo10MJL9Wdiy6gJXU=;
        b=XqWy8mouDVBL+yrWb3Zq4RBIgnc9ayiuCPvPJs//f3ApY47dfd3NlkeCc4cxq3rM8x
         9icBssjT7ZJr4e0o8MuZRQk+oznZYqiLNcG5Bwl5OOyjO1s670lDberEcoMLSlFDaxc/
         6dDQ893mACRjnC7k1Zwux+PHiwHOcFGIkrobvBnmRjPDc6MMyDOhbfopLaHXQ5WHI8ne
         W0XlWwfiWBl3snzne+oQZvfRg2+XaZ/kXP4Sn01Us6ZlaMFOz+k6KK5R9P577bwZq0j3
         uTjGBL3ti9zPMJtblmkXwAH5vPOj8uBu5HMm2Y9I/hjQkhPBR7p29Gt89BDQHOApZ/1Z
         JcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755086643; x=1755691443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFJEM6gKLS8APrjgYw576J/ohlNo10MJL9Wdiy6gJXU=;
        b=wCxTVt7W/7QzLxx7p12JOKzCrphubeWAqiDsLLK8Pm9IUlRZ+BrFqQ6fv92avCciZ2
         re6MCHaPZwz7w3vxCIzn8Fl8w/3pjsR0/iVHHlxsF3oOIzzT/fb8aTjSjau7eCsMHPYQ
         dtWr+SuSW3dq5mZkXFcrkMJZuZIMONArrH4j+rs8mEytTWFUyEtJwCvZYFyuYHH6aOZW
         //rP2X2r9CnR56CDWROcKZ8NBKGaLFfjE2p/bF71SgAZ2muSsHFqyxv1GSc5DKEOGCmH
         D/DwQI2UAH6mpvREJ+n+3lOg+Mds7rCgm7ieFVcov15VtaOuwuEjekmUBHIxPGnhT/GX
         DNTg==
X-Forwarded-Encrypted: i=1; AJvYcCXzUYprxPk7alsbgT67UFr3xCdtAj9GIJFfOyPpQzUPB37V5ZS5xaBTNhk9pYkaCmLzz/n7zw2GitfoGuyw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4n8f4aV73YuNwSe9UPb4yxpmlkStGPVB1l73cdtP/qC3TBEKi
	0DNG0Fx0ZgKa1qJaUmvJsowt7RGhdtDVwoL2ZC2YrH1f8g48eLibC7V3ZP+T6CySBz8=
X-Gm-Gg: ASbGncumOJm/9hDuPeUDR1ij3XsAmVjkwPs0t3dKOF3gqm4gXGf1MSNM+NYEwb1weyV
	hNfKqGB71ITJ1tzUVsr8VuKMLyqcq1+7TgjScrrdXhR4j5luhwH8jTwI9y61uE9IUDN1UGEt7IJ
	bZTFWT/NcRUtrPfRglwCwTmyTRnbW8AQpi96xCtj/c4/z8j3USr5TFaM1YY/DSdYDqgpMtJW8LG
	Vyqe+0UpSxg6KD2Jt6rjvaQsu8eANnhecQLhYititIxKE8o3rQHnH1agDSB/mFa37/z2uvG7+10
	jK6+4iKQNBhxF5ZxfmNj/DLRHkl1u6S5LDldH//Fnmk3dwy9ZlER4F6DkDT5fAtymu5JI6QPHXu
	bx0kPrimx/HHHg7VaArxvlVWMdcnxXwXsCu6aQv2DcAh3
X-Google-Smtp-Source: AGHT+IEbIIUvKX+tZSVHZLQC9aoX5f2381vIkWSxUdNWd/V49S21DiHBFi/zBkvX8b3n3gIVaPjB/Q==
X-Received: by 2002:a05:600c:4f12:b0:456:fc1:c286 with SMTP id 5b1f17b1804b1-45a17949c46mr12423815e9.1.1755086642808;
        Wed, 13 Aug 2025 05:04:02 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:eb1a:a80:21cb:47a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c4beasm46169797f8f.30.2025.08.13.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 05:04:02 -0700 (PDT)
Date: Wed, 13 Aug 2025 14:04:00 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Wenbin Yao <quic_wenbyao@quicinc.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH] phy: qcom: qmp-pcie: Fix PHY initialization when powered
 down by firmware
Message-ID: <aJx_KjWFxeYE5U81@linaro.org>
References: <20250812-phy-qcom-qmp-pcie-nocsr-fix-v1-1-9a7d0a5d2b46@linaro.org>
 <f44beed6-72c3-4e86-834b-ac522c786bc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f44beed6-72c3-4e86-834b-ac522c786bc7@oss.qualcomm.com>

On Wed, Aug 13, 2025 at 12:13:31PM +0200, Konrad Dybcio wrote:
> On 8/12/25 6:30 PM, Stephan Gerhold wrote:
> > Commit 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention
> > support") added support for using the "no_csr" reset to skip configuration
> > of the PHY if the init sequence was already applied by the boot firmware.
> > The expectation is that the PHY is only turned on/off by using the "no_csr"
> > reset, instead of powering it down and re-programming it after a full
> > reset.
> > 
> > The boot firmware on X1E does not fully conform to this expectation: If the
> > PCIe3 link fails to come up (e.g. because no PCIe card is inserted), the
> > firmware powers down the PHY using the QPHY_PCS_POWER_DOWN_CONTROL
> > register. The QPHY_START_CTRL register is kept as-is, so the driver assumes
> > the PHY is already initialized and skips the configuration/power up
> > sequence. The PHY won't come up again without clearing the
> > QPHY_PCS_POWER_DOWN_CONTROL, so eventually initialization fails:
> > 
> >   qcom-qmp-pcie-phy 1be0000.phy: phy initialization timed-out
> >   phy phy-1be0000.phy.0: phy poweron failed --> -110
> >   qcom-pcie 1bd0000.pcie: cannot initialize host
> >   qcom-pcie 1bd0000.pcie: probe with driver qcom-pcie failed with error -110
> > 
> > This can be reliably reproduced on the X1E CRD, QCP and Devkit when no card
> > is inserted for PCIe3.
> > 
> > Fix this by checking the QPHY_PCS_POWER_DOWN_CONTROL register in addition
> > to QPHY_START_CTRL. If the PHY is powered down with the register, it
> > doesn't conform to the expectations for using the "no_csr" reset, so we
> > fully re-initialize with the normal reset sequence.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention support")
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > index 95830dcfdec9b1f68fd55d1cc3c102985cfafcc1..6a469a8f5ae7eba6e4d1d702efaae1c658c4321e 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > @@ -4339,10 +4339,12 @@ static int qmp_pcie_init(struct phy *phy)
> >  	struct qmp_pcie *qmp = phy_get_drvdata(phy);
> >  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> >  	void __iomem *pcs = qmp->pcs;
> > -	bool phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
> >  	int ret;
> >  
> > -	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
> > +	qmp->skip_init = qmp->nocsr_reset &&
> > +		readl(pcs + cfg->regs[QPHY_START_CTRL]) &&
> > +		readl(pcs + cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]);
> 
> I think it would be good to ensure the value matches platform config
> expectations, i.e. !(val & cfg->pwrdn_ctrl)
> 

I think ((val & cfg->pwrdn_ctrl) == cfg->pwrdn_ctrl) is what you want,
to check if all the bits we would set are actually set? That sounds
reasonable, I'll send a v2 with that soon.

I'll make the same change for QPHY_START_CTRL, to have it consistent
(checking for SERDES_START | PCS_START, which is what we would set).

Thanks,
Stephan

