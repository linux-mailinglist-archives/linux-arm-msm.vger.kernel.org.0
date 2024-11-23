Return-Path: <linux-arm-msm+bounces-38924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1409D6A1C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 17:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4181C1606C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 16:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CC986AE3;
	Sat, 23 Nov 2024 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdjP/2gm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A13A7080E;
	Sat, 23 Nov 2024 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732379285; cv=none; b=sUy7KAo+s2kds1Pwvo2cZb3rayyqxq2gLA41mbR0fsS4kfdSjVajyHxnTd4fr0dOODrKILu1ZDHFsT/R0Ln5S8thOyG2rBPR+q1db+m2/qlffLY0vffYLubRfYmTaOMCk+h6GVIMMl5b9CBXtyecnT/03AOZC9YVHYRB4mk37xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732379285; c=relaxed/simple;
	bh=4kW1hmaRcvlW822s40y2EmNJ6JjAbCgKF+oCMp92zm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUW5av3YGKAPDZNZYXXCXDsrAgw9wGFKj9Z+LGuG1tsv9KeB4AbkTJ+o95LfNpjWQBpXFEa7ZMpIDHkgLp7ntLSY3UCthkz/p+Dx2JGRDDwwZ9qJUuRO7rwxs+1GU93pB2P55GhTy1/MPb0bV8Y2vJQYEO+91TDjmEGzgRyOXYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdjP/2gm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17970C4CECD;
	Sat, 23 Nov 2024 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732379284;
	bh=4kW1hmaRcvlW822s40y2EmNJ6JjAbCgKF+oCMp92zm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdjP/2gm7hiTwtGDqfK0SBqJNDJFcKbVC0EY/2C+H0qYmNbeQAhvEUp+uf3cKSsFC
	 zPn/BP7qIIsTA8dHcM9ToBBd5PpdR8mlERcZV1FK8mtkm46H4cPTY3y38RPRON6j/i
	 qbY/RI3amOroUnQdw7QGiKrJH5usRR7lEYxY9NUhZ2IF89sE31ze9/tw1iLlv6ywVP
	 NqbNZhFcWSDIgfIKczxfXRjY6HcGEWlev1BH+aFU4YowMy3oymW29pKSsOl1bXcoYQ
	 dahDTEdSpMlH9U7qFuoZkvkmo4mnrPWaOyXUUluYTHg0HUrEXytlpLvRO8lcpLSnls
	 gLqZpjYOC1OiA==
Date: Sat, 23 Nov 2024 17:28:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/9] dt-bindings: display/msm: dsi-controller-main:
 Document SM6150
Message-ID: <grizxfiq3zlquijtufhtjnnwlq2cl264ouzxrglroafreoujoz@lk2rjcaa6lxy>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-2-35252e3a51fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-2-35252e3a51fe@quicinc.com>

On Fri, Nov 22, 2024 at 05:56:45PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Document general compatibility of the DSI controller on SM6150.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index b0fd96b76ed1376e429a6168df7e7aaa7aeff2d3..a7fbb5af4b0583e88ebcad07dd004046c38f95ee 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -30,6 +30,7 @@ properties:
>                - qcom,sdm845-dsi-ctrl
>                - qcom,sm6115-dsi-ctrl
>                - qcom,sm6125-dsi-ctrl
> +              - qcom,sm6150-dsi-ctrl

This is incomplete change. Where is the rest for clocks? See entire
file.

Best regards,
Krzysztof


