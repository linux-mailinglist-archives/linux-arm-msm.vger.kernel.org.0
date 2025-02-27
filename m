Return-Path: <linux-arm-msm+bounces-49638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D23A47716
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 267ED18906EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 08:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810B8229B38;
	Thu, 27 Feb 2025 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW/o5pab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37446229B00;
	Thu, 27 Feb 2025 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740643165; cv=none; b=SVC6Fyj6KfrVhVJBZlqACHbXKXSkCo5th2dcVN+Z1ap2hW3Uzy1XJdhEX0EO+ZKdFiuilX4ezX6X3TpvV94TRSwq37pUC4A1NwsTh+mbW77h1aP4Ibaq0rIZl+LayfpCrHpMACKfVZawsgd4Mfq26Ez9OMyRCiskA4yM5T5Cff8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740643165; c=relaxed/simple;
	bh=ua7JLATqNQHKU1/RkPTa0NEpNyB79kXYZEIWW0ChIhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8TkHUHOl49Rns0bnu/b/KgsGg9hDwyO32+EMHEz8WzPW7KA+kwUrJXzAX2YuPkzPK+eY1kDUPSL+Ti9sLdpTeUT9eYLassiPjXkJE0blRV1/XKCvuMz1aeO5Asgy7CIRkli6ZVzZYq/v5icFhXPTcq/Yry2o1xkblWbh8QTikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW/o5pab; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF110C4CEDD;
	Thu, 27 Feb 2025 07:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740643164;
	bh=ua7JLATqNQHKU1/RkPTa0NEpNyB79kXYZEIWW0ChIhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CW/o5pab5Co3B60sYb72R1/4ESR3CfYf72+RhC5rnKqh+JcUz6eJxGv0QiYbOaRAt
	 UMSn0D4rjBadK5e0vplu/iSCHxtXcGqJe2utNtxn2hpid2dusgtFo+QMU7e3urdLE+
	 9qbeWOK2F51rabxzlnY+xcb24mnOMvNLlIFg6/j3LFIzOabbILWqnnnbNX2r8Ugwnj
	 AvgBZf7cg8fbSrp29MOw79FXOPyaW8LONDsEXmualNRhQONLwSN+3ccez70kXYDVJ6
	 c63dOjWRecjsSQbTvjPrt7JDkfuf+3mGuqUjo8z+UYuV6UbWXk/SYjczyXxU45px5T
	 Gr1I9zWYc2UoQ==
Date: Thu, 27 Feb 2025 08:59:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wctrl@proton.me
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: Add compatible for MSM8960
Message-ID: <20250227-dazzling-mule-of-domination-0b8fdd@krzk-bin>
References: <20250226-expressatt-tsens-v3-0-bbf898dbec52@gmail.com>
 <20250226-expressatt-tsens-v3-1-bbf898dbec52@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250226-expressatt-tsens-v3-1-bbf898dbec52@gmail.com>

On Wed, Feb 26, 2025 at 07:50:41PM -0800, Rudraksha Gupta wrote:
> Document the QFPROM on MSM8960.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


