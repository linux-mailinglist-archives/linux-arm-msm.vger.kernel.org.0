Return-Path: <linux-arm-msm+bounces-50321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F2A4F8E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 09:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21333170B78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 08:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D841FC0E0;
	Wed,  5 Mar 2025 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLH5fR3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77CB1D7995;
	Wed,  5 Mar 2025 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741163519; cv=none; b=lTWf0KLdvdq83vpnzsFoKhRGjfmh1Umrjj9i8dmjwcY/ntAySH/ijBpogamCgYlXcPZmnYlikQc1CNSi6BzYFqFoAC7T1h7gAp+TpwjTjzyCi9aY+s/G2YJDlRkzpuhUt8aMt8Hky/ByGpeJZif1afiE2aDElCZEDVDWkC/Yad8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741163519; c=relaxed/simple;
	bh=XYXcBhkGaCZOgG+OuOEQ8Rxq0O7OXOcNCY1lCUhWqh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdY5tR7IKDnFgQPXNmpeGJBxXGKwSMJJeYJGsM7KufW6F3BCx27zeBGVsLbScFk8Vbe59lMKMGk1/cjv1/6WvFN+96wAMlZ7l1jCNQqA5W3KJSLBr114OxPvM2J59ZD0f5dxvSSRFKX8YECLqSONT/5b9sLP000QJyPIIGSesZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLH5fR3A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2489EC4CEE2;
	Wed,  5 Mar 2025 08:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741163519;
	bh=XYXcBhkGaCZOgG+OuOEQ8Rxq0O7OXOcNCY1lCUhWqh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nLH5fR3AMmtf4lXAT/5NGbldLwpC/Zc37ZSUDxmyJ6lMl1KjWJ72bUII/q5CfsKf1
	 VvXMMnsCJpbylLvED7MxaHylDbl4ToC1gSz8tBXGicazKJmDrWupcAH0+veRmi1ot3
	 RsGjyW34yCcJjDgEEBZldOzGskVGP9zGy1J45KQkGe/qX/SCyV+P6WrmmG4tz8Pwj/
	 Mrl47iuACVuRHxHl9FUw6Agf/hj4ZR+MUEyaZlnI6v5QSbvP4qQALZPas8If33IlMa
	 xO3oQe0pmc1aBuGuMtg0Come7Ywj1y3S2Qe419vTldZWRZE+KTl2fYKSsYkyyJhgao
	 3RT8DGQVYdBbw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tpkAU-000000004YM-40DJ;
	Wed, 05 Mar 2025 09:31:55 +0100
Date: Wed, 5 Mar 2025 09:31:54 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-romulus: Keep L12B and L15B
 always on
Message-ID: <Z8gL-q5Ae6XjQIkH@hovoldconsulting.com>
References: <20250304-topic-sl7_vregs_aon-v1-1-b2dc706e4157@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-topic-sl7_vregs_aon-v1-1-b2dc706e4157@oss.qualcomm.com>

On Tue, Mar 04, 2025 at 06:10:46PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These regulators power some electronic components onboard. They're
> most likely kept online by other pieces of firmware, but you can never
> be sure enough.
> 
> Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

