Return-Path: <linux-arm-msm+bounces-37137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D78B69BE663
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 12:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 887E71F24936
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 11:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB0A1DF975;
	Wed,  6 Nov 2024 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iE6ULav/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E011DEFC5;
	Wed,  6 Nov 2024 11:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730894258; cv=none; b=F41vssF6eJm17B25vF4ZhxW4bfo1f6on45Xy031myXtrMGNn7Qhc2HflHJpfixXMhfPMXBGrHJXo10COJ3SZNyYtjVchrR5GPbof86Oh9duwF7NofiZZPGMTf5WsgDAxFdjI2CC+wo8QdfQmf7L2zUgJVrORIdOTMvbg+dv7hCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730894258; c=relaxed/simple;
	bh=zFu0y/SOeLlBtCda28wQpQ4py4Me3MCIdbd9B5cVi/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsHINoxqQn03KCvzbMnAupyN/GLedoE5lLj/vkdoqEgxz2dHhLqKaB/LU/Mg1SVgteaaKAHit3t/C3kI0qFO/ehS4O1RZaO4lDL3mSEI6LG1Zh5Aa9G+KqP/9ouvmrndByxZfIkKbAtkrmFDH89rF3ww1Ejd++J7fIs2aQ1VNrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iE6ULav/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E922EC4CECD;
	Wed,  6 Nov 2024 11:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730894257;
	bh=zFu0y/SOeLlBtCda28wQpQ4py4Me3MCIdbd9B5cVi/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iE6ULav/NmEjzNz/5GZVCG9rEbDY3rod7sh+QlZrxgQOGfEq5xrOL5UvKq6+A2XH4
	 PTA6jBNen9s7RlVyQLALay6oavMj32CPHX+XUx6vuppyerqxHsZDx/rtMZt3Ke8GRT
	 gBNxoIJPwoiIwmP/l7XX6QiSjA6lWkZWmgFhBsBiTzve9zwY2DE/Ey3+CxKq3O4upE
	 oB9mDP9AdG6hNhmm5tXpOYv6Uml1oleHD7B9VDiNVdIYa73m7wcH40ydlhwEXWa24t
	 Z34aKNx96LNc7jdIQax12rx8fqi5fmcB+9lypwfsKb8FE9/J2xxe/cj+24VtrlOpZ9
	 TARUot0n3zijQ==
Date: Wed, 6 Nov 2024 12:57:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
Message-ID: <36f2ng6bdovp63xmojrs4sxmbwnapl6oo2isehmiiuh6xl2les@7nfpou4ppkp7>
References: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
 <20241106-qcs8300-mm-patches-v3-1-f611a8f87f15@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106-qcs8300-mm-patches-v3-1-f611a8f87f15@quicinc.com>

On Wed, Nov 06, 2024 at 03:21:56PM +0530, Imran Shaik wrote:
> The QCS8300 GPU clock controller is mostly identical to SA8775P, but
> QCS8300 has few additional clocks and minor differences. Hence, reuse
> SA8775P gpucc bindings and add additional clocks required for QCS8300.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gpucc.yaml |  3 +++
>  include/dt-bindings/clock/qcom,qcs8300-gpucc.h          | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+)
> 

That's a bit unusual, I think none of other SoCs do it. Last time you
brought existing example which used the same header and prefixes.

Anyway, it's fine from DT point of view, if that's what SoC/clock
maintainers want so:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


