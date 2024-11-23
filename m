Return-Path: <linux-arm-msm+bounces-38932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 212BF9D6A62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 17:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE8F3281A3D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 16:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2DD13D531;
	Sat, 23 Nov 2024 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgTFsbJW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A79170818;
	Sat, 23 Nov 2024 16:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732380821; cv=none; b=oya5Lx8kuMyb55bpo8Zqm7ceBRtsWojyEmGNimvrjxiFfuGDUwGyejPl/XdkgLaz0nIexZD1/FlheF2O0fWz/vqAyQGyaNiCGW2P60BIGQ0+qivvV8S939TxZAxSDAd5ifGunIHCFsR9pLYzcuejJt9BJILsgqDV/I3ayfXfbqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732380821; c=relaxed/simple;
	bh=LiDRN+P1C8JnwXFFnGVl29oTpfjFE/BLTsPoLSMswac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Us0tN6A37W/zhdpxodSvuyHf7X8gUtGE05Ej44EviSLIaRO7wTShxOp89ULAx/1M6ieih00P8E3mHAv2XWiGzqVfHa6OpdnFkuRKl6AarqS0KM+mcZAFd3s6zvfjE5PtWX7RbBfxBLvz7FaqnPuLsbys3RDmshg7EQzLIOSNUIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tgTFsbJW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA32C4CECF;
	Sat, 23 Nov 2024 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732380820;
	bh=LiDRN+P1C8JnwXFFnGVl29oTpfjFE/BLTsPoLSMswac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgTFsbJWxFP5c18mJ4rjF/QPkpyftalPB0CQXh5q5F7ptHQTg4ihrjznPksRM/DWB
	 8mKjiVUZIXypyangClg3o0AgqrvhR+KY+pgL6D4/oSWJi/acyAyImDIKr097mGXbyg
	 O0E+A2+oihuErh1SGKp9Fw14sx3bB+xTmtmmxPLfgf0t5wlslfHpuN20LCq2t3biBh
	 uQbjbf7BOmC5MTnzkzu5JU/Qti0NjRg47O52XSX5VKpBSDHOgzOTDN222HMljGD7Jr
	 fmY1YX5WTqV1YqTrri3ca6p8FZCz49LJf9kcROH1r8RxPMkUTaP8d+cR20zgS/7E/2
	 pLkBy0UxgCwTA==
Date: Sat, 23 Nov 2024 17:53:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raymond Hackley <raymondhackley@protonmail.com>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] dt-bindings: arm: qcom,ids: add board ID for CDP
Message-ID: <alg6hcnth4mopbumand7yjabocuurcfcv3nz2syudctw2hbo6p@sojqms6vmbn3>
References: <20241123071540.50329-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241123071540.50329-1-raymondhackley@protonmail.com>

On Sat, Nov 23, 2024 at 07:15:47AM +0000, Raymond Hackley wrote:
> Add board ID for Core Development Platform (CDP).
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Where is any user of this? Sorry, this define is obsolete, should not
grow without clear reasons.

Best regards,
Krzysztof


