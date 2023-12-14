Return-Path: <linux-arm-msm+bounces-4723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CD3812CA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02F8028275D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 10:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739153B18D;
	Thu, 14 Dec 2023 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+HvtCwn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A90E39FF7;
	Thu, 14 Dec 2023 10:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7537C433C7;
	Thu, 14 Dec 2023 10:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702548938;
	bh=spD0AcUmHxYeiPYt/c3JhN1YM2jl2kjLtal2py7KBa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+HvtCwnirQYqb0XbaZZISMF+cDLc/3vjA3UQTYQWPiM7Z67oMaX0TSMyybRQUwo3
	 VoH80XOrwpYpM+tma/YD2DjOzL/RnPF419qSrGIM82tSHG+nRcI7xozewZKviSs9Mz
	 RviVxNHT93s54OVcbGMkNUd+iiZUqIHuENqCtp6poC8CenDJLteveEAlVHawyyIctM
	 hnaWuLkLsiVCRH4oYptbvCWKi0GoRzUO9UQglIKK4wl0Z41N4h8U2umipGVKOiHQAp
	 wsqaBvgwqL/97KOepDh8TFUqA1+V8DLB8sRkUMQNDpQLrO8O98TyEqXdH9XFg/BvwY
	 quC3+8ZE6Sdew==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rDikg-0007zX-34;
	Thu, 14 Dec 2023 11:15:35 +0100
Date: Thu, 14 Dec 2023 11:15:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
	sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 00/16] Fix Qcom UFS PHY clocks
Message-ID: <ZXrVxmxY6wZprbBa@hovoldconsulting.com>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>

On Thu, Dec 14, 2023 at 02:40:45PM +0530, Manivannan Sadhasivam wrote:

> This series fixes the clocks supplied to QMP PHY IPs in the Qcom SoCs. All
> of the Qcom SoCs except MSM8996 require 3 clocks for QMP UFS:
> 
> * ref - 19.2MHz reference clock from RPM/RPMh
> * ref_aux - Auxiliary reference clock from GCC
> * qref - QREF clock from GCC or TCSR (TCSR since SM8550)
> 
> MSM8996 only requires 'ref' and 'qref' clocks.
> 
> Hence, this series fixes the binding, DT and GCC driver to reflect the
> actual clock topology.

Is this based on documentation for all the SoCs or on inference from the
current (upstream and downstream) devicetrees?

Are you sure that you should not just describe that some of these UFS
reference clocks are sourced from CXO in the clock driver instead?

Take a look at commits

	f446022b932a ("arm64: dts: qcom: sc8280xp: fix UFS reference clocks")
	f6abcc21d943 ("clk: qcom: gcc-sc8280xp: add cxo as parent for three ufs ref clks")

Johan

