Return-Path: <linux-arm-msm+bounces-50780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73282A58CD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 08:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D57E316C587
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 07:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A691DE2B2;
	Mon, 10 Mar 2025 07:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7lcU/JZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254A61DA0E1;
	Mon, 10 Mar 2025 07:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591388; cv=none; b=oWymQk59TDIkjeNTW4gPdUnbiV8lRoopYMO9bmxQGjTgaGBdZ6YVbcE3bRzkq5OggVdNkVNp4kYlbkrPT905CZKhEg6iXr7CFeqzTm0rd/EmdFDAdRhPfS9XhkthtjGNOWVY7bisgA2bGCZTtfw4TQORUE23NoHDU+lv80+ajSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591388; c=relaxed/simple;
	bh=RlvKs07iuCvZ/lpYdSqVxJ2vXNGKN73rfYEc3+gIKNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYor7p254A8AoxwXw5P33B9l7hZoo9ug+aytQVSZdQiqOCIi5fH6cmHFh4Z3Yn6ILiKB9sf2OmByDnu9TR5fuyLgaSVO7B8DVuQ6fWDFw4bjTnkccJB9E11+kPlrxymEnc4Rn3d49YMlEAV48+SdXt5qiX7nQbeNeN6Y6EtAJlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7lcU/JZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5290C4CEE5;
	Mon, 10 Mar 2025 07:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741591387;
	bh=RlvKs07iuCvZ/lpYdSqVxJ2vXNGKN73rfYEc3+gIKNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7lcU/JZEenWdzfzzb0tr1SWG3ZkhI0EoTYO2icU/G0L0RaJ7ZHQqtPfGuzJai0HC
	 csLJE5UnThUxUaxF0bE34TVJL0ewvOMiRUrpS1LpzGlEk3REzTuKwya6g19OoTRiDS
	 Vz1PJKupNDxoNgTQCzwAKVx8ovdnCg/wWlA7ZN224R6D2I7duzgJkvJvSVrBYG2slZ
	 p3u6yjBN9ebkdY2O8lhGFXlyjDWThPCcrnH0pS9VPLA+fbrK6jIKHIgOnuOzbgwGMo
	 0+KIgoJJRn/t2TN1ijKgRSzdVchI1UrORXhbGhg6icw/pthPbr0kJBZ2/ft/GNI5QH
	 50MUxij1sgAHg==
Date: Mon, 10 Mar 2025 08:23:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
Message-ID: <20250310-prompt-economic-gaur-ef0bbe@krzk-bin>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-3-1d4c30f43822@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-3-1d4c30f43822@linaro.org>

On Sat, Mar 08, 2025 at 03:42:21AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


