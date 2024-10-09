Return-Path: <linux-arm-msm+bounces-33620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C892996012
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C79351F228CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 06:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8F21714D0;
	Wed,  9 Oct 2024 06:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOSjz3tX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6DC154C05;
	Wed,  9 Oct 2024 06:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728456476; cv=none; b=PZSGBW/OzGIleHVglJxOq1S9h4eE4DXfj+XSJA/punXwSmWYq9l2vfz4uXxkQm/USseHNfZUA1ea/dqDcDBNsoU4CyfJSbyD8UnFtdtwHUsNcw+8jxZBjLSvzNCGR5MzKsTXm+TsA0XSNWNUlXnS/CCIEPhyblR2ibNUflnbhbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728456476; c=relaxed/simple;
	bh=ODW0q0IcZqLRj+M1gN/xw3uV4aRjbN0SSRNcLahoPoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXKunqeqIUoY8aef3QJn9+Z5cUHLU2yQKYFn8/BaWgFW/k715lMcYQOf66SRqSypuJ4iyPHE2EYQzamLdoZWLIHQb7yVKy9Lz6Tk2p5ZPVGsGwaYKXx7cc8XVCB07KhFMSXbBVVwvoZtHhyjD3KUVIxYY1qvVdOKDsfMcBdsaqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOSjz3tX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86865C4CEC5;
	Wed,  9 Oct 2024 06:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728456475;
	bh=ODW0q0IcZqLRj+M1gN/xw3uV4aRjbN0SSRNcLahoPoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOSjz3tXvbBJkTs5gRhMIewQwuWNTob+/bXqPHZleZGZKfzpF1Xtb7wjt8LaeFhYa
	 qErQ+bCb5XTAEhBa77j87V5DRR4GdUlcEATzpHtgBgSgaumDYSApdRfZGGReqZrU2K
	 Vl43bxhDte6n9vcfpUjHQoZ0i6SK5kCOBisXDcsKEjfW0pC194gqjjiqYCE4ZCnmsO
	 jsSgt81lIcZXncDjUiOhL2KDE6Hw0eRXX0QuBTHpuqhlGGtPPw70YYXNUC440d1Xo5
	 JkwnI5+YkgU5OqY7DFucTlDrOK0CyQN5+65dXWVMDoXz7yGe89S0+2InI0gOQkX3Lc
	 5yGzbEnCrNlLg==
Date: Wed, 9 Oct 2024 08:47:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mmc: sdhci-msm: Document the X1E80100
 SDHCI Controller
Message-ID: <nqyoypmssz42dyfl5rnlykmpi3zl2uacrq3esfkqnvrnuzl35k@dhn5nsj3qe64>
References: <20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org>
 <20241008-x1e80100-qcp-sdhc-v1-1-dfef4c92ae31@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241008-x1e80100-qcp-sdhc-v1-1-dfef4c92ae31@linaro.org>

On Tue, Oct 08, 2024 at 05:05:55PM +0300, Abel Vesa wrote:
> Document the SDHCI Controller on the X1E80100 Platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


