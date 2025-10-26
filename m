Return-Path: <linux-arm-msm+bounces-78825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B136C0B4D0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 22:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA6AC3B82FF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 21:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC2C27467E;
	Sun, 26 Oct 2025 21:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+SY37Nd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25911D7E31;
	Sun, 26 Oct 2025 21:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761515121; cv=none; b=WKX1JiOI0TkOZaYfa+o6UEmgnDNf5SVUZXJ5vrAyrNHd+GiV1zoFKBK747cDnGgHqM2p1iOr56jDuvdbp2/xZxmposfOTVYp/VipHfAVnJpo7Iyf56V+JR0u03KSshHbUqsD8DX6k4awpQ4S18bGt2TIKPDsJiY7HGkWJnsjTck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761515121; c=relaxed/simple;
	bh=2oCXk8yWmT0Rh4DSL89Lqqbb+y930NQMDgM+wHt8Qt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=to3Nlux13hL1NEvNZMbBrCbFO3Z+w53jtItB1QOQqCLGP1bunOoGacRC+BB6+Pcr5qf2EL8M/q8IgQQsQkjBljVp0wQu428Q1VgiD6pgecp/YBp7XXGOXUnQGBIvt+2p31nFl3TGH+35053z9efroTingiNS4sDAa03wDmIY7FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+SY37Nd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E73C4CEE7;
	Sun, 26 Oct 2025 21:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761515121;
	bh=2oCXk8yWmT0Rh4DSL89Lqqbb+y930NQMDgM+wHt8Qt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+SY37NdmY8yTOMg3t4DSAkQIi+CpDzeYrHeqdy3xgeMwmbFeyUiuSOFv3g86huVn
	 1TA4nX/YEE2mxAY9PclfciiHdRhVZavCqP16DAplI0CVJsQK4Var5GayqVJgaUN6W9
	 lKhCxOnQsUNFNX4jShVt1yHaQTIYFlcX/Iyn9+2dciWCMx/oh+fro3SytPwPScesnn
	 q1dYbSsZtmukHxchoPjapKoJ7EQiPUAhKlQ6T5Sw2wq0RwCwGaKXs/DJfnf2C5eS+O
	 HZBuIwU5+1FGydsT9eRWB2ki9PKs4d0JxQ8jvKRI51Nen1JnQ7pxbvmZU2UK4uXUfk
	 lcTSHBnvWrAgg==
Date: Sun, 26 Oct 2025 16:45:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: Reference DAI schema for
 DAI properties
Message-ID: <176151511679.2990875.10147448365246102323.robh@kernel.org>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>


On Tue, 21 Oct 2025 13:10:51 +0200, Krzysztof Kozlowski wrote:
> DisplayPort nodes are DAIs (Digital Audio Interfaces): they have already
> 'sound-dai-cells'.  Reference the common DAI schema to bring common
> properties for them, which allows also customizing DAI name prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


