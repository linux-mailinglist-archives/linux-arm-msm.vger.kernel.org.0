Return-Path: <linux-arm-msm+bounces-79119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1140C1363D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 08:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A49E7465E06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D96299944;
	Tue, 28 Oct 2025 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijJWElmD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4897F7405A;
	Tue, 28 Oct 2025 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761638054; cv=none; b=Md6zo1kcvT+/xSjR9Wq2D8fg+3u0bLrPkM589DpqRu1W9/5IughUeGkwRoJv899EKZuCAlRpI3+MXepXBrEoecIbyVKfaKrclkFzmGf65VLTovVkBq7FHo/mvTeip48/cWeEvV4MbY0S1/KGGKBIcHeGs3wgMnvOQF+ii0x+PpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761638054; c=relaxed/simple;
	bh=wUUKO54EgAdTNrG7tEupAzNScrGsxOhihdHV+0Y2eEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVvy5EvvKcn1xSdQbt2kMer//l27ECGAi954qi71W1qu51DoefOUV3s4/etaLoLJprFMIvpwQ5dHGU2xFulf2GrvXhxwKQdp25QbWH9t/3SmlKQ5yqeEjkmlNCrbltLYa9op9p2XKd0ejr5Hz5x1nLid9BiiPLMi070VPJtK6hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijJWElmD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58ADAC4CEE7;
	Tue, 28 Oct 2025 07:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761638053;
	bh=wUUKO54EgAdTNrG7tEupAzNScrGsxOhihdHV+0Y2eEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijJWElmDuT8jOWeTUGfgEnWd9otU2i50vp1GshC9HZ75Oshuo/RbWxUmGhPygHp23
	 BvOk828KiLum/+llLUBIdZ4GPdWfVas6ta9N7+D8mO4jb6G7e7GqvOiP9YVCIK/5P5
	 1BE0PuXPARw+n4BmLO5jh966FIbOspXsDSuor6MYSOuQyltCcgcw7XNkhU2k/raR2i
	 ltqmAEkDxTQDSBEfqSa976UQU/nxRrjxpNnhN8+VIAHeXltj0Gg9qKORW0MZhNShFw
	 NAmhNLy4td8YbvL5HYYMTc8Xg5VeyVtFvD77lmNtxFvpsW+Iof2u1KySbw2lWiEA42
	 J1hCyk33/2EQw==
Date: Tue, 28 Oct 2025 08:54:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: talos-evk: Add QCS615
 Talos EVK SMARC platform
Message-ID: <20251028-cuttlefish-of-impossible-downpour-9cccc4@kuoka>
References: <20251028053248.723560-1-tessolveupstream@gmail.com>
 <20251028053248.723560-2-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028053248.723560-2-tessolveupstream@gmail.com>

On Tue, Oct 28, 2025 at 11:02:47AM +0530, Sudarshan Shetty wrote:
> Add binding support for the Qualcomm Technologies, Inc. Talos EVK
> SMARC platform based on the QCS615 SoC.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


