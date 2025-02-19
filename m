Return-Path: <linux-arm-msm+bounces-48579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F36EBA3CD58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 00:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB5D7174BA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 23:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE07525A2B0;
	Wed, 19 Feb 2025 23:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uhc3+68f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93949257457;
	Wed, 19 Feb 2025 23:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007241; cv=none; b=f/KZ48okzOChphuN3eAxV/xJUZiOisAFXEHcKAzQW/vezc0cH0o/goCxiW+OWKzO4upYLe8WBHfMEg8HfgvU+gjlzx4SVyWU/HNCq2doJ6p9nwxeFo4KAErM7xR04piJS/HBk7kDs9Bai7CwSgm+zJLm6DPP+PKr5zDQOsTbJIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007241; c=relaxed/simple;
	bh=bW25hAEAcFcQAeJPwHi4GCnzFSyyf4GK2hY4UaPY0ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PI6iLLrgoiUALKlTGyWFVYUTSO5IjMB0FkhSNVwiG3VXW/IfLeJ8uRRXwLZ3mViikSR08Sd1oMhHeg+bW+PoL0Gp41zXPjPQKAuOgTDoZTtEzZdzWXTITRfsAS1aEtR4vH4DFzp7Z0OM0FbaDStyTeRpYHczhAtbvhKzo1r8D1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uhc3+68f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49699C4CED1;
	Wed, 19 Feb 2025 23:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740007239;
	bh=bW25hAEAcFcQAeJPwHi4GCnzFSyyf4GK2hY4UaPY0ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uhc3+68fv9ZaVvoo0I9g9S4AVwg6ZwuF1I7Rcks/a5txuvO69M1BwuKVw0eCMzUva
	 LgJ0JhiuVtwMqaC/42A7mkZERLL5MWWsyetkTr/FvFnXLUQwaWPGUmN5XLLkTc9/7+
	 ogygdMvo1WbnTjDSvxvXYyoPSrrcbcerutT565rUzcFOcMhUd1KLsi6eD7RMjT2MeB
	 Zop6q+lqPEVmTKPJXKM/tEK7RtsAN9U3b4phvY4M0axxBCQRtbNpz5wU5qG9xE0IZX
	 uK3W1fNG6frNiwl/bMp64bFwTogSEWSpA6OJF+8jpqtbKcGHnKs1AXbhV4wkKWtvah
	 6izu+ckT8mXxA==
Date: Wed, 19 Feb 2025 17:20:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Marek <jonathan@marek.ca>,
	Maxime Ripard <mripard@kernel.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	freedreno@lists.freedesktop.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 03/16] dt-bindings: display/msm: dsi-phy-7nm: Add
 SM8750
Message-ID: <174000723734.3162047.14287723709346655414.robh@kernel.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-3-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-3-d201dcdda6a4@linaro.org>


On Mon, 17 Feb 2025 17:41:24 +0100, Krzysztof Kozlowski wrote:
> Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
> previous (SM8650) generation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


