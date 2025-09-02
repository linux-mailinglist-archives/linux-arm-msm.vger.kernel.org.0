Return-Path: <linux-arm-msm+bounces-71509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A13B3F82E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75CDE3B1853
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552842E540B;
	Tue,  2 Sep 2025 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9CIxXWk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA43D76;
	Tue,  2 Sep 2025 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756801304; cv=none; b=sATF2Aocsa7Uk1CZ5DWgrK2fy+/rWN00+pA3pE6U1OfpXVzqA+mqSKVPOPViPz9peWyi+CcWGfRzf/4y8FtH75GsAyJKGNR3WuICpWQI+1wATSuuFOUmfaGU9kYzgbE41ctDGAcfNgt7CfS1YFXEEYZ57D99058tMIXwLBNn0zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756801304; c=relaxed/simple;
	bh=HTP71WhzGipeCSBajL8ANOHMk6CxNR64g0iCm2wt0kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPBFEsHPYteEfEry8q6hdOptipFIOL+Y4+ESSvL17LX1TcI2d5rYDvb8Z2NKVqyNj8XIlfuWR2DLM4KP0my6KUzwpbmu1Ts8gU3rIEEHWQfMLR7d0daK/7e/tOBNTLLhKDZ0HU3EuNO39rhXHTk2eIZCyIyS2nLnMojnAg3SDmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9CIxXWk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E31C4CEF7;
	Tue,  2 Sep 2025 08:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756801303;
	bh=HTP71WhzGipeCSBajL8ANOHMk6CxNR64g0iCm2wt0kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9CIxXWkCuROnlh1iQx3SkkD051nxRcFCvy3ABzDYcrX5XJ3Q5xYOCu7zcxDYplD1
	 TRrLbvXVKN2JO05Krc/nJ+o+6pBYkJO+r2CfpQLA8Q17L7F/YbvWZko1YzwQ2O2fAX
	 2eA2KKS/xk3JmPaqY0GRjM8RQQl6WXtMr1s2gDxN/g2tn+5l/nlhGmrzEIhLYrUyyj
	 JgNTrjC91rCsxIY4KbTeguaGw3NGt+GGDsqC4rMikKQHhW1hglPjD7J6KemtDEYsX3
	 QGcJ7aEAqyGaqdk8evBorVaQhPT3wTSm74NnmsPJOhSVCDgBim6XXd0bAsnIVkSaGU
	 UC3YOcz1/C7Cg==
Date: Tue, 2 Sep 2025 10:21:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add DISPCC and reset controller
 for GLYMUR SoC
Message-ID: <20250902-loutish-dangerous-trout-cf4e47@kuoka>
References: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
 <20250829-glymur-disp-clock-controllers-v1-1-0ce6fabd837c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829-glymur-disp-clock-controllers-v1-1-0ce6fabd837c@oss.qualcomm.com>

On Fri, Aug 29, 2025 at 01:28:03PM +0530, Taniya Das wrote:
> Add the device tree bindings for the display clock controller which are
> required on Qualcomm Glymur SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,glymur-dispcc.yaml         |  99 ++++++++++++++++++
>  include/dt-bindings/clock/qcom,glymur-dispcc.h     | 114 +++++++++++++++++++++
>  2 files changed, 213 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


