Return-Path: <linux-arm-msm+bounces-45476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B290A15D9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 16:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87505165DC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 15:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD872190497;
	Sat, 18 Jan 2025 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iv/7Z5Nx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9878FEEA9;
	Sat, 18 Jan 2025 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737214010; cv=none; b=Bn3+Lg5G/u2QJr97EfDHLCjAwNelSnJnDb0s09j9VyEWljawg0zv/VnMKo4hwtT1VehCaqm2U5koZ7a5yzQGugHK+V+3WlExZVcEJ/psnzz2sLwGW9NSxKU6z0PHv8zKiOnroAMaz0MA/63WucX98A1y/NzwWvzYAfZcj24OyYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737214010; c=relaxed/simple;
	bh=fvkRJ2//5gmnj833MEERU+I5q/xhzqw+MJtSM4Wo2CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miIgpQ30YOLYg1SrK1VAzpGBk9LIGA6fPywsEHm6w3LJlhLUQoN+4FoYLPRg8MrK02Hnyy+fGW3cwqrc4asFmirb2lnUOrfrKPXuWwy7zjN3j9nsWODYUaNWUntT9guBLeDkidti2zKjFe0NKl770yhNNU9scn1qV0/huRGshIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iv/7Z5Nx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8149AC4CED1;
	Sat, 18 Jan 2025 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737214010;
	bh=fvkRJ2//5gmnj833MEERU+I5q/xhzqw+MJtSM4Wo2CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iv/7Z5NxNNA18T8qvqM0qeuOsWv+kSJkNO6shcM12LpYSRrtZwDxZAu+RbH06Vv6W
	 jHq93aTZ293amR2oV9wWisDWQgqDYBJr1aL2ETgTN9Pyj3cqOWA5d99pn8tuHSyKEi
	 Sj998WxYyhRq5oVtgBFc/bGLf2HbMiSXF355vQ0GDteCOsdJKWzmbDb7LQXe5sGAGP
	 xLgde2gtxFcWTKzF0V224DJvQ5ZsOl51tqK8xU2UGtqZrBINJrRynjYU4gE5W+MS3i
	 L5wOetE7PzIE9dzYhZ4W/gfTrSWj6HRO3rzvAGmOGfpagFutN1AuLjwliRpv3BuG0b
	 T7SO3g1p8ZNfQ==
Date: Sat, 18 Jan 2025 16:26:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Nitin Rawat <quic_nitirawa@quicinc.com>, Manish Pandey <quic_mapa@quicinc.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750
 QRD and MTP boards
Message-ID: <20250118-neon-adventurous-chachalaca-cccfa3@krzk-bin>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <20250113-sm8750_ufs_master-v1-5-b3774120eb8c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_ufs_master-v1-5-b3774120eb8c@quicinc.com>

On Mon, Jan 13, 2025 at 01:46:28PM -0800, Melody Olvera wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Add UFS host controller and PHY nodes for SM8750 QRD and MTP boards.
> 
> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 18 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 18 ++++++++++++++++++
>  2 files changed, 36 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


