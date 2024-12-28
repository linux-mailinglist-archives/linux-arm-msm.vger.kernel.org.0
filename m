Return-Path: <linux-arm-msm+bounces-43550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2889FD9F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 11:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98CE73A0882
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 10:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3D881727;
	Sat, 28 Dec 2024 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBBt/HQI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FFC3594B;
	Sat, 28 Dec 2024 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735381885; cv=none; b=iTzsfVh6CqSG2Iri0XKi6S9y+JW1ja6IG8juKU5LiauRZS08oLrnm746DcZKTob40DeE7LmjLNy1VjBcG3BHYvAj4u/PysNJ6jTIJ8QDxmJ88t/JVPPnrnCBz4mgFVGzqqCytzCRmgC5pceddeQXGmS0tm9mlw0h0P6FBANbU10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735381885; c=relaxed/simple;
	bh=BYysM9akr3PZ2e39g6QsaW5zXtxyoggv0R2ihGqj7q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/YwJ+Mup3KwMagJInCuUbFz9fTJ/uC+ANrNlygyWtnY5EJMlz18R1KPIOXcj4MqVGuVd/mmPmifgdwVFabXSxAWmd1tlDpx4teQ/eZo7qVnWq9acCAADRy2opuCF0hjKT0zvyrXxTbfeiRUWzwyPLe1+TQDQMt5mYcRg5YMZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBBt/HQI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91389C4CECD;
	Sat, 28 Dec 2024 10:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735381884;
	bh=BYysM9akr3PZ2e39g6QsaW5zXtxyoggv0R2ihGqj7q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBBt/HQImIW4QswYCJdWigudRQT0PFMlslLHqgH6Jqft+Sdg6fD17MLWGdZpsuPKr
	 gXPaq1PtNJJsS7xi4DOGWE0JWd8vGrMOb1HXgZiwf2GCr4Uhoifvd7rKywDQLQZJ3H
	 Go10u4GiQbECjVSY2wmmZ0H8bBuzkww056ezAEMuQK3jUXuACT2JZNfSlvDqhOeM+4
	 12fIugwURIFvf5U7+zRN6rE063bPEDsK5vPBYEuQvTWiZ8Rn34C0gY/FX4KSQSJk3F
	 cu8FnJwQEe+ry1pJ5E6kkPMHQpOt8ZAQYx1FNHFf5hOQzQ3fgz3+zIg7VK9cGsTMlT
	 KH+x6iWc/0ssw==
Date: Sat, 28 Dec 2024 11:31:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom,mmcc: support LVDS PLL
 input for apq8064
Message-ID: <aqq63snnk3tnb62ue4iahy5lufobgssnxlnyjwhhjxegjj2a2h@ksudcj7kyl2w>
References: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
 <20241224-apq8064-fix-mmcc-v1-1-c95d2e2bf143@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224-apq8064-fix-mmcc-v1-1-c95d2e2bf143@linaro.org>

On Tue, Dec 24, 2024 at 12:12:13PM +0200, Dmitry Baryshkov wrote:
> APQ8064 / MSM8960 have separate LVDS PLL driving the LVDS / LCDC clock.
> Add corresponding input to clock controller bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


