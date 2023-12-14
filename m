Return-Path: <linux-arm-msm+bounces-4728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54712812D2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 063E71F2187F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 10:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69993C092;
	Thu, 14 Dec 2023 10:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5w1HLkE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8992837F;
	Thu, 14 Dec 2023 10:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20BDC433C7;
	Thu, 14 Dec 2023 10:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702550363;
	bh=yCEKQFaUrCZAt0Cggx/F1wMYgUKW9axB5dGFHkP8rxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E5w1HLkELARynQCRfDz4e/qOmrfpq/znPX7uuY+43vvYzB0JhDPZMpD90pHmb5+TS
	 pNar2GRPHylpBIgI/yXLg6mSjR+fHWHM2uVwD2+F2k704AHEnw2/vMDfKjf8ELTWss
	 8eXju5pKQonG+EN/Yo1CpqF0H0SVscHiWzDnC0NVCY4kaNyXJ/g3//zAF0xokFehC0
	 fmBrk5E0ySQus/FAPaF6KjZxe/ESQiEWaN/g/KjbxZeOr7Z3+lqXZzEmX4ieiqil7I
	 KmdayZLawHOGmHZMUHl8LDeyVicfnTJfI0uFpU+0YfCp/GgPDK0ggj/UhIzGnQlF3T
	 xyyVq54yS3Wnw==
Date: Thu, 14 Dec 2023 16:09:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
	sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 00/16] Fix Qcom UFS PHY clocks
Message-ID: <20231214103907.GL2938@thinkpad>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
 <ZXrVxmxY6wZprbBa@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXrVxmxY6wZprbBa@hovoldconsulting.com>

On Thu, Dec 14, 2023 at 11:15:34AM +0100, Johan Hovold wrote:
> On Thu, Dec 14, 2023 at 02:40:45PM +0530, Manivannan Sadhasivam wrote:
> 
> > This series fixes the clocks supplied to QMP PHY IPs in the Qcom SoCs. All
> > of the Qcom SoCs except MSM8996 require 3 clocks for QMP UFS:
> > 
> > * ref - 19.2MHz reference clock from RPM/RPMh
> > * ref_aux - Auxiliary reference clock from GCC
> > * qref - QREF clock from GCC or TCSR (TCSR since SM8550)
> > 
> > MSM8996 only requires 'ref' and 'qref' clocks.
> > 
> > Hence, this series fixes the binding, DT and GCC driver to reflect the
> > actual clock topology.
> 
> Is this based on documentation for all the SoCs or on inference from the
> current (upstream and downstream) devicetrees?
> 

It is based on the internal documentation. Even downstream devicetrees are
wrong. I should've mentioned it in the cover letter.

> Are you sure that you should not just describe that some of these UFS
> reference clocks are sourced from CXO in the clock driver instead?
> 

I don't get your comment fully. Could you please elaborate?

> Take a look at commits
> 
> 	f446022b932a ("arm64: dts: qcom: sc8280xp: fix UFS reference clocks")
> 	f6abcc21d943 ("clk: qcom: gcc-sc8280xp: add cxo as parent for three ufs ref clks")
> 

Btw, these commits are not accurate. In all the SoCs before SM8550, reference
clock for the UFS device comes from the UFS controller. There is a dedicated
register in UFSHC memory map that is being toggled by the driver to
enable/disable reference clock for the UFS device.

Since SM8550, reference clock is directly sourced from RPMh. I'm preparing a
series to fix it.

Unfortunately, this information is not depicted correctly in the downstream
devicetrees.

- Mani

> Johan
> 

-- 
மணிவண்ணன் சதாசிவம்

