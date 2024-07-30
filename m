Return-Path: <linux-arm-msm+bounces-27379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B84940AD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 10:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE2E21F21B2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 08:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5A0187853;
	Tue, 30 Jul 2024 08:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ij81QCv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD4A187322;
	Tue, 30 Jul 2024 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722327000; cv=none; b=uRBef/4CEuqmBPRBk6WskYBcqZhR8duq8ipgg5Vn34+gJ2ZwcQKZOcJtG/VqYYgRXuWb89tjo3ojsoQxp1DhLmdjim0LV830qIlhbdakXJimJVIbleJb7Vb5CH3KJ9I5rEahwg7t5VjzY4EF1hUFgtvY1rlTVKLpcbDgf+K/jyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722327000; c=relaxed/simple;
	bh=cJVhMzIFD//rJ9+dNgrDb8IM9dN1TwNup6EeJnJFkCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFKxHPrVNo5liNyhbO3GWvpaL9O/isVQCm2gK+KiO+SJjglKumzP9M3vXKwY2I8VqeqCaoAqRgOOD4VSAqXQo4GR+TZlUC5tgACxl+L9f5k1KutrXP4UyaUf95xkr2uLMX67jjWUgyzeuSTKK8ApUjVVV3Lqaqd1IJwhTrL/M70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ij81QCv0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EB7C32782;
	Tue, 30 Jul 2024 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722326999;
	bh=cJVhMzIFD//rJ9+dNgrDb8IM9dN1TwNup6EeJnJFkCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ij81QCv0Cm8UTX+qhSnNb+J1wrQKn3nUALdH9Qw3yW0OlnBOvgxN+oaXX5PklTKc1
	 c9yb8zIaFQuz/S5Abr50/xBiX96XPbsUkQpZaN4mhCCeup9t2fktrOplJXi5MCUlpz
	 7ZhIoSg4U6WygXHSLTekqvZAFKm/nQndgsJNWFn0MCWQJR5Li/DPwWHtlYBBwlmgqy
	 VN73RjljfX+DqQHt8ERO10fd8tpNTftI2flv0R02sUOqAr2tt4RbTUsujcM1RPeajG
	 wzUvQpQYBtA2IAfKZtH20HR2wkMk2Qi9SUmkItuhNf/zq4vDXH7XgBXx+0afzaRx7T
	 9ozdcKbTFnxxg==
Message-ID: <02e23c16-dcdf-4572-affa-e3bfe1f42856@kernel.org>
Date: Tue, 30 Jul 2024 10:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ARM: dts: qcom: add generic compat string to RPM
 glink channels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
 <20240729-fix-smd-rpm-v2-4-0776408a94c5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240729-fix-smd-rpm-v2-4-0776408a94c5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 9:52 PM, Dmitry Baryshkov wrote:
> Add the generic qcom,smd-rpm compatible to RPM nodes to follow the
> schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

