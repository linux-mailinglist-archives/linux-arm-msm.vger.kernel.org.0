Return-Path: <linux-arm-msm+bounces-18837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371E8B5E78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 18:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A6B51F2328E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 16:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652FC84A30;
	Mon, 29 Apr 2024 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBv/l2ad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319758288A;
	Mon, 29 Apr 2024 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714406505; cv=none; b=bBLnmy3XGiIvfK7vqx2VLGqwL0iPBT6QuQ/LaHU4+LNfrSVdV8qS8QP3yoYHnJvXSP272j5RwKRbyY9hPHRT5ckaz0Vv2Zjhjsj/CpoWGkx7tOtPjLPj5E7Idx1F4TH1rUQc3ysB91aUuAusGIF5hGaHv73YBvy+B8/nKAD/NHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714406505; c=relaxed/simple;
	bh=A3Hki7z7hywN9GrVFAEH0xFORQ3VWuwTdqd8TB3P6hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fU0kyzQ6GW6cLUzdV6q0isJEhtVU8st+G4U3rVFBETLm7fkHNBx6KsdlbdgQMQFJpoT9AnvrRc1T64EeJj9STBR8BHL9usnGgyYdfuH0I9OCY0GRtXxt93C3N/n7MzRnPVokx1Syw0+AO9A1djC7G8384JPeOBIafXEbv/rfPqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBv/l2ad; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891A4C113CD;
	Mon, 29 Apr 2024 16:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714406504;
	bh=A3Hki7z7hywN9GrVFAEH0xFORQ3VWuwTdqd8TB3P6hU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XBv/l2admUwJAqhB4AtfaNGndthlIUq77wnOu9qvknuOfo8Be+7KGqEoeWE+rxRrD
	 N0ErePj6dAF1/NOrAonu2z4z4RBJ5NgkzZbWNbkXu11/iznE0RWZwvIClhg5Kq0SVc
	 A6yM2FVSVVxdgVStM0UlUgLeBwnBrwPK2pZEevBcQ8OFrdMuAzD5DrgRsczBVixDRX
	 4tnFOAdDwmLY/Umz871T0WIu5kbgf+D2UOmvMi8JiiOUn+7Cer7jCdKs180G2W+57r
	 fdliHfnrTgW8Kfnd+zWpQ64cc3X+x8WjeQtlfYqtdxocrAGGhBNyeCn3yhK75ljSPV
	 dPM9YZvL6X1PQ==
Date: Mon, 29 Apr 2024 11:01:41 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: Conor Dooley <conor+dt@kernel.org>, phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: soc: qcom,smp2p: Mark qcom,ipc as
 deprecated
Message-ID: <171440647164.1897451.14731652819682611835.robh@kernel.org>
References: <20240425-qcom-ipc-deprecate-v1-0-a8d8034253ea@z3ntu.xyz>
 <20240425-qcom-ipc-deprecate-v1-2-a8d8034253ea@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425-qcom-ipc-deprecate-v1-2-a8d8034253ea@z3ntu.xyz>


On Thu, 25 Apr 2024 21:14:31 +0200, Luca Weiss wrote:
> Deprecate the qcom,ipc way of accessing the mailbox in favor of the
> 'mboxes' property.
> 
> Update the example to use mboxes.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


