Return-Path: <linux-arm-msm+bounces-64068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C705AFD06A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24C3A1885906
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91CE2E266B;
	Tue,  8 Jul 2025 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nteUQ4Mq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C3821B199;
	Tue,  8 Jul 2025 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751991423; cv=none; b=ct6m+PX7f1wKkZdL2BvxozD9eTDqm4G4g/HvTI694bwI9bE2ttjnUpQMZuWYZ17wpVmuAAa9s90eV6va2fahC2T1QV1svLZwXrCa4VC7gy98oToKs8zjEdMUkwJuLRmlI2/INB+dcvA8Q02iEL9RQlxBX2Atd25I7mKHhD/Th2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751991423; c=relaxed/simple;
	bh=nbGCmYL+a3SA2RRWksLD7uACXMII0cs1xS2gIUHJeeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ark8hvRjZx9pU9WPrntk8qP8SiHgWrAc9oMYncMAVNRgwoXFbCIgx/k9NvOV2gNRHtRkB0i+1SyQyEcqoiZvuwIBbSgT+xisXaTseJrf0Q+7N0t8AL876Fj3iEScRR4X2qpVT2sG9Tvoxke3CXeyySyodtyHl0ITPAa7CwG7KjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nteUQ4Mq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC665C4CEED;
	Tue,  8 Jul 2025 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751991423;
	bh=nbGCmYL+a3SA2RRWksLD7uACXMII0cs1xS2gIUHJeeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nteUQ4MqJaaomEKaAVmOyO0KsiKqr+K9XvaCSQ8Y3SsSGh+9GrwopG/RPxPgam5h/
	 I/grsXO8JtoslYXVSZepAC/UwZmigtruMZn+mIHTEzWbvpnj7q6MMoqZPsgbEjdA73
	 +wfRMtVKGp0F2nMARO1vGmmJyUQxBleYTDhnauY5PNEm0MRpxdcEeHH3t1kPn5GvZ3
	 LZ759JuwEtz0LvoGJKoktlENXDQ1680Jqh7B3WhSccqWpc9SKl2wi0aVVjdO3O0TVH
	 PyiGbzxj8xWDB4z48EJ8nKiyMyzC6a/nRN9D57PMu2RBXYKDqonKfwmfyaFC94DRR1
	 KAZEzGBV+If0Q==
Date: Tue, 8 Jul 2025 11:17:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom,sm8450-videocc: Document
 X1E80100 compatible
Message-ID: <175199142127.518048.16838716470013972083.robh@kernel.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-1-785d393be502@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-x1e-videocc-v1-1-785d393be502@linaro.org>


On Tue, 01 Jul 2025 19:28:33 +0200, Stephan Gerhold wrote:
> X1E80100 videocc is largely identical to SM8550, but needs slightly
> different PLL frequencies. Add a separate qcom,x1e80100-videocc compatible
> to the existing schema used for SM8550.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


