Return-Path: <linux-arm-msm+bounces-27531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165F4942E0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 14:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA693283DB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 12:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC8A1B29B4;
	Wed, 31 Jul 2024 12:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pxb6RGFz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9944B1B1401
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722428370; cv=none; b=Bdc511j8i6vRcLyFsCAw/SgHPfKqPdvGSN9Fs5/sYe3k4UbLdUbzDf4sg0nFfQiASEJ6m8PXvrwcdDNYoap47nc4S1XwQzzgdxWERbdToMO3Yc3Fa/ojUkkTABUZBYcYf8riDqswsdt3o/xXE8SHbW+nLu4kcyE6jL7HdjoADZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722428370; c=relaxed/simple;
	bh=A5r0NANpmhLQHt+RRxDRqKsHTSeSEtZr5R1TqvCSWPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AznUZPDQLbZeh7mOgkNLcKc6fAK2Qlp7vtPfZ8aa3RsoZXN/q/8xux+0V3I9xKU3/ICr6qcLIyma0FF6g+mfcuFhFEXhuecNV7yS+GyMhHcbTnX8paLTmEhrh14pzzhggu9Pq8DA7a+xDvM3zmGat+hXpxq467hGfeX3exKwx7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pxb6RGFz; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ef2d582e31so68619081fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 05:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722428367; x=1723033167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZS7SjZ0Q1lIeKnPxLIzMq7+G1/0CZ8+qiYitWCXl91c=;
        b=pxb6RGFzVNvX+YrVQVmA2qIX3UxnLDlFa8awgp7sy2SDmsBI9g5pQpOlR3H99CQPgJ
         PHKN07fyiG+6FsPPh7oKWjMZLtde2KkiMzKFZJuLEvzwyR5/PukPqyxWLO5xU+Qw00Yw
         E/+XlWiL1La24Lj+AxIh7w+4S7bCMWFKEb2jerFFNZBQsBvph030MGfDMc/LusMTPqMu
         10Fx1GtU6r+xHJG/vlOPbtzb//tRkZbyo4UttBFss1vuqG+i5pSLZxhnnCV1IvCZCjZg
         bS7wP9YuKQA5DbqJXzWDNIDV2VME3/H2adYCZvyBw2Wt2mfakiz1TtXovQV3Z1mBJ2AF
         FwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722428367; x=1723033167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS7SjZ0Q1lIeKnPxLIzMq7+G1/0CZ8+qiYitWCXl91c=;
        b=V//uyfQ2BOsY/RpDl4NyKsE9rTWkkzbK7hPiiM0yqIcXDWyaJ/ipj9JTrEy3UVuR44
         odVgH7rTLoPBoe0RLhf1bXRgSAPOjbx1ccTpXMNibMZeO588FLac3z/Rmj/bLMjYvy4M
         5h7y0r6UY+Po42uNRhYXOPJQvmsRdXiBdIND998U80Sa16RoEZ2JU3wGdb6P9yMG2ek5
         wPk2cH7FNurLbYCqbOA3lVM7KWNtpP/SXNI7MwN6f8HT5qW72Py48mYEjklNWDqo3Qkh
         kQCDvStZX8m8vFhr82ZZlkjGA/qHMNE7rocIofvwYm/6eY7I2EoTtXJgzXQJvFiaPwXQ
         owwg==
X-Forwarded-Encrypted: i=1; AJvYcCUnvI9Z2bgn66ToVJMezCBJLRyVozKPTPn4V1MckkIIEKaLu6PFmK2a5AD+h8i2Rt64Qjiwngx9cEGoArpAVhflTB85IJuP5x3m27uSLQ==
X-Gm-Message-State: AOJu0YzOzmHlGgvNvts+w7aP/e1CyJsFDx/79EXfZgnEk7kONu5eXvSc
	LKWxolIAlBmPfVrmoP8Q7YFcg64Y75pzKdEIHh6SuLJAViPOrSD/cyDrMWUwIWc=
X-Google-Smtp-Source: AGHT+IFwcEfe8qCY6v5xorKupZOP+DOCeKfMqDzht/uIvX7Fps/kmNwieXy5dgRLm35+kmGBuw2/7w==
X-Received: by 2002:a05:6512:1142:b0:52c:def3:44b with SMTP id 2adb3069b0e04-5309b27d680mr7587479e87.31.1722428366532;
        Wed, 31 Jul 2024 05:19:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c08cf9sm2201909e87.149.2024.07.31.05.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 05:19:26 -0700 (PDT)
Date: Wed, 31 Jul 2024 15:19:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	kishon@kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp: Add debug prints for register writes
Message-ID: <sqaeseivhysqzzc2udkjv23l5tysjr6hxtlide3an7dngwtdoe@njmgfk3kcvt6>
References: <20240730100351.51454-1-manivannan.sadhasivam@linaro.org>
 <ZqoY5kFLDEmkb495@matsya>
 <knjl4q5zyqz3wrqp5aawgpxk6aqggvteb72enpsgweulgrxmnu@ol42qtug4xvi>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <knjl4q5zyqz3wrqp5aawgpxk6aqggvteb72enpsgweulgrxmnu@ol42qtug4xvi>

On Wed, Jul 31, 2024 at 03:18:34PM GMT, Dmitry Baryshkov wrote:
> On Wed, Jul 31, 2024 at 04:28:46PM GMT, Vinod Koul wrote:
> > On 30-07-24, 15:33, Manivannan Sadhasivam wrote:
> > > These register prints are useful to validate the init sequence against the
> > > Qcom internal documentation and also to share with the Qcom hw engineers to
> > > debug issues related to PHY.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-qmp-common.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-common.h b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> > > index 799384210509..e6a6bcfcac28 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> > > @@ -9,6 +9,7 @@
> > >  struct qmp_phy_init_tbl {
> > >  	unsigned int offset;
> > >  	unsigned int val;
> > > +	char *name;
> > >  	/*
> > >  	 * mask of lanes for which this register is written
> > >  	 * for cases when second lane needs different values
> > > @@ -20,6 +21,7 @@ struct qmp_phy_init_tbl {
> > >  	{				\
> > >  		.offset = o,		\
> > >  		.val = v,		\
> > > +		.name = #o,		\
> > >  		.lane_mask = 0xff,	\
> > >  	}
> > >  
> > > @@ -27,6 +29,7 @@ struct qmp_phy_init_tbl {
> > >  	{				\
> > >  		.offset = o,		\
> > >  		.val = v,		\
> > > +		.name = #o,		\
> > >  		.lane_mask = l,		\
> > >  	}
> > >  
> > > @@ -45,6 +48,7 @@ static inline void qmp_configure_lane(void __iomem *base,
> > >  		if (!(t->lane_mask & lane_mask))
> > >  			continue;
> > >  
> > > +		pr_debug("QMP PHY: Writing: %s --> 0x%02x\n", t->name, t->val);
> > 
> > This lgtm, but fails to help when offset _might_ be incorrect, including
> > the offset value as well (not just the name) would be better imo... 
> 
> Can we please use dev_vdbg instead? Having dev_ part makes sure that we
> can not mismatch PHYs and the sequences. _vdbg is less important, but
> I don't think we want this in the log messages unless absolutely
> required.
> 
> Also, could you possibly apply this to all other QMP drivers?

Please ignore the last phrase, it is used by all QMP drivers.

-- 
With best wishes
Dmitry

