Return-Path: <linux-arm-msm+bounces-43481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB459FD215
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 09:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D30737A1612
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 08:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C46154456;
	Fri, 27 Dec 2024 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBDVr7LR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA2C153808;
	Fri, 27 Dec 2024 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735288789; cv=none; b=LcEdpi6R3PUkTlgXk80FYwpkD9hdjTej16YycXEW0r7xfmGeVwDzVQDk7Y1QBwsdS6v+ZaU7RypRrNRsZeTMg5cbrO5G879KrEY48bXYDiIsmBF+wyr2NRUY1Hf67UTgRukN8eHPVv/2y4teZml1wPTzTM8xQa6TCIUbVIcJzLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735288789; c=relaxed/simple;
	bh=+0FfP/it/g6a5NcBaGoGxMC03dKPY+plNCRmhB37Yqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiELVq88tU59lLVDZnshzFD2zBib0XiMd+ExI/3OlWbJuV9yK/32WLtc8tIw92BPf3BDy3vzliGPg2j1PCapDakLMfaYqrRnLKANPkMlmhJP8XIpfn4qFgCuasOGZENWgoKJ7LXXKZI1ah8Y13HD2TBmBZC09UWNDR1Ovd5oqlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBDVr7LR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA23C4CED0;
	Fri, 27 Dec 2024 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735288789;
	bh=+0FfP/it/g6a5NcBaGoGxMC03dKPY+plNCRmhB37Yqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBDVr7LRS7ZJolIw/KKBRGpkLWRTbIZnQ5XBdsnWYztuxrcn5Y9ZLYy5g0gGHqZAW
	 jAGMm+1nWOLcAbCShvSnxwecD1HAfNqIwMD6l8aoL/h1bPsjAbSkepPU4cGVnTc7RA
	 ZbFsOtZH+YlS9a81UI33JH1fju+J4GwFF4gtQLA/FJghudZekNSfatmFdIAj2+sKXX
	 KdElQQEl+3E9wZI5cw4X4Pf2Ggua6l8r3diI5T7O515poDKJoHGmXT/Ehm21QPMxGK
	 AIy6BghZIevtOMYZ8WrZsyWtXQ+z+boeSadaL+hvIg/PfMhoJOQLCeID+ik4cwgiYR
	 4JPHBoRBDc9xA==
Date: Fri, 27 Dec 2024 09:39:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Message-ID: <d6qiwltykiw22o2gydqguaqzf5tf5vpbzdt34qodipc6pxakfy@4tmihfn5fta2>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>

On Thu, Dec 26, 2024 at 05:40:44PM +0800, Yongxing Mou wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> , Display Processing Unit (DPU), DisplayPort controller and eDP PHY for 
> the Qualcomm QCS8300 target. It includes the addition of the hardware catalog,
> compatible string, and their YAML bindings.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> This series depends on following series:
> https://lore.kernel.org/all/20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com/

Then why this is not part of initial DTSI?

> https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/
> https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
> https://lore.kernel.org/all/20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com/

So it cannot be tested?

Way too many dependencies for me to review.

Best regards,
Krzysztof


