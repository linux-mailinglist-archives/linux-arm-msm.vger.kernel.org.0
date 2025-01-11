Return-Path: <linux-arm-msm+bounces-44779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0EEA0A26A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 10:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3FCE3A83CD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 09:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF7118BB8E;
	Sat, 11 Jan 2025 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIjTofQn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD311494D9;
	Sat, 11 Jan 2025 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589103; cv=none; b=EyCnOq7ZEfF2q/aBpdrAciFeci43jWvUQKgpmbFOmnrySnix15DsgEM6B6H9eYZ+lHfUvPEfUdV08tAHysJqpeZ9BYK6SJV6exjXHGa6prxpMGXAr2VYzNQHnl1McSxyfiG0jFh5jmqGq4yf9+3KgyLhyrhOCOn97yJ389J2Oco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589103; c=relaxed/simple;
	bh=PktPUpb/tRLHLjiGg+FbkVcP6k7A0rn964PryI06Log=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grEe14wSje1RYEbBK/AAq0ylLTe97UBvaLVtrpKa95VEEU/kFzXvkr1CNdZzglwvuXQ5BXa6wq8hJgBQ5nk5oC6sCcDCNaQVqBhLoAejet3rR6enA81fD+5XmmZQTNVWPIUqB0MvzMiGi/xs+6kvBqBSeC1xlcxfZ7RxWIY0DCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIjTofQn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EE6C4CED2;
	Sat, 11 Jan 2025 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736589103;
	bh=PktPUpb/tRLHLjiGg+FbkVcP6k7A0rn964PryI06Log=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BIjTofQn1SJrvkJolD3wL/WDhla1G9vLMPrfVwaqOHYyS2UwV6rjcP19ZKzsj9SKI
	 srNs4urpo1hzmUnmTkjb2XwuwLCNKLqG6ZyEPfRK1Xtt5aFo/GLydq0+7ayhg3htWD
	 HY2BxhxTXTrpF3wjGMWna7CpNVwJ3YMI0f+pVAb4BrI2mQe4nZMa4ZeSo/LUa5zBEH
	 TQPxIZUkGDybUsdBc/0RqdBeCzEatXSwVMgwsA44wE6afll7vTI7ppmFTGvIbJvxl4
	 9AEJrHV0NHrbfL8Ox2ErFXZRyOm2yMORZkFFn1gpBG1/XkvvhwHQWl9JWqCxDMOJ+D
	 OZXSgD7KCWboA==
Date: Sat, 11 Jan 2025 10:51:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] dt-bindings: nvmem: qfprom: Add X1E80100
 compatible
Message-ID: <dqirlou2bcntkqo3t7hnkigvgrtfm5fh5nufks55mfaqyis7hg@6gu6xfk6gz74>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
 <20250109-x1e-speedbin-b4-v1-3-009e812b7f2a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109-x1e-speedbin-b4-v1-3-009e812b7f2a@quicinc.com>

On Thu, Jan 09, 2025 at 04:12:40AM +0530, Akhil P Oommen wrote:
> Document compatible string for the QFPROM on X1E80100 platform.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

This shouldn't be really RFC...

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


