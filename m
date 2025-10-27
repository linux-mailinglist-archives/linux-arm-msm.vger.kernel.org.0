Return-Path: <linux-arm-msm+bounces-79021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB144C11BBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4105F1A28713
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F732F12A3;
	Mon, 27 Oct 2025 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dz4qRStE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C38A239E7E;
	Mon, 27 Oct 2025 22:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604488; cv=none; b=BuVNTGP+kCtRji9rG9KVn9pO+fC2xPUReJSuRqMSe/1AaAeKc4Yf+/w2c1TjxbIdiT5vWd3jX000QgTGAJUFRkjNQkkOckqu6iBR/v0CKvh4c9veVKNluH2ooLdOJamVH0riXIKv6nfU4F0N4ji8cpIr0f8Pv5lGfIOH0WphUPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604488; c=relaxed/simple;
	bh=vzBr+yxDuWYssqy8HhgZk1oBeKR5UFQrHdnJ7mJAUFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDHMMCCDo0FzUAFghyKt4L9U5S3d6oU4APL+5unqegWIf+6NrRiXjS1IBIEg8k9D6QwMcgY45aELkX/npj3DErs990dQfIhU76WzLj9vajB96hatIW3CnjcXVu3m/CMRx/lyt9CbQTgMrRKfhc+R4km4MdkydIWHA0QfuVCu1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dz4qRStE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F929C4CEF1;
	Mon, 27 Oct 2025 22:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604486;
	bh=vzBr+yxDuWYssqy8HhgZk1oBeKR5UFQrHdnJ7mJAUFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dz4qRStEXx2NFtUH12/+N/Vs1bM7fWpdAIU9keu76nte39i7cBX559wW38xvW4wTy
	 ANH5zm1C4NuH6A1f5OrKkyOZCWyWixCKf7raO5HXvQ9hMu8E6PBfceTy3une2AJnCx
	 58j4D8f7Its92U1e7myipmcfZticYtpEPm9I4g3ajCnPGuY6Kcg5vEVvHiNLDAmELz
	 i7M1lvl6HJZxRP2JeWL0WqAlTd1bdkkJU5P4ybYbpWaDxJDy9IrJ8IXUmqNWoSkNgt
	 q8ofNzUZJt9iXLVrWLdmun26QpXwBrCtXniao8qvKGPpCQgBX0rB2ii54avZBnOAtB
	 AOhpJ9cWo89ZA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/7] drm/msm: Add display support for Glymur platform
Date: Mon, 27 Oct 2025 17:36:42 -0500
Message-ID: <176160465226.73268.4378641662848766051.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Oct 2025 15:38:25 +0300, Abel Vesa wrote:
> The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> version bump. Differences are mostly in the DPU IP blocks numbers.
> 
> 

Applied, thanks!

[7/7] soc: qcom: ubwc: Add configuration Glymur platform
      commit: 9b21c3bd24803e4ebab9f91bd812aa10576d8220

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

