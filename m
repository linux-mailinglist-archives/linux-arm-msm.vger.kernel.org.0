Return-Path: <linux-arm-msm+bounces-86690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E9CDF863
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 12:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A455630076B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 11:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9210A26F29C;
	Sat, 27 Dec 2025 11:06:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE7F13A244;
	Sat, 27 Dec 2025 11:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766833597; cv=none; b=EDg6LETcCLBvMg1c8jLbJ7ELeq1R2rSDtQsofn84LypFB02XsktnLazP/snn2TyBV9lBiG+eCPvR856YxoM18W0quVWXCfvjN5R3S/tZ3Ah/wqHr6BHFy1cyXxMevO9CoTX7ez43H9lLgRFifKhI2pVzNdn4UyeIk3VhzYkqZ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766833597; c=relaxed/simple;
	bh=OsGvZ2T2rTCLhozUFFP9/ahnNJxa9T4SOFN6L9XBMwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpaM4atQSBoQMLSthoRLyqvnJU0l423VMtpQVNJjkBl7iviamBxxSFSYgOEpdcUjBKGw1oWFw9HCgx65HlmmxLhKchJy277PzdeXyBEuTSojXgRRxaYBrZEn4fABq+Ohmws6SVChmnZRjDBgelloxp6IqWNi2+spjW63Sr9OQgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C27CC4CEF1;
	Sat, 27 Dec 2025 11:06:36 +0000 (UTC)
Date: Sat, 27 Dec 2025 12:06:34 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: display/msm: gpu: Simplify
 conditional schema logic
Message-ID: <20251227-invaluable-micro-snail-e5bf8c@quoll>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
 <20251226-qcs615-spin-2-v5-2-354d86460ccb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251226-qcs615-spin-2-v5-2-354d86460ccb@oss.qualcomm.com>

On Fri, Dec 26, 2025 at 11:59:35PM +0530, Akhil P Oommen wrote:
> JSON Schema conditionals can become complex and error-prone when combined
> with regex patterns. To improve readability and maintainability, replace
> nested if-else blocks with a flattened structure using explicit enums.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 56 ++++++++++++++--------
>  1 file changed, 36 insertions(+), 20 deletions(-)

BTW, this will conflict with my series sent now:
20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com

so if my patch gets in earlier, you need to rebase in
non-blind/non-obvious way.

Best regards,
Krzysztof


