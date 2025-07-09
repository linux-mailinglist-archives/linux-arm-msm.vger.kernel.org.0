Return-Path: <linux-arm-msm+bounces-64127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4B6AFE15C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41B1D3AD34D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 07:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4290426FD97;
	Wed,  9 Jul 2025 07:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwMdrFiR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BCD23A9AA;
	Wed,  9 Jul 2025 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752046446; cv=none; b=UEpal00DnMYtxbLtaHXtBzOjFRWeWgFtlKrjjoVlBwxdTj8OflXoz1FKOwzCcxgXlZI4xrCVp8la2Dib37/mpwpCLldqEYUH0Hiit02WVIenJ6Xm1+bQsxQgM0IjmaGGRv7eVSRrTHiykoJTsm1Xl+UozEi+jZ9GaJFeovkDAQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752046446; c=relaxed/simple;
	bh=d/mQu+RaHIQBm4t6DSdHi9b9ipRrZhRBVahn1mh/kng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adWCpZ7MIvL0rvaAt8jgVcH08H1KxHUbXUjIOS0jnZGUmawrT/mAZq8dzcSL6czocoL5uFz/WnvtMVz+mCrQu75I8pAodF8RoeLnq4n8+r/bPVws3yXLxUpr4PLW6gdVY/FdtDQAzMfAa/pVsDdzV0AQ7yg1Kbwl/auE6J6V8Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwMdrFiR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01ADFC4CEF0;
	Wed,  9 Jul 2025 07:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752046445;
	bh=d/mQu+RaHIQBm4t6DSdHi9b9ipRrZhRBVahn1mh/kng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DwMdrFiRSpJlIw1nEjMWG2wluYEEd3fEvgkbv3kn0wm70ob/NV73V9fWxrMsSr2xD
	 ewBImtLpwbo9NI+CxeuF/hhWaASGUhIFJLePjmeMx6LAJbhaSxHSeJIK2PUVwH62XS
	 e6nHcf2/eJ0xRZn03gXD6C5y6Z7ndL55TzlBqD8VEpLo7G/nwEvfExott+xcrK0FN/
	 at5njYSG6EqBNhpFws5k8Nnx4xeQDlv5m1f79PxiWeMMiMQbigT9sSQ0SLBap80mjC
	 +6zjunRaEX8dCKcSdMs7JAi1OZsp4WCRRMLJTebriKXazzYb01j+evrqIMIcvtjCU2
	 QZg1iljsMz06w==
Date: Wed, 9 Jul 2025 09:34:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: qcom: Add HP Omnibook X14 AI
 X1P4200 variant
Message-ID: <20250709-cornflower-tuna-of-charisma-bb3abe@krzk-bin>
References: <20250708-hp-x14-x1p-v5-0-44c916efa973@oldschoolsolutions.biz>
 <20250708-hp-x14-x1p-v5-1-44c916efa973@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-hp-x14-x1p-v5-1-44c916efa973@oldschoolsolutions.biz>

On Tue, Jul 08, 2025 at 10:34:06PM +0200, Jens Glathe wrote:
> The HP Omnibook X14 AI PC is available in fe0 (Hamoa, x1e80100) and
> fe1 (Purwa, x1p42100) SKUs. Since they are not completely dtb-compatible,
> add amother variant:
> 
> hp,omnibook-x14-fe1 compatible to cqom,x1p42100
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


