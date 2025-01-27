Return-Path: <linux-arm-msm+bounces-46207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C90A1D24B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 09:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1D86165D2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 08:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5979E17C21C;
	Mon, 27 Jan 2025 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goANkQvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DCA158536;
	Mon, 27 Jan 2025 08:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737966263; cv=none; b=eVsVjpP0eh3iw+4MSebdgWDuSzgQVQ3AwxnFQZHEJD2jEowZ2KjldQgVe1v4fF/rmKGclPl6DOHz1ujeHz8+SiwhOssZ15wovz8bYftnD1JTxBgNuCrHhWpSd0maxNlSEeUF007wid+cqi5r6wX2ol3PhsZAtM0uxE8yd8ndWmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737966263; c=relaxed/simple;
	bh=b6p+7k1Z7/ukyg4zBi8mCQpTGKiCTqXzey9l/uJRgRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTmkb7F9mj8O40H2D/rMOW6J2jv8rfOwBsSUafHu8Ozl4rKLcp8hRSL2PF+bYgwInNZAOGlYaUVnDoe571CqFKIRa/n+sUHRfW5XSoNlMNezXoNPEG9YzYTcTDahsf5NTRJ6JE2Fw6vPxhTRKBm6t63b+97QZZu3Cqe+sWrnXp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goANkQvg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A409EC4CED2;
	Mon, 27 Jan 2025 08:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737966262;
	bh=b6p+7k1Z7/ukyg4zBi8mCQpTGKiCTqXzey9l/uJRgRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=goANkQvgCTHcs8JD/oY8EWsNUo5tghe2xzpL14ou7fdl5/gLMweBp9A0+wfLcY1cS
	 BhFdvL2tTnEV9d5z0phpHLsOv44XdPcSt+rNjUvFCMTPJop8bMxsAQHlhqB2odD0Un
	 qbEPNvBITwxRe5nCKv0GHSbp50q6Gq0WNoYuVrIZHCQxWnFvwEBRx7s1XdFnSydJ/F
	 KTq5isEI1w5PuA5pI+BvZYBQAKJ1fUZQFfGjCtK4zVL9xb9us/xHh/bsEV00Qjko9a
	 ty2pD+2HTUOPxmTl7UIS6WsR3UcmYTU034LmUon6jDGBQ9xN4HLjF9yqt8Dg7uzyDk
	 BHemW5GPLMSNA==
Date: Mon, 27 Jan 2025 09:24:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] dt-bindings: phy: qcom,qmp-pcie: Add X1P42100 PCIe
 Gen4x4 PHY
Message-ID: <20250127-glittering-quetzal-of-tenacity-d448dd@krzk-bin>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
 <20250125-topic-x1p4_dts-v1-1-02659a08b044@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250125-topic-x1p4_dts-v1-1-02659a08b044@oss.qualcomm.com>

On Sat, Jan 25, 2025 at 04:31:17AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> X1P42100 has two Gen4x4 PHYs instead of one Gen4x4 and one Gen4x8.
> 
> They are mostly identical to X1E80100's Gen4x4 PHY, but there are some
> minor details in the programming sequences.
> 
> Introduce a new compatible for this flavor of the PHY.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


