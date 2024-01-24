Return-Path: <linux-arm-msm+bounces-8075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96A83A2F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC469B25EC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 07:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050AC168BC;
	Wed, 24 Jan 2024 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXtpTJvW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470A1643A;
	Wed, 24 Jan 2024 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706081506; cv=none; b=JdXHcbV+A5bnohGfpoFhK2mvQSN/g8NKWGlfBLvj8w2VV1xt6JQiQGJRyLYKInslGTX91ZEhAgFfFYlYcOeWAPeTd3rUeVgf09Rf0rJc0xODeX9h+J7VDeprJkYlurIHrtYkKNU52WEpsoSlMlbu2dwj6LaN7sKHIINUlW6BjiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706081506; c=relaxed/simple;
	bh=Z5xkNjim3rqnsAkQGQ0id2z4IrLAeUuIm2Jfh85DiOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKJrM72AugW/LaVecgiy8k/o7iFKwiyz947k3hxO8FBKhF09Plf4W5VHFMIDSdBQVXvVADdnHoQAJvej8/DLvctkmRFDuFUjyfo3hGUCAkh51ZeCv0sreQF44hZ2wlDzZ1YJ6kS1dNLJgVuaNim2k2jA9ZlN7XfL8fPBNKPQQ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXtpTJvW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387DBC43390;
	Wed, 24 Jan 2024 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706081506;
	bh=Z5xkNjim3rqnsAkQGQ0id2z4IrLAeUuIm2Jfh85DiOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mXtpTJvWYNG5rhMRLdzLnwj82B1bHgSPNTuWT7YmbnuS4AjeTYYtOxm9SKIPOxgCp
	 f8MtpfN/qgF9Wf+ay3o+W8LGK2UbVRj77JFFDziPeB8lwAj1G2Ef4FR04hqfpmUQbA
	 gUFolGmdfZ5ZMEMDA4NbZHF+m8j3k0J18aYHIAZ4YYLR7UkJ0bYiXv44ES0HhE2pIw
	 99fqRI3Trjdd2g2j7/xsvYYR+5HHihLMCrSfv0A2U0S6GIgXSJHZDBLjk5ZKCRhxPM
	 RYBWgdzVvBJcnWaFjD89QOqWxlANl/DehjUWvRR9v3N0wEyTcWKtBrVDIQ2+G+1Dr1
	 e/9bE+lMuy4YA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rSXjp-000000001Mm-43yo;
	Wed, 24 Jan 2024 08:31:58 +0100
Date: Wed, 24 Jan 2024 08:31:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc8280xp: Fix PCIe PHY
 power-domains
Message-ID: <ZbC87YiI4Sg8eEbb@hovoldconsulting.com>
References: <20231227-topic-8280_pcie_dts-v1-0-13d12b1698ff@linaro.org>
 <20231227-topic-8280_pcie_dts-v1-1-13d12b1698ff@linaro.org>
 <ZY6sh8nlEUyEfL0u@hovoldconsulting.com>
 <20231229170334.GA9098@thinkpad>
 <20240122172528.GE3176@thinkpad>
 <Za6ns-xhN3N-cmIr@hovoldconsulting.com>
 <20240123170614.GH19029@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123170614.GH19029@thinkpad>

On Tue, Jan 23, 2024 at 10:36:14PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Jan 22, 2024 at 06:36:51PM +0100, Johan Hovold wrote:

> Ok. I tested by enabling the PHY clocks during qmp_pcie_clk_init() without
> PCIE_GDSC. It worked for one instance of the PHY which doesn't have
> PCIE_PHY_AUX_CLK, but for the PHY instance with this clock, I saw the same "clk
> stuck" issue. Then checking the internal documentation revealed that this clock
> needs PCIE_GDSC to become functional >.<
> 
> So to conclude, PCIE_AUX_CLK belongs to the controller and it needs GDSC. And
> PCIE_PHY_AUX_CLK belongs to the PHY and it also needs GDSC.
> 
> I will just submit a series to remove the PCIE_AUX_CLK from PHY nodes. Then
> in another series, I'll remove the GDSC for PHY instances that do not require
> PCIE_PHY_AUX_CLK.

Sounds good, thanks.

Johan

