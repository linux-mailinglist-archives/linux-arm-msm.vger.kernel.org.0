Return-Path: <linux-arm-msm+bounces-45475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A065A15D6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 15:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 597DC1634C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 14:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAFD18E377;
	Sat, 18 Jan 2025 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlHrloem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09B316D9DF;
	Sat, 18 Jan 2025 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737211550; cv=none; b=LFFxSiZ62b3JpnFz4/adHTspObcr+H9/J4c8FTRYzDXDARUADCpM32+KEXdgdv17NuNg29GdegXrmSv8dBF9UmWy3/VrogFfDnOLor3mknL+wO2iQvZUD8EDwh6LbL4yLfb8mtDTOEHeE/kkPtcx/+6ljidbKtaREb0+Ikvzne4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737211550; c=relaxed/simple;
	bh=UVYF+ImoZ8RLdWLsucuuSH9TQgAlv3l/NXIkVeacLq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+brU3v1NUr+9oSVj+IcSB8+LsJWjwfEJjhKCNmwLbcDip05dy+Ve91ncsGnjV0xSuJZB/4ec6+KIEVM7rQgkUQrjMrgV0w36mtai7pmdfp7ZP0FgQTAbdV8oygjO4I1JbeCVH/WPZZNqKwoe1JaSKYoB8zVdC3LzzqzREJkrHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlHrloem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2F9C4CED1;
	Sat, 18 Jan 2025 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737211549;
	bh=UVYF+ImoZ8RLdWLsucuuSH9TQgAlv3l/NXIkVeacLq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlHrloemHqG5AL/at6zEr50bhQ8zWO3FGdCBtUQfNivICg6G74s7XVjksIwycpn9y
	 1K/q7qKJZN9bhBp9he3x3ZlJJk+o36GAuItz45Z58YrnZmZnsTWCvg3cJ1DtLfhPMv
	 JpMhrUpqQuEV2QN+xVJbfk0Hu+wupd6KSDhSWJ0+tmGaC8IOQCa6YiXHoG+AGSkSeI
	 SdFgBsQEoqN25tP+fAOc0JLzydygCK42M8bOud5d4NNrZ9p5l/uHocG6Qg6ymIomh/
	 xpOZ+pBZyqoyvQf4eWUG1ZgcH8dy4WEBzBSO7AGRUunjmkl1tP3ulsKITl60GWXE0l
	 3J7a0/tzBLSsQ==
Date: Sat, 18 Jan 2025 15:45:46 +0100
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
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH 3/5] dt-bindings: ufs: qcom: Document the SM8750 UFS
 Controller
Message-ID: <20250118-vagabond-sparrow-of-merriment-beafbd@krzk-bin>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <20250113-sm8750_ufs_master-v1-3-b3774120eb8c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_ufs_master-v1-3-b3774120eb8c@quicinc.com>

On Mon, Jan 13, 2025 at 01:46:26PM -0800, Melody Olvera wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Document the UFS Controller on the SM8750 Platform.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


