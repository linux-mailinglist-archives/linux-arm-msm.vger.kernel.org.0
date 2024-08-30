Return-Path: <linux-arm-msm+bounces-30297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D6096685C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5641F23D18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED2C1BB68E;
	Fri, 30 Aug 2024 17:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpfGRa9+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433B01B3B3D;
	Fri, 30 Aug 2024 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725040089; cv=none; b=PQ6wL9gpM7imhqgQULzsVYNBNvjgMpsflnTcUONAWVIUyNhSdLpYSFTBEuC5RzaihvKLYKs1/dE/h/YKdsZY5+PzdTCbLzHRgKNpcxgqrBKLgDqI/3RtxTS31a+NT3gfEJat7OAGoxuBx5z9jnlS4V7Hs3k8El82f3cZk7JmAXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725040089; c=relaxed/simple;
	bh=cshtyzuuHr30k1MQeCOI4lV334B1kqTOv1/y07L5BTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhRHnsKPj7ayHlsDCap+VAIWngW1H5dPYiZYKgin2Cq+wJFBKrvoLOGCB2z2J5gtNPlkQaeDp7WdJBAtyZgmISRP45WdtxHdgMO+yZEaHrCEcVHSVpzbDQxfsFLRDbXLtVGCCEn+TF351seBObHgqSLOX8XVuvUihCWSlgkgtTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpfGRa9+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8EFC4CEC2;
	Fri, 30 Aug 2024 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725040088;
	bh=cshtyzuuHr30k1MQeCOI4lV334B1kqTOv1/y07L5BTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpfGRa9+oZN9fWjDsX+R5P1zwo1mQjDGBYeXbZ+HjYEuAgJJftZfgnJ/Im/IDpmpf
	 0kXzyJ+pIpk6dMfYmUMsJNfs47FpzdysenNIItEGJISRCkJbFqcu0gYqNOrwc/y2tu
	 cWR94StJbqmXNK9r42tThcXLTK16U76G+wBqeIE9QQHCAGh5D96+ConHq9034Yjw0Z
	 YMY6F2Rxk0zb98DXAycgkNH4Y9fuRYHRVSRaUam9cDoWuuLFqA2pMev08CG5dHict4
	 Mk6MstERDnYylLRaVT0gBpzfM7dG0vhBi0Yn8WZ/IJIfyi/fOeI0rKYjqSSr5iSQmc
	 jkfAX1+CpJVgA==
Date: Fri, 30 Aug 2024 12:48:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-kernel@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Elliot Berman <quic_eberman@quicinc.com>, krzk+dt@kernel.org,
	konradybcio@kernel.org, andersson@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for
 sa8775p
Message-ID: <172504008411.564423.16497968915981453847.robh@kernel.org>
References: <20240830133908.2246139-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830133908.2246139-1-quic_mojha@quicinc.com>


On Fri, 30 Aug 2024 19:09:07 +0530, Mukesh Ojha wrote:
> Document the compatible for sa8775p SoC.
> 
> Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v2:
>  - Added R-by tag and rebased it.
> 
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


