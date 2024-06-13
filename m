Return-Path: <linux-arm-msm+bounces-22599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64A90785E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A34F21C24B62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 16:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D207D1448DA;
	Thu, 13 Jun 2024 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJjdLIv/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38671304B0;
	Thu, 13 Jun 2024 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718296445; cv=none; b=OYkLQaIEW0+B0p4bqbJPgXIzHbysfDUksIlyam208eN7SyslZ/n9rjDau5wHNwoe/UMqXNJEEQAm06wjUnuMajBT9OV6lqlPiC1E70Sr1efCjrtcdBJOvHfUdbZcVCIMrWaeFxj/ZJs/Cx0+ZD1iPfOaWS3Fhkqrx0RewDasGgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718296445; c=relaxed/simple;
	bh=ZB1ifLOpQaPVOSjJVzZLiFMrasZc5JKFwi1kov7rzsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnYl4u1QRG/j1Z0JrxIEsPJ9Na1+LGRQ2Jc0e9kCkBNTuo82foVtcAT4tx1Y0fhJ5e5Dk1aBsH7c0y7GI1foTIK0/dskry4cJR+uANJQOJRJ5I6L4o/Bpy6m12HnQfIvhyl94FbTt19Jfh4GcREKg53YwgOLE0iXOCmQv2+c1XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJjdLIv/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFDDC32786;
	Thu, 13 Jun 2024 16:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718296445;
	bh=ZB1ifLOpQaPVOSjJVzZLiFMrasZc5JKFwi1kov7rzsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJjdLIv/Ntc1Orx31H2uj1EYc0nTfxW0yDoehaTb5WDhK6bbEFgAD5zxvn5fYL1dk
	 yGf1B+IFo2DFrjlNVnVXR7amnskRuoUkSx59RI3vLmA0N0wQEhvEqu2rNjiVghTdj5
	 wfqDnBVXanis7maDr4JPD7xo+cGSKKViUmAE8JubxnAWFAMSXeg7F6ygH4LGT7eKZt
	 jbiFJEgaoNDpmOsg91U2ismiPUGxvghfaPY/omIAaj/gO5ED0rkYDCRJBIqVITU23n
	 yvhrnme5qF0IgC/hAAVmnYssWN4DW+Kc65pVk+ajAc8M5PDzKyg43a0J3iua33GDEt
	 aK4NztEInMnIA==
Date: Thu, 13 Jun 2024 10:34:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v3 09/12] dt-bindings: mfd: pm8008: Rework binding
Message-ID: <171829644194.1994746.14942085531796352882.robh@kernel.org>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
 <20240608155526.12996-10-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240608155526.12996-10-johan+linaro@kernel.org>


On Sat, 08 Jun 2024 17:55:23 +0200, Johan Hovold wrote:
> Rework the pm8008 binding, which is currently unused, by dropping
> internal details like register offsets and interrupts and by adding the
> missing regulator and temperature alarm properties.
> 
> Note that child nodes are still used for pinctrl and regulator
> configuration.
> 
> Also note that the pinctrl state definition will be extended later and
> could eventually also be shared with other PMICs (e.g. by breaking out
> bits of qcom,pmic-gpio.yaml).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml  | 135 +++++++++++-------
>  1 file changed, 80 insertions(+), 55 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


