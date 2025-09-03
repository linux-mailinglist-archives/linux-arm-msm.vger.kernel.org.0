Return-Path: <linux-arm-msm+bounces-71950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD72DB42CA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 00:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56BBB1BC75B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 22:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948352EC090;
	Wed,  3 Sep 2025 22:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWOlTwZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C38217F33;
	Wed,  3 Sep 2025 22:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756937610; cv=none; b=iNaCwPWdfhHXeHcDx67tNAGfPeWGtvY/3LlOa9y/FqMGlbEIYBn6BQZeizPqTdTuPZBrxe786DjgCmDqWQSdYkoHRAwQl2IQhchAQUHVnD6uEasFNGuPvLJpi4H34v90flKtq7beUBxXQhyymcC5PMN8k69dz7hAkuukDVfEPg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756937610; c=relaxed/simple;
	bh=oV2NWXl85j6kRtt65I+kwlkxl12a07d3zCpp3cY0u7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvVUMOW4RoonsbH1em9fIcyQORrRPHOt5cYSiaWaliRwQxMIIkpfgV6M/xoPrAuo7lZb5IhaEisCCJoFcxqKXboQ4VLyjsGt+KTkVD5b9BLhTA3SfMnM1ZgaXnYmGQpO6/CfzIkwNbCA1zlYqOZBzRgmZ05uyBlzDbTsW7bDmJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWOlTwZ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1C4C4CEE7;
	Wed,  3 Sep 2025 22:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756937609;
	bh=oV2NWXl85j6kRtt65I+kwlkxl12a07d3zCpp3cY0u7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWOlTwZ1nTSfXLuD5gd526C34LTRvNISuCXTEx6tJGQsTrY+bYTIDnBwXiBaONTFz
	 Mm6Xw3oE28KZV0wQ2qEAOF4LS8+5+vnFEqbQhgnfA4vBW83Yqf5YVeK8OtTk6w9ghD
	 yUetGzl+tu00FFwz2oagXV0MiKAUffyLgoSStzFGrJp/eme/5quFSWJ2dX1asSgbEW
	 o3FGYkpZJJrRjpw9rxUmHrF0e4ZIxA8+IA6C27uWpy9Ds1URWBO3TCbtwMgGMtmWBi
	 HsLKgXhlzQazYjJuOQqqNfG9XcFFBDTsNf/B/i11ZoeI5NMTpB6TaooCId1NdGna5h
	 yDcpNVWuPsFpg==
Date: Wed, 3 Sep 2025 17:13:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	David Airlie <airlied@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	freedreno@lists.freedesktop.org, Mahadevan <quic_mahap@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v8 7/9] dt-bindings: display/msm: expand to support MST
Message-ID: <175693760715.2953637.17179173729112460922.robh@kernel.org>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-7-7526f0311eaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-dp_mst_bindings-v8-7-7526f0311eaa@oss.qualcomm.com>


On Wed, 03 Sep 2025 14:58:18 +0300, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On a vast majority of Qualcomm chipsets DisplayPort controller can
> support several MST streams (up to 4x). To support MST these chipsets
> use up to 4 stream pixel clocks for the DisplayPort controller and
> several extra register regions. Expand corresponding region and clock
> bindings for these platforms and fix example schema files to follow
> updated bindings.
> 
> Note: On chipsets that support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 103 ++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  26 +++++-
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  10 +-
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |   3 +-
>  .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  10 +-
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  10 +-
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  10 +-
>  7 files changed, 150 insertions(+), 22 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


