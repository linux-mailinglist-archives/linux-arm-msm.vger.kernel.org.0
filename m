Return-Path: <linux-arm-msm+bounces-49285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 820BCA43E43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 050E93B104D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E072C268FDD;
	Tue, 25 Feb 2025 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3eHIKBd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA0F268C72;
	Tue, 25 Feb 2025 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740484028; cv=none; b=OqB/ZQl/uXrd0wiKV7vqbO/Raio6LjsNppqOKP2w2vMO0Muw3RDnokVn9tgcirwG668qoqtg/E46PhNuCLRntLQqMwruafwHzh7zQTlUpq/ic2jPEAF/9+lBP9QB93Ukd4CO8b30Vvpsl/1YuiGYXx/Wa0WbwKqLqYWi9Xbions=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740484028; c=relaxed/simple;
	bh=MnVxgTOKD+Qbz0EZDFgjBpsgwV+PLP04o0DIITKpGf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+frOrNMld33+7rTnTmTERqjxRl2fx0HmJ7rExH94fpKtZGGq9tKQ2Qwm8bkDz/aqZ6oboTy++E3JUPQorQ23xkmrnLogJnyE7gTjtndpjX4FADHlvChCZx4YWxACDMprlkRRGTdVPHQNT/gMIXu59mf54e9Z7kzbAoB3Hwzvso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3eHIKBd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38921C4CEDD;
	Tue, 25 Feb 2025 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740484028;
	bh=MnVxgTOKD+Qbz0EZDFgjBpsgwV+PLP04o0DIITKpGf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3eHIKBdidCXp/7lUrKFHiR+byC5kr0tbtSgFcGFFzcpHyaqKC2HP+/FsgyIiwrz+
	 JQphjGF4z2AnWUJYvI3FCJuTJIV1hzbyU6/7HDiuruuR7vDHrv0sOCTswiA8/xX3fe
	 ntvoQxMmQXIJ4Pt0Y0DeN0NYbEjZQesa5o/DWsPLkH7j5+WnWZCUSf8nIUDT1F3JBa
	 I6px/rrrdZjN2t1UFUnjesLLjPwJu2zgAjNnvtL+5GZzNc8wFAlXtPPjk9lxFeNzh/
	 JybbgmdPsJ6inWettmeDkevrbSF2KH7vqeu7GdPdtdPPrVDy6hf/Gfnx9peW07uBqJ
	 rzKzArzQBA5NQ==
Date: Tue, 25 Feb 2025 12:47:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: phy: rename qcom,snps-eusb2-phy
 binding to snps,eusb2-phy
Message-ID: <20250225-encouraging-deer-of-will-9aeca2@krzk-bin>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-2-ivo.ivanov.ivanov1@gmail.com>

On Sun, Feb 23, 2025 at 02:22:20PM +0200, Ivaylo Ivanov wrote:
> As Samsung has been using the same Synopsys eUSB2 IP in Exynos2200,
> albeit with a different register layout, rename qcom,snps-eusb2-phy
> to snps,eusb2-phy and drop mentions of it being only for Qualcomm SoCs
> in the binding description.

Rename itself is pointless. One logical change is: you add here samsung,
this you rename it.

Best regards,
Krzysztof


