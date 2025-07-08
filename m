Return-Path: <linux-arm-msm+bounces-64070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 722B5AFD083
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DEE3188680A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5742E427E;
	Tue,  8 Jul 2025 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NA65KBJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56C7269CE1;
	Tue,  8 Jul 2025 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751991716; cv=none; b=eVJM16r6tovo3cLIygCjOUZQNSW84+gHjt3RphuSWQklMh2vUzuepg8HWS40FEt91pp6QCjAlKriu4rUIustgAIq7erBpOzaUPTCEV46T8YuVpkOmm7srJysoyKwQPiiov0bgSua7szhyDezTRTPozThJst51fndMdiNXG/z5Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751991716; c=relaxed/simple;
	bh=TLvocITXJ+jGWEc+GbjQZJFvOjFTeZesBcRy+xMkzLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0gopaUzuPDIEXWxZA5NoyjAcUD+y2ej0Vj0r4An5zRuKZ2CRrI6GD+di/tRLytkJGYB84nj3ZZbImvMkJ3CyM9OM0LFetnVJOvpVAY9IL66NOinJWSbz9i0u8aOrUAgU3FRYFPLlQRH77hGfeaHdEa8iSFgwcIXyVOPUsppTxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NA65KBJG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671F0C4CEED;
	Tue,  8 Jul 2025 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751991715;
	bh=TLvocITXJ+jGWEc+GbjQZJFvOjFTeZesBcRy+xMkzLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NA65KBJGSYJYKU3lzvXmQ0NFxdXb5lepEg7SeBf67E/fMjpYOu2z7L5CfqJCT9uTi
	 zRmKSTIq4F/JojJcii5MFuS3xwUp7pJhmj6v8+nrhWJM/t9QOB8DvKQ5Msdvl9DKcZ
	 T3lXsuGu0YJ/y989qbcWwO3yAFEJE8/bmsgV8LFoUkCkDywwtGQCVe/s5sH9EwM+Fg
	 ylbgVtb6AJwtdN+YNBUzoBZfBvrPN4Z0kSOAKqyQ+hfDc90m4+sY7cw/JkwzY/ibGl
	 BwMG71qA25IConRQhwsNDyqh9KEKC69gQoPOgvHGBk7vT1cIBqRUprTqEufh53cxho
	 tcBNEXu4wgFmw==
Date: Tue, 8 Jul 2025 11:21:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 video resets
Message-ID: <175199171363.537918.5935203140901577075.robh@kernel.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-4-785d393be502@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-x1e-videocc-v1-4-785d393be502@linaro.org>


On Tue, 01 Jul 2025 19:28:36 +0200, Stephan Gerhold wrote:
> Add the missing video resets that are needed for the iris video codec.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  include/dt-bindings/clock/qcom,x1e80100-gcc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


