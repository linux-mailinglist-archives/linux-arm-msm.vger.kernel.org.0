Return-Path: <linux-arm-msm+bounces-35172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED399A5D94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6C071C215A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF871E0E05;
	Mon, 21 Oct 2024 07:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEJHQM/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8F11D1308;
	Mon, 21 Oct 2024 07:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497108; cv=none; b=F98Ofb3o2p8GfwYLMvg4BR5QNc7PysqDeFMOnxlRD0s7t7yUHanFfXH8vacIxPGbe6tEgWa40S+A1DhUaZDQnUAiugD7rdbbzN6cOCDABkl9U3wobDW0KMsAtFbAgRCir8NxTaRP0R2wsld/8xDssCLVr4Tg/LUV0fwjZhE8sXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497108; c=relaxed/simple;
	bh=0QLxqnjn8QRtF8jlI6qVFrOxGUDCPam5Dm3ZOm4573g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEifoRQ9j3XXOzQ45DuOHEt3+9vkV2iK6riV27DR6OrYZqbP5NenlcnLrtByuBz1nW8BtzZZgZJ0oKDVEAo0sY6m9tWNgN8fTRui3j7I2eLGjXsjGuWITYbZaMDkMQUgHaydjKW9ll9UYJMi560FC6FZH7jNYQ13k9AkPBk6vNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEJHQM/u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC918C4CEC3;
	Mon, 21 Oct 2024 07:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729497108;
	bh=0QLxqnjn8QRtF8jlI6qVFrOxGUDCPam5Dm3ZOm4573g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fEJHQM/u9C1Sv871kfBcgOtCtQthB6PqCj9hWq+bTjr4TmEBQEUDz7S2ea2X/+VZT
	 A5c2z6haIbOsSUZOblq4wfDDPCzhZJ8ty5abzpQv2MVIgtjik1GlaGOMywPvNDwv7A
	 tDBMqqow7OGgCc9YlnkJemwO2jEMtC4AxGhuvbPa3EUvO/aUUupP+DGwKfK3oqm7tg
	 RAukYs8RGdaUfE/1A1STY6CyH4CkXWO7vIfWflyfFL5ScqlC5hVdddrvIq76HA4FnL
	 McsbcGGlrw4oZfWZ7dHrAlopnj9qDv3gy5EPT5N8kxzoVSRLNL+SLYHO+qhlLEoUJD
	 b5Y5d3kE0SDcQ==
Date: Mon, 21 Oct 2024 09:51:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/14] dt-bindings: clock: qcom,rpmhcc: Add SAR2130P
 compatible
Message-ID: <tlr32nu5azfpcendtgk7d6awxycij7yczsg5q37c2mykrt2unf@676fcwgmmjxr>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-1-f75e740f0a8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-clocks-v1-1-f75e740f0a8d@linaro.org>

On Thu, Oct 17, 2024 at 07:56:51PM +0300, Dmitry Baryshkov wrote:
> Document compatible for RPMh clock controller on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


