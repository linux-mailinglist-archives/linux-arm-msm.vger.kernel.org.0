Return-Path: <linux-arm-msm+bounces-78094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58846BF4CF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1231A3AB3B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 07:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A6227586C;
	Tue, 21 Oct 2025 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6z3hShT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51176273805;
	Tue, 21 Oct 2025 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030320; cv=none; b=E/BtUb5gaWhaDZ0zEaRpUJavbbODYkmmzy+UTcYeOU8NAwZD0QB/YDmNjbaFQgLPCiHDEGik8zppAk5uBq93h3vAn4EgqNYnwlo+hLa9/zK+tWpJuTeu+XP9p4BV7NpXwVbVZGqTa68QaT8KdVfzZlZSnKdiCTqYB6iWTrEMoIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030320; c=relaxed/simple;
	bh=/SmmG5lFug4AKfl0j2cTAo27RJY+Yd7FMSlalftjCE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNbPfzKJEDzrR8MdGm7ram2IToJMvA64aau5lSg/gql2Vlv0HqFKX8vDzMsH5ydMmnoA/w6RGHqsnmtW/z9eIQhf6Yj/zYHW3Q+n2Cj7eOvAaCxeGZkHyG2Ppj5W/kyUwM1XS37Ny+OC7oEuc2vJF/ZEyQ/5Des9xfjVB2Qzv0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6z3hShT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868F7C4CEF7;
	Tue, 21 Oct 2025 07:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761030320;
	bh=/SmmG5lFug4AKfl0j2cTAo27RJY+Yd7FMSlalftjCE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V6z3hShTYlcszavAnkPjZr9663cSQdYwpE2r9C2JW0Z6Q+b7UPtohsKHMBK+js2OK
	 H7QrpytRoiBaxjrnxyd8rf14Buo8qjdiVAl0r4XLuoz5ejIBpTRKYcVKQkksaEqpEb
	 SPpDA7YH0Tyhh2o6bdXH5rClDjH7B7fvs57b/+0C2kDFw6YBk2LxMQmUFrFBt4hA7c
	 z6lsQXGCrqTd1RNJw/xw9W1GOGpzIiEl6j1qeOS7Fs3OOCVZNZcVb97aT5XSB9AA8R
	 ObFvaA/bFdHzPSEt4TQc2GkdMMoHIAGgJ6lI2tWMWg4H5OQl9iTmJX7D1jTp5tVIEy
	 sPKrC6i2g8SzA==
Date: Tue, 21 Oct 2025 09:05:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wenbin Yao <wenbin.yao@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: sc8280xp-qmp-pcie: Document Glymur
 PCIe Gen4 2-lanes PHY
Message-ID: <20251021-swinging-copper-harrier-95fcdd@kuoka>
References: <20251015-phy-qcom-pcie-add-glymur-v1-0-1af8fd14f033@linaro.org>
 <20251015-phy-qcom-pcie-add-glymur-v1-1-1af8fd14f033@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251015-phy-qcom-pcie-add-glymur-v1-1-1af8fd14f033@linaro.org>

On Wed, Oct 15, 2025 at 04:42:54PM +0300, Abel Vesa wrote:
> The fourth and sixth PCIe instances on Glymur are both Gen4 2-lane PHY.
> So document the compatible.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


