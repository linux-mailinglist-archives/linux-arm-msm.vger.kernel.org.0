Return-Path: <linux-arm-msm+bounces-67266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A11B175A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 19:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D405C16989C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 17:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3462417EF;
	Thu, 31 Jul 2025 17:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbKdcQ2O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464111DE4E7;
	Thu, 31 Jul 2025 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753983301; cv=none; b=LQN5t6sM2IlVeCqs3vcyo35Ue85+1IP20YpTRhQhNLROHBMhsMoF6RgpsWQOFMhHJa2Z8Q67SkzAnuZQQsy+9fJuy6tZfwwoRESiUQaL6QE0q7b79B+XfiT+P8hUO1CGr2q+Cb/12wt6m9MpJuDHrqXoE8+9ROW5DsidhNmocW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753983301; c=relaxed/simple;
	bh=JiDnKF3IpXc6rXBjO09bRRekZPcZX7iA0oknDyM6mEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODec9+SEDsVWok/V4Y5CiYol/KYscx6PbImcPoQRCD48GuSTPhG9M5EtpL+3G3fw7FBmBQa0w5f/znuhcEZvnzuopQNGXJPy6rcvbj3OoNyNWKBcrWzCnNwu6l1xS/CXdtEY4KryoYlfusFEq3BwEOpybSqz60AttJCXaldPjOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbKdcQ2O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E50C4CEEF;
	Thu, 31 Jul 2025 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753983299;
	bh=JiDnKF3IpXc6rXBjO09bRRekZPcZX7iA0oknDyM6mEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nbKdcQ2OgY058bckyN1Zy0YS9uHrbuEtjZ1fLW5Y2tHDn70v3HHHABJnYuPDYPbRb
	 WplMlFwaFxahfBqTrT8Rf5EAOv7wMuYHKh1bjMrs0d/F8sp3kWgWE819PNDhX4GWZ2
	 MVdK66sAo3x/oitCPPq81RHZjuMmTld+Wv3HpAOMruDM5cYQ237g+N6pjEqHcx+FAM
	 f/KKMZbcH+3oRDOT7TdP8u1/87tK4isWghSnUm5/0wfqnqxmFBlxek/pPt5aTsiovw
	 ufJ5ppk6cXOfoKRWn0RflKjzeASBcDpOZtd5WzxPurQivLDSdjpw4kvNk2kMYzB+tk
	 xy8glo9jP5UEw==
Date: Thu, 31 Jul 2025 12:34:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: ufs: qcom: Split SM8650 and similar
Message-ID: <175398329829.2268219.10303422532695900388.robh@kernel.org>
References: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
 <20250731-dt-bindings-ufs-qcom-v2-3-53bb634bf95a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-dt-bindings-ufs-qcom-v2-3-53bb634bf95a@linaro.org>


On Thu, 31 Jul 2025 09:15:54 +0200, Krzysztof Kozlowski wrote:
> The binding for Qualcomm SoC UFS controllers grew and it will grow
> further.  Split SM8650 and SM8750 UFS controllers which:
> 1. Do not reference ICE as IO address space, but as phandle,
> 2. Have same order of clocks.
> 3. Have MCQ IO address space. Document that MCQ address space as
>    optional to maintain backwards compatibility and because Linux
>    drivers can operate perfectly fine without it (thus without MCQ
>    feature).  Linux driver already uses "mcq" as possible name for
>    "reg-names" property.
> 
> The split allows easier review and maintenance of the binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 178 +++++++++++++++++++++
>  .../devicetree/bindings/ufs/qcom,ufs.yaml          |  32 ----
>  2 files changed, 178 insertions(+), 32 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


