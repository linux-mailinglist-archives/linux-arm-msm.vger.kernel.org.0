Return-Path: <linux-arm-msm+bounces-75767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED89BB266E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 04:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B10D161FED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 02:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4CB1EEA5F;
	Thu,  2 Oct 2025 02:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnSc6f0T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE60D335C7;
	Thu,  2 Oct 2025 02:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759373744; cv=none; b=QAvfExsI/0dOhbupd0g9F6iCAn5UbFzlXYY9U78ztUgw/mtGeCZLtBOz2tU3BgrEjei4Y33hHjiqL724OnU32jTl0Q3WohA9c+Wnrib9PzKekUjHb3XdWg7j91kI4knRoo3MyfM2Cuk+l23nYfgSlSLuIyV/WQA0N6s7bOZ/1tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759373744; c=relaxed/simple;
	bh=4Q8KN3t8PrMWqPzYc96enM/J37p9JJO8vsuWDUnc5Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hk5xRiVJaB3ijOMI0o6rmWWcGTt1t8oiPhzVGI3hLjQ9LB+dtc10lH6joZ/Psw0ykcHXMJq2gLCyQV5L1zMxOkAH2RBj5OaA1IxF5jooIQwDO0OjhdIK6dSDH5qordVdePG6Nt0zOd7Z/ccDgfr0UdI38zz5O2Nqg4OHjvCv5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnSc6f0T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4386AC4CEF1;
	Thu,  2 Oct 2025 02:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759373743;
	bh=4Q8KN3t8PrMWqPzYc96enM/J37p9JJO8vsuWDUnc5Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BnSc6f0TfYGYZ9WskfKmVbbqXanHjpwnL3DZJl7nJ3etfNAE5Tuw9b8NGu0N3EJXL
	 0VbLPM2jeBivvOTVJk1Ep4vUaQiq/uo1hU80K09NI1+onWFjhT4IjgwNx1Be6xa8NP
	 fYFi775l8e7L6nK1x5J3IKRaXOm19ex6c7h6LXleN2QVya6wKgZ5EKjSdjcVce/vvM
	 Az1dtaNByOfBvWkCjE5f2VkC0ABdNJ3LVT4bbpauYKj0X3pVfv25hC9fM0hzroO+x1
	 hrB7dOV8yfCc96bxv83Bfdbarn2GWRSNZUUSAm8Bf8Kj9HD0E6WaBof9kMQCCu34Eq
	 jhNuT2G7w5Fig==
Date: Wed, 1 Oct 2025 21:55:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v5 3/3] dt-bindings: max77705: add interrupt-controller
 property
Message-ID: <175937374135.2964452.8506735773123499639.robh@kernel.org>
References: <20250926-starqltechn-correct_max77705_nodes-v5-0-c6ab35165534@gmail.com>
 <20250926-starqltechn-correct_max77705_nodes-v5-3-c6ab35165534@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-starqltechn-correct_max77705_nodes-v5-3-c6ab35165534@gmail.com>


On Fri, 26 Sep 2025 20:13:28 +0300, Dzmitry Sankouski wrote:
> Add interrupt-controller property, because max77705 has dedicated interrupt
> source register to determine which sub device triggered an interrupt.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes for v5:
> - group interrupt properties together, including #interrupt-cells
> 
> Changes in v4:
> - fix commit message: node -> property
> - fix commit message: minor reword and punctuation
> ---
>  Documentation/devicetree/bindings/mfd/maxim,max77705.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


