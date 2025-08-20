Return-Path: <linux-arm-msm+bounces-70012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5C5B2E734
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 23:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 380603AFC46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 21:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03E62E7646;
	Wed, 20 Aug 2025 21:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oihkB/d6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D425DB06;
	Wed, 20 Aug 2025 21:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755724084; cv=none; b=MZ126m2B3jGpDLc0tsmNbJDOfWDrydfqU9qBJjU7+Iv6tCa7TbZ/GfElJ+jon9p5aSTSohC+HRiFgcyLP1StUjkbqPGbdy7CECQAGn4Yt/Ou+aIJz2FRAhWzeWjqW8fslRj1pdtv2SMCTRPJneQw5eD8LzRnRfeYR6C6283g0a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755724084; c=relaxed/simple;
	bh=rkoobUseBl3ZPCzxbYJUmI8ZVFYkuSdLZI+boJGT8UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZ3vkb8/F21W8uMJrikTFYuWh7ABgvYzw+mYJzNx9KLXs0iBOlFmetK2Pz3aQSkCA6Q0TXEiH5WFlyxX4RZWLiu56X4DC4IvMXo5zsjxGv0uYqlAbaxQQHi4H7BHET92mqFj4QjyDYupdrTlAj8fJiFXG1Cl1zQ0kZxAPrvHO9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oihkB/d6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80C6C4CEE7;
	Wed, 20 Aug 2025 21:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755724084;
	bh=rkoobUseBl3ZPCzxbYJUmI8ZVFYkuSdLZI+boJGT8UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oihkB/d6bpuibPKO7CVwMQ1R8sWllUitiVtdBsUS035RrAaBSORoBP936GmEIOsbu
	 OjULfbVu+pQfvp8jTOoJyz0e6MVlvFM9oi6QWxgpuJQgtivFicURpKEfobLF0866nf
	 qbhhahV5cBcAWDgxDq6/d/tMq50+hvWGhmleVCS+7nvUo0ye0IyNyQVIulpizy/mLO
	 VqV7qeC0YV7tWXSDwSsP7Jin6VG+A++3DMHUBQl3UzhNhwcoLc2ETx3SgG+7ihvuCc
	 wECvB67E1XPAUPi9vquTOpqkaDk6gSIg8erCwUnLSE0K8Rla8SQpyYWiKFqjWS6IJe
	 XJxwBTnEKC6uA==
Date: Wed, 20 Aug 2025 16:08:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	freedreno@lists.freedesktop.org,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Mahadevan <quic_mahap@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Message-ID: <175572408273.1071685.13722769967964549822.robh@kernel.org>
References: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
 <20250815-dp_mst_bindings-v6-5-e715bbbb5386@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-dp_mst_bindings-v6-5-e715bbbb5386@oss.qualcomm.com>


On Fri, 15 Aug 2025 17:30:32 +0300, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On a vast majority of Qualcomm chipsets DisplayPort controller can
> support several MST streams (up to 4x). To support MST these chipsets
> use up to 4 stream pixel clocks for the DisplayPort controller. Expand
> corresponding clock bindings for these platforms and fix example
> schema files to follow updated bindings.
> 
> Note: On chipsets that do support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 63 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 20 +++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 10 ++--
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 10 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 10 ++--
>  5 files changed, 99 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


