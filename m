Return-Path: <linux-arm-msm+bounces-37673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABF49C5EDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21BE4281969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEBE213ED4;
	Tue, 12 Nov 2024 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J89+Z5J8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C63321315D;
	Tue, 12 Nov 2024 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731432250; cv=none; b=kvmVxkrW4AXLhPMAYKpuyWDTryGm+hW4hKzkaDqngQPFJiGPwp76hOwbfa21qPbjVtcNPks7c36E1cshq9vCDagDN+442zFgFKCgWXLWgJhiyjycriB0Ke+ERv/d5dBCbFqIGZ0wSQIjHMceqTMhlquKXfg/rT0eKDSo2/+Laj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731432250; c=relaxed/simple;
	bh=0c/hWbR9TrYecZamdGS1Vyc0xM0lDaU6Ufv3l/ajAOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+OzO9wHyjnW0kzPvGvT0gSKbSk7i4i6BQJPF80G04axruHJmS3ZNa2zDACqR/33me4wsEP1VYSVUDArbKvexk6Aoj/IliFITNQ+jmy8BoPTzG0EfRhFMzvW8vGH5DMD2zH3HuVbb9lKJei83AVG+Q531Fy3tm2ShiKsuAC78fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J89+Z5J8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0205AC4CECD;
	Tue, 12 Nov 2024 17:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731432250;
	bh=0c/hWbR9TrYecZamdGS1Vyc0xM0lDaU6Ufv3l/ajAOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J89+Z5J8JSKL+nOLSnpYl/m0aD/abEhx5hGgAJlwXs5f5vjSQS5gjyDI0dk8CMiK5
	 0Cf1PnsERATRhfkL43G5O4Sqqd3IX/ownNzu6DM7Bm6VDndLu9Ekq9OKe7lo7byPlw
	 nA4OTA3mh5zkio/FGcRgPzzJ+NriOQIIm6sa4jnETx38ZcWf9URWjsKbd25Nm1WMy1
	 jfC4sy0IryD2KII1Z1uLjFnrtN5i/Syy5oyX9FU5p2EeDMyFcaMpOCLc6D4oSSt3mG
	 8GrSP5iloWdPVgW6fMusF1WNIzQgRKLcMvPlDo41Y+8iS7UcE2oHCCM04ctFQMadGA
	 3j1HTWyml3T8A==
Date: Tue, 12 Nov 2024 11:24:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: quic_anupkulk@quicinc.com, vkoul@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_msavaliy@quicinc.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: dma: qcom,gpi: Add QCS8300 compatible
Message-ID: <173143224769.1393359.18393815958875552790.robh@kernel.org>
References: <20241112041252.351266-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112041252.351266-1-quic_vdadhani@quicinc.com>


On Tue, 12 Nov 2024 09:42:51 +0530, Viken Dadhaniya wrote:
> Document compatible for GPI DMA controller on QCS8300 platform.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


