Return-Path: <linux-arm-msm+bounces-12630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C30868804
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 04:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF1C91F217EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 03:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFE24D10A;
	Tue, 27 Feb 2024 03:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxLfaoLs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE747F58;
	Tue, 27 Feb 2024 03:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709005672; cv=none; b=ZJruT7RlqXOCZcaytjFy9if/qzLmROEHcRv43BT9ZxZD+g0LVyGEWHMcTN+0Hxc5qtwqfzxscwRUKwVjJN8zD9pSqA7Iv4AKXpa5pkaE9zI9MbhiOOVGUlFgS13hZJDSqwvLANlms0iT31/LdOkJ6MINFxELOGSGTwaxBaFW28E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709005672; c=relaxed/simple;
	bh=oTtNtJRD4tWbdLZHoDbBhpMmZL9HWWEgulD3nR6OEbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFQ+VPskhWR2S2TuwPFz1IDPfFrV/L/GetfKVjdaTtpG6LZrSp8ctLmoMqfV2JhqZICi9fxHRKD+CwzFWD/8x/GXRZeRH+WLYtRowXjXqbq9fvZE5/jhw2dtL9JR/SEd78pApmTvqBaN4iuNR4hi1M1HBg86n9TUyOxrwpEgQrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxLfaoLs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0441CC433C7;
	Tue, 27 Feb 2024 03:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709005672;
	bh=oTtNtJRD4tWbdLZHoDbBhpMmZL9HWWEgulD3nR6OEbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxLfaoLsYv/fRa4fXHH6ZoouZ3xEZK2ZeJaBHQo82smn2Pbau1CocRBBKhGpnABC7
	 fbA+EPoZyPfq+J5b5foC0NaZhTjD6Geg/yfChgj+SSL+o4LuNhpin7WXj/2fzINTvo
	 nhnTVFe2fPxZnMZOo+kLy5SBKN3TpAeKF+qgmJh475EckgOA+BCeW64pG32+rQ7Qwc
	 PB8OO6ZjbZz1siZP2v6DH6vu+G9jPWTGNVYh7bmvKCG9zTUPDJ89BN/oTLxWNGnl92
	 UuHbQrlkQLnpW6IRwQVdnZZhK6nNjhJo0cz9So1Oi/V2Ag4Z9NbVkGu4GXo26KM3d1
	 X/FNrZtb9tSDQ==
Date: Mon, 26 Feb 2024 21:47:49 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,glink-rpm-edge: drop
 redundant type from label
Message-ID: <170900566917.2662551.9847010419670899364.robh@kernel.org>
References: <20240226122854.86197-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226122854.86197-1-krzysztof.kozlowski@linaro.org>


On Mon, 26 Feb 2024 13:28:54 +0100, Krzysztof Kozlowski wrote:
> dtschema defines label as string, so $ref in other bindings is
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml      | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


