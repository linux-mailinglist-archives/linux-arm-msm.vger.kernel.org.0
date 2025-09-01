Return-Path: <linux-arm-msm+bounces-71342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A01DB3D7EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 05:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0C5917BA44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 03:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273AF228CBC;
	Mon,  1 Sep 2025 03:47:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081001C1F02;
	Mon,  1 Sep 2025 03:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756698427; cv=none; b=f6mYxdkCIweTQx41rCRDX+lejDz+WxfKUG/X29UMcrFdiCZ4QwVJehLt8kbEVQ3WQlpW3Y2GdYg3Gzg4MZr0GuC4erkeqOwhDA44M/rB03ZejrsP+eFllXAdzG/co9/TpGHCW3hiBvtodhQo9ewlP5cdZ+e7FNQ7Os8raQRnJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756698427; c=relaxed/simple;
	bh=uDc+Ss6sFCk8RQ/1G3aJdXZMhJzTYDRGFWvMizIDvzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1MHTarDTqvw8B6zv4n7gXevHvpk5tcEJFr77uIvb72kKYrLOIt0/BHJkujZwqjTVlma1TK+G/Otj855vrpuBHuEXBcO8l0TvEdJ+NEhn2/mMWCeBcA7E/aIPXPVFdlLhN2AY+/3XiRAGFEBEZOUtITJTeIxsh+o789krP4xO9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BDFC4CEF0;
	Mon,  1 Sep 2025 03:47:05 +0000 (UTC)
Date: Mon, 1 Sep 2025 05:47:04 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 8/9] arm64: dts: qcom: sm6350: correct DP
 compatibility strings
Message-ID: <20250901-defiant-illegal-marmot-7ce0db@kuoka>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-8-2b268a43917b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829-dp_mst_bindings-v7-8-2b268a43917b@oss.qualcomm.com>

On Fri, Aug 29, 2025 at 01:48:21AM +0300, Dmitry Baryshkov wrote:
> SM6350 doesn't have MST support, as such in DT schema it has been
> switched to use SC7180 as a fallback compatible. Make DT file implement

That's insufficient. You basically claim to do it only because bindings
change. Bindings were changed only because devices differ, so that's
your true explanation here as well.

> this change.
> 
> Fixes: 62f87a3cac4e ("arm64: dts: qcom: sm6350: Add DisplayPort controller")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 2493b9611dcb675f4c33794ecc0ee9e8823e24d4..8459b27cacc72a4827a2e289e669163ad6250059 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -2249,7 +2249,7 @@ opp-560000000 {
>  			};
>  
>  			mdss_dp: displayport-controller@ae90000 {
> -				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
> +				compatible = "qcom,sm6350-dp", "qcom,sc7180-dp";

No, that's breaking all the users.

Best regards,
Krzysztof


