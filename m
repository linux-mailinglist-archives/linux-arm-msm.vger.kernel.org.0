Return-Path: <linux-arm-msm+bounces-47686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D8EA31D2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 04:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D1677A0878
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 03:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2411DED5F;
	Wed, 12 Feb 2025 03:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKZcHPYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D678F54;
	Wed, 12 Feb 2025 03:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739332777; cv=none; b=iWSFgxFcFv4UQiD7S9UObhAp1VnGQn7INPLKvF/QbRObpIHtwPBP6+gjXFsh2/WrUoNOzEBNaojUAzrNEyUlwv8YY+K4NMt+aIhYN/nuzQKNatY2QACrilHrELFogOQOs8zKKyoQtqACu+8yFm40Y0T+R+mKnzEkln3m3y/x6y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739332777; c=relaxed/simple;
	bh=JaLBBTLuZK3t1z48SvdeLWkeg0yEjSt8JbPcEaXMLZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYOQksnSO0Qf01cUXKDdc1E4rBwGnvJ8HQF40hbkaGRnwzvZh2BNFGLYwQATOZQRAB3jYeelq7HaYXMNpTx8Yh/EbhftFl4UcqGuqs0tCGdwAGadItAYAoZtbE5Pzs2Wcb483Vha99aZ6R5Vpw+Y7g361Kc5PBYgN/iWcbS3iyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKZcHPYA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DBBC4CEDF;
	Wed, 12 Feb 2025 03:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739332776;
	bh=JaLBBTLuZK3t1z48SvdeLWkeg0yEjSt8JbPcEaXMLZ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FKZcHPYADRK/fL0VqWgjL7xe5OaolNokgPhL0oqnORO33d367/VqDqfWC4KDbjKxF
	 tWXRDj9YhdVwjUGxWqwddFIbKjgUmyeS1oTBCR3fr/u9rtGZWLUS+NIFoJWRCL7RvD
	 VMSy5QxfoTZqzDtAWvPDss+/BJuLVBThYUOM3V4Xk7ywroMtz7Zf7k6POhFqVsbgRq
	 9SVgDelOXjkw2AhGvOVDCUxx8Iyw7a3utQZxkiQPSKgSOpiflLBtDGlkDtbekEl9cx
	 s19HzEwGyfvPxIYGfzBh4JuYq9N5X1lKmPwtxY/0f0KAS2l+G1x+mAItmQ36seI65h
	 gxce6QPVxRcpQ==
Date: Tue, 11 Feb 2025 19:59:34 -0800
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
 <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH net-next v5 0/5] Add PCS support for Qualcomm IPQ9574
 SoC
Message-ID: <20250211195934.47943371@kernel.org>
In-Reply-To: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
References: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Feb 2025 23:53:11 +0800 Lei Wei wrote:
> The 'UNIPHY' PCS block in the Qualcomm IPQ9574 SoC provides Ethernet
> PCS and SerDes functions. It supports 1Gbps mode PCS and 10-Gigabit
> mode PCS (XPCS) functions, and supports various interface modes for
> the connectivity between the Ethernet MAC and the external PHYs/Switch.
> There are three UNIPHY (PCS) instances in IPQ9574, supporting the six
> Ethernet ports.
> 
> This patch series adds base driver support for initializing the PCS,
> and PCS phylink ops for managing the PCS modes/states. Support for
> SGMII/QSGMII (PCS) and USXGMII (XPCS) modes is being added initially.
> 
> The Ethernet driver which handles the MAC operations will create the
> PCS instances and phylink for the MAC, by utilizing the API exported
> by this driver.
> 
> While support is being added initially for IPQ9574, the driver is
> expected to be easily extendable later for other SoCs in the IPQ
> family such as IPQ5332.

Could someone with PHY, or even, dare I say, phylink expertise
take a look here?

