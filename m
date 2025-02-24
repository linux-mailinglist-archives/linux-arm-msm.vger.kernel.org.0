Return-Path: <linux-arm-msm+bounces-49190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CBBA4296E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 18:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA14918842F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 17:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA07F263C65;
	Mon, 24 Feb 2025 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOG5xWd1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B362627E6;
	Mon, 24 Feb 2025 17:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740417776; cv=none; b=nAlX2vqKaeQPfMqav3VC6zR9xiUdwFEOIYD7CC4KKQVGNuFn+vuLPlBn0amaWXjARMhI/czIfd4MDGEwGjPL8TaxVafQSsi0C4B62gXoUozWcdxloOd8beFeVZSLo4zLZpjgZJQu9za2inIwIWJfUxPKJCuIwGIJoj81fHmc+O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740417776; c=relaxed/simple;
	bh=/P+Rucaw2uTNNTVGKF3Z7fCCwDc+94TYvL/AhjRy5LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FngAlpDLtPRfVBx5iDuuKKYHT95eWT9SQPPPi7vXb16CbQwpIQ7/PhKfmzMrG48SeaN9fFbqirkqj+Du+Ug88jBoI0sEUSG25riMJeoLttcD/hR115pshG0W4D6NRwkj4mc4o0PjhUh5f2EzlxazpZujH9XxRcu7cvn+0D4jo6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOG5xWd1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00CDC4CED6;
	Mon, 24 Feb 2025 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740417775;
	bh=/P+Rucaw2uTNNTVGKF3Z7fCCwDc+94TYvL/AhjRy5LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gOG5xWd1Mcpi7R5MKHAdv5vWzW8N8j3MfWVNZsKg9HQGaYDjUmU2pdXKCagfYuOCl
	 xEgdH+wtezarxqhyoTzWbdPpZXTWRIZNuMZRJstphdwTEergItmkye/l3ZkevwMWvl
	 +JjVL9YOqlXv+Gm38DSRTGusBUP5jfCqTgYpBEmPSRkevooPQGTCh4PPKfvdz2Yzvu
	 gAPQ/Hm4sR6qNd1ZbFdwihboh5dInnJbIJqIN+XDd3SlIDsSXjvVURcbFwPj4h/RTm
	 vL0iThNH5kfVqRpIRjUH2eTqjLJZken1G4P9oDwRw2nkbwScKpUvu6UTAxkAyo5KpX
	 AJvs0dJxjPwjA==
Date: Mon, 24 Feb 2025 11:22:53 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Jonathan Marek <jonathan@marek.ca>, dri-devel@lists.freedesktop.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robdclark@chromium.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 05/21] dt-bindings: display/msm: dp-controller: Add
 SM8750
Message-ID: <174041777290.3552153.6543201724370698286.robh@kernel.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-5-3ea95b1630ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-5-3ea95b1630ea@linaro.org>


On Fri, 21 Feb 2025 16:24:15 +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
> fully compatible with earlier SM8650 variant - both are of version
> v1.5.1 of the IP block.  Datasheet also mentions that both support 4x
> MST for DPTX0 and 2x MST for DPTX1.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Extend commit msg
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


