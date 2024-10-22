Return-Path: <linux-arm-msm+bounces-35334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6A9A98DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF3EA1C23314
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 05:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93C5132114;
	Tue, 22 Oct 2024 05:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3/fPyxw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB659128369;
	Tue, 22 Oct 2024 05:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575937; cv=none; b=szDgqdoo3YpKgD/cqq01qRWGMQMLZHrvtU/NQoRP0VfTbHhwEKRNtDp7LusOwzZ6M0vh3XbbAf2Nez8Sd722gpIA0zLJ/2GpdeJt3+giTmejEx6fdHHAcDcmCHMk/i38kNuisI8LgJ+WmkWGvGafESeoIvbYR5ktfB1qEeDcOCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575937; c=relaxed/simple;
	bh=Nda+QGcrrYhxDlDk8aov3JtGDNSWzbu92v6mmZYkIhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSJ2HWymWZlGnq6CSWphQ4vNiZ44qIL09Wi4r5BaVnfWNPO+jykHuKfA0ZLfqyPScY+KGyvaf34XNQViNI7Gq+gvrX1gKdbOahJSQxy/eF9jl35qlP8Mn/BI85hoQ617M7zV7aolbEZwHgPLV/gReVn9/aE+aRWUZdxA4RtAWzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3/fPyxw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4DAC4CEC3;
	Tue, 22 Oct 2024 05:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575937;
	bh=Nda+QGcrrYhxDlDk8aov3JtGDNSWzbu92v6mmZYkIhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3/fPyxwgALqjM8oTiXjGvSshq0o2+XjXTUtapmOoZ9kOA+JPCoCBkjUyGKzo8lxx
	 wNrO/3vOaCHdHcM6qmdgkHJdwhG5YOddC8P9M/rLcYTNMZaVWB107VRTaiyqYzQPNl
	 9sDBYtA6Hyvrz9U0Hxp5TBOX0t6oUpze0FBC7Un/Ysb2quC9eV2sysAbD++nlDBT9p
	 nXYSxIh2RZLBs11ZmwyzKys0yKe6Mg/iVloKo/5kzIXQxrte9yCTT/hE6EmVy6Aheo
	 1VVUw+t2K9Dn4bbBdbsj35vtCCPYZypVJz4PuXrVfyQ8IgbHi7BOShVEWqfGIX2XUa
	 cNvfkIuQmAtfA==
Date: Tue, 22 Oct 2024 07:45:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 SAR2130P compatible
Message-ID: <6ntsgzceya46cdxgqvflkirmbjpxdltc627aa6ehv7lyo3dryu@ledk7jg25m6h>
References: <20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org>
 <20241021-sar2130p-phys-v2-2-d883acf170f7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021-sar2130p-phys-v2-2-d883acf170f7@linaro.org>

On Mon, Oct 21, 2024 at 01:33:08PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the QMP PCIe PHY on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


