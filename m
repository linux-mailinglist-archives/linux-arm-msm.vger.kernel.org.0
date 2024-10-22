Return-Path: <linux-arm-msm+bounces-35461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F9A9AB3E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 18:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 564EB284AA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBACC1BBBF7;
	Tue, 22 Oct 2024 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8eYlxpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02891BB6BE;
	Tue, 22 Oct 2024 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729614323; cv=none; b=TI0zG4rR6Hsd+Wn77RhaKIQ3V9JlC08FVhdvFWfumXvFm/2pvJAybfIk8Dj4H1Ky87iesfR1yC4Q+4tkGpTFpEBbrKNvJ3PB5/jNUQdABVmcBld2IK2CAyenW4Lfe8jF64ogZmwgiVb+vFsVORzq5SNT+vbGfwrShIchIhmRdnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729614323; c=relaxed/simple;
	bh=hg1K/hUnb1N4PHZXAe7Z3VEVyWsDIXMOdk9gxdCDWc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVvyboztaj0VaXhXh0r2NxUwHKhEL1DqdzxlNvZVe+OzN2IEy6aDke44cAA/HrNL55mbD76ZU6jkXQpCXd3yBx+S9lVzb0mZ6qSV6iYg0/YJVGIb3GDzEfiBOk7Ep5CiDDbQX8bLQ8Cc8oqK1MzfveNzF5ByS6rugs4b+ZzOBSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8eYlxpy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312F3C4CEE3;
	Tue, 22 Oct 2024 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729614323;
	bh=hg1K/hUnb1N4PHZXAe7Z3VEVyWsDIXMOdk9gxdCDWc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t8eYlxpyWBvZgyslB4xQH0OhdfkTTCNRT14J726K3zdGQkh4NpQV7yj4h4Y6pdHvU
	 ZoO8zFj95KH3L6+WAMT4nVwiKoeerYUcwle+u/ZroEsY6Mgq/N2FNR5VecEIzVneRg
	 00URIGo7dAAo6xpcV5gwSnB5yKGLWFTm/9pqGkZGlceBQRsuyaeE9rWm7eXCc1Bd88
	 dhtAbUJWhkAAN6acIXJpWmLXXKMImk1tJT7r8leZ9rixFo11xcuqivjv4byulkoUyQ
	 EVz9oEQ121R309ETHkGl4UUnUPMPXNEnj7JY0tgMcPIw3B/KJAmv8Jl1a+lUH98fLS
	 9US/M5DwBPKFw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t3HhN-000000005Yf-30XV;
	Tue, 22 Oct 2024 18:25:33 +0200
Date: Tue, 22 Oct 2024 18:25:33 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix up BAR spaces
Message-ID: <ZxfR_XM9U-HSXTz_@hovoldconsulting.com>
References: <20240710-topic-barman-v1-1-5f63fca8d0fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710-topic-barman-v1-1-5f63fca8d0fc@linaro.org>

On Wed, Jul 10, 2024 at 04:07:23PM +0200, Konrad Dybcio wrote:
> The 32-bit BAR spaces are reaching outside their assigned register
> regions. Shrink them to match their actual sizes.
> While at it, unify the style.
> 
> Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

This one seems to have fallen through the cracks.

Bjorn, can you pick it up or do you want Konrad to resend?

Johan

