Return-Path: <linux-arm-msm+bounces-79719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C861C212D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E08511AA058B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F9736C227;
	Thu, 30 Oct 2025 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WR8xPAf7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D636C223;
	Thu, 30 Oct 2025 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761841373; cv=none; b=qZXx0vthTn/X3rlZ5eMgc1YbgVh7hd9U5tOxCsvjae2IWMw9k+KKsN20ZYB523CMeevawA73nkrh3I+g1m+ls51J1xPYd0SfRsGZULNNE+to/c8hI09vv0UopoNZeeUZjlOp+0OWHcREjJWoKJMlpNCJmIpxkcnFaiAgntIgZtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761841373; c=relaxed/simple;
	bh=cmZmFgC76pi98WknvVC6o6aMaiEboDlTfT1jYrQ4eJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VIqXcXYe+WevIy+RXUtC5PLk9nMB9jTJQ6AhS3w2tO8H0+wKWilwTZNju+SqZs/JWJbzmRqSqaj1bFcVNKMfNNpE+/Org96QKNiSJso5n7J0XJz6rMJZ+cRQVudCL9OWBYPsma/r/KGDx0aIsFXyRgGEgXJG9JDLw82/FjLpnyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WR8xPAf7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E4EC113D0;
	Thu, 30 Oct 2025 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841373;
	bh=cmZmFgC76pi98WknvVC6o6aMaiEboDlTfT1jYrQ4eJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WR8xPAf7ZUQ1RfvdbsVCbw6cI8vRO7/WN5PAbqT44g1Ckxop4RajDmbNlSS6CJ4sD
	 LVAPr56VGyUdCp9lXDf4d1ZiosqFD5aSpj611uoz/AbOm019HdlLtllSDg6aWA5fS5
	 QyXpGCtKUha2O1grAIQhn7OinRpHeWi/MFrXeukL5e21j+YxbQ+1reKELR0jGbPxW6
	 SE04bu9UujLJD3sR+Kt1V562T3/qNrLlbZvKW6RhCwaW4MUKmODk8uQsPIGlq+JpTn
	 26xv5W3fIG+PHNX8TEumtJnthdEjqOsoPcaAaq+HFLjNKf9iyMsktwQD7lnnV6AwGu
	 +5utx1ktFAlSA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
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
	Jessica Zhang <jesszhan0024@gmail.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v13 0/5] Display enablement changes for Qualcomm QCS8300 platform
Date: Thu, 30 Oct 2025 11:25:44 -0500
Message-ID: <176184154225.475875.2172967213754375064.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Oct 2025 16:51:33 +0800, Yongxing Mou wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
> QCS8300 target. It includes the addition of the hardware catalog, compatible
> string, and their YAML bindings.
> 
> 

Applied, thanks!

[4/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
      commit: 58fbc8208e9fd950ddaa2614ac6f324999c32d09

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

