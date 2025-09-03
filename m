Return-Path: <linux-arm-msm+bounces-71748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545AEB417B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 178FE7C3472
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1262EAB85;
	Wed,  3 Sep 2025 08:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evWJ5ttU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA182EAB6C;
	Wed,  3 Sep 2025 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886503; cv=none; b=Ok7UF0BnGmrUKNjd14wLVjmctfj8zpiiQJlFBVEhrsPbsma3zNo9mDHJQP3Ek9+ISZ/ly8/73ZLN1ITf01UvrnRdgowHCMU64I/NTZGWbh06ajw+M4L3UdP1snsD4BWRmKkTtnRIatIaCaFzOmLjDSYGxIHJefxkfUGNDVGu/aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886503; c=relaxed/simple;
	bh=QwlbbBn8XTEY2W2jNAhzP04Sv4nwcE6MqsWVHJtUSjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkdsQHV98iC3KcDf2jvsiVsnK4JLNst1zZic8FnO+4/qvzOcyPCYWRMG4Y6qT8OT5ah10GrQJBTurM6kcZVa0/uEc87T3N51kY8qToyub/wW1exHLsIK4csIjQGqjFVGPU+7IovRpVivdCzwQNEGKS9XABar3+xYiSJNwYQT8yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evWJ5ttU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3770EC4CEF0;
	Wed,  3 Sep 2025 08:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756886502;
	bh=QwlbbBn8XTEY2W2jNAhzP04Sv4nwcE6MqsWVHJtUSjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evWJ5ttUngeh89aPH/g8M8G1rIv4N4j23/Q0Cnn/ZHoZs0S2oWbDNpKRFdtyqueO1
	 Fblst7nhbvnaUIOtgAgxhAiv7/FAwIk/vcro5uFYJI+W6Z53NHptYNIwBLWOHbCUC1
	 EUHMDrnZh5IAB70Sv0it42df4C3xWcVX89TY/AavHI3FvZ6VO3Ijx2FaAsDVziKJ7L
	 cEINst+m76MGTqCQEMdOPA2gxmyIdtAvfIQ5XsrbSpUcrcBkr2hmvCsX3L3X3VWYND
	 wPpGzsEWVkysIM6Sv4HQZ7NVGj5p86i+9fWM6wvfWLS7c/xUUAcr0jUlE7xj+3Hgf9
	 5JM8aXx84dLxQ==
Date: Wed, 3 Sep 2025 10:01:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: do not
 reference whole usb-switch.yaml
Message-ID: <20250903-leech-of-imaginary-variation-a91aba@kuoka>
References: <20250902-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-5b4a51c8c5a8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-5b4a51c8c5a8@linaro.org>

On Tue, Sep 02, 2025 at 06:10:05PM +0200, Neil Armstrong wrote:
> Both bindings describe a different layout of the ports properties,
> leading to errors when validating DT using this PHY bindings as
> reported by Rob Herring.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


