Return-Path: <linux-arm-msm+bounces-28407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C1F950B0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 19:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11793286D2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 17:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6E2200AE;
	Tue, 13 Aug 2024 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJgebXuf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B05199385
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723568624; cv=none; b=g7quUfBoH/suA3yjQvSUpTWSmlbCDpQEH2dVg4GO3TURsJmTQoRqjwrDTmTZ2CaB73NIXxigH6CKDSV/adaX6/oaoSS1rL2Zh0Y7FMRCVIJJsHoHiSIFlH2sr04shJ8lrtSoU3Y72ZJ8Vc+2ZaDLMLm6xCGSwqQSHvdqPR0/3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723568624; c=relaxed/simple;
	bh=+88RSkxN/H6afefxdGHCqq377VWT9vaJAn1EHtYr1rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrLGr2nTmwM/TpUoVAO0u56vOE+hQWmMAcSj0qsb9R6cMl1nITiGvWGWiJAmqkM90kmfbPIhsM4u8t11Qb/yuRu4X5y4m8BE60B2CLF7EZMwM6i3KungK66pf4AqawgCmoVqT583NXjXEg5h5PwPBe9tbxwA04XOpc2i00whc0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJgebXuf; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a1d3874c1eso302465185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 10:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723568621; x=1724173421; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+N8UBYC8SKNdClQHm8KFeXbKwY6AotyQfa8NkNjLDpo=;
        b=BJgebXufE/+3ao08QXZf8tDY66VhoFMoUKvWbYlIvsD0WeHnxOFknK9zQdJKutGz8I
         bDBIl5fHlMTxAvLQtPmYiggpNgyZtog73ODamy1pvqg+6HDo61HHp9tLEYzGU0EHrgNa
         wZyRIf5D9NdTtTToMce4c4YVN1Z8xq1d0hSFMPWwpAWFvMhmjzLgapBevZuq4yXnORBn
         /caqOyAesszOgJ07AUpgr/B8G+0TWA2IwWeAZN3oGWdADTZt6rzKf8TX8evLZ0OQQgAM
         6PBZhx47i+d35CakaNpYOSxho/SjxmxHOxUTzAXXqrZOt8drfMVMZm+tIxM8EFRq4/Nl
         LSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723568621; x=1724173421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+N8UBYC8SKNdClQHm8KFeXbKwY6AotyQfa8NkNjLDpo=;
        b=u5nREfwJgd3g3UXgV10fjiXWfTDumrA5uT90QlqUoZFSgMpThXvs/h0ApTi0l2buh5
         EBrBS9J4Qon3ZOvuUw9FXmnuURWfS+UYkuyyJWFlIxCmimFjrmA3REMKaHnbJ3rjnHnU
         dhEBDAi6oz8MynM0v/eYDAHjovCa9ZuykbQ0eD9y2Y8yLcbAVMhHF0a9XDTWXDJVYuxs
         vO2fvePP/deX7TmgqL0H5rQOvx/Tot/FgLgba+yV9LtoKcMvMvDOj/ilRjnQyJqBmhuq
         roVb4DUnpvusN34f/gKSzkSMttxUjN1HZ4NGlmHeyZw9549NCuKzxEiD3YXJudeJne0x
         eSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhTGDvgcU79mIsFUiaMchAhJc/843TF+/TuwxxoBxhsVU3DYCmBsdLZr7gILzManrJK/CehXfSkECWJcq14VV6diRpxGBzFiHIFuq7rQ==
X-Gm-Message-State: AOJu0YzEX3a63wRxeH8Uvno11/avvlptglSpcZajPU3B871Si4rdirql
	SvhHWS68Mn7Hwkot9DGlBqtaGlvGtWswDJh0L2/NnlQDtM98EMwLOtAKiGbFcUyaUwuEnOXrLHs
	=
X-Google-Smtp-Source: AGHT+IEthgbcgoAs4AuQD1OxGgSkqwR6WBXoTTpYwsR/9bZNZTl31mk8MOD1vQ8KTchWQT15dBdhBQ==
X-Received: by 2002:a17:90a:680d:b0:2cd:2992:e8e5 with SMTP id 98e67ed59e1d1-2d3aab422a5mr123893a91.33.1723568572275;
        Tue, 13 Aug 2024 10:02:52 -0700 (PDT)
Received: from thinkpad ([220.158.156.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9ca6c4dsm10810545a91.33.2024.08.13.10.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 10:02:51 -0700 (PDT)
Date: Tue, 13 Aug 2024 22:32:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom-ep: Do not enable resources during probe()
Message-ID: <20240813170247.GA26796@thinkpad>
References: <20240727090604.24646-1-manivannan.sadhasivam@linaro.org>
 <uk7ooezo3c3jiz2ayvfqatudpvzx6ofooc2vtpgzbembpg4y66@7tuow5vkxf55>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <uk7ooezo3c3jiz2ayvfqatudpvzx6ofooc2vtpgzbembpg4y66@7tuow5vkxf55>

On Sat, Jul 27, 2024 at 01:32:40PM +0300, Dmitry Baryshkov wrote:
> On Sat, Jul 27, 2024 at 02:36:04PM GMT, Manivannan Sadhasivam wrote:
> > Starting from commit 869bc5253406 ("PCI: dwc: ep: Fix DBI access failure
> > for drivers requiring refclk from host"), all the hardware register access
> > (like DBI) were moved to dw_pcie_ep_init_registers() which gets called only
> > in qcom_pcie_perst_deassert() i.e., only after the endpoint received refclk
> > from host.
> > 
> > So there is no need to enable the endpoint resources (like clk, regulators,
> > PHY) during probe(). Hence, remove the call to qcom_pcie_enable_resources()
> > helper from probe(). This was added earlier because dw_pcie_ep_init() was
> > doing DBI access, which is not done now.
> 
> ... moreover his makes PCIe EP fail on some of the platforms as powering
> on PHY requires refclk from the RC side, which is not enabled at the
> probe time.
> 

Yeah. I hope Bjorn/Krzysztof could add this to the commit message while
applying.

> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

Thanks!

- Mani

> > While at it, let's also call dw_pcie_ep_deinit() in err path to deinit the
> > EP controller in the case of failure.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 14 ++++----------
> >  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> -- 
> With best wishes
> Dmitry

-- 
மணிவண்ணன் சதாசிவம்

