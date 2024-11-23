Return-Path: <linux-arm-msm+bounces-38929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F28919D6A3B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 17:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86131161704
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 16:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82595137C2A;
	Sat, 23 Nov 2024 16:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjgcnPik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEAD45948;
	Sat, 23 Nov 2024 16:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732379859; cv=none; b=sz0ayNMinUm4G4HkDPUYAxUY9bvE3VDLHJwpOB8Rl8MGBDTAkh7DQglufcnYuIWt94CLJ30iPN/sZ3yAS9VzNKuDRzKouHBWsikLXuwi9hcbraKxC6G/g0cllwu3maspJ3fE8lXU60xL2tFBI/YufTppgZxb1rVUzzODicfFZKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732379859; c=relaxed/simple;
	bh=YNEmZzVb/LFwKsxzeTicEJcsxyRI8JmhD/ZNgd+fPNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSw1Ax4Q0zjhloTTW8oOLZsB0ThLHQRcBXPIRX0OipHXMmmBwgiNeVV407rB9cuG3RzxQ4USh656aprTdD3BUK4p6ZYtDrd4G+BP+1p7SO6fv8ITZ9owAeT6/xIkYmwoR9epDN6fq3KF88hgMimtjVizoERZzoqeFFwXiSkClHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjgcnPik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B21C4CECD;
	Sat, 23 Nov 2024 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732379858;
	bh=YNEmZzVb/LFwKsxzeTicEJcsxyRI8JmhD/ZNgd+fPNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjgcnPikJ8c1rsa+pIzYERrbKDVXY8iQ8eapiuZcjDMi/I4UEeJ6GZtZc7w8j4l/7
	 lc81dyOccpiG2uYBV+yNETFndMgpF6Ob1gNHriO7bwhrmEuT7v82fBhXni3GyhuVC4
	 6TfGY6HXXKXElpNjTAmyMqjNeMucw0RGPh6HgwtlD1S04207Eg6iBfiwxIzGUYpQ/B
	 21u11WcNRWFmApdT4tM105koUgieX7iRnzh9joUxoIY77J3hhBQkEalS9uCpvm05yj
	 taGphfPWkxB8ZYM/NDb5E9LFs///1RzP38Cs4NtH8/P6tZWqSWhpIXJxOAEt5SXRE5
	 zZ6aIHfZSlA0A==
Date: Sat, 23 Nov 2024 17:37:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qingqing Zhou <quic_qqzhou@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com, will@kernel.org, 
	robin.murphy@arm.com, joro@8bytes.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: document QCS615 GPU SMMU
Message-ID: <bmkpwbqqymxu576ugys6ktno3zmrcudrsznqpknbvxnjbeldau@jcu3udl7cse5>
References: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
 <20241122074922.28153-2-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122074922.28153-2-quic_qqzhou@quicinc.com>

On Fri, Nov 22, 2024 at 01:19:21PM +0530, Qingqing Zhou wrote:
> Add the compatible for Qualcomm QCS615 GPU SMMU. Add the compatible
> in the list of 3 clocks required by the GPU SMMU. Remove the compatible
> from the "no clocks" list.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


