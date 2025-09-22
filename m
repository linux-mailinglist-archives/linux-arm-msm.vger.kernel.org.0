Return-Path: <linux-arm-msm+bounces-74452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D0CB92495
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 18:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEE137AE3E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 16:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A3F17A2EA;
	Mon, 22 Sep 2025 16:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKl1iuRQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9821979CD;
	Mon, 22 Sep 2025 16:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758559543; cv=none; b=adrb8LO9Cvy8MBQkdvj5F8YKtDVN31Y6HbgZQ0kgpvXTeCK6pwaF9/x32ETHWh+9pv0H0RYZqM+eA9JpYEIOIp7cSM5kK+Xd7k1F8XxhDUcdDs9mIx6VKa1zyTlIplwwZF3Adhla5k+zLiMzCp9/YYBg8K/UHghAblXRr0jUUg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758559543; c=relaxed/simple;
	bh=DfqJ03fjXW2q/FSPPzCRU01fL5qNfhhdgRjHbspkYGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjY7A4a4ddE6baOzlEN+uL56UbbkXXiXplcqbMyWljW+G4TFlyqpaHhz6hlTkkUtX31NiQkYqFuczoxP8gjWg8GvbXtNcywQ/VHzcJQD40DnKwmEjBZZ0MJ83hDHIx+E+/mJTJJGKwgydXskuDAm12ZYvY4l3LVKIQbr4VXvA8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKl1iuRQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C775BC4CEF0;
	Mon, 22 Sep 2025 16:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758559543;
	bh=DfqJ03fjXW2q/FSPPzCRU01fL5qNfhhdgRjHbspkYGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKl1iuRQvPvgPk6QutkItO5vT3cBEu9RlRTBLhhabF+BE194f1VIaDU1tP9sC6Xoy
	 FLitfi3RW0c9obWhyytPyDyqWL45qIU0RvEObco3E2Re20dNoA7c7tI+dXumwr0s0H
	 WsXIGuko64ayHA5rbki3iCrd3VeSqI69yGtP+uNOsIeerMOykExYCq8U7GH2dW2VdB
	 +tacsPNJa04ERnRYA27O2Xs85TBphveNa1AYOPhR6LOgnKgLpsubYrrwScyoFShhdi
	 z0jCSCXVH+bIv/OAMLYNuXCUUUftcqgjitUVt1ACDrq2vOf15KosQB3WID1C/mKFY0
	 60voZPXNdJc1Q==
Date: Mon, 22 Sep 2025 11:45:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	li.liu@oss.qualcomm.com, Sean Paul <sean@poorly.run>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	freedreno@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, yongxing.mou@oss.qualcomm.com,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	fange.zhang@oss.qualcomm.com
Subject: Re: [PATCH v3] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <175855954154.407393.7360010734247803300.robh@kernel.org>
References: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>


On Tue, 16 Sep 2025 20:11:03 +0800, Xiangxu Yin wrote:
> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> SM6150 uses the same controller IP as SM8150.
> Declare 'qcom,sm6150-dp' as a fallback compatible to
> 'qcom,sm8150-dp' and 'qcom,sm8350-dp' for consistency with existing
> bindings and to ensure correct matching and future clarity.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
> This series splits the SM6150 dp-controller definition from the
> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
> 
> The devicetree modification for DisplayPort on SM6150 will be provided
> in a future patch.
> ---
> Changes in v3:
> - Update binding fallback chain to "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp". [Dmitry]
> - Link to v2: https://lore.kernel.org/r/20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com
> 
> Changes in v2:
> - Update commit message and binding with fallback configuration. [Dmitry]
> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


