Return-Path: <linux-arm-msm+bounces-87388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B7CF2AE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 10:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05720308B368
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 09:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D0514F9D6;
	Mon,  5 Jan 2026 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gz7Dx+ll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7619C329E5D;
	Mon,  5 Jan 2026 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604394; cv=none; b=tXu5xI2yPvrTSM8VG0Rc7yeBgfZVYRcAV/wT7l0aKiJu4+FOzM2zu2q+qB+ZiejIs763M9cOvtSE6R7AlG1z3zo9WBpzVMN9mQctSBCgZVZ2WqPOTH8XrKSa4JM9mSXFFQKb1ab99ycQFxZTXbq7o+9Vi3XFNy2GzkYleStAl1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604394; c=relaxed/simple;
	bh=Tjl4xuQa7xeRvZG6UxL62x/Me/cEXKQCIgD+UeWBhYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9dNQIdalz7JDH8eeZ85pUL/hp4vlNWmW+vtdL2JiICUU8Im9c2OJprZm3TCmwGnLkyCcJQ0RghKjX8Z58wZTI4+A+7LXW1Twdbj1key1IbikHzRpLYiyNI4BV+olCAo7xGqH2bF86FDKCAZasnlwWZHxm8eyHAorIQYLOGjBDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gz7Dx+ll; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52E6C19424;
	Mon,  5 Jan 2026 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767604393;
	bh=Tjl4xuQa7xeRvZG6UxL62x/Me/cEXKQCIgD+UeWBhYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gz7Dx+llxvOy2izspMPy1Q0PtsEgyBl68Ei738unZyr+S9+B1ZgSmQ0DWlnDyJDFs
	 MZ4zvPyQhuXW1dBphlCZeMilWbXtVe8sifMszuEi8I99jvYz2XmHuy6bk6J/OpuT1/
	 MZCDDeB0zADZ/57mqadhGrcUfiz6FQ24+FCoXlkj7Td0Pg6XDxyIM3ZKyg5lGr6G5j
	 vdy+GA+E8N/wBqm3ndv6JZelhOZVxjiZhsKZyBPm1kxgz7AsCvBAg9sVjfKSXt1IGZ
	 Xsn0u6sxYMhl4qCwDcP+wC9iYb3V+z5omBzxG4bP/uK6G5QBJSlOhisjwzUF9++o3v
	 AiLDkVBpOacYw==
Date: Mon, 5 Jan 2026 10:13:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: weifu wu <boss@oi-io.cc>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] [PATCH v1 1/2] dt-bindings: arm: qcom: add Acer
 Swift SFA14-11
Message-ID: <20260105-slim-fennec-of-lightning-0fbff3@quoll>
References: <tencent_C83F441A1B9128E38B200E3D75C304B25706@qq.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_C83F441A1B9128E38B200E3D75C304B25706@qq.com>

On Sun, Jan 04, 2026 at 10:36:44PM +0800, weifu wu wrote:
> Add DT binding documentation for Acer Swift SFA14-11 laptop based on
> Qualcomm X1E78100 SoC.
> 
> Signed-off-by: weifu wu <boss@oi-io.cc>

Your posting is incomplete. Only 1/2 reached mailing list and people.

> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 4eb0a7a9ee4a..55d4afa9a70e 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1065,6 +1065,13 @@ properties:
>            - const: qcom,x1e001de
>            - const: qcom,x1e80100
>  
> +      - items:
> +          - enum:
> +              - acer,swift-sfa14-11
> +          - const: acer,swift-sfa14-11

This makes no sense - device is not compatible with its own. Just add it
to existing entry for all x1e78100 laptops.

Best regards,
Krzysztof


