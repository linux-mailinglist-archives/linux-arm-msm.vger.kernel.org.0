Return-Path: <linux-arm-msm+bounces-45049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C071AA11387
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 22:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3495F7A4080
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 21:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2AD212B3E;
	Tue, 14 Jan 2025 21:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krqqAD/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183FB20F091;
	Tue, 14 Jan 2025 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736891885; cv=none; b=WZTO5U6AQkZG6shAMfgi8gaP7NSiAW82tRmOkAkKP1QFKcokJZ/K9CoQ3d7IsI4ypsKlwYOimkjHDFSAZyef0rJJ4rlnor8MiECRSsQ48DuKNSThNlsrXpeVpCgYtw+zjpFSluIsZc3FK03P1inny8DIIr+RW70t7+dX1/SpYsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736891885; c=relaxed/simple;
	bh=fIRjaf2CBR9Qy+fI83to34FCd1RO8+IPvgldD3ddWh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkr2yPFlX943rL8W53inlUpHMTnjocxZZOOXo4VHljGm0FwWkPX/3spNRwY6BtPgKWU9PjfSBMA1yzujngTaVXgkYxb5bO1unol483VJkLeRxZEISisWtHvl/hKJd/Lvng0bCg7WVBSI/PQQL+YCn1GtqU0xvbg/lUlgge60CVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krqqAD/t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF61C4CEDD;
	Tue, 14 Jan 2025 21:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736891884;
	bh=fIRjaf2CBR9Qy+fI83to34FCd1RO8+IPvgldD3ddWh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krqqAD/tinsHRONkhI0CAN1VER5dNJQoyDRkkj5L3Fv3NE2bIkwbFlbgRQ9/KkAj/
	 F8zeNWmDZP8L+Y3Yc5Tt3wp22Azhw4P0b7Dsj5EfMCra94eP2rmcsBxarrn7BMwgfG
	 TexrpasEOfT4xLLd6qpX8ZUif1r4852u2MYAEFTL0LAi7fVlZ0S5c4aa1k15MpxF1O
	 LzAkc1eB0u+7ngi0MEpqxDyblcL4W4c92Y8M4oo5IEoBu+YGtFqTULFyvtJpxsI2Gp
	 MfAd7XdMBVVOjfcfSa7Ukrhx6y3a8gwpXZZVAlJtYl5ba+fXg01qbtja/K6rSH6Mg7
	 soPWNoGBPU14A==
Date: Tue, 14 Jan 2025 15:58:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: crypto: qcom-qce: Document the SM8750
 crypto engine
Message-ID: <173689164413.1704764.8805395503286034717.robh@kernel.org>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
 <20250113-sm8750_crypto_master-v1-1-d8e265729848@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_crypto_master-v1-1-d8e265729848@quicinc.com>


On Mon, 13 Jan 2025 13:16:21 -0800, Melody Olvera wrote:
> From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> 
> Document the crypto engine on the SM8750 Platform.
> 
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


