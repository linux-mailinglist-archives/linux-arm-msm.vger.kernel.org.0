Return-Path: <linux-arm-msm+bounces-73220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 86515B5425F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 936184E2312
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 06:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044DB2264B7;
	Fri, 12 Sep 2025 06:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxKoFpDr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF2B7494;
	Fri, 12 Sep 2025 06:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757656832; cv=none; b=ImoVyay20My/96dABQeXVaXk9m9t1StoKtX9n2PedXdHCvRgL8y5xTror1Q9Ji432W0zdYfzCiZgiSrIawmhitkvvTkfRNA/JIy7A4FlGdircUQDP/1/1HQS+JTY0DYiLLOErE7jXX6XOJ1MCfbJ1hrmh4gAMrF9Py7w8yUtqf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757656832; c=relaxed/simple;
	bh=v4F9JXeXoDv8M2AHsm7GiMN3NHjj+IJJfmf7gY+kOPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/iW9wIphNQf/fVQCivFxDFrUbTAkigJTgXCPvUq7X0PtNSMwFQl0/wn1GZcLhfVuSeu93C6SD0elQ4MjScAfHkG3o2Hz1Wj/lgBeaGVqaz/POp94q9CMKXgAPD6Bj4xVjr4Mz9N0qEV8bS+m+EWhmoR5iECsHdC7UUOAQukK40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxKoFpDr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DBEC4CEF5;
	Fri, 12 Sep 2025 06:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757656832;
	bh=v4F9JXeXoDv8M2AHsm7GiMN3NHjj+IJJfmf7gY+kOPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TxKoFpDrAkTjpyVvitwqALhrpQZYxK5MQDbefo8bGptTHAi2jXkBX4ELzNu4oSxvw
	 Z9fGvsEB8vEk9IzHTNdhfwVBHAamZ/D7M2x3fe6CHnjYFho4Stpv0MiIEvtuhcqQfJ
	 /41nnd9QTTvbjjFBkVtbm6zM451fsK50ozhFgFQnQIZ7FOPDStok4BSZH5LeoKMvo1
	 Tr/ZQL3daoXn2mZDEj6aNhGyw+jbCbkgEqRjEmInE+N4+/SkTcdpNOKSJQevjWWFNR
	 T4tUhG3u3KFhk29dNSTpUt27FB/M1j4FAm+pDoc/pu7+rBZLrEkHi3F/fFAlqtbMhN
	 2E7Jqp3I2IDbQ==
Date: Fri, 12 Sep 2025 08:00:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: display: msm: Document the Glymur
 Display Processing Unit
Message-ID: <20250912-premium-beluga-of-reverence-7fbdcd@kuoka>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-2-d391a343292e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-2-d391a343292e@linaro.org>

On Thu, Sep 11, 2025 at 03:28:49PM +0300, Abel Vesa wrote:
> Add DPU for Qualcomm Glymur SoC which has very few changes compared
> to SM8750, just enough to make them incompatible.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


