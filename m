Return-Path: <linux-arm-msm+bounces-35173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D49A5D9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A5BF1F216AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794651E0E0F;
	Mon, 21 Oct 2024 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmEhYPRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BDF1E0B9A;
	Mon, 21 Oct 2024 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497127; cv=none; b=kBPzQk57AGWLPUOdlfCLaqmUj7pmjVmfruJGM9SFPA+mxdaZ1Z8fek5bhXbfZfxaybmdkz5ROn36TycZQSvcwFz8+t3PVMQf9z4WW2ovdriR9ynUixzmIcrcwbW55mDwMEyaH1JfeJ8kVxSNsjo7HlgPdJo11+GxXwsqUI79HPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497127; c=relaxed/simple;
	bh=RMWS11YDQYECFzhlbuqPLEsM90WqFjCKpsLWN9yzR8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrcd5KR4zjB937v0dmRnIK7cEFeI9wa4m1CUjIP1cP39e5UA9woiLgVS7VSVwQfiGAUcuL14iTh3o3GeeSAhJ2UEA0kUyVdbmjjj6Kh6R8KMR4e1ShDRgKLo4E+YmLtzSdolWg0/yEbUWTYEGxMSxs2jPm1GQ0pPY0Qoy/i6VWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmEhYPRO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC547C4CEC3;
	Mon, 21 Oct 2024 07:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729497127;
	bh=RMWS11YDQYECFzhlbuqPLEsM90WqFjCKpsLWN9yzR8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmEhYPROyJ6J/NhrQZBkScRYPUQ4RStvwJjxK/4+/5oLkCAL0XWz8sQKrVF+FR6+X
	 HajDx/435Vg/H9QkssjP5TzKUDxondP8BEVKkBVNs8YmG7rHJhZTCJx+nV8m5Tn5eL
	 1RO0RXygOobRyYwn2sRPEctLbTvbevh6681sN3v/u8yOwqhe3Y5etCIc35tvHwXHZH
	 FRdP/ARa0pyHvGZWNg8S/rKILg09DPdQfu5PLMtPXTNGdx1pppiul9KNX/CIJETL8S
	 ed3wyMWzLl+V+GMwu6vXRFY70geJ7aCQKbbL67gox08OOMHTHtnfrp2gipDdMGXtSl
	 qDOg7asCmPV5Q==
Date: Mon, 21 Oct 2024 09:52:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/14] dt-bindings: clock: qcom,sm8550-dispcc: Add
 SAR2130P compatible
Message-ID: <r2qosfitumryr7ztejn2rsjjqvzjaahy7ug4g2vfgfy2k7dodp@r354yz4n65mp>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-4-f75e740f0a8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-clocks-v1-4-f75e740f0a8d@linaro.org>

On Thu, Oct 17, 2024 at 07:56:54PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the Display Clock Controller on SAR2130P
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


