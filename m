Return-Path: <linux-arm-msm+bounces-55590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAF6A9C41B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F826188AC2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEAB233721;
	Fri, 25 Apr 2025 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hd+sQnwz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3A233707;
	Fri, 25 Apr 2025 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574446; cv=none; b=sxDMzGwmjsXHxh/oe8Lmupk4fShZDpKr08GdI+ASwi0b+VZO7R1xf23LgXS1s/mf7h+6NR/dAeHXPngyjToDRuKofx0q5/F4KtwcCN0xDbZf1ylJEXYRGONwn2H0M1RAAehCNFAkD5QdgvhevqTh/xz/1hB10YLb1wAzxJ1ayFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574446; c=relaxed/simple;
	bh=hwJ0UFkl9vhPKzbNWc1Xi5cv3PU5yR6pZ52y0oNJg78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isdfpotXvA4q9JKaMUtHIf22c6pVUkCZkXg1cP9XITNf6KtQInLlC2HdMcPMEMyVFpaKdNxZrt67gbKS1HonvuQ/+J1OpNzvTQ9MPoVb8OUM0jIsF83fjivkKE3dvkRhTN2X5uBfiNsgAlAfzMzWm/AqLO4lyYo+R3FCgfsPiSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hd+sQnwz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C343C4CEE4;
	Fri, 25 Apr 2025 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745574445;
	bh=hwJ0UFkl9vhPKzbNWc1Xi5cv3PU5yR6pZ52y0oNJg78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hd+sQnwzEGfn4d5AnNfPaRDuzzQi4Cyu8Q7fz7oaU3zLXUrK7swqNXkfSAsDskk90
	 Ef5QPXoRtMp0DZI9lMCtMP/XnBTJvQt+51cCMz7h1HaX5QSFpSYOZp1nGf6Ti/0kD5
	 PvTjNzvmguHd4GdEeJFmK/LPwwCdxk7CX3Sf5d1wUpdXkZR0/oMC+noNPAENwRl7By
	 jgz31BduQXpbrQzUnyVg5ifyiKjlxFRazACxcZZ2KbN7RXbjSGyRBvHfQOcdqjbPo3
	 fXvht/Mf5thEx5KPVgpkeb7Uf/1TJAJEI3hHcJYvxLo6F151Kba+D0DfAE/ULnJw1x
	 NCNpC1iRCrGGg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u8FeY-000000000Ej-1xWm;
	Fri, 25 Apr 2025 11:47:26 +0200
Date: Fri, 25 Apr 2025 11:47:26 +0200
From: Johan Hovold <johan@kernel.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com, quic_cang@quicinc.com,
	quic_qianyu@quicinc.com
Subject: Re: [PATCH v2 1/4] arm64: Kconfig: enable PCI Power Control Slot
 driver for QCOM
Message-ID: <aAtaLm253EtlXwan@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-2-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425092955.4099677-2-quic_wenbyao@quicinc.com>

On Fri, Apr 25, 2025 at 05:29:52PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Enable the pwrctrl driver, which is utilized to manage the power supplies
> of the devices connected to the PCI slots. This ensures that the voltage
> rails of the standard PCI slots on some platforms eg. X1E80100-QCP can be
> correctly turned on/off if they are described under PCIe port device tree
> node.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 8b76821f1..14d2742c8 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -270,6 +270,7 @@ config ARCH_QCOM
>  	select GPIOLIB
>  	select PINCTRL
>  	select HAVE_PWRCTL if PCI
> +	select PCI_PWRCTL_SLOT if PCI

Note that this symbol is getting renamed for 6.16:

	 https://lore.kernel.org/lkml/20250402132634.18065-2-johan+linaro@kernel.org/

Johan

