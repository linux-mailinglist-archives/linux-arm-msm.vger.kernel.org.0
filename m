Return-Path: <linux-arm-msm+bounces-48580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15058A3CD60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 00:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39169189A38B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 23:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108C725A621;
	Wed, 19 Feb 2025 23:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+wcL5cT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D931CAA65;
	Wed, 19 Feb 2025 23:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007298; cv=none; b=djxgqF1crNDKTBk4i7xv6OyiY6rJI4xTMj26zqXVU5vn6k4csGXfZR8uKQ5HYQWem2yTN/Yb1aM1SuR7s8ODZm0FXDfhLx6RLYVYHuQ0N6GeglqDMcHpzqktF/kUWAu4Q4dbAw3u0TWkeTEyAQA+SmdM7bf+tl5ZyMhy5GUK8lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007298; c=relaxed/simple;
	bh=LMS1nLB7BGuN+tfhQGVp3lwyass1VSu3itpL87r5DTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQGq+sBzxaOmgkqXKT5xjZrLJ6cPjyvoD8yTB4aNhQ79AzJCmmVXzzz2ncoD3EGupWHqqCo+T5Np4lxvfFs+FJ+9bY0BHkmznlO9ujJdyFxarC9B9G0X+lc0Y7SgakbKhYRp4+ET7Zi2+lgIok+273Me1MbZVHcBy7FO7Y9bCSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+wcL5cT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D2CC4CED1;
	Wed, 19 Feb 2025 23:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740007297;
	bh=LMS1nLB7BGuN+tfhQGVp3lwyass1VSu3itpL87r5DTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+wcL5cTtkCr1j28mNbUZQWDmq/2yXOcPj+MU8854KsvoAX9B12+Y/YyoNxEu89z0
	 yGV1NAG0SY2ER3PwFHcl7JVa5vBfPQe7u0fhX9tS9eARAI+vYJ0UMm9qk+g34kkotm
	 VRwPohu93V4gK6SQs7QEKH6J3J1p3JoYcYJ0WOavM2PvVuZ+44dkeVB4f0DcIZTBS0
	 JaQDaDkX+9ybbgoOkGA16b6LFbENUnt8YgzYpelU9qQ5QWc2umiVDmRbUbW2caiAVT
	 NzIJm0ldEsOpxJg0zMiW4Jrz7GvZZJ4MnlUmpUpUDwd4WwlUx7RSi/vB0jUlZthYtC
	 Sm59WZb54NGjQ==
Date: Wed, 19 Feb 2025 17:21:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sean Paul <sean@poorly.run>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 04/16] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
Message-ID: <174000729541.3163430.2531640843485250752.robh@kernel.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-4-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-4-d201dcdda6a4@linaro.org>


On Mon, 17 Feb 2025 17:41:25 +0100, Krzysztof Kozlowski wrote:
> Add DSI controller for Qualcomm SM8750 SoC which is quite different from
> previous (SM8650) generation.
> 
> It does not allow the display clock controller clocks like "byte" and
> "pixel" to be reparented to DSI PHY PLLs while the DSI PHY PLL is not
> configured (not prepared, rate not set).  Therefore
> assigned-clock-parents are not working here and driver is responsible
> for reparenting clocks with proper procedure.  These clocks are now
> inputs to the DSI controller device.
> 
> Except that SM8750 DSI comes with several differences, new blocks and
> changes in registers, making it incompatible with SM8650.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  | 54 ++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


