Return-Path: <linux-arm-msm+bounces-47995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD60A35939
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 09:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7E3716D37D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 08:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F58222564;
	Fri, 14 Feb 2025 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oANmjjAO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD746224885;
	Fri, 14 Feb 2025 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739522701; cv=none; b=oZCUXL0chc7dmqvjHdqp7U0ZLTjWWTrm4Qp4skZVopfan4ETz7HM4vNrty5NGm5Cr9cWI88cD5awMLM1ASo6B22xEtdW+Swx6YyJVUBRqQpTICJrBWW0Rlifbiei2j+2R9p4CefqP5FnDXbDBMKeQydYP229z2tLNRSjTIMz48I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739522701; c=relaxed/simple;
	bh=pxMeWOIi9uZwESxzXMW7HG2B+aMVwY1z+txrdJHs9/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPwzjKGdIpKQka1CA33lrb0UVrAHrqToF66w1j1gspKui5Emdv4vLwETE60VeBeKqhA0sE/xuiwYdqOCzdKLlD9i9SkHkdXa1IHTLyT07Wx1p9DujOYatiIhW4hGEgx8kDVfCoTLxev/+UMRtjKKqa6ZV429hR+rNtfkBatyNqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oANmjjAO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37486C4CED1;
	Fri, 14 Feb 2025 08:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739522700;
	bh=pxMeWOIi9uZwESxzXMW7HG2B+aMVwY1z+txrdJHs9/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oANmjjAOgfkSnmRcdIzGJ5bmWwzgaWYEA1DSNQN+wGNRIv6m77fDnpmRucknHUPAy
	 t2kLk2PSLKL59fqDmdE0S4ISLgDXImyxMmzCpmWcsie2fd00Ijq28PWcgGO+oaQxw9
	 pLoKFEqkIDK62HzJrvUkUqk5ASC5QdCUDW3Y6S2nLs5cw5+lAiH+mcf8vug1zvUWse
	 4IclKfrBMiqvT1twoXFo/AvVJQJDU/FaJlk72OdLbQzUxa5yp6F7Ps+DXE+wMdaX8+
	 TSbTcsOzlANIocMkWxl/Dk0sF1qab/fFs+jCmq7+DxWJXB2/yNj9Io/8C+FLU0D4g5
	 MSnOgcXiuL6kA==
Date: Fri, 14 Feb 2025 09:44:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 3/5] dt-bindings: display/msm/gmu: Add Adreno 623 GMU
Message-ID: <20250214-refreshing-fearless-lobster-a55bc0@krzk-bin>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-3-993c65c39fd2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213-a623-gpu-support-v1-3-993c65c39fd2@quicinc.com>

On Thu, Feb 13, 2025 at 09:40:08PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Document Adreno 623 GMU in the dt-binding specification.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


