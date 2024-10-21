Return-Path: <linux-arm-msm+bounces-35177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE72D9A5DCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A795B211B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12ACF1E1051;
	Mon, 21 Oct 2024 07:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdlGZJXw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF12A1E102F;
	Mon, 21 Oct 2024 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497587; cv=none; b=UTYiLPpiQyz2ZHTOyzR7iF25J7KjUnpGesqXnJ1/LRgoO5WSceg6dTRwW/yIuKzC4NbidVzMEhS1uiqh6821NSCqZDlpWrNFi1P5FIHAHXYHFPoMi6R1EdC9XHIiIXhuDdCI7wYbf0lePJRO38vTYp4rCuNmFQwJx4N0vUr0yQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497587; c=relaxed/simple;
	bh=E7oSvUhYW6MNdf02zoVmwx/KBu5SAQgUaDf+IyzGsUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4Kves0gGElo8/rmoOka6lyVTiLFMyDGMdN+xpqr3eUdKn1FDzO5PZ0irVaOjaI+NykfKEwlPy+3nwjK3d0sVLczSMZ3lsBnbDWvHZEVMCKDCrjTqrinx3LOPQaT5/tBS8z+KPfv8SqvsC0auTovdrl7SRZ4o+gWU/NUx+FFvBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdlGZJXw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C39C4CEC3;
	Mon, 21 Oct 2024 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729497586;
	bh=E7oSvUhYW6MNdf02zoVmwx/KBu5SAQgUaDf+IyzGsUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PdlGZJXwxRSWyAIikk3HVjeAHjQQ5EeXWcTliV7GiLUQOADWparZjHjCHVOoK2rOP
	 RF77xQ8OiNC4w/05Vu4gV4XdcKqssqJhrzABOA5Dm2X5ErZ+MqQ4OR2y8f3nsANdEt
	 WVZj6GhPf4xbTVApUuj+CXlyl+lESQaloYavAxGh1ouPqgUA5OOBimkW833v+ak/KM
	 6MpmZOqJQWhyq+EofII7O/2ZYCx7NU5rUBTX+FOqcg82K5gBjCx3dRbJU/fdkTdK+9
	 z5aKiZg4zcvLj+h9jIKquHH2aNPD+hDvC8HEWLkEaU6/LpaMJIs+Gljbr/9e47uShH
	 NZgQxPdbalgPg==
Date: Mon, 21 Oct 2024 09:59:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Fix
 X1E80100 resets entries
Message-ID: <f4y7dyd3mpejha6vwpweena5g56ifchhzricqqfxvbk52ye4rq@kig2kukx4vif>
References: <20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v1-1-f543267a2dd8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v1-1-f543267a2dd8@linaro.org>

On Fri, Oct 18, 2024 at 04:37:36PM +0300, Abel Vesa wrote:
> The PCIe 6a PHY on X1E80100 uses both resets in 4-lanes mode as well.
> So fix the resets entries for it by adding the Gen4 4-lanes compatible
> alongside the 2-lanes one.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


