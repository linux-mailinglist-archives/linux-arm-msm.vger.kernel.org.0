Return-Path: <linux-arm-msm+bounces-48578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73919A3CD54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 00:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 666A0189B610
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 23:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143DF25A621;
	Wed, 19 Feb 2025 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="puqaLM44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC55A214A7C;
	Wed, 19 Feb 2025 23:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007209; cv=none; b=ru3I0yj9Mb4RCSr1SU7XK7lkulkJN6I9tW6BuYe1av7dg5Myh0BZkOPozGhULgg+cTClKXKtOv5SJPL0FC/PO9ubXC8LfeKc3zxtDgxO20FY6qKhaZvHQc2sryKXOFLmiTr6wN8eLTlCEvgQNuBzVty04BKHGKIM+fdfCW2sKDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007209; c=relaxed/simple;
	bh=FjkWPKqWSxRGLZds0Xo7ynAaaD7sTQjH9kCvmrRpZCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pD+ah+tjV5uPlYneJlR6dpRy7dEaXsh6vAfge422Exy6sBB1rItLbEnHlUaO5Ew0yf+mrpCF0pJXFynctTz23Di9p3+UVAT4Nm/9zYMJ5MVwCybIWnrIW+zqGi0RVU/GJZ5Bw89jpJtDc3radH8+4HWExs2/c19frYsh0Axun1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=puqaLM44; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C95C4CED1;
	Wed, 19 Feb 2025 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740007208;
	bh=FjkWPKqWSxRGLZds0Xo7ynAaaD7sTQjH9kCvmrRpZCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=puqaLM4455XuIIfjXRwP6zMffumU/YGxVpAayVVnDvCsFh50siRNp0M4cZiEz7+80
	 Ccar/Ld/V1s4tU8VHmQGhyJDAFx17+t/xHWVE4vw3yKkVaiiTIJ2Br+XDHoqnkFKvX
	 NkmyFmevXutfezs8OZ+YZaD0PggeBXUAxEW4/t0VlO98LUKYHcoiI/AjqzsNQzApdz
	 8OKBTIPrADUv/P/rHNLmR/HlrVgGc/R5Psy8ndyvGrxEbMF0PrUn/Y/H3FR1iPOMQJ
	 EuO8We29rTESj+chwBeqd10BjLAU7yi2cjqb/iZGjWb+HlerOvL0eTYb05NI4i1zP2
	 LmBL3DkcZNziA==
Date: Wed, 19 Feb 2025 17:20:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jonathan Marek <jonathan@marek.ca>,
	David Airlie <airlied@gmail.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 02/16] dt-bindings: display/msm: dsi-controller-main:
 Add missing minItems
Message-ID: <174000718937.3160861.6936876798495965739.robh@kernel.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-2-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-2-d201dcdda6a4@linaro.org>


On Mon, 17 Feb 2025 17:41:23 +0100, Krzysztof Kozlowski wrote:
> Specific constrain in if:then: blocks for variable lists, like clocks
> and clock-names, should have a fixed upper and lower size.  Older
> dtschema implied minItems, but that's not true since 2024 and missing
> minItems means that lower bound is not set.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


