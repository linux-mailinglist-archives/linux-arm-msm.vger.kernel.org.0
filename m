Return-Path: <linux-arm-msm+bounces-55277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02751A9A454
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C55A189D177
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 07:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3171F3FC8;
	Thu, 24 Apr 2025 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUAu1y4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6411F30BB;
	Thu, 24 Apr 2025 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479958; cv=none; b=ZWWwf2W9IOdjY2d/bAOQNB0KZC96pub24yfeQc6nOu/WROtsMzqIAhhuj61DHMIU+PL/f6Fxqml9nIKpjc7e0mU+cmu37o0IjfGzF9Uhkd7IVPZPQ9PkW4dVoB67kyASbgORPivYGg6onRreL8PzKzUu7B5jXdItgtYc2iGB+h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479958; c=relaxed/simple;
	bh=UXUhPaNtMk1R10Wyxi4MJA+gxXMW3VzEBTRBlFMNNlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1m0b0F5layvwiu5wFX56HRHpUSHxvE05tK4ZkfmhWYfMz1MciPtaSCGOS2WnwWirK2yiLqSsUHM8nFsJJJBNX9YZiuzAS8wMmpOm4n2j3apU86aN/xWzl6C0Hud3AAAHEe1ZGlJHqTTK73KRZy8S6Pn+8Z/S1+xMq76/xhtOjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUAu1y4Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65A9C4CEE3;
	Thu, 24 Apr 2025 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745479957;
	bh=UXUhPaNtMk1R10Wyxi4MJA+gxXMW3VzEBTRBlFMNNlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUAu1y4ZS1rReflpqiqcIN7UnNIzLnab3hyFdHbWsnfk+sesWnE+cnjI71LJ2ul7z
	 Txo6iwxJWGfe3H6ghAxwT7/PnMWRR1rTO50jVNZ/75faGyo9IFUA9XP2aIF1Ne7F3O
	 5CRIxgl24EvfPD9kT3I1EJORhClYqukaQN2TE/T2FpFkh8Z7KPucdXIqA5f3znsAft
	 c66S1jwjfoWNY0oIVs42CfUy77VvxmAUI/8lVQvBTYj5Rpulxfu9oNvtgHOrMLM//n
	 n76pHNLmcC3Q/CsqtMM0Y1UBha6tpmg7TXSsfd62OOCmdHm4duiD4qy6VFW+891Ilv
	 9mkV0EBI4odrw==
Date: Thu, 24 Apr 2025 09:32:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
Message-ID: <20250424-masterful-original-python-8dafb0@kuoka>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-3-25c79ed01d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-3-25c79ed01d02@oss.qualcomm.com>

On Mon, Apr 21, 2025 at 03:00:10PM GMT, Melody Olvera wrote:
> SM8750 does not require an XO clock in the dt as it is the
> parent of the TCSR refclk_src, so move the compatible to a section
> where the XO clock is not required.
> 
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


