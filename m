Return-Path: <linux-arm-msm+bounces-31853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F3297A6A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 19:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB79928C8A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE5E15B0FF;
	Mon, 16 Sep 2024 17:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEwPtgEu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9250D158A1F;
	Mon, 16 Sep 2024 17:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726507216; cv=none; b=Ci00+iGhcDXkjJgApFRxsG2pUEa+6DkZ2Ri3PMXlimMICiFpj468tm8kA7LDv8EiL+v+hToTjmkZ65c53V/Q3alOH1FoN/2nv/eqPJTS6eO+pnWc3lAegHbmgAX2Mhx5G8OM5LTGBBHqezD9FPrwQP+d1kcDK8esyZnEsHwiQFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726507216; c=relaxed/simple;
	bh=BuqWk+oynntSkEt/VqRuyPyq2XjA7UEMx12/OyaPpmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7VaOoK5VC/7dH5UfcdJFElwiFLEp9E6w+SUGMQJZPxy6IIfCtiw5IOnNjCStcpOOvhi+3ffkY8MKYRVDbpM2cwvI8cGcKCW3jCLIzlhsV50jNg3DF1N/Ktf10zSoJDDqC4/RE/5r2xo6kgl4fWecexlY3VtRrbG1InrQ3dqvsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEwPtgEu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1016C4CEC4;
	Mon, 16 Sep 2024 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726507216;
	bh=BuqWk+oynntSkEt/VqRuyPyq2XjA7UEMx12/OyaPpmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEwPtgEubZrtfI/0EjSS5yAO3pxyp85wQBeRl6iUPrGSp1z+cfQ6qMKcAE/GayE+r
	 zSXiiKbGA/DDOaxzJPPelbKUnr4ASUFzVw+a/NXM/hx5RhAJ6GP/60GGhI/muhSpE1
	 juWWD3CJjrqbape54Rl/45Xx2gNtWTpJkI7MUsAPrcQIl3jji3MoIe8UTeEGUmY1Xu
	 IZb9CqFiYXAD/giV6RtKEmX5unS8Xr5NmQIIhdr4z3HdFQNgUIDV1uKpuYkeoIsjMD
	 GCDffjxlNCTo4GTTnHKEgdMIjgnFqwWfXLzy6la1WAnGLWJc4SKL4SdixtQ1vekvON
	 +pu0CiWRLTjpg==
Date: Mon, 16 Sep 2024 12:20:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, abel.vesa@linaro.org,
	konradybcio@kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Snapdragon Devkit for
 Windows
Message-ID: <172650721401.830831.10249674056161765352.robh@kernel.org>
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <20240911073337.90577-2-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911073337.90577-2-quic_sibis@quicinc.com>


On Wed, 11 Sep 2024 13:03:36 +0530, Sibi Sankar wrote:
> X1E001DE is the speed binned variant of X1E80100 that supports turbo
> boost up to 4.3 Ghz.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


