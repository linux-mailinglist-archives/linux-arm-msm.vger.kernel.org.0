Return-Path: <linux-arm-msm+bounces-52411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F033A6E48A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 21:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 918873A5628
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 20:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4B91D5AB5;
	Mon, 24 Mar 2025 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWY+snBo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FEB1A08A3;
	Mon, 24 Mar 2025 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848458; cv=none; b=PpWf/RD6kRt+J+67RT8gnvlx9T9rcIWLwDjm8Nq0gT0m868i+73X/hYIUs5jVRDKyvvgoOji1k11XsiYBezW6c1fgxAHCxX2OYBPv69NX54pdgzrzy/QIpfjHuDQq4aquIUQkCe4LyCGz8Kj+knEyHObpf1mI0OshKzewu4x8ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848458; c=relaxed/simple;
	bh=WQsgdrLzGf/rKF9Rxu+Myb56pbGqDyG8vHyfgjdOXGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBPOxm36Nwf6DUFfPZSdATyqPyaAwK08Oh8ajC5aPuDSOSY6ExVI24SrcbpxC6UVyq9xyvRQoPuNB9xboe7C9b/qJQe6RVSlVprVA9OzDsFDvVQ9+GEydPCypohizr8UIGw6ZU++ru/exLaQGmqYI5byG0Kpri//h/NSCsz1ato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWY+snBo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D591BC4CEDD;
	Mon, 24 Mar 2025 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742848458;
	bh=WQsgdrLzGf/rKF9Rxu+Myb56pbGqDyG8vHyfgjdOXGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWY+snBo1wR3tfpaXeEhwe+NKbipOVKkpTmiUiZR2C/w3Fa8r5TSIJD+NV8xyjIFT
	 N+fPC0DanXPQgM4ll3UklXBdUxOaaHdp6tvramUR3CIjFrksuRlriGIOHucexniQjc
	 AoObG2d3679GL69DDFxFFWWe8xfxGWWtmVhlw6sX+atDBdyvtOSN23D9fwqreWywKi
	 zJqx/D08WhocPB3Wv4W8eSY8oPQnHcaMClZO//4V9dq562tI2+OwvO7aBGAvtOsPeI
	 AZH3qv9kWTsouu7N0tkAZC045cfM2e3RRVREStfWQST7uvV7eJ32wkaCZaDinWuuwW
	 pGD19TWfAG4qA==
Date: Mon, 24 Mar 2025 15:34:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	krzk+dt@kernel.org, johan+linaro@kernel.org, broonie@kernel.org,
	conor+dt@kernel.org, konradybcio@kernel.org,
	paulha@opensource.cirrus.com, luca.ceresoli@bootlin.com,
	linux-arm-msm@vger.kernel.org, perex@perex.cz,
	dmitry.baryshkov@oss.qualcomm.com, zhoubinbin@loongson.cn,
	ivprusov@salutedevices.com, peda@axentia.se, andersson@kernel.org,
	tiwai@suse.com, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	lgirdwood@gmail.com
Subject: Re: [PATCH v4 1/6] dt-bindings: mux: add optional regulator binding
 to gpio mux
Message-ID: <174284845664.822870.8151972984188794106.robh@kernel.org>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
 <20250324130057.4855-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324130057.4855-2-srinivas.kandagatla@linaro.org>


On Mon, 24 Mar 2025 13:00:52 +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi Mux Switch is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable. One such platform is Lenovo
> T14s.
> 
> This patch adds required bindings in gpio-mux to add such optional regulator.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mux/gpio-mux.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


