Return-Path: <linux-arm-msm+bounces-71747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C24B4176C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AC9B189C9F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90E32E06C3;
	Wed,  3 Sep 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErG2Xvp1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0C02D594A;
	Wed,  3 Sep 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886309; cv=none; b=DrGwwIcf+Hdm+TjpMvdcadD7l1yBGiBOrGP/mPn/dfmAqUV7jFqrZQQZlAkULvABmcPTDa9/InJcXexBmJbHyKmBehGaukOeuIIomoXVRCnDyBxE5a693U2HA6eok4xuVs/vvGdmqWi2srK/LTv7vM+wPytO4lNi0O4WEBfGudE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886309; c=relaxed/simple;
	bh=UnvsakRuPXXuA7dTjGQYvFF3ZCwE8/uc5uDGHX+4nRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXbfzhh3tKjvD6mAqytevFvb4qw6ET5G7Ji5oe7AQddIEgbav9qsAaUxiIgqZgSlgD/4Gm9W5+87z7jsb9/Rw8TOvnGfJvrAM8bFQyGWK8cc5qDc2K5+8kHIEtsK1ke3rURqlIbUwZr4yg7D1Wb96WFG3RaDpuD2MWiGsmoLdL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErG2Xvp1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59297C4CEF0;
	Wed,  3 Sep 2025 07:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756886308;
	bh=UnvsakRuPXXuA7dTjGQYvFF3ZCwE8/uc5uDGHX+4nRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErG2Xvp1ui061jyYaUFSIuBFi9t6pdMVAWhuxlT0UJPgqXfHFZpnJSEw5w2DJrexu
	 nVDTd4lSe0ieEquWQtqQ+v8NUkb3FJVQe78uJQN8DRtyYyPwifd80phmqNFkK7bp8w
	 fspBBMCggTJxT8NayHH18PDMbWYMx/Y804El5OLFOaHjuhHRAYFmNevboanytyicyx
	 LCuwX5UYsTk+zGzRKmTJrzrTO5YFFac0nmjXS0MGAnkBU9hAfWxojLhcrj2QVQJsIr
	 PXOQ59ujWVH3iSVmXXXHXw+eW7QNiAyodTYRfCjOtz++gvHvc6uVr34CVi0Bd1Uw/H
	 iObxHxeJ+HeiA==
Date: Wed, 3 Sep 2025 09:58:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] ASoC: codecs: lpass-wsa-macro: add Codev version 2.9
Message-ID: <20250903-speedy-fine-macaque-5e4cdd@kuoka>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250902140044.54508-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902140044.54508-7-srinivas.kandagatla@oss.qualcomm.com>

On Tue, Sep 02, 2025 at 03:00:44PM +0100, Srinivas Kandagatla wrote:
> Add support for lpass wsa codec macro version 2.9, which is available in
> Qualcomm Glymur SoCs.
> 
> Its compatible with 2.8 w.r.t register layouts
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


