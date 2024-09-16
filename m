Return-Path: <linux-arm-msm+bounces-31836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603897A497
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 16:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3328F1F28D95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 14:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00674158540;
	Mon, 16 Sep 2024 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMJi/K5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A0A1DFCF;
	Mon, 16 Sep 2024 14:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498594; cv=none; b=WOu9o+10oWckuoAdY4R2lHFNYQfkFcsmN0IEGqq9vH/yF+1wDlWzu7z0GXJ1j6qL9sMn27RS3LdQ/eYysovkcNAisKkbzH4kRQ8KqB22z0izNWrOfCuPLTSu0G/O4vnB1PrVUDb/TD6X278+yJPae4FQfooPljwgeSva7E5N0/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498594; c=relaxed/simple;
	bh=lS2PAJoSJx2hpLLbA4jcqXR9YRtANBKj2dhr/JbVYA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaidPCh3kTGI1hMmvBANuWBLDMahN2yrfLIjwSiK5fBdH1GCgay4bLCDWYNSlbloMTtF3ajDbB4pteOPrsmtRqUf5qqMc0JD+Zw6dQcInMqg0qtTc0ak/jYrKEDfAofxd0i/vrI3KKiZEeciazzUe6xqSmrYFh9YuHIWbl69Zy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMJi/K5L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE4AC4CEC4;
	Mon, 16 Sep 2024 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726498594;
	bh=lS2PAJoSJx2hpLLbA4jcqXR9YRtANBKj2dhr/JbVYA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMJi/K5LdhB6A6YN4CQOB1tAANqfD0NxKH4G/dCw4cEi9f3rin5t9kW387yH8Bu2n
	 xzfma5Z4OIyfGENzN6KsYAvW8DnSja66+h/kvGQkNX/P60UtapumCccBgUmnTjwutH
	 PFdaouR0Gsfz7qPLZBj4QqdLHCpcrrPRjHvixKYBaslhpBveGsLru7u768tI2aCQKs
	 x99B08i3AU0k+Nuth88oPcz3K8HYDVBzfA8WGTQg6iOH4xtrkbFS9exmb8vSMMrQoi
	 CZB5i6WgP0DBX9QBDyim3iM9VDCLDGudoOwEMSgCwTch6VZWCrAf5mxcIdVnc8QoXH
	 /pEUs9ZBM2Mvw==
Date: Mon, 16 Sep 2024 16:56:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, quic_tengfan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com
Subject: Re: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document QCS8300 IPCC
Message-ID: <w5nhdebjzjpocxijoreewvnj7zv6pjddczcmcpfgl63l7hnngt@kvxv2fn5edw6>
References: <20240911-qcs8300_ipcc_binding-v2-1-ca15326c5d0f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911-qcs8300_ipcc_binding-v2-1-ca15326c5d0f@quicinc.com>

On Wed, Sep 11, 2024 at 03:25:15PM +0800, Jingyi Wang wrote:
> Document the Inter-Processor Communication Controller on the Qualcomm
> QCS8300 Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
> Changes in v2:
> - decoupled from the original series.
> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


