Return-Path: <linux-arm-msm+bounces-78961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28817C0EBC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8352919C3484
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB4521C9E1;
	Mon, 27 Oct 2025 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIdlkKki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EF51A3167;
	Mon, 27 Oct 2025 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577094; cv=none; b=uYzAxwJ+tAnIi91yymFjdvpX8nu21MMv6moIgwDKxwyQ/zk6AN6khXaj+x8OxpnfdB2GPe1Tgc0lvQju8qWCNmQCvxc4hMGd77MyDhRYeXpCl+VAPpos55VqbbfRd1fIE49iIvwlev/dOipeFmcnd9PG7SlM4A7PImJXgpuEI94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577094; c=relaxed/simple;
	bh=A0Krk2Y3CRBa8n6OsFmdRhm68y75VXCkCgp6HeaDlkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/LqQD7ZuNW8/X7scNij69Y5PwuiYCLMBEAeVcn1+zOhBv3xzR2Y/zsDN3VpV1ZjfXhzQZIYsJne9dVcEs7xMoN5APGkf8UVFVORatO4naqJ2j1TG9yOshqNCgsQMOv1e+YyxJ2gDWCwfEQY8ZhbGdPuTGox9k77ULBee1LVr5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIdlkKki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D138C4CEF1;
	Mon, 27 Oct 2025 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761577094;
	bh=A0Krk2Y3CRBa8n6OsFmdRhm68y75VXCkCgp6HeaDlkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GIdlkKki3Uk6YG99jMF+rB+DnVcelHBzf9tBsnBo+qmNckcTjkMH8gQD8x1oZBv1a
	 oG3Ti/fZCBVWW9L1QWcrePTafCb00tuGsBwRZl6ksfbrtCxQberkLl6jD/SoePoMI7
	 EYQf/IHrajfUcwfKgPjIInbFxWp8JZ7jFjYQUG4BBi8CRBUgspYC3kW2ixe0+y9Kvi
	 kUiTn2xpgdSWvtOhvmxwhJIH+efnNUP8orFDoa4K28ar4FQgHRe71KiH0c0YrdAjh6
	 1a1+tRdYYRCxVnNOCrbUxyJOmAxrPa//cDWIeziBFnAHveDR34qD9aRPcKwUGfn6GG
	 dsj7TnTD9hMag==
Date: Mon, 27 Oct 2025 10:01:06 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: amitk@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_manafm@quicinc.com
Subject: Re: [PATCH v1 1/2] dt-bindings: thermal: tsens: Add QCS8300
 compatible
Message-ID: <6273bs3yvfx5b2ah3k3kvua3ebfex7ufje52m64dzjsjwiqhfi@thcbsov4xf4g>
References: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
 <20250822042316.1762153-2-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822042316.1762153-2-quic_gkohli@quicinc.com>

On Fri, Aug 22, 2025 at 09:53:15AM +0530, Gaurav Kohli wrote:
> Add compatibility string for the thermal sensors on QCS8300 platform.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 94311ebd7652..7c1f121fb417 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -54,6 +54,7 @@ properties:
>                - qcom,msm8996-tsens
>                - qcom,msm8998-tsens
>                - qcom,qcm2290-tsens
> +              - qcom,qcs8300-tsens
>                - qcom,sa8255p-tsens
>                - qcom,sa8775p-tsens
>                - qcom,sar2130p-tsens
> -- 
> 2.34.1
> 

