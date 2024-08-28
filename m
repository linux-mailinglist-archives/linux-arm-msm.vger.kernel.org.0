Return-Path: <linux-arm-msm+bounces-29707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7A2961F91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 08:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08F2B288D4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 06:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E2514D29D;
	Wed, 28 Aug 2024 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3jgttB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05536374F1;
	Wed, 28 Aug 2024 06:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724825972; cv=none; b=JEBsD5QT/WuJPKSjayUq1mdzSA3hCLoVxL39EyqtlwUCxsZ/nbwTJwXoSitzWiEM7ovQlGFC536WQabU4avQDyt/cIIvgbUYu85IdcvVpbQ5kBspFxEU4EDgSZrUEl7vM8Pvde4+b4gW0eNq5wONxVamYiG+yrpFF+Iy4qTXGhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724825972; c=relaxed/simple;
	bh=QQ7icH8cVXjBNiyrcYFK0oQRimYmfQ/PdFFwaaQV3k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnLALuTbvbSHohCuDYJqYqmE7y3z0nJSN5W+zTkwhOYG+A7E6WFhtFFTPm7pBb6drYAw+B1N9QH/w+j+7ZZHHP0jyOteDVBZcnaTaNwHglrvCvybfab7fU0Lnn3pavnejzdi+jbmDRz9kDyZC5oYPUDi67XeqbLw7Z6rSOJWV8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3jgttB5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E407C4FE06;
	Wed, 28 Aug 2024 06:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724825971;
	bh=QQ7icH8cVXjBNiyrcYFK0oQRimYmfQ/PdFFwaaQV3k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3jgttB5O4eIAIJaZnLbqq231mCiAyRWTJblu1qgbr9kQhK39gyn1ZUto8Xjbs+MT
	 0B1g5I91nk4iKqYTriZFKplMl0eaAHr5+WdMSfcNpDF4qdV1PoelSf5whxhMug8FHv
	 YG8cs8F13hWBgNRLEteAFihQUMAYtzyAYT7JixsURITquut7j3PoSiBumlk6VFnwbE
	 wxtPpSnPJQ90UxX10pwC4VTB7WyxKoox96K+Fh4kyfcN2qToXQ0A3MU0q+T5G2X+9p
	 NPQjWy+vxPaxc0KnNj/lTrYc4laXVShQOMGEofdcKmajM3rIitbmhm/ZqISAFr56pe
	 P6YhYnETfoQWA==
Date: Wed, 28 Aug 2024 08:19:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] soc: qcom: socinfo: Add QCS615 SoC ID table entry
Message-ID: <4gzrksz4p2unkzua2og7n74ob24t5njcwzdclta2gyqvzpdvph@eur5zmtjlepc>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-4-5599869ea10f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828-add_initial_support_for_qcs615-v1-4-5599869ea10f@quicinc.com>

On Wed, Aug 28, 2024 at 10:02:14AM +0800, Lijuan Gao wrote:
> Add SoC Info support for the QCS615 platform.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


