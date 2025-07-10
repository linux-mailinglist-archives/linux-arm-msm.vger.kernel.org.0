Return-Path: <linux-arm-msm+bounces-64350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A63BB00017
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 13:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A385F161F5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE56624501E;
	Thu, 10 Jul 2025 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ch1fvGcz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A976013A3F7;
	Thu, 10 Jul 2025 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752145629; cv=none; b=QW3XQV6RrP90Q7yK7aSj8+2VFwvuAPVh7rdZjbaK2qfDgLsoTLnAtVPYOnCYQTwDOa6V/P+0+Ww7kDKqWi7eROw4AL+hH0+YgyxQobau9DliHIUQrmrUAHt1a80nQIjsyaocMA85ZnS3qt6zEkHDKS60msqQiIcbP0UF+OPDCMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752145629; c=relaxed/simple;
	bh=D4lW8+tE2ipIuH3PD2qdcekKDJKUgOBIQK0QukPhuGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sO0foaM767ZYzBHMo1w3jM6rE0WSnK7tNlkWwZC0Ye6AI41zpns8RHolB8WCk78nBxyLdN0QgXFkJn+eYqxCNWJ+Fz7cCIhg4jaq87OURoIuQOibnk4EDpyhDRKujf4azrf35mTBbRVNBv9AHHD3q2iLfQlDPeoDSIkMLa6fSBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ch1fvGcz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2D8C4CEE3;
	Thu, 10 Jul 2025 11:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752145629;
	bh=D4lW8+tE2ipIuH3PD2qdcekKDJKUgOBIQK0QukPhuGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ch1fvGcz4B7amDJKIGLXoAxtcXhvsfOBsMZWJ5xA+gpkC0RCmOxJMatEJHAn6fzEu
	 AxuefiheP107MUGJUxhU+yLqGOo12Krd5eS21JOVnut195ryd8f3Ak3udFTsEW8ki9
	 QLCPnzUo2gtQBCHLW5Rv6DX/hn8kGSiYJumiwdGVE5TaGLj3VpVEi3J8PwLsjhC8sC
	 1AzAOIcjCQHgy7TXVSvqD4Mrc5W6cUeaaDzDlCHZ1rDocdUyVW6SrQdhehwDeT9aaM
	 U/EH6I536WE6TmAxkG+40dG9qh0XAHCfJo44dnk/Fa9Rt5flkFuWfNQnR91CE0khhv
	 oRPfAd0zkjcZQ==
Date: Thu, 10 Jul 2025 13:07:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: qcom,snps-dwc3: Add Milos
 compatible
Message-ID: <20250710-inchworm-of-subtle-endeavor-af71ee@krzk-bin>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
 <20250709-sm7635-eusb-phy-v2-1-4790eeee7ae0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709-sm7635-eusb-phy-v2-1-4790eeee7ae0@fairphone.com>

On Wed, Jul 09, 2025 at 11:18:15AM +0200, Luca Weiss wrote:
> Document the Milos dwc3 compatible.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


