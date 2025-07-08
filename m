Return-Path: <linux-arm-msm+bounces-63973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9BFAFC46E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 09:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3274D7A3F63
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9AB29A9D2;
	Tue,  8 Jul 2025 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epHZKj6f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26C129A331;
	Tue,  8 Jul 2025 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751960721; cv=none; b=D0qKtoGrTA7WBCHQrk6HfCPOPLsEEY5Dyzx9bUL4T2m3F3xZo09crUAQTTMiRnksehNImGRWd6QLuwJc29BRYTMYPZsn3lDaD63g4WAKJU163YJc8uJdXXx1SdUSFxno0cUtfJbxRhDS8jO3xBgDlIviya840dNkKdEQ5V70n/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751960721; c=relaxed/simple;
	bh=zZB0Wdl5LPnjvlMhwndr1kj1exZoIn1f7iY/aY14nBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBIgt5a8jOcqY122e0TLBCwS5RE6tXdaXUfg+OwTKgnlqPSH3EBgI4klr3tFa1bCg1rPE8LkfimLn7LQHcl4bqFTf7e+nFn1ApFDvwfo/nc/TaaSv8J1Z/wiYw8+dKH0MSR/f7gcTmFkkmiYvIXOpNK2TAYByyVXa6UyBcDnIUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epHZKj6f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCFBC4CEED;
	Tue,  8 Jul 2025 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751960721;
	bh=zZB0Wdl5LPnjvlMhwndr1kj1exZoIn1f7iY/aY14nBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epHZKj6fM2nyYfk3ynJ/En2wrEMoPQ25Wy05oYE7cDOw6+23NGXCug6msbNhY8k3U
	 G5GS/2tZm9iADqW8aKFfIF9c2gmXBQn8uw1clmfXHBUg2lMs2/fIKhD6RGTN7pEWlj
	 y9kFQjdB6tOoncPfJ8bAeWgxfO3rP7L4Kp4ndQlLMJKXzJU06QiVXtyH01sQ0rgPdw
	 sh49LG5FGxrQwFfbhSigdnS9oTzlw3A7sxzNASe84zu2xypAZiSARIIX5CI/1aD2OK
	 BHWTt6loZC5LZbUGIbMC1c4UMR3AMWgquH9iAQRforgn1UgL7w47ala6Qd+Yy8TmAW
	 Y7BeglOel8oZg==
Date: Tue, 8 Jul 2025 09:45:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: qcom: Split HP Omnibook X14 AI
 in SoC variants
Message-ID: <20250708-brawny-optimal-lynx-8aab31@krzk-bin>
References: <20250705-hp-x14-x1p-v4-0-1c351dbeaf18@oldschoolsolutions.biz>
 <20250705-hp-x14-x1p-v4-1-1c351dbeaf18@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250705-hp-x14-x1p-v4-1-1c351dbeaf18@oldschoolsolutions.biz>

On Sat, Jul 05, 2025 at 10:31:54PM +0200, Jens Glathe wrote:
> The HP Omnibook X14 AI PC is available in fe0 (Hamoa, x1e80100) and
> fe1 (Purwa, x1p42100) SKUs. Since they are not completely dtb-compatible,
> split the model strings in 2 variants:
> 
> hp,omnibook-x14	compatible to qcom,x1e80100
> hp,omnibook-x14-fe1 compatible to cqom,x1p42100

I don't see split here. You are adding a new compatible for the fe1
variant. It's fine to mention there is fe0 already, but main point of
commit msg should express what you want to do and doing here.

Best regards,
Krzysztof


