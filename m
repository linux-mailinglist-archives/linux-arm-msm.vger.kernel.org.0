Return-Path: <linux-arm-msm+bounces-51798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E636A67B2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7581817D27A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7312116F4;
	Tue, 18 Mar 2025 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rpt/VNw+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60591A2658;
	Tue, 18 Mar 2025 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742319726; cv=none; b=mFml38PpdD+FcnYmE6XJg9QLebvFuE5dGSaU24UKqM6jt4DXIuoQ0l68z5x7ZOHIJ3Ed+OG9INfFxBNKF+EoV8TfydenDmGPeISynC8hbyUtm+vp33atavqGrTMO84wB4h0bS1OMwCXNPmNCe31UsB+aO/MZnk+cZUbntJhE90c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742319726; c=relaxed/simple;
	bh=+NevMaFlqFLQOGC7iiOMu0IHSa/S4jYieR4USGKS8Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpioUQJ78S0RyP3FWI7cU4varj0qyqtjkR+G7QAde+hSqyVn9FWsW0cIQaTfL/NBbvAyClXCH9E1GNyA3dT5bAa/2XEITvxlukPGPpZCK/fwJSaBvZy5ZcdKEZo74X/qpACGEkaqzFdITn/AuDPIAXwH6r6DUzP3TpT9DLGwgjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rpt/VNw+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5F9C4CEDD;
	Tue, 18 Mar 2025 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742319725;
	bh=+NevMaFlqFLQOGC7iiOMu0IHSa/S4jYieR4USGKS8Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rpt/VNw+DNDutc3BYIvzMBJ/RGRoLoE6yshO5swsZVCxR34rM2IQQVccps39AeZ6s
	 Rk/anR8cX4IhO6VjH93Uz+COn5cH7NcmQUfWI+fpNi1KYictnLfA74RUcrqdwVmiMw
	 o4GpRsnCNd5cg9+3d+9pXYvs1BukYPmBnL8643ta5ChaZfadqUBkwawgFomAjTEmMk
	 TLtVH22pWLrle0lgFdedc5vtJ+ounqCkJaGqR2ZNAxMMWEdyM1cucHUEYOq+zsIOsw
	 oW91W92E8OGVxEYC1mEHnV9AK7tldQuM2JBb5MciMq2pJWUIgL7dKCqgJ1NXbWi1db
	 y3GPyx1k76IKw==
Date: Tue, 18 Mar 2025 12:42:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	David Heidelberg <david@ixit.cz>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] dt-bindings: mfd: syscon: add
 qcom,apq8064-sps-sic
Message-ID: <174231972363.3281332.10722530407269396405.robh@kernel.org>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-4-bcedd1406790@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-fix-nexus-4-v2-4-bcedd1406790@oss.qualcomm.com>


On Tue, 18 Mar 2025 15:21:57 +0200, Dmitry Baryshkov wrote:
> Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
> present on Qualcomm APQ8064 SoC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


