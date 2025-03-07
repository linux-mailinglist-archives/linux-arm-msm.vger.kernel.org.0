Return-Path: <linux-arm-msm+bounces-50597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3AAA55FB6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26F5C16B0A5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 04:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74C9193425;
	Fri,  7 Mar 2025 04:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbRLZx34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908619FA93;
	Fri,  7 Mar 2025 04:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741323378; cv=none; b=AApNBVsRL6i57rrJ7d1R3Zyj+tvjJ7dWAWE4Fbx3dPrLofOGaB/gytcX7d5SR//nTVJQAwFTvQaNQY0B4NdlfYhYzel5PBSepf8JFr9yRsoX4t1yg44n2+M9sbG+Q806FeS/0XYnRXYL+DR5SvlK9A3mMo2wy0tXx4E/25KUjqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741323378; c=relaxed/simple;
	bh=tV4mWJwblSpLJntlE2PRqNsAKvm8a1dUCx4Mdb4I8MU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hBKEkGUKKn0gAJc15NS5LUVIpCvS2LerprnrKaCY/EpwDYsr3WD9OWWYr9fq7S5YFAKOiT0BliQA2Y0gE76LEzPflygRbtfudAse7PkyjzBB92Q4fcm6gJ1aw1nUgis1bgZh6Xsxvo1h3bCU0R8fr0Fj2gXNrw80fm8e0f9e01M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbRLZx34; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AF0C4CEE3;
	Fri,  7 Mar 2025 04:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741323378;
	bh=tV4mWJwblSpLJntlE2PRqNsAKvm8a1dUCx4Mdb4I8MU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbRLZx34r4Xf0RNuo80VlfRPkoXv+WC20f86SFLCzc4i/kS5Qe1fPQT+1d0PPA+Kc
	 y6q8KmFCnR8O2yABDI/qNHcpx60926OZslQo4TWtXr7g6nCXPRwSjsOMB0b1WbBYg+
	 216ykO8QUxeL+N/lQfzgRATl2DScBmaCUnZhWsqSUFeEwcHshIdf3pg5Oh0Eg617Gg
	 oT/h+2TfWGoVKTJQLpM/lsk6Y7Zpg5TMcCuQXFkQskmRVLfMDVUSmg3cSTGs4U4VsM
	 GwhWshL33dRTl6DV96gjL2EqIpAzIabbzUtW5Y4vv/MzHg6Pg5epay/sXZCxwK73vX
	 nRKbI7pZSIxLQ==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahadevan <quic_mahap@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: display/msm: qcom,sa8775p-mdss: Add missing eDP phy
Date: Fri,  7 Mar 2025 06:55:50 +0200
Message-Id: <174132271320.1132259.1145484645607636085.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250221151311.138755-1-krzysztof.kozlowski@linaro.org>
References: <20250221151311.138755-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Fri, 21 Feb 2025 16:13:11 +0100, Krzysztof Kozlowski wrote:
> The Qualcomm SA8775p MDSS display block comes with eDP phy, already used
> in DTS and already documented in phy/qcom,edp-phy.yaml binding.  Add the
> missing device node in the binding and extend example to silence
> dtbs_check warnings like:
> 
>   sa8775p-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,sa8775p-mdss: Add missing eDP phy
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d3169ce5251b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

