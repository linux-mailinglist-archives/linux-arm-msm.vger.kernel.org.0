Return-Path: <linux-arm-msm+bounces-37138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4168B9BE673
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 13:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC768B20D27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 12:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09D21DEFF7;
	Wed,  6 Nov 2024 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbPfOMLX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB271DED53;
	Wed,  6 Nov 2024 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730894363; cv=none; b=pAAoJ49GUa/sN/dpl9A/62IK3SeR5OXQi8TsIqlZHz2QC/4evt5HgeHLMZq3yz+uOXndyD8in8tO4iKJ5Jb+o4hfdRa1ANmImLG2JeIMvHn4e0OBgOTXwhpe/a0jIrtj+2t/Fcu99DgEOQGX+uVLk5y9inzeKpS4Ml/EMID42U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730894363; c=relaxed/simple;
	bh=p0bB5Mo6zqDXDHymfVXTwt+F9b2dNtLH64V05Z+5h48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kABSOQ49UY6WrzTsp0X0cux7vZbB3ReRARdc/VQV5FEgiTQWJMp65/rF3m07bxqe2gU8+UF2BKx4ZWEPNiLJz9PjitZKiszivjyswHlxjRE1lMdqChfd4tjbTmmcpzOYJ/wmFBqlXNaarqO4QKySAIHXFwgza6q/7N7SM4ait9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbPfOMLX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0F5C4CECD;
	Wed,  6 Nov 2024 11:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730894363;
	bh=p0bB5Mo6zqDXDHymfVXTwt+F9b2dNtLH64V05Z+5h48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbPfOMLXrU9obWrgujDCuY9xTJDbgAuEIPwYySIjPZhpyJfW9bQdfBZyJ1n/xyS2x
	 AgigZRhn52eQ7sgo6pGM0KEwTMqZAZdAiwXniDxus/PKqvg1rm6CNqYeyzAixuwXnH
	 t1xV+0uztMN8Ans9QJMXWRJUJ+wH55tUg0RLu75iE+qLOxrYoVNMxSf9HmNZ2HXvNT
	 hPhI/bl8li9X/KmQC3iGShdTwmcsI/ZsXhUt37zhM6vQrwoj6MrTvOShKLJIvyH1Mp
	 PIID5zC0EsVn8VXGuCyZe7GsmBZo0pqDoOofoOHsnIcQunUcFG3izlL3iSQcO/mkxX
	 o1w7Kj33lSO3Q==
Date: Wed, 6 Nov 2024 12:59:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: clock: qcom: Add CAMCC clocks for
 QCS8300
Message-ID: <pzlvedk7hs2eawu2vpd6zq5cyrcgj7vtdj6ztwr5fb54kxdrvl@h6yrs7ab3ruc>
References: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
 <20241106-qcs8300-mm-patches-v3-3-f611a8f87f15@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106-qcs8300-mm-patches-v3-3-f611a8f87f15@quicinc.com>

On Wed, Nov 06, 2024 at 03:21:58PM +0530, Imran Shaik wrote:
 +
> +#include "qcom,sa8775p-camcc.h"
> +
> +/* QCS8300 introduces below new clocks compared to SA8775P */
> +
> +/* CAM_CC clocks */
> +#define CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK				86

I really wonder what you are going to do when sa8775p grows by one clock
and will get ID of 86 :) (and before you say sa8775p will use 87, let me
just clarify it will have to get 86 because no gaps would be
accepted in existing header)

But that's not my problem:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


