Return-Path: <linux-arm-msm+bounces-82371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEBAC6AE49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 18:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE20F4F4DAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 17:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478B93A5E83;
	Tue, 18 Nov 2025 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDSJbAsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEEB3A1D1F;
	Tue, 18 Nov 2025 17:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485867; cv=none; b=rol6qx6RLN194rkRDxONWc+nYAy2ETV9StBrkl6J4VlcaGzwcLUh3E+COneIGgNTlW2DdFBq/t4wiVOCnzH0aXW6I8gM5qMET8TlQAWs8AnqnxVv7P5vRwjC6Ga7wx1/s2iqLymyI1uSTISLKmIPyLwQBIoTFJTb68f30PNoXEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485867; c=relaxed/simple;
	bh=wOZRNNIL+m5X/h13FesXwnoBhtVOzxcdpFfYndv3xl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETrcsCSkyL9x3IjgD4BDHzGN/vlh0jYz4vQ8tQpiGqsZK88yTLdVtde8/Qk6GxWpcWkmjOFVIxFp0p3F1HVUvRN4ECBlGz/Smji6kYN2DTrARE4k6i2sSWpilrVRr8Ckk+BYqceJxhpeHpg24XX2tSrvVQTJsHv+GICnC9+1FU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDSJbAsp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D168C4AF1A;
	Tue, 18 Nov 2025 17:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763485864;
	bh=wOZRNNIL+m5X/h13FesXwnoBhtVOzxcdpFfYndv3xl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDSJbAspBhtFe32YSTBs8uYPNiFEWfPcwFKM1ZnYHS/pAO2MFWEqnP8wwZEMKRxBB
	 Y5oWUjhcxjk+aMVjUfmPh7yxgW7k2h+9MEhn6KDy3lTgLtzRJXBmzIG8uvG0XKw3o6
	 5STIiUTtWwPSUO8vMcBcIDz/RZeNnFhtXr/TbmTD9TFFjhSLk+UswR2+Ypyz9d+ZX0
	 5u6RwKNGK2J0ZDPCryQ0d9ryiYvKf+QJa1x3VH/qwYhBzX4biOkeqoXWFML3OjwpAo
	 Mcf0jAf/PAM9dJWAgxAa+4nBl5Vw6Wgiwa4tCAAJwokx0GgcVQDrnapaz2r4VRQjLd
	 dsrxIawHtEKLQ==
Date: Tue, 18 Nov 2025 22:40:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
	Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v6 0/3] Add support for Glymur PCIe Gen5 x4
Message-ID: <aRyoo2Ve_hjgc84M@vaman>
References: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>

On 03-11-25, 23:56, Qiang Yu wrote:
> Glymur is the next generation compute SoC of Qualcomm. This patch series
> aims to add support for the fourth, fifth and sixth PCIe instance on it.
> The fifth PCIe instance on Glymur has a Gen5 4-lane PHY and fourth, fifth
> and sixth PCIe instance have a Gen5 2-lane PHY.
> 
> The device tree changes and whatever driver patches that are not part of
> this patch series will be posted separately after official announcement of
> the SOC.

Please rebase on phy/next, this does not apply for me

-- 
~Vinod

