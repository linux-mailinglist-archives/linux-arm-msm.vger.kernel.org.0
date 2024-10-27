Return-Path: <linux-arm-msm+bounces-36085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B579B1FEA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 20:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C7ADB20D9B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 19:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93384145A0B;
	Sun, 27 Oct 2024 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJIsJTIO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6742E286A1;
	Sun, 27 Oct 2024 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730058517; cv=none; b=d4vYolarqhSruu38VUKywM4ZKiVOr7vkfShg33BX1d1FFTlxhpENZDIsePcjkiOxQuQvSFXmTN2TqEb47q+4Nm9Fcm/pBvg48rz+AYbYAH0UjkYR3M92vIPQz+oLw2WQs5mnWpMzkVqRqSj1m6a7eAKb3nTF2qs3iC+OxYNU1R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730058517; c=relaxed/simple;
	bh=w3vKUjdSX9tc/J4Pkj3p4KIlJyBMlEnLHrC4g+m5zqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnWT4K/xbY+yh7uL2xMF3MoYKfrXWwtFtX3t3qhixVdayhlH8HH6//ISLgO/YOhophOZ7ocXagg0kKrI/oTg9t+oGV/3JS+/yym5DVTCBa6l5ATmfcmL1W3Xp8iO+A+XPbYJb4QXk7216iZGSqb/7rjf5ny70odboYDj8qjxBsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJIsJTIO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41947C4CEC3;
	Sun, 27 Oct 2024 19:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730058515;
	bh=w3vKUjdSX9tc/J4Pkj3p4KIlJyBMlEnLHrC4g+m5zqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJIsJTIOl0Ry+IYC4ZugtnKEh9+8moghp6sy73CRyQwYDWIiMxtMtmvCg21f1EE8y
	 bAc+I2oa5N4Khec5mtmIPcqZvqNsyBGW0rQgYN8e2cICEVZTB1PYUmUufA2gJ6nkmc
	 IjHZ8w1yghUCwKrbK74LpcIK82Lo5j2o9blWHVoJCRToq1JHDYL2z6JjeOhL0y4ggQ
	 X3qH83157R/ZQEp7yAI6/LQk+GXTDmzt9BMM48FsOYYsxjxvZvNeizmXdRMQWJlBuG
	 dZCDCqL0QfxaAYqQInHGLoaB09WjNe4FzJoocbbP5gYOJx+n3uN3BxrYGMXc1Xyzoy
	 FJaJ23dDFXTbA==
Date: Sun, 27 Oct 2024 20:48:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: nvmem: qcom,qfprom: Add SAR2130P
 compatible
Message-ID: <pm3f6guakzyn7xujcqrwv4xkcoq3zsigl3qvry7dzirxcoojjs@zrkvlupw3vyg>
References: <20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org>
 <20241027-sar2130p-nvmem-v2-2-743c1271bf2d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241027-sar2130p-nvmem-v2-2-743c1271bf2d@linaro.org>

On Sun, Oct 27, 2024 at 01:42:34AM +0300, Dmitry Baryshkov wrote:
> Document compatible for the QFPROM on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


