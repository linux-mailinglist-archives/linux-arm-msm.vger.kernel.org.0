Return-Path: <linux-arm-msm+bounces-40476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 282BD9E5215
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3D33165C64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1831D61A4;
	Thu,  5 Dec 2024 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="et/2MYTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901851D5CDE;
	Thu,  5 Dec 2024 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394195; cv=none; b=YlCrQwoshHiI9E8oCdFCSQO3rUzvCwM85w+q61MkwEpYXnNE34B1DInJFW2m+Rb0/bVmWodXdsXsLeK2yEP1DeN3hHpJzBE2VdUgisN0S8xzYQv2XdY9cHjGx5T2aHgo2+0D1FERJ/aSCyzN4mup735ABLOWNAH8RWmPTaaHzG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394195; c=relaxed/simple;
	bh=UZ1KvcelYYledwTph6YzjUqPIYh/JDvmFymWS1QICb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GY8GN3OSW/8Jeiom54oNHKDsaGKcfY/PDC64E64rXXajr0WNPBJqM+WnJjxOcFW/P7YRezEAxvHlohOzei8gO4CxwDdXh7qEiaP3S8yaLuU1vquVgaCqhdTODliaouR+yh32HWrVNqRFcG/yLlVI2HF3BdLmoJf3VZH7aYU8A9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=et/2MYTx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A42C4CEDF;
	Thu,  5 Dec 2024 10:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733394194;
	bh=UZ1KvcelYYledwTph6YzjUqPIYh/JDvmFymWS1QICb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=et/2MYTxeWg9Ggq49R+blRWJpp9ZR+ILBLsSOcvLHEFFFxGSNd+Qa7gMHzzIqwRra
	 BsMFuGBmfb6gv5zjnZ47jkURhl+0c8ShFoMeUz6wgV5I2IaXQA5Ig6fsXk1+lQ8gHL
	 xJNcFzUmkSqi3q0U2LU0enqLtUZzyVHSiRWWtfP8Gb9bXdjzZq0516Gd64PkHNVPiC
	 gM2AvjEngSXrzj0spjStcMyD122JvgMkJrjN4oLnC3tbvwVYl4mnpTG+PGIfEj0ZBo
	 vFHHwS2AzrMbYOMVz/vtViA/bjHHBgYVLCAuquGIJFinSVOJyhKdwly6/3MDepOYAB
	 12XVr4zPoNAnA==
Date: Thu, 5 Dec 2024 11:23:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, dmitry.baryshkov@linaro.org, 
	abel.vesa@linaro.org, neil.armstrong@linaro.org, manivannan.sadhasivam@linaro.org, 
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp-pcie: add optional
 current load properties
Message-ID: <qvjtwilukxbeaxnbyzfkdsfkktm6p4yv3sgx3rbugpb6qkcbjy@rohvixslizhh>
References: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
 <20241204105249.3544114-2-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204105249.3544114-2-quic_ziyuzhan@quicinc.com>

On Wed, Dec 04, 2024 at 06:52:47PM +0800, Ziyue Zhang wrote:
> On some platforms, the power supply for PCIe PHY is not able to provide
> enough current when it works in LPM mode. Hence, PCIe PHY driver needs to
> set current load to vote the regulator to HPM mode.
> 
> Document the current load as properties for each power supply PCIe PHY
> required, namely vdda-phy-max-microamp, vdda-pll-max-microamp and
> vdda-qref-max-microamp, respectively.PCIe PHY driver should parse them to
> set appropriate current load during PHY power on.
> 
> This three properties are optional and not mandatory for those platforms
> that PCIe PHY can still work with power supply.


Uh uh, so the downstream comes finally!

No sorry guys, use existing regulator bindings for this.

Best regards,
Krzysztof


