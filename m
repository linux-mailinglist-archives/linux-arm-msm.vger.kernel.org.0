Return-Path: <linux-arm-msm+bounces-57496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D0EAB1F9A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FF4B3BEDA1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940CB25F780;
	Fri,  9 May 2025 22:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bo9WIVz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608412367D3;
	Fri,  9 May 2025 22:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828307; cv=none; b=VRg6IcD3VPaDpTD32nzyBA5wZowgiabx/LiVjGs59lNWOcddLcM43KVBFdim9myQrX66CtOnFteRaGqNUY7Te3pcHLm0wq0v++vdsfhJ50b1k3ObCC5pDlnIW59L764N5LKqj8fY1SFLOxPX4dkfFTLGcoZNGfeM7Z4d11Oe1wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828307; c=relaxed/simple;
	bh=StSrIKDVK/EzCCK9Cc/w19dncJefyntfVTupYhZr++s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DerCR+vWdrb7jFq81pClXbEe3OijTGXIjM/DJbqmm/7p6PixlRw5+QKdJZOxVo5HXfTDyoQVEZW/0u+rJPFXvxPz25q5lelrUV26TXG5CnGSfOVGKEISmWc0Sr2fZMQi05yG2ZNIttqqJrLZ5n8qIi4WWaAT0u961fdydxj/K6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bo9WIVz9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A628DC4CEE4;
	Fri,  9 May 2025 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746828306;
	bh=StSrIKDVK/EzCCK9Cc/w19dncJefyntfVTupYhZr++s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bo9WIVz9HzbPmtVk93PYaUof5XUoAPrimkDXbD5XnrsBXzVL+hLTGc3ni+x7yWg9k
	 WSKsEUv8UZc36o5PPV6EUgL1UZzcIA34Wh9iae8yXBlrSD2TL4H2r5Ds35odmtgAEh
	 GcoL42Q3Vb9jINOi3iIm7eR5SSh/6/abKvoVOOFppd0UIQ7L9VwqLoyyrHd/EVvFY1
	 IIRzGDK31Wzw3Y1E4dt6GU7PMVBaiNG8aunyIg5sHjOMUji2lb/spCLX5cWGrDUaQB
	 BnzXiwZQioI6NZU3v3ejJTCFt8Bs49OpqPdzAQjbtWmLF9rHAtVSQM0RZxASfFE9si
	 U7s0wbXt8DG9w==
Date: Fri, 9 May 2025 17:05:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
	Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: mfd: qcom,tcsr: Add compatible for
 IPQ5018
Message-ID: <174682830451.73045.182553612890266089.robh@kernel.org>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-4-27902c1c4071@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-4-27902c1c4071@outlook.com>


On Fri, 02 May 2025 14:15:46 +0400, George Moussalem wrote:
> Document the qcom,tcsr-ipq5018 compatible.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


