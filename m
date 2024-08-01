Return-Path: <linux-arm-msm+bounces-27670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B626944505
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 08:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02390281853
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 06:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D36E15748F;
	Thu,  1 Aug 2024 06:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FP810te6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38FE158547
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 06:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495507; cv=none; b=irCx9+HvwbB1VbopRM2plR2P2+mgYK+o22pyi2eccLVb8zdZJkZJgs+REkd/C+7sK+VrLc+HG1RHLff+wfXrj6P1FGEPktR5CnwNWpk2zD9L392ZPEEhjg0YGjaa198xoXX1J2xhMx/4XKsk9fKc6CTEmnzILtoSuZJLlIeSQRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495507; c=relaxed/simple;
	bh=xRpns8Z1kTkYGAw219DqBCRKDHyqKxM9xgdFPGqLpp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvL0MOH8+L+VbmWtYNlvG8KRsN+FRE8ADC71I3WizJs3XXaGXSfkm5x5ECpvaQejSbNndaGuRsiaFlbGc6dsv+BOHHVcmN2ZNUTiTK8L42x/JiC6uJvKqe+VnJAieqV8sBvOYP5AnPpoCRmMQYR2jiQ8xq0Voo+4c9Kk8mZslOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FP810te6; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2642cfb2f6aso4400539fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 23:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722495504; x=1723100304; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b80CEDH1AWD7dRM9ZkzDS0U0qYNdNBA0wVmoesZ+ivU=;
        b=FP810te6ipT3/mSkZiXGjwnJTzyewaz5+/K6dNViVBLDt6Yt4LGCH85KYzJRlvutN2
         FKz9QU8o/hc53gRL8MR4tG/XQPzJ+4Nyd5MHYtTd195sy2ZUuSrx4dFKcD7BmmbYKkUj
         /1fEvFxSZK8sQCNcCP3dck7XZUQqVTxf5dnBCjM9SQS8AVVUTlvyuvqyZYyqKmvUEXNw
         LhGNPM5VATvdPpL6g53E4q4btSvd8bx9iJRGFyWJ7IYZwFB2kUJrT1z0TN7VRBB77CNq
         xqZasQ8mCLJPRjlOMcE+1yCisihNRwr9bkJmGJDmzri0IKTZZGTzbmfskqELvIbg8PE/
         rm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722495504; x=1723100304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b80CEDH1AWD7dRM9ZkzDS0U0qYNdNBA0wVmoesZ+ivU=;
        b=Te++KR2JB9IJ7m4QI+AGWMp7zsglQAfBguovRtzs7ZnpFKf5u7AXc+T+Aeeff5jSN0
         fwMnANjrTueTAfQ7No+YBPFgGbHpwMM+gUvu9R7qsHiFjqJa3xfgrBskJrXo9WaHte/j
         ev0zIUUsSJ7Ymnh0PoaO0OQdXf0fHi8VOt4QZ+2euLMCIwLRr4ZtS3/fWjyDsXXg7ELi
         p9wbZMPsuGcw04gDnhee+iOxsxjQk/NnfCI+a99RJ49E+i9ZuEI0NcHhD4WjJJb223aw
         xqxyRbsusEaSlXt7IndJHuvYSq7/c0fynemvOo0ADV1+U9wzrPekAt/xVDhrspnl/sRX
         XXzg==
X-Forwarded-Encrypted: i=1; AJvYcCV2O+aBeW8Dfgf1SkIGqoajvTScjq8hq9GcR1ZDm4N9fpawvrQ8sm9RQtguvoHxkEYfJfguh+mi7jzK/CHiB/zLmE/rnf/IE1OZ8/8MLA==
X-Gm-Message-State: AOJu0YzT26AdUyecVfcPdMxpnRneYLRvYI0ikBEMBQ6Jc3u/Vfeb25Xa
	8Q3vQivhoy9srqvtKudfch/IJ2QM0ERvn2jgbBeYfcn3y9LjhAz7ivx0esxlg0RDbwa14TNuH+M
	=
X-Google-Smtp-Source: AGHT+IEAZToGJkTgcxaM2rLESmbJojcIECRtbj2ajP/I4aD7kMYijhp0v1pTxUNit5zec6JnLqQU5w==
X-Received: by 2002:a05:6870:8a22:b0:25e:b999:d24 with SMTP id 586e51a60fabf-26879d81d10mr1705185fac.0.1722495504609;
        Wed, 31 Jul 2024 23:58:24 -0700 (PDT)
Received: from thinkpad ([120.60.66.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead81234dsm10912944b3a.115.2024.07.31.23.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 23:58:24 -0700 (PDT)
Date: Thu, 1 Aug 2024 12:28:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom: qmp: Add debug prints for register writes
Message-ID: <20240801065814.GA3705@thinkpad>
References: <20240731115637.90351-1-manivannan.sadhasivam@linaro.org>
 <nkfrtuxv4ueow66bnazyb4ul3pz3z3wo6zsptu6wnw7hflxerx@pkwn7sx6gfqi>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nkfrtuxv4ueow66bnazyb4ul3pz3z3wo6zsptu6wnw7hflxerx@pkwn7sx6gfqi>

On Wed, Jul 31, 2024 at 09:26:27PM -0500, Bjorn Andersson wrote:
> On Wed, Jul 31, 2024 at 05:26:37PM GMT, Manivannan Sadhasivam wrote:
> > These register prints are useful to validate the init sequence against the
> > Qcom internal documentation and also to share with the Qcom hw engineers to
> > debug issues related to PHY.
> > 
> 
> I've written this patch every time I've touched one of these PHYs, so I
> certainly like this.
> 

Me too :) I've been carrying this as an out-of-tree patch ever since I started
bringing up Qcom chipsets.

> > Sample debug prints:
> > 
> > QMP PHY: Writing Reg: QSERDES_V5_COM_SYSCLK_EN_SEL Offset: 0x0094 Val: 0xd9
> > QMP PHY: Writing Reg: QSERDES_V5_COM_HSCLK_SEL Offset: 0x0158 Val: 0x11
> 
> That said, with multiple instances of PHYs being configured at about the
> same time it seems this would benefit greatly from something identifying
> which PHY instance the write relates to?
> 
> dev_dbg() would certainly be nice...
> 

I understood that after comments from Dmitry. So v4 has this:

qcom-qmp-pcie-phy 1c0e000.phy: Writing Reg: QSERDES_V5_COM_SYSCLK_EN_SEL Offset: 0x0094 Val: 0xd9

- Mani

> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > 
> > Changes in v2:
> > 
> > * Modifed the debug print to include reg offset
> > 
> >  drivers/phy/qualcomm/phy-qcom-qmp-common.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-common.h b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> > index 799384210509..40beb413328f 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> > @@ -9,6 +9,7 @@
> >  struct qmp_phy_init_tbl {
> >  	unsigned int offset;
> >  	unsigned int val;
> > +	char *name;
> 
> const?
> 
> Regards,
> Bjorn
> 
> >  	/*
> >  	 * mask of lanes for which this register is written
> >  	 * for cases when second lane needs different values
> > @@ -20,6 +21,7 @@ struct qmp_phy_init_tbl {
> >  	{				\
> >  		.offset = o,		\
> >  		.val = v,		\
> > +		.name = #o,		\
> >  		.lane_mask = 0xff,	\
> >  	}
> >  
> > @@ -27,6 +29,7 @@ struct qmp_phy_init_tbl {
> >  	{				\
> >  		.offset = o,		\
> >  		.val = v,		\
> > +		.name = #o,		\
> >  		.lane_mask = l,		\
> >  	}
> >  
> > @@ -45,6 +48,8 @@ static inline void qmp_configure_lane(void __iomem *base,
> >  		if (!(t->lane_mask & lane_mask))
> >  			continue;
> >  
> > +		pr_debug("QMP PHY: Writing Reg: %s Offset: 0x%04x Val: 0x%02x\n",
> > +			t->name, t->offset, t->val);
> >  		writel(t->val, base + t->offset);
> >  	}
> >  }
> > -- 
> > 2.25.1
> > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

