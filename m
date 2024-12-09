Return-Path: <linux-arm-msm+bounces-40982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EC99E8EE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 10:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A463285240
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 09:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5AA2165E9;
	Mon,  9 Dec 2024 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/O2Qu+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC1C21639A;
	Mon,  9 Dec 2024 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733737162; cv=none; b=E3IMTFQMSDC334bhcD+8oudOOmYFWY6ZZdv1JgEXVGcrL5PjpquBVX2aN3M0lzLT8hyR3rxPj43akPqcoLBJyfAbrydOy7PZiskS4KgpWN5xPQ+Zsr5KZYlwqazgw6ABcL9c8jw0tt/IH1hrVhykmf8Tij6xPctIYkRpHBttS+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733737162; c=relaxed/simple;
	bh=LjzR60E+UhSRTYFgb3A+TDPCEApt2g0xKpBJsiveJOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8xy9WzEHuSMKufzD70M2+uOQwRP03bC+r+0jYdMI2JVeugLTCDlEAQERDPLKuUYy95p/F98CA4RPcGDa+jE7PbS9rP4DtI3UosUtqiBsh+dQykkdC5NKd70WCqjVRno+0LWY1MX+Jd0C7gYspltNfSSFR3FtRoQbWFSBrl6d6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/O2Qu+Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BA4C4CED1;
	Mon,  9 Dec 2024 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733737161;
	bh=LjzR60E+UhSRTYFgb3A+TDPCEApt2g0xKpBJsiveJOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/O2Qu+YDCcgCiti8/09pgb6z3TUusuNnDzE9h1AmEpn1xRKXnNoBDNlFOx1wqXF5
	 R/3+oJJ6HZVI1OG9yuWel2isoFbmV+lU+AF6z68XdmAQ9prEG+oIxbpIgVYfinWO+v
	 rD8Gga/L/L279OM6wqpZtPn7dv+vWnO2yJVyCfTtZ2cdSACqfIvZ9O26SHDg71TF/U
	 U2WCI1406i5VXyWm6V9fvuakT6bgxhrgJZo12QZYwxm/L8DYxnsHoiJvfKNQyrf6j5
	 z+RdrFFAj/CzT3aSLxiSzO6Bz51/cXVoJKEXQcdhQ8d4A8EyypPhRDOH1Dy+Jvu66m
	 5uheTclriw2Kw==
Date: Mon, 9 Dec 2024 10:39:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,qmp-pcie: document the SM8350 two
 lanes PCIe PHY
Message-ID: <uvgu5fpcoxmqnlqlu2evtufy7qtwl7bfztzpmxtvqsr7lvcdy7@645q74bovcyo>
References: <20241204-topic-misc-sm8350-pcie-bindings-fix-v1-1-e8eaff1699d7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204-topic-misc-sm8350-pcie-bindings-fix-v1-1-e8eaff1699d7@linaro.org>

On Wed, Dec 04, 2024 at 11:34:50AM +0100, Neil Armstrong wrote:
> Document the two lanes PCIe PHY found on SM8350 SoCs along the
> already documented single lane PCIe PHY.
> 
> This fixes:
> /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']

Maybe we will succeed this year...
https://lore.kernel.org/all/20240124-pcie-aux-clk-fix-v1-5-d8a4852b6ba6@linaro.org/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


