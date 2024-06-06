Return-Path: <linux-arm-msm+bounces-21997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 985148FF61D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 22:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 903CF1C21E7C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 20:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E03812BE9F;
	Thu,  6 Jun 2024 20:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LoTyV14v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F112A6F08E;
	Thu,  6 Jun 2024 20:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717707267; cv=none; b=svwK87q6AOICi1z7v5Grjx+XUKKr4dZw6WoqmmjdS0qzbGiKyv8wbbBIq+Ft0VRjG2jig0iR+KvV9op0i14WcaaJdIloy4MGX731H6qgs+fXE19QH3PUzZ2G/ERYvyiOprdjP1O9XKZRhONSGG19J6N2d008Yk3RKrV11PhYAew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717707267; c=relaxed/simple;
	bh=aeXGQdzPsVZ4cpuieF65ifFWcRnv+FQafZ2EDIxzKb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByOgyId/g1LOj0Np4IJ1IbWqLBXicXhlia8rQS1sEEzSRqO8gRMM4VDbGZn7Axd/iBkIuGdufkRKQDw8xOMG/Y3nAgtgejRpLGBtt0yOva3bpc92vu9e17PIcNrob2mu0+AaACC/6w/pZXvTT//k2pEPx+wAwgx4RzMgqE58q/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LoTyV14v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4EBC2BD10;
	Thu,  6 Jun 2024 20:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717707266;
	bh=aeXGQdzPsVZ4cpuieF65ifFWcRnv+FQafZ2EDIxzKb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LoTyV14v/jAiVGP0AATfPdsSbN8gtFnuY7baOKfWSmqxVwsrDKIj4HRRxuCGZma51
	 550tMfBDqLisPoGIOjoMm1TmNWQgLk1ARDtUT+IpDmshoSp6wbqVH9G3Ky8sYlSdfS
	 9EWrbUHKC+mueUd4/JAmfaaP0CFiBoUZiFmM5JehmrAR/wpuW9dibjzGT9+JjtcwYO
	 tiSzaRx3ftMqPb93b4bx/F2ssP503CKzdnu7Ey5nPMJ+R+f5D5lnLS7xSDEryk37Uc
	 38fOfjY9AQfguhiCpUIEL0ZMUcqix0vlYtOCPEuCb1ap34Lquz+jFofat0l3twBUrC
	 C2M9rrysLxZvw==
Date: Thu, 6 Jun 2024 14:54:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Avri Altman <avri.altman@wdc.com>,
	Bjorn Andersson <andersson@kernel.org>, linux-scsi@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: ufs: qcom,ufs: drop source clock entries
Message-ID: <171770726231.3843186.17154781456146316329.robh@kernel.org>
References: <20240528-msm8996-fix-ufs-v5-1-b475c341126e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-msm8996-fix-ufs-v5-1-b475c341126e@linaro.org>


On Tue, 28 May 2024 16:36:48 +0300, Dmitry Baryshkov wrote:
> There is no need to mention and/or to touch in any way the intermediate
> (source) clocks. Drop them from MSM8996 UFSHCD schema, making it follow
> the example lead by all other platforms.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v5:
> - Rebased on top of linux-next
> - Dropped arm64 / DT patches applied by Bjorn
> - Link to v4: https://lore.kernel.org/r/20240408-msm8996-fix-ufs-v4-0-ee1a28bf8579@linaro.org
> 
> Changes in v4:
> - Rebased on top of linux-next to resolve conflict with UFS schema
>   changes
> - Link to v3: https://lore.kernel.org/r/20240218-msm8996-fix-ufs-v3-0-40aab49899a3@linaro.org
> 
> Changes in v3:
> - dropped the patch conflicting with Yassine's patch that got accepted
> - Cc stable on the UFS change (Manivannan)
> - Fixed typos in the commit message (Manivannan)
> - Link to v2: https://lore.kernel.org/r/20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org
> 
> Changes in v2:
> - Dropped patches adding RX_SYMBOL_1_CLK, MSM8996 uses single lane
>   (Krzysztof).
> - Link to v1: https://lore.kernel.org/r/20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 

Applied, thanks!


