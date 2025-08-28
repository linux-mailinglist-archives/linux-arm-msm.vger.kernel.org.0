Return-Path: <linux-arm-msm+bounces-71076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C87FCB39593
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 09:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 557D46844C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 07:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD5D2D9794;
	Thu, 28 Aug 2025 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFmOV0HX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B32D6E59;
	Thu, 28 Aug 2025 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756366674; cv=none; b=jo8mSfoE7QB87b2DUzoVDQTyDUA3WXruVnEDNLbddcUR1flzykSyL8XFAl0XWj5fvDs3uiYP0XdvNnUkMOZI7lTzPRfmefxJh/8VNIKE8CMnHTnMBINvaS7GBasj5Ry8By3qsWIQk5TpEXWF68VqSVDRkEQkuzKxzZEqyC2eM3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756366674; c=relaxed/simple;
	bh=ypUAy8NWcIBt+dmd+5qONQkZWcuP0uYcJ+1JecEEurg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRhY5DxTH3bHR70t5mKQczyjmnn5wAebCwuJ6pxQLDX2X8WoEKH2vIpwFgH2afPBYnj12oC89nYrHT3MR02JVbJblzLTWxI/ljZmLhuezUnmqBlUObCJQn1nINNA5BC0Ta6dfiegWviNqE5SPKUGyn9H9GnZMUoynGkJgyUhsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFmOV0HX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7312EC4CEEB;
	Thu, 28 Aug 2025 07:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756366672;
	bh=ypUAy8NWcIBt+dmd+5qONQkZWcuP0uYcJ+1JecEEurg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFmOV0HXtE9bk1DeT5Zjf6xKCscjuFmRqQR9wY0w7KGhL2czwCMdSN4ckwx2Yo/wD
	 dou9jJcMq8/ky5FZv0HRuO1M/5a4n45j/sccokcHmlbCD4y85Vq7fBFuTr8VQAQBlI
	 VRavAe20vsQ6TtOdz3sr/B+P+/U74obzJZbOLfpTNesz4q+eVOVoJlYPDjI8qwEUrN
	 ZxkTaR2PVNKd3eVCsRvP3dApr6wRJRJ1kB16Pyg+pHNxr1pnsY5HgK12mj4a3//oF5
	 2sm0kqk1gaEwZ9STjOdoUCu9mBleeyEaTgOrtnd+aG4xKC2nIYTD1a+YaWwqgwWa1Y
	 hdPvNeBMACj7Q==
Date: Thu, 28 Aug 2025 09:37:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/6] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <20250828-glossy-pheasant-of-energy-bae4dd@kuoka>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
 <20250825-qcs8300_mdss-v9-3-ebda1de80ca0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825-qcs8300_mdss-v9-3-ebda1de80ca0@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 11:34:22AM +0800, Yongxing Mou wrote:
> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 282 +++++++++++++++++++++
>  1 file changed, 282 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


