Return-Path: <linux-arm-msm+bounces-87229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FA3CEE79B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 13:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE5253010FF5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 12:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7FC2F28EF;
	Fri,  2 Jan 2026 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIVIT/m5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA9027A123;
	Fri,  2 Jan 2026 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767356099; cv=none; b=u9eOSRwHDLdd4i0Ndiigijqa58ncSDfRr7nUolFZjdeA6T1QKJdjE6c1JtkVj06AGMwgt6UYWn8iQ/fSkISKfOW3onaqrQYRfbsxpaf/+t9s8oT2nRZAzq+nFtQDXXI8r1Ezjc7R7WnSpLiUtiDhuy9Le6zsTQfNCj1tLfiiIzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767356099; c=relaxed/simple;
	bh=hthjXP5kAq1S1kh08u5nZT76L5KxInmjvwsExPy7sL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nreKSiCizn/Qi/NZCprFJGAXOuvRBM8V3mTURbx6u/Ax5qCU4UJI7+auP0ww1TZ97PEfNdQFPmVzd/DpQVOq39k/Mar0uBjo70dMkF/YC1+ukthu4pt6lyuup4UK6sf8v3M8g4GEVzyTCnEGi+8/qOVbRQXOK1BAQW5sUZ/mxaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIVIT/m5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35FBC116B1;
	Fri,  2 Jan 2026 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767356099;
	bh=hthjXP5kAq1S1kh08u5nZT76L5KxInmjvwsExPy7sL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CIVIT/m5ognjKPRQUzCikJ0XLTobkC17NqJj2wpcpGmfsJi+QYevCLCRNa67Eml2+
	 /tkHCdFR7mjDnRgmENBPzsgnFWJpunFflbSCJLeCSXkSdlWKOzX3HjH94wnmpCwt2D
	 26QbwLe/K6UmiiKRDmgmRZpFp7IxwhcE4byqRxJBXomFlQPUUgrZOcAJ7JkBmGXLyB
	 /2vqxsRELpY/SM26QJrtHCzEeaCNVKkpHO+w08vQatNkvSlJlr+bDwyv0UmwVw4s6a
	 yyM1JEbW4ovdTqFE2nThyOmAEFYTKH2Qx3s8Q9O0/oh3SmT/F0YuOQGJmhXP+HS7WS
	 jTuTa8AN1XHdQ==
Date: Fri, 2 Jan 2026 13:14:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abelvesa@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 UFS mux clocks
Message-ID: <20260102-helpful-natural-donkey-9b5005@quoll>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
 <20251230-ufs_symbol_clk-v1-1-47d46b24c087@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251230-ufs_symbol_clk-v1-1-47d46b24c087@oss.qualcomm.com>

On Tue, Dec 30, 2025 at 11:08:34PM +0530, Taniya Das wrote:
> Some of the UFS symbol rx/tx muxes were not initially described.
> 
> Add indices for them to allow extending the driver.

Please drop this. We do not add bindings to allow extending driver, so
above is not the correct reason to do anything here.

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Best regards,
Krzysztof


