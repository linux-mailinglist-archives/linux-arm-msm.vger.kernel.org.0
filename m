Return-Path: <linux-arm-msm+bounces-32169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B7497E2AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Sep 2024 19:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CCE91C20D2D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Sep 2024 17:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDD62BAF1;
	Sun, 22 Sep 2024 17:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RVdVgmwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA0626AD0
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Sep 2024 17:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727024971; cv=none; b=UPAxpTKqyI1C9LF5Kp59bayAHi/YLqLQyTKPoXDQJj6Kp6y0XFWRg/Sqw3K3jFdcjYJ8DvFWUxtBNXyZ7rQsiZH2d3joVWFa2HLDvY3xYf3xYnC0/ldabyisRUEPceo6KwkwN+LnAdhSTliiko1inmoCo6S1HkciuPr+k0xX/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727024971; c=relaxed/simple;
	bh=7kPmqFQNL8wHbsPJ1aFo4mgkSTjutG+BY+1kZiG8quU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQo4mG/jr1+1h+rr5nybiQFSfF8YDX0+gQ9bhuXX85Ud27b4vhaBsnwo2+88hqiQiFSpV/OcOOgCVjdQE7TOsOp9pt26IIrbAXjdTd7yIxbq3LJ71loyPjd26XN7qpY+QQwpal7sBEqvYlQjPJvn2rf/f3RijIvrW8e2JtCFCjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RVdVgmwq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so22343205e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Sep 2024 10:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727024968; x=1727629768; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L0rIrXzxLzm1RYymakq/5yWW79oFHaAAUNk6PTkjpnU=;
        b=RVdVgmwq2gl2Qr+72ogBtUR1SOZjuyexkfBIdXMRmgMec1gsqU1ivluOcDZScjHaXj
         c7kg7yLNaBxQ37vi9OnjnQk56KQVhdsiCEuCcEbWXL6vl57lNhQmVb6RvHyaWbkePkGX
         ZBLoX9P/8+LsgmLH38Vu30KcmqqmTzayP9VLFaIHqnNcIr6rOeb3HIxw82B/DPi/ELFQ
         O5QVDkdG0mHgIoGNmIKpicnub/wj46rLFc9lr1xCB4bRTl4TYUDoFKKWiUAzy1nz6Nzi
         SuKDJal/0e3BUEzQIQj2g1CxNhyryqIWRDzqSbedZhHTeSx/EFOmk9hBxZMAsDT98Gzz
         jXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727024968; x=1727629768;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L0rIrXzxLzm1RYymakq/5yWW79oFHaAAUNk6PTkjpnU=;
        b=vA5bNIfCvKajDdCiYdecZoeVannpL9pI48ezjDhrWD7UjFk1HDXmZwUgXLKaJFd2+A
         iVmJV4sdaKOSTRPe9fw8klQu2vqKpLpxOrornk/9WlT0PDmuzus9aSjFKfq932MI/cNN
         ygd23rbRlt82ZZTIAAdrH5kXiSIcPEAGkK8fYHAcLWsyxI4WXSTaSMlueo5LWrCdB+Gm
         Nhcnrvho4MHMJEGC6mEPwKRPKs6BHzDq4R0t3gSDWXzkmELJ0rhazgxamJObnzpMWAq4
         3ul8u0fMUBA3JjCAMazjK5qudajhi7Mm9yshBhoto3UYj1Npx1avHLAc61M9V8uF37GG
         827w==
X-Forwarded-Encrypted: i=1; AJvYcCWJEjijOTYlIcH+DEoLDOaoeNafH6zbAJbpahTDysfTR6aRfgg70ucKapYHWDV6IYkuXUlQrO3eEnU3VDZe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy65Iw/K4m2b1Dkh9m2zwL2IktcNhlJOfmrrVBpnA/CkSPRSgBm
	MoLkvY4xnExgokQSmfsY/eSF2pJgoxDnJ5Ehw57Sm2C6vqKmublBPboAniViRw==
X-Google-Smtp-Source: AGHT+IHnnuaHgxDj+rS3r9lgGu134/fQ270qm0dfx4TIlDOErD+D6Q+2jXX//mse26TLw59cSmOqYw==
X-Received: by 2002:a05:600c:1ca2:b0:42c:b8e5:34d5 with SMTP id 5b1f17b1804b1-42e7a9fe8dbmr52478745e9.15.1727024967852;
        Sun, 22 Sep 2024 10:09:27 -0700 (PDT)
Received: from thinkpad (i53873832.versanet.de. [83.135.56.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e801d66f6sm55926815e9.29.2024.09.22.10.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 10:09:27 -0700 (PDT)
Date: Sun, 22 Sep 2024 19:09:25 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, abel.vesa@linaro.org,
	quic_msarkar@quicinc.com, quic_devipriy@quicinc.com,
	dmitry.baryshkov@linaro.org, kw@linux.com, lpieralisi@kernel.org,
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Add support for PCIe3 on x1e80100
Message-ID: <20240922170925.qcuwja6oaqlbng5j@thinkpad>
References: <20240913083724.1217691-1-quic_qianyu@quicinc.com>
 <36bd9f69-e263-08a1-af07-45185ea03671@quicinc.com>
 <6f1118eb-89cf-4fd4-a35d-e8b98b0b7a8d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f1118eb-89cf-4fd4-a35d-e8b98b0b7a8d@quicinc.com>

On Thu, Sep 19, 2024 at 10:14:06PM +0800, Qiang Yu wrote:
> 
> On 9/14/2024 11:59 AM, Krishna Chaitanya Chundru wrote:
> > Hi qiang,
> > 
> > In next series can you add logic in controller driver
> > to have new ops for this x1e80100 since this hardware
> > has smmuv3 support but currently the ops_1_9_0 ops which
> > is being used has configuring bdf to sid table which will
> > be not present for this devices.
> > 
> Sure, bdf2sid map is not supported and required since we use smmuv3 for
> pcie on x1e80100. Can I add a new ops which is same as ops_1_9_0 basically
> and only config_sid callback is removed. Or add a new flag to determine if
> we need to config bdf2sid map like no_l0s.
> 
> Hi Mani, what do you think about this?
> 

Good question. IMO it is better to add a new ops even though it duplictes the
callbacks. Because the newer platforms are not going to need this bdf2sid map
anyway. But if we add a flag to determine that, then the check will become,

	if (pcie->cfg->ops->config_sid && !pcie->cfg->smmuv3)
		...

And this doesn't look good as both conditions are false for X1E80100 i.e., it
doesn't need bdf2sid mapping and it is also a SMMUv3 platform. Moreover having
two checks here makes it confusing also.

So let's use a new callback. But please mention the IP revision in comments as
like other ops.

- Mani

> Thanks,
> Qiang
> > 
> > - Krishna Chaitanya.
> > 
> > On 9/13/2024 2:07 PM, Qiang Yu wrote:
> > > This series add support for PCIe3 on x1e80100.
> > > 
> > > PCIe3 needs additional set of clocks, regulators and new set of PCIe QMP
> > > PHY configuration compare other PCIe instances on x1e80100. Hence add
> > > required resource configuration and usage for PCIe3.
> > > 
> > > v2->v1:
> > > 1. Squash [PATCH 1/8], [PATCH 2/8],[PATCH 3/8] into one patch and
> > > make the
> > >     indentation consistent.
> > > 2. Put dts patch at the end of the patchset.
> > > 3. Put dt-binding patch at the first of the patchset.
> > > 4. Add a new patch where opp-table is added in dt-binding to avoid dtbs
> > >     checking error.
> > > 5. Remove GCC_PCIE_3_AUX_CLK, RPMH_CXO_CLK, put in
> > > TCSR_PCIE_8L_CLKREF_EN
> > >     as ref.
> > > 6. Remove lane_broadcasting.
> > > 7. Add 64 bit bar, Remove GCC_PCIE_3_PIPE_CLK_SRC,
> > >     GCC_CFG_NOC_PCIE_ANOC_SOUTH_AHB_CLK is changed to
> > >     GCC_CFG_NOC_PCIE_ANOC_NORTH_AHB_CLK.
> > > 8. Add Reviewed-by tag.
> > > 9. Remove [PATCH 7/8], [PATCH 8/8].
> > > 
> > > Qiang Yu (5):
> > >    dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100
> > >      QMP PCIe PHY Gen4 x8
> > >    dt-bindings: PCI: qcom: Add OPP table for X1E80100
> > >    phy: qcom: qmp: Add phy register and clk setting for x1e80100 PCIe3
> > >    clk: qcom: gcc-x1e80100: Fix halt_check for pipediv2 clocks
> > >    arm64: dts: qcom: x1e80100: Add support for PCIe3 on x1e80100
> > > 
> > >   .../bindings/pci/qcom,pcie-x1e80100.yaml      |   4 +
> > >   .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |   3 +
> > >   arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 202 ++++++++++++++++-
> > >   drivers/clk/qcom/gcc-x1e80100.c               |  10 +-
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 211 ++++++++++++++++++
> > >   .../qualcomm/phy-qcom-qmp-pcs-pcie-v6_30.h    |  25 +++
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_30.h |  19 ++
> > >   7 files changed, 468 insertions(+), 6 deletions(-)
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_30.h
> > >   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_30.h
> > > 

-- 
மணிவண்ணன் சதாசிவம்

