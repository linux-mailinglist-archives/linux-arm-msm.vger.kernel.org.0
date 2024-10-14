Return-Path: <linux-arm-msm+bounces-34239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6740499C11E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 09:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 994AA28120B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 07:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4A1149C42;
	Mon, 14 Oct 2024 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIViGYo7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C402633C9;
	Mon, 14 Oct 2024 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728890405; cv=none; b=HvXJEKmi/OIqhPhXO6HC2MpRhnFV0vSGNoR7upYytfm63iUUzN0MP+OYgd0dBPMF5x8i7pFYjQds0oRKuFCJBEYakSyx99IoEmDsjpVTTuMTdyj0keIevFZFgkxp/yTyvYpeDHGnmsPSZUsjvScj4HmLcvRDq3AZcZdNPyPvg5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728890405; c=relaxed/simple;
	bh=lTu6b95UCsiayyZ977ilYDsx19yq0h1YXeBd8TAgnAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6yAgbDFKOnBXqlqgxJ8i+r+pHTIXEpGvsKfLIfo93q24dP1O8uYOAZIa9NROXZawU4XWbjHv7NVKr1v8Wc/5oU0N05sj+qy5WSjqPqHM5AkFDnySYasnJrIzJ3fbQ0oD0CbZs6Ig4BcPB1Xj/YWiSao8j99mswohRzfcy8wqOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIViGYo7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CABC4CECE;
	Mon, 14 Oct 2024 07:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728890405;
	bh=lTu6b95UCsiayyZ977ilYDsx19yq0h1YXeBd8TAgnAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIViGYo7QB6FWy5beKClPwuP1l07fqRDxTa2sMeL4v2mqoAJwnbf+8JwoGwAWxc3q
	 4Z98CXu8E59Dko+qLKk8tbeHZlAEzHwzSvwMbJllmtIhlahen1nuU8gZ1lAmINqKdi
	 ++/VEK0z/T5ZPrAQxxa+BuGQQycnUkgyEtcr2tITH1uUWxWl4gCh9/g1VaMhycMpk6
	 LzPmpsStC9pi/Ly4ycVI5D690yEpXU5XfWnQY42N7tTlTe+ZFoezNff6EUi6qBExXq
	 2nyoyZOf/9LixGXGzLibZASxKyIlu+TQmO+H9kwFy+G6h5hb9PVVMFei99n6ZvsI5f
	 ZdYNITUxmDqnw==
Date: Mon, 14 Oct 2024 09:20:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Merck Hung <merckhung@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
Message-ID: <jebri52am4sjtdfe6726g4cbbroyr7a7ctrvolin7rxjfpdu3z@73ko5u37hpnc>
References: <20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz>
 <20241013-jg-blackrock-for-upstream-v3-1-839d3483a8e7@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241013-jg-blackrock-for-upstream-v3-1-839d3483a8e7@oldschoolsolutions.biz>

On Sun, Oct 13, 2024 at 01:54:03PM +0200, Jens Glathe wrote:
> Add compatible values for the Microsoft Windows Dev Kit (WDK2023)
> with its codename "blackrock". The Dev kit is a small desktop box
> based on the mainboard of the Surface pro 9 5G, intended for
> developers to test/build arm64-based Windows software.
> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


