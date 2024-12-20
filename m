Return-Path: <linux-arm-msm+bounces-43023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC09F9C51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 22:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6357169E88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 21:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F1E223E7D;
	Fri, 20 Dec 2024 21:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fgf9Jj8v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15D51A0B0E;
	Fri, 20 Dec 2024 21:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734731383; cv=none; b=UanA44LfLkEdUmdQbBY4g88vfILSnUUCJHXR4sVd0o85DM7wJ+1oPSXqQA3n+sbvYiW8xFCc/I2pKzJmTlyHc7cmlB347KPcwQrmNLHo2tzmhKXpWSL86R1yBN46bdIRTnAPvjPPgseEbn1J+bQoVnxa+UR259O/dXj93l7A8Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734731383; c=relaxed/simple;
	bh=kx6b30cZFM1q//wtqBJD+Qr5e2FgSNwPrqD26U2DchA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MyIKElFP//O6lZ3ieUB/lYZtF1aiSTX5A/RQ61bXqGBIL/HnL1gICXie/Bcvzkob4Pp6SxCVruHmcNOsObMDej9g6x3aH5RYlWXLJG3o1wdv7jTVyGY//5/PjhzWASZsPUrexF0ZbcQbQUFrWLSdKYqVQuUSVqey1JGW7sAZw/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fgf9Jj8v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B875C4CECD;
	Fri, 20 Dec 2024 21:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734731383;
	bh=kx6b30cZFM1q//wtqBJD+Qr5e2FgSNwPrqD26U2DchA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Fgf9Jj8vWlEqW5dCB1Mgh412cBqksDJjQ2t1/bWJ8WeU21phmBks4jNln5+OOPtDo
	 fEgHuJjVXFukDaMhZrtRu7RodnOCTdtqBxQDb/rDj0I/2QG82su/AJ1MDboi5/XqLM
	 BVGXbYqXiFwI0uHjDxhmAe+8WzONIRqsoN/q7vnjWRwkJxxtCEDQd6KPVnLGP1h0Ld
	 9IemJ7TRu06eqexeQkb0r552LI+JHKhPExIUY6m88ibP4Snav6RDUzrxrdO4gHWXAM
	 cftsJjITfavTFBvj+NtjmsCLMs17mQyItO2vp3LYvZ4dSBUrm4F6r7wOv/z14OCuKT
	 Dv1r0choLa/BA==
Date: Fri, 20 Dec 2024 13:49:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lei Wei <quic_leiwei@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
 <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
 <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
 <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>
Subject: Re: [PATCH net-next v3 4/5] net: pcs: qcom-ipq9574: Add USXGMII
 interface mode support
Message-ID: <20241220134941.370d3357@kernel.org>
In-Reply-To: <20241216-ipq_pcs_6-13_rc1-v3-4-3abefda0fc48@quicinc.com>
References: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
	<20241216-ipq_pcs_6-13_rc1-v3-4-3abefda0fc48@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Dec 2024 21:40:26 +0800 Lei Wei wrote:
> +static int ipq_pcs_config_usxgmii(struct ipq_pcs *qpcs)
> +{
> +	int ret;
> +
> +	/* Configure the XPCS for USXGMII mode if required */
> +	if (qpcs->interface != PHY_INTERFACE_MODE_USXGMII) {

nit:

	if (qpcs->interface == PHY_INTERFACE_MODE_USXGMII)
		return 0;

And then the entire function doesn't have to be indented.

Please fix this and repost, it'd be great to get a review tag from
Russell or someone with more phylink knowledge.. Please be mindful of:
https://lore.kernel.org/all/20241211164022.6a075d3a@kernel.org/
-- 
pw-bot: cr

