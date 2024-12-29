Return-Path: <linux-arm-msm+bounces-43567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E79FDD4A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 05:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43B5D161116
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 04:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545A817C8B;
	Sun, 29 Dec 2024 04:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXktgfu3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C41023BE
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Dec 2024 04:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735447482; cv=none; b=qYV+lkeeROQQ/HNQtJ++XodKl0/zoD5XsnxeIM4a3L0FwfPR/IW8y9/eDolfDyq7MBHJWQPFLZo6p8XcOfBAbf86EQlwRbejklme6DEPX4h7sodpNRgW79RxYyj62w5hq0rERbYV8HZpwlHSmggJ63W4rHFtONCFJ4RMYggaEh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735447482; c=relaxed/simple;
	bh=TJr0TbbMyHO6rnJ6urMgKJZB+5+QPeE67o8LJNeKkuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFgBlpxfstJv7aj1QXh//Qr0/X6xC3GMxwei7pDcichUBklFs30Qw305O4mvyPL9R0+JKyCVgwC7LZiUa+O3a4ZwtcgGFH9IxtNJqiFQHP8CG/C6e9eJ0FFucgihSNn/Dlvw9hoGNwJmWtPCIwRJGzumQHwXbBXoXr+y1Iv6suc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NXktgfu3; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30227c56b11so95371271fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 20:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735447479; x=1736052279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=chdPQNE/j8Xw45cOV5VKgoIPj08nYhEDdCs+/0/t6qw=;
        b=NXktgfu3ec4u2j/35/0oJD+ya+mobtu1xv9+LQpgL/ZTeL1s06hv6kvNG481G6dxRm
         GVFySTiWWwumO4FqNNy4ZWG641uINTaUuhdYsygSEHBQWQLEkGrU8GRgFGG8WFuiI9sG
         iZVstqoR/IvfL+N8zbj6D5fI058oKLoIrHmHBIx5S9EiwCTnzKaL7IQ7AGeISFLFaDJl
         actHmYRRJuMWum2NCL3poMBH5Jioqzf1Uyx1M5r3C9g5BAPP6HQQuC34fAh1Hhz716M8
         jcUc8Np1nE2E9++5cZA97uL+pKVUXrAkffaOEbyBBPXNoYYNnbWioyE29wpFH961bGJI
         eFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735447479; x=1736052279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chdPQNE/j8Xw45cOV5VKgoIPj08nYhEDdCs+/0/t6qw=;
        b=c1bs1qEX62KdHVW6yXbX2rYC1N8GI8U3YTah7JbsjtArRU9fTwBtooaCpz96og0eGx
         yuQMqc2oxQjfHffbiqS4Olwhs7/iiMsnM/7zIkV4WP4HCt2bzBifR54jujPpE3HSJPnY
         Zq13GDi6q5nXfTiXo6nDkgvNtJUbb+kZJstf6EVKJC4/h69xFik0Pt3Qi10K2adOD0L2
         RvcYhb2dUb33zEhWUdK3DGEz1ErHZIk9HqIfEb7/fnWRyyby5bmND0zy8kfkuC2ueQGA
         cqutip5Md9PPJY+6xs7Tr8YJ0i4YgKpKF8cW+lPor9VB5YSiANlmX3TfsXMwOd9ATyfK
         zD4g==
X-Forwarded-Encrypted: i=1; AJvYcCVRLKVHnpm3DuOzAeHBkwFXc0SCf8Mw1h8Ay2JJ7fshMPbCABmN+o3dfzoJvgmfSDMGDhMlCpF4Lqco4HHn@vger.kernel.org
X-Gm-Message-State: AOJu0YzH7RO8nddYfCeUEeVJfKuocA4ota498fxxThMLBP9k3oRJ2PeW
	uI4/JRRHVziG+OyvlVeIRX0FxHIhWaw0L0WHo/yL+wDHHh0kALk1et7m33iMgr8=
X-Gm-Gg: ASbGncsScVGv6ncelkJ05xYQe5QM7apPtupAlNPWVem2ILCrZ5QZOgEN5AaDNv9M+pT
	vM39RFOW9teIyXB9vg60lZCztsvQJEoIoLcqGox4iNIyLbcjXgCf0E5GTcP7/OhtjNlTCkVHg8p
	4PSLyYsSV8Gxk8PVVWhyqK7Lr9oWw4CzQSefoaj1uMG2PitlJn4/7wbs5CpXYLkpfpsS2ZHRXk8
	uELw18641WO3kWeGNXHqwHJ0n9dOf6WmaJD0rKhKY/XRBZUsrDCPgTN0xRTc1Mc34MVfnJcg0Zm
	prK123wIx96SVqa70IvrNlWgjM7KzmDLDsVM
X-Google-Smtp-Source: AGHT+IEqnOJCZfEtqq/hxEXbpXGiUtUrPmZ/EuQZbNs9DkS0CE7apf881FhBeAE8931EuWeeqm9PqA==
X-Received: by 2002:a05:651c:60e:b0:300:360b:bc36 with SMTP id 38308e7fff4ca-30468579f57mr84634791fa.23.1735447478652;
        Sat, 28 Dec 2024 20:44:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adad6dcsm30120291fa.60.2024.12.28.20.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 20:44:37 -0800 (PST)
Date: Sun, 29 Dec 2024 06:44:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Message-ID: <mha5mg3yyco2dm6g4nw5xfufuhqataoyiw6arkjalsu5caswth@vblodqj3ldcp>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
> https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/
> https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
> https://lore.kernel.org/all/20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com/

How does it depend on all those series? Does it have any intersection
point at all? You should have decoupled all bindings from those series.
If you did, please update your cover letter. If you didn't, please do
your home work.

> ---
> Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
> - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
> - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
> - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
> - Correct formatting errors and remove unnecessary status in MDSS
>   bindings.[Krzysztof]
> - Add the the necessary information in MDSS changes commit msg.[Dmitry]
> - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
>   20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
> - Package the DisplayPort controller and eDP PHY bindings document to
>   this patch series.
> - Collecting MDSS changes reviewd-by Dmitry.
> - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
> - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
> - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
> ~
> 
> ---
> Yongxing Mou (5):
>       dt-bindings: display/msm: Document the DPU for QCS8300
>       dt-bindings: display: msm: dp-controller: document QCS8300 compatible
>       dt-bindings: display/msm: Document MDSS on QCS8300
>       dt-bindings: phy: Add eDP PHY compatible for QCS8300
>       drm/msm: mdss: Add QCS8300 support
> 
>  .../bindings/display/msm/dp-controller.yaml        |   4 +
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml      |  19 +-
>  drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
>  5 files changed, 280 insertions(+), 11 deletions(-)
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
> prerequisite-message-id: <20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com>
> prerequisite-patch-id: 33f2488a8eb133431f200e17aac743598508dcf3
> prerequisite-patch-id: 7b653ebeaf1ca3f87620ccf7d876e3d1fe496c4a
> prerequisite-patch-id: e1b60af8a64332e5f0ecbd3a4ea2b6e090bd97cf
> prerequisite-patch-id: b823d744d2fb302e2496eaf0cf0c9c66312dcf2a
> prerequisite-message-id: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
> prerequisite-patch-id: 367d9c742fe5087cfa6fb8e7b05ebe9bc78d68f3
> prerequisite-patch-id: ee0513c070ab96e63766d235b38ee53ca9b19181
> prerequisite-patch-id: 970974160bcdc837ccbe5ea3b5dcac582e90bc0d
> prerequisite-patch-id: 5b2bd9cc44a529b0b9e5d73128dca5d2ff9f2f44
> prerequisite-patch-id: 6a0a81242e1d0f051e3102533bf0191615c6e96b
> prerequisite-patch-id: 322540ce6d45c32f813ecef50e5135c6f08d9019
> prerequisite-message-id: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
> prerequisite-patch-id: 8faad5c6d8ca255935d3e4d317dcbcc32b8261ff
> prerequisite-message-id: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
> prerequisite-patch-id: 81378ec66ab6e569bd828401c43c4f5af55db32c
> 
> Best regards,
> -- 
> Yongxing Mou <quic_yongmou@quicinc.com>
> 

-- 
With best wishes
Dmitry

