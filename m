Return-Path: <linux-arm-msm+bounces-58875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 358CCABF092
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE8704E3506
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809C5259C8A;
	Wed, 21 May 2025 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYl+CXbT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508532356A0;
	Wed, 21 May 2025 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821499; cv=none; b=SI/N/4UBbuI7ZNzlbjO7HjFjz0AyJZ8D2PwPVlEa3SxHHEOMw2+D8cxVYxbScxElayoN802MVUZzJieqDDXY8AgfN3B7H3FDsumP/8s73fiUd2D8+QN7hRWtIL/zYaCD51nMp4ffocqnVQq8QNvl1Amzk7ZGWLMgsOugLXs16kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821499; c=relaxed/simple;
	bh=KX1Q1Y4Y8vSvwhM8+I5oSWXY8lYvcqOE9KR8h6NqHss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2l5iCj8gILIKV9OpM7JUjiNPO4Z9PnVEWjdW32gCwd67PdCA133PxDU9yvYV/3nPzDfXlZbTi0ZoDTtvMVS45uz0x8UGXu+gwnlQ97OTCrJ3BzwJ8qvxbYiIH/RwF41fU8Px20XZs7/UWpKCrYZWxX/K6U6X7sUIii2n4250Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYl+CXbT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF90C4CEE4;
	Wed, 21 May 2025 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747821496;
	bh=KX1Q1Y4Y8vSvwhM8+I5oSWXY8lYvcqOE9KR8h6NqHss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IYl+CXbTN7H7xUzQMlDqt/AnBUdpXOrV7wI8zQBE98vc61mkNcpZ4UPJ5nl+mjea+
	 79ubIF8gGboudJDX60dXzepNAUPmO/wXaJSdeESLzN+ZyGL8c1Lk0FI2oftavIFW22
	 KTy02njS2UC5jGOX+vWhUyAMgQtTnUcEY9ULoJgRb08L8gTCVT3iiC6qD7w85zPkOl
	 oR7uSUWALtwIStYdbEDVt0Xa6Y5CBJqeJk1UYtvtjf1Y9NBnfX3BCclMElL+UIoVn9
	 bH7Hdy4A8d/kpxjPKRVUZkN4nmxRB4amuUa6tq8TgE+2Zygfd5HA3wclLN4vUDMnOs
	 XBFrt4gpAOtEw==
Date: Wed, 21 May 2025 11:58:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Oneplus Pad Pro (caihong)
Message-ID: <20250521-notorious-tuscan-chipmunk-aac30d@kuoka>
References: <20250520164208.516675-1-mitltlatltl@gmail.com>
 <20250520164208.516675-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520164208.516675-2-mitltlatltl@gmail.com>

On Wed, May 21, 2025 at 12:42:07AM GMT, Pengyu Luo wrote:
> The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
> platform. Its device codename is "caihong".
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


