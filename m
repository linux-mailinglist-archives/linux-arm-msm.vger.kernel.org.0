Return-Path: <linux-arm-msm+bounces-69135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D6B25E54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 10:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FDB43B6DDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492162E7639;
	Thu, 14 Aug 2025 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5/XWItu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AFD2D12E7;
	Thu, 14 Aug 2025 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755158756; cv=none; b=l/iN5dPjMes5CSEM/TBxkjvNeH4Zqr3etFshXAgJWqGHFhRKioHlUBveswjaHxknSnXfnkhpMrsDhmFajwjTeLjGpmrRsQvDXGSfB4YfLvPZaSw3+sK4Hll8kVmbNIvYy3sT2WUdDCewtjisxJI9I+5CroeiBb075GrRIOaDdYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755158756; c=relaxed/simple;
	bh=HUjRoUBiPA6qKjrIqUqj+tWWPwrwSnjORUlp6OeXZaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPr992x7Gp9VpQoDCF+wEg+899DHgvOppOOLxUTRwK2OcRSlT6RslGK/EOFw8cGRBmXX7Gvm0DYguYeyhN6L36wfGe19cEBS1HQy80KkMIk7+XubUy+8fXT/bIjNqzzHwCxBATck7tPP8pF7nX8Io+dCuE2YjoSYDCO7Rn2qrIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5/XWItu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA8DC4CEF4;
	Thu, 14 Aug 2025 08:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755158755;
	bh=HUjRoUBiPA6qKjrIqUqj+tWWPwrwSnjORUlp6OeXZaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5/XWItusZsyqPyNHbtQySAAEa88+ND8yVFrvjobJDf7KWOF+a4XTNQZykaPKTQ45
	 dTQCjk9f7QGHcTJXyWBcO2D2AscS7DK4YWE2q8MxtfiWHKhxa9kkSWymw4D1Jc9bT5
	 XoRURi3jFZDfmwLWdgv8fYfNyiYJ5wxxOIxEnKHMFobWJGP6Rm//potJokUboqP9s8
	 5cafsbJ5tm5K/zuDz5TkTo74gTe9ZG8vJsniKpjTB74pWq4RPr9V/unVE419nSMqCf
	 T3X3BdFaSKeZOVkfhU30BdvFdxKs+RfoHmnwQg1x2JE0msRQgeOqRQdoZEGzLk+EDo
	 5yzo7BRy3iFbQ==
Date: Thu, 14 Aug 2025 10:05:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for
 Glymur SoCs
Message-ID: <20250814-positive-defiant-hyrax-f62bad@kuoka>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-1-a408b390b22c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-1-a408b390b22c@oss.qualcomm.com>

On Wed, Aug 13, 2025 at 01:25:17PM +0530, Taniya Das wrote:
> Add bindings and update documentation compatible for RPMh clock
> controller on Glymur SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


