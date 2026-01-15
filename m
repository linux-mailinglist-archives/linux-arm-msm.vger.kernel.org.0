Return-Path: <linux-arm-msm+bounces-89225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D346BD25127
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 15:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C3D830141C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 14:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188D834BA5B;
	Thu, 15 Jan 2026 14:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Np8K8Kxe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232F03A35C6
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 14:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488498; cv=none; b=T+adP4qGqGIfLdHtBHTs+PhVCx05NbPL2QeQrDc4JcCxA3Y21lc5GftrCbUmO30m4GAhcitdvhXXh0sVBlpY1SEboryGd+zje8/yWtcMd0mEipJQG9HhpuT3QcAyouUTy2Y+hz0O6OOpr7EgTKYlBV2O5SvI2DR0b3YUBga5NHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488498; c=relaxed/simple;
	bh=ie14YPe4ejNRn6NDSSN+vqCfIS//3StFA3h+RPA4WKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyeBeZDCE3n7PBRYc749iWmy0hf0iEL41EtqH0MFC1Gy2RQm78t71hNbQ4ImY1yAN9017K5tLuWERQbAtxJC9fK6R0QR4auAqn2QZLyrwrRn2EHBP6CsBx8hmKRclKmxA7iK0syJI81Q9O3Actn7Kinuo+ej+YOi5Rd4Fzd1Pro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Np8K8Kxe; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E9FA4E420F6;
	Thu, 15 Jan 2026 14:48:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D548606B6;
	Thu, 15 Jan 2026 14:48:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C2FD10B6863F;
	Thu, 15 Jan 2026 15:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768488487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Tnh3H0qYNwGp6qVVwkc9HsChCokbifV7Nfx7Yhfo5TQ=;
	b=Np8K8KxeLsilDkOmYJmbd3SN54jVQF9kNgt6Bk96yKC4Gf1NvNy5w/X6XQMGeck9u1WnvU
	W2suCBiU3uiLMeTbsC3XAtdTCDLx+jGMMsSWjunuD2aWwuBY7HYdDRPmUfNqAnge+wZ0Zh
	SD5z1V0je8wYUujIqZKId3/WgJOGsC1ABAOOBlAWJnhl5FpsdpAtH4cgnHDXbFH8Z3UtzV
	DSkjgu6cpQfnIYsB5W/sNv5Ya50EM/01uR6YuxtV1YtU3KtowjOZRZe/xSy8eJWFfRdk1v
	SlfT+FoYuDRD9+S4A6CwaKc6fO7GvRqFtjCa8FMHrKpexYCw9KB4//5MolcYvQ==
Message-ID: <6a4dd81e-fe37-4e41-82af-18a9ac812137@bootlin.com>
Date: Thu, 15 Jan 2026 15:47:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 04/14] net: stmmac: wrap phylink's rx_clk_stop
 functions
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vx-00000003SFz-1ldy@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vg4vx-00000003SFz-1ldy@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Russell,

On 14/01/2026 18:45, Russell King (Oracle) wrote:
> With generic SerDes support, stmmac will need to do more work to ensure
> that clk_rx_i is running in all configurations. Rather than turn each
> site that calls phylink_rx_clk_stop_xxx() into a list of functions,
> move these to their own pair of functions so that they can be
> augmented at a single location.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


