Return-Path: <linux-arm-msm+bounces-63988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF42AFC599
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C23E3162EE8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59092BDC36;
	Tue,  8 Jul 2025 08:28:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA122BCF46;
	Tue,  8 Jul 2025 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963308; cv=none; b=KQ7qNPw16O7W32JfU20rKdN171VC28qt1klw4jBExQJDJgRG5QuD3tO0AJuj47Eq2hkxh9LqNJ3xR5I0559HaUUkqDiA+E4VKWKfj2XO/bCy9AwnkJb/hL5GyFU7Rrv889RkqVU8Wbot3r5qpM9dXJTlhLdTFiVBGNbud4NPEfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963308; c=relaxed/simple;
	bh=QZkEEX+wbrqpmTxR9/6edWPtu/5pWJyXRGQZvOJLqOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USDH3CZmUMTpwZl1HTZilMPCdo3pY8n3V5y60eGUjy2yp9G0gzmYF5isa3zqsXPH5vmDcFIEAecsbyXyRuFXdEeIA7JNIruQPsgLgTbOTjZnVDj6tS2gXDUXasV9gJOgixYkcd+XZGhaEsGNjGIWGfQR3VVlpiPcQliLkpaMPdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5655CC4CEED;
	Tue,  8 Jul 2025 08:28:27 +0000 (UTC)
Date: Tue, 8 Jul 2025 10:28:25 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] regulator: dt-bindings: qcom,rpmh: Add PM7550
 compatible
Message-ID: <20250708-interesting-quaint-viper-bad4da@krzk-bin>
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
 <20250625-pm7550-pmr735b-rpmh-regs-v1-1-cab8ef2e5c92@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625-pm7550-pmr735b-rpmh-regs-v1-1-cab8ef2e5c92@fairphone.com>

On Wed, Jun 25, 2025 at 11:18:56AM +0200, Luca Weiss wrote:
> Add the PM7550 compatible for the regulators in the PMIC found with the
> SM7635 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/regulator/qcom,rpmh-regulator.yaml     | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


