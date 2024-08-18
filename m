Return-Path: <linux-arm-msm+bounces-28891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7275955D75
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 18:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 523F91F212C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 16:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C96E148315;
	Sun, 18 Aug 2024 16:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4pSOtEL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C50D1428F3;
	Sun, 18 Aug 2024 16:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723997962; cv=none; b=DJTAxsgdPJRk/gSdApsNrXjBf6On4CHJ7YLoRqMMM1eIoP8taAnAecCXTHSMeIIIYPQMQdyPnUDWk8nT4OrQOrK5/W/sS/6KS3Z1RRSnk5fll3RJLW2aNRavFTw6Ad9J1gALlMiOIGyJVX63/UEr5xp6Aw57qkd2j0ILxhDfGD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723997962; c=relaxed/simple;
	bh=13eP9+oppQ7Kv3CxDti6umt+IjMBpYH2dAw9mbpOVhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sz9O9nk3IExFZoOXhzSZzxDe/LO/+uKvFI0oxJOMTaLluIu2K+0cL9OQ1C6K9pjfZTAunna5ovv8h+rETUMFmxxW/WicpY/CcY06r6CFIXgZ3NUcVsFwvwPd9beEbi0uDRMXN5LRO6mDv61ER8NFu0ewiuntOA+/aN21vFGml3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4pSOtEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A6FC32786;
	Sun, 18 Aug 2024 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723997961;
	bh=13eP9+oppQ7Kv3CxDti6umt+IjMBpYH2dAw9mbpOVhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4pSOtELPQhPSnB1wVPalzFoXWf7jdQL91hY6lFZJIjLQNrm8CL8YlXetljPB6udO
	 z8UNGpOfp/oDKDjGHw5alTh0U1jMUoaGgmuN+z69Jd+WFfIBah0g0eb8GDI7UDf2XB
	 /Pj5NqcMBnal5cbh0AqlnBGsSIBvX6EUPRYpiObgceRB1q0e5eqSedvGzQomZMHKv8
	 JqBU/J/OTDqGlKgEaBJpEx8l1u/83bWZM3+yaHoFt7Ks/CABrqywchn2AOHUoFef1j
	 TZZLRqWsAFx0GtAmPlYSvgwTR6YagjGbQtUQGo9Hot/TLAGxqJwzNK068guPK9x3/t
	 kgM/oJs0gnWVA==
Date: Sun, 18 Aug 2024 10:19:19 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: clock: qcom,sc7280-lpasscorecc: add
 top-level constraints
Message-ID: <172399795877.184573.6620159071061158443.robh@kernel.org>
References: <20240817094605.27185-1-krzysztof.kozlowski@linaro.org>
 <20240817094605.27185-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817094605.27185-2-krzysztof.kozlowski@linaro.org>


On Sat, 17 Aug 2024 11:46:05 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for reg, clocks and clock-names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,sc7280-lpasscorecc.yaml      | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


