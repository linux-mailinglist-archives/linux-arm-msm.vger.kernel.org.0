Return-Path: <linux-arm-msm+bounces-82153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB0C659AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B67D4E38A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C2030C36E;
	Mon, 17 Nov 2025 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLrvfoP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657842E92D2;
	Mon, 17 Nov 2025 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763401777; cv=none; b=T1gs/1Uzm0pL4Jvt/UTchhQ3M6ddpNQiGZ6lVuSx4jTinGXH4hRTWtsER3NPAP+7absow3VU51IYla/tBvGftWgCEo90uBAo5OYhET/6PB5tySPEWQnDz8rLxQxfDouaSMm3dFPcG0jmVDledmDgTVa4EQWQD5PP+NQi4dNGC+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763401777; c=relaxed/simple;
	bh=q17rWwYms7bqi6JrFo/nfNxVt4E8WXvWF8leqcaj3kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GU/ErrkGlPrD/jyOJiX7dakHT1XZRbIdsVm1It3h160RYf6a4Mo93fRE3/QX/QMyvAtWvsNRyhIEhIptYmcV9v9jpe3PbejmPv8YjGBaVUqCJvfGqEo6FaXzZBEl9aGPXsH4Y7zsEaHr9FQqQv2fajTDZKGV9j+D0Kuv/3okOGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLrvfoP4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9AFC2BCB2;
	Mon, 17 Nov 2025 17:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763401777;
	bh=q17rWwYms7bqi6JrFo/nfNxVt4E8WXvWF8leqcaj3kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLrvfoP4AvS0HSOdyeeD65Rwj9sSNnbjbSOjRg8wBpkzTRLzObYIzgdvEMpCji2+j
	 5jW2JRj8JY8FbLrVeyPi6bRL6RQw2kfHaguEePiqO1XUKeEHIJhx5G0IrtjBinvHg+
	 y7HPNPZ3z2TrSY3e7RHADSIBcXs4Sh07Uz/Klrnt4OTE5gKzAOOmPIbbQFgBXL5hxO
	 MxHnk7zYimlNlbS+Fij3j8I6dAM0r2JlOPfwNryfSNObTFg4KJcm0HscQlP00oK5zt
	 Zet0AhymWWmF8N+xMLNbrwjK1C3pM517AFYr4CHHMzF7yWyJ+FOwdH9E9xGAAgx+Gt
	 q+RNO0H4iyf2g==
Date: Mon, 17 Nov 2025 11:49:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: add Dragonboard 820c using
 APQ8096SG SoC
Message-ID: <176340177428.223385.7898090817007810585.robh@kernel.org>
References: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
 <20251111-db820c-pro-v1-1-6eece16c5c23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-db820c-pro-v1-1-6eece16c5c23@oss.qualcomm.com>


On Tue, 11 Nov 2025 18:02:51 +0200, Dmitry Baryshkov wrote:
> There exists a variant of the DB820c board, using the APQ8096SG
> (MSM8996 Pro) SoC. Describe it in the bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


