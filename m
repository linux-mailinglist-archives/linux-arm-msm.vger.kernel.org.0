Return-Path: <linux-arm-msm+bounces-76132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF006BBFE76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 03:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A63F3ACF98
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 01:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4822D1E0B9C;
	Tue,  7 Oct 2025 01:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIpfst5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1493C2B9BA;
	Tue,  7 Oct 2025 01:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759799305; cv=none; b=CuHky50Gz7qs88HxWbWAahmpLIm3BTdEaVw8l0dAJ7zxigUv0obsQE+2jtfTfjnk3k91HPgCFGXINhmlhSDqzcOn84707i+Uc/W3+q1QKEDODt6ZpqLH/QZVuROk3hEWDS0I9aWxzKZ/bAjapw76al+6qG975iv0cYdACTuS2p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759799305; c=relaxed/simple;
	bh=4mZ2Pd7g7yEA1a/btYS4fCpf+KxY0K6O7rgNoBX5KJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjtckusWJ8albq0m3tdMXZPEEBboVEbHrhGLN85atFD1OPFT1e5UTD9grL8URRXBSZULbRXdiSwtH6vK5z3GYFFfb4EMF00mrtmmTjdmQp3HZFBoCtaG10Qq/wEfkkJQmpxbmV+li84kPgK6w/lOB/HNdQ1ct6jp2g7USP1ldag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIpfst5K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7998FC4CEF5;
	Tue,  7 Oct 2025 01:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759799304;
	bh=4mZ2Pd7g7yEA1a/btYS4fCpf+KxY0K6O7rgNoBX5KJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIpfst5KFmC7qevzDNx9HzQobP57DvqFlF2zEOAmbfTjskVex3r4K0egK5ODyVxRc
	 pSRv4XR4rgfydQmwv3PD7qWkS8e/Yno9sSLUIsTzbZh0ypIWb08mw2reke9yQQqadO
	 Q7Kh4iv/sLIJvArPRDiIfxxmBiJwGvKeZ144P+C2dvPpnShd4UplGq7JMBnaiZr40v
	 HTo0bHtLmqqJzqqV6ZzQNuPm9LLVhxvay3FGjldmoleHApa2P/iGEulXiy8wI+VErM
	 LeEQNtFz6fR8Z/O1R3YBnE3r00qIRui7g+tfPLW6fTWSndmxolva3GTQWGJntez+Rl
	 9azlF3FT+3Usg==
Date: Mon, 6 Oct 2025 20:08:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>, devicetree@vger.kernel.org,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 17/17] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
Message-ID: <175979930291.705827.13931250728494462568.robh@kernel.org>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-17-73530b0700ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-17-73530b0700ed@oss.qualcomm.com>


On Tue, 30 Sep 2025 11:18:22 +0530, Akhil P Oommen wrote:
> Document Adreno 840 GMU in the dt-binding specification.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 30 +++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


