Return-Path: <linux-arm-msm+bounces-30758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DED1296C35F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 18:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F1C21C24CE0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A96E1DA635;
	Wed,  4 Sep 2024 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZP/+QLqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083C91DC73E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725465875; cv=none; b=tT+Pyrhv/Po8Wk4jolUSl2rAlYedoY1xwKmFznkp+EiwuaUG43O7fgIOZx+1uiF03pt5a9xerAHL03DrqpGBEQtqmRni47MP/oJiJXlmXoE4Bl0qVnWjaUx7GkDo4ieJNtmkzWRTbP82nX4JMNXhU6+BHbVOBirpscX8bK+8GYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725465875; c=relaxed/simple;
	bh=cc1jVshxbFi/QLV3z/IpFhIUGiLhzD1RIo0yMPNS4Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rihcpPihZBac8tniUWP2yNbgk0GdZRUuIxQeaUYCUKaeRh2OnR/2Yq67akQuy1thn+DvipAw9k8qtMnjAxoUDfye1RGGuxT6Yrf1a0Qmxzm43l6cQkkFhXVqPtTl0i7usu+01sOI4zIWHo/rezTcmOFgFFJV4yVcXMjH7C2YQWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZP/+QLqx; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-714186ce2f2so5692074b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 09:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725465872; x=1726070672; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pTWIkafvhIyaw72vYF2nIu0q0KkJZo9TWe5SKwwB1cE=;
        b=ZP/+QLqxH7UZlfe6KsManmw6qPNYCDGaGBgBB0LsYzb64NK0dLPzz2MM2u82isPBQ8
         FG+aotAI/U7x18ehxFn2M3sFmlv6RexHRms8kl36/8wfDqJJ4V9RaS+14nDLGB94fzIu
         lb5TATMNNGXqpCGnYeaFCem9gBGroIXJpHiiDSsVkzpBC5507XOxdGjq9Ny+dzdqNUDK
         PlQUiHzo7agLRiFWkSsL3bdJ1n63IasW3DdOwQpuciUepFoA+Be8nZ6GB6I4AmHhUJ5k
         y5DmEPJyupZz3zO2Hd75cAwTS+XUanHxUFQlMXT4VuuRaDA1txubsg4uZl8YRqOX2rXV
         fAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725465872; x=1726070672;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTWIkafvhIyaw72vYF2nIu0q0KkJZo9TWe5SKwwB1cE=;
        b=CAU2N+t57UGQ6xEru1YjgNkMqRiXhW2O0jK0Vj1xGFUgZ7EWj18S8YJwwj3CfycW/w
         6h0723mJzIrgai/OI43HbzpHNexC7lvyQVvPzxsTW0xazCKuJ7eD+Ulwj2M8rezWAK0E
         Ys2/b+dZIuYiwHrFgYBgTthlv6eIK15P3RLKUc9jpfKE4rntMPUsIMMBQsuDX30rjDrK
         AJnJf92ylK6G/FUnOiw8ZiDhsppuoOdzwqP5G5jI1EX0Q7cL9rAoYlqbiu8/3UT3GOco
         a4KDAXvJSzkzl/V8ynMenmHjy0pIMhUPQ0h6paEItOxdwUnrmLtxdXR82C3vfJ/3X9Ii
         l4Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWqaa0tjho59o+zgPzffe7LdknN0zlzo6NZLvvF2/mHq85KNDwrNIbmdJF/srlT1Zrwf20Kki6OmPDEyDyt@vger.kernel.org
X-Gm-Message-State: AOJu0YzeA5ncwydB4YVH9xwFdDWRehllgWvPPsf6boFmlknjz/8N1sfm
	MHQ1Zn9rWZsuciMY+/qATefqTtvWlBtcg62RNwWW+ZPn1K4oqCCxZsVmvmuWVw==
X-Google-Smtp-Source: AGHT+IF8ZgHhZFQkLhu7G3/0nDy7t863NQyJpS+P5ULnYu+8Srp8PCWJulYiZnF2PeyUTMgRJhj56w==
X-Received: by 2002:a05:6a00:3e21:b0:714:241d:a323 with SMTP id d2e1a72fcca58-717457cf069mr12861507b3a.17.1725465872123;
        Wed, 04 Sep 2024 09:04:32 -0700 (PDT)
Received: from thinkpad ([120.60.128.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7178a9482d1sm25096b3a.71.2024.09.04.09.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 09:04:31 -0700 (PDT)
Date: Wed, 4 Sep 2024 21:34:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	abel.vesa@linaro.org, johan+linaro@kernel.org,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Subject: Re: [PATCH v6 4/4] PCI: qcom: Add RX margining settings for 16.0 GT/s
Message-ID: <20240904160422.gcyrdrzgc47w7pbd@thinkpad>
References: <20240904-pci-qcom-gen4-stability-v6-0-ec39f7ae3f62@linaro.org>
 <20240904-pci-qcom-gen4-stability-v6-4-ec39f7ae3f62@linaro.org>
 <ZtguJs128O-N07Eg@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtguJs128O-N07Eg@hovoldconsulting.com>

On Wed, Sep 04, 2024 at 11:53:42AM +0200, Johan Hovold wrote:
> On Wed, Sep 04, 2024 at 12:42:00PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
> > 
> > Add RX lane margining settings for 16.0 GT/s (GEN 4) data rate. These
> > settings improve link stability while operating at high date rates and
> > helps to improve signal quality.
> > 
> > Signed-off-by: Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > [mani: dropped the code refactoring and minor changes]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware.h  | 18 ++++++++++++++++
> >  drivers/pci/controller/dwc/pcie-qcom-common.c | 31 +++++++++++++++++++++++++++
> >  drivers/pci/controller/dwc/pcie-qcom-common.h |  1 +
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c     |  4 +++-
> >  drivers/pci/controller/dwc/pcie-qcom.c        |  4 +++-
> >  5 files changed, 56 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index 51744ad25575..f5be99731f7e 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -209,6 +209,24 @@
> >  
> >  #define PCIE_PL_CHK_REG_ERR_ADDR			0xB28
> >  
> > +/*
> > + * 16.0 GT/s (GEN4) lane margining register definitions
> 
> nit: Gen 4?
> 
> > + */
> > +#define GEN4_LANE_MARGINING_1_OFF		0xb80
> 
> nit: upper case hex
> 
> > +#define MARGINING_MAX_VOLTAGE_OFFSET		GENMASK(29, 24)
> > +#define MARGINING_NUM_VOLTAGE_STEPS		GENMASK(22, 16)
> > +#define MARGINING_MAX_TIMING_OFFSET		GENMASK(13, 8)
> > +#define MARGINING_NUM_TIMING_STEPS		GENMASK(5, 0)
> > +
> > +#define GEN4_LANE_MARGINING_2_OFF		0xb84
> 
> Same here
> 
> > +#define MARGINING_IND_ERROR_SAMPLER		BIT(28)
> > +#define MARGINING_SAMPLE_REPORTING_METHOD	BIT(27)
> > +#define MARGINING_IND_LEFT_RIGHT_TIMING		BIT(26)
> > +#define MARGINING_IND_UP_DOWN_VOLTAGE		BIT(25)
> > +#define MARGINING_VOLTAGE_SUPPORTED		BIT(24)
> > +#define MARGINING_MAXLANES			GENMASK(20, 16)
> > +#define MARGINING_SAMPLE_RATE_TIMING		GENMASK(13, 8)
> > +#define MARGINING_SAMPLE_RATE_VOLTAGE		GENMASK(5, 0)
> >  /*
> >   * iATU Unroll-specific register definitions
> >   * From 4.80 core version the address translation will be made by unroll
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-common.c b/drivers/pci/controller/dwc/pcie-qcom-common.c
> > index dc7d93db9dc5..99b75e7f085d 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-common.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-common.c
> > @@ -43,3 +43,34 @@ void qcom_pcie_common_set_16gt_eq_settings(struct dw_pcie *pci)
> >  	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, reg);
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_pcie_common_set_16gt_eq_settings);
> > +
> > +void qcom_pcie_common_set_16gt_rx_margining_settings(struct dw_pcie *pci)
> 
> I'd try to find a shorter symbol name here, "settings" seems redundant
> after "set". Perhaps just
> 
> 	qcom_pcie_common_enable_lane_margining()
> 
> or
> 
> 	qcom_pcie_common_enable_16gt_lane_margining()?
> 

This one looks better. Since lane margining is implemented in the receiver, we
don't really need 'rx' in the function name.

> if these settings are indeed specific to 16 GT/s. But perhaps it's
> better to let the helper honour pci->max_link_speed if different
> settings will later be needed for higher speeds:
> 
> 	if (pcie_link_speed[pci->max_link_speed] >= PCIE_SPEED_16_0GT)
> 		qcom_pcie_common_enable_lane_margining(pci)
> 

I did thought about it during the review, but this setting claims to be for 16
GT/s only. So I wouldn't recommend applying it to other speeds without checking 
with Qcom.

Unfortunately, I'm on vacation for 2 weeks and have limited access to Qcom
internal docs/chat. So won't be able to check it soon. If Shashank could check
it, it is fine. But on the conservative side, let's stick to 16 GT/s only?

- Mani

> >  void qcom_pcie_common_set_16gt_eq_settings(struct dw_pcie *pci);
> > +void qcom_pcie_common_set_16gt_rx_margining_settings(struct dw_pcie *pci);
> 
> And maybe something similar for the eq settings for symmetry.
> 
> Johan

-- 
மணிவண்ணன் சதாசிவம்

